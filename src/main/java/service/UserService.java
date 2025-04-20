package service;

import dao.UserDAO;
import model.User;
import util.EmailUtil;
import util.PasswordUtil;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;

/**
 * Service class for User-related operations
 */
public class UserService {

    private UserDAO userDAO = new UserDAO();

    /**
     * Authenticate a user
     * @param username Username
     * @param password Password
     * @return User object if authentication is successful, null otherwise
     */
    public User authenticateUser(String username, String password) {
        User user = userDAO.getUserByUsername(username);

        if (user != null && PasswordUtil.verifyPassword(password, user.getPassword())) {
            userDAO.updateLastLogin(user.getUserId());
            return user;
        }

        return null;
    }

    /**
     * Create a session token for a user
     * @param userId User ID
     * @param rememberMe Whether to create a long-lived session token
     * @return Session token
     */
    public String createSessionToken(int userId, boolean rememberMe) {
        String sessionToken = PasswordUtil.generateToken(32);

        // Set session expiry time
        Calendar calendar = Calendar.getInstance();
        if (rememberMe) {
            // 30 days
            calendar.add(Calendar.DAY_OF_MONTH, 30);
        } else {
            // 2 hours
            calendar.add(Calendar.HOUR_OF_DAY, 2);
        }

        Timestamp sessionExpiry = new Timestamp(calendar.getTimeInMillis());

        // Update user with session token
        userDAO.updateSessionToken(userId, sessionToken, sessionExpiry);

        return sessionToken;
    }

    /**
     * Get a user by session token
     * @param sessionToken Session token
     * @return User object if found and token is valid, null otherwise
     */
    public User getUserBySessionToken(String sessionToken) {
        return userDAO.getUserBySessionToken(sessionToken);
    }

    /**
     * Clear a user's session token
     * @param userId User ID
     * @return true if successful, false otherwise
     */
    public boolean clearSessionToken(int userId) {
        return userDAO.clearSessionToken(userId);
    }

    /**
     * Request a password reset
     * @param email Email address
     * @return true if successful, false otherwise
     */
    public boolean requestPasswordReset(String email) {
        User user = userDAO.getUserByEmail(email);

        if (user != null) {
            String resetToken = PasswordUtil.generateToken(32);
            boolean tokenSet = userDAO.setResetToken(user.getUserId(), resetToken, 24);

            if (tokenSet) {
                return EmailUtil.sendPasswordResetEmail(user.getEmail(), resetToken, user.getUserId());
            }
        }

        return false;
    }

    /**
     * Reset a user's password
     * @param resetToken Reset token
     * @param newPassword New password
     * @return true if successful, false otherwise
     */
    public boolean resetPassword(String resetToken, String newPassword) {
        User user = userDAO.getUserByResetToken(resetToken);

        if (user != null) {
            String salt = PasswordUtil.generateSalt();
            String hashedPassword = PasswordUtil.hashPassword(newPassword, salt);

            user.setPassword(hashedPassword);
            user.setPasswordSalt(salt);

            boolean updated = userDAO.updateUser(user);

            if (updated) {
                return userDAO.clearResetToken(user.getUserId());
            }
        }

        return false;
    }

    /**
     * Change a user's password
     * @param userId User ID
     * @param currentPassword Current password
     * @param newPassword New password
     * @return true if successful, false otherwise
     */
    public boolean changePassword(int userId, String currentPassword, String newPassword) {
        User user = userDAO.getUserById(userId);

        if (user != null && PasswordUtil.verifyPassword(currentPassword, user.getPassword())) {
            String salt = PasswordUtil.generateSalt();
            String hashedPassword = PasswordUtil.hashPassword(newPassword, salt);

            user.setPassword(hashedPassword);
            user.setPasswordSalt(salt);

            return userDAO.updateUser(user);
        }

        return false;
    }

    /**
     * Get a user by ID
     * @param userId User ID
     * @return User object if found, null otherwise
     */
    public User getUserById(int userId) {
        return userDAO.getUserById(userId);
    }

    /**
     * Get a user by username
     * @param username Username
     * @return User object if found, null otherwise
     */
    public User getUserByUsername(String username) {
        return userDAO.getUserByUsername(username);
    }

    /**
     * Get a user by email
     * @param email Email address
     * @return User object if found, null otherwise
     */
    public User getUserByEmail(String email) {
        return userDAO.getUserByEmail(email);
    }

    /**
     * Update a user's profile
     * @param user User object to update
     * @return true if successful, false otherwise
     */
    public boolean updateUserProfile(User user) {
        return userDAO.updateUser(user);
    }

    /**
     * Update a user's last login time
     * @param userId User ID
     * @return true if successful, false otherwise
     */
    public boolean updateLastLogin(int userId) {
        return userDAO.updateLastLogin(userId);
    }

    /**
     * Request an OTP for email verification
     * @param email Email address
     * @return true if successful, false otherwise
     */
    public boolean requestOTP(String email) {
        User user = userDAO.getUserByEmail(email);

        if (user != null) {
            String otp = EmailUtil.generateOTP();
            boolean otpSet = userDAO.setOTP(user.getUserId(), otp, 5);

            if (otpSet) {
                return EmailUtil.sendOTPEmail(user.getEmail(), otp);
            }
        }

        return false;
    }

    /**
     * Verify OTP
     * @param userId User ID
     * @param otp OTP to verify
     * @return true if successful, false otherwise
     */
    public boolean verifyOTP(int userId, String otp) {
        User user = userDAO.getUserById(userId);

        if (user != null && user.getOtp() != null && user.getOtp().equals(otp) && user.getOtpExpiry().after(new Date())) {
            return userDAO.clearOTP(userId);
        }

        return false;
    }
}
