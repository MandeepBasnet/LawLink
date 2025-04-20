package dao;

import model.User;
import util.DBConnectionUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Data Access Object for User entity
 */
public class UserDAO {

    /**
     * Create a new user in the database
     * @param user User object to create
     * @return true if successful, false otherwise
     */
    public boolean createUser(User user) {
        String sql = "INSERT INTO Users (username, password, password_salt, email, full_name, phone, address, role) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getPassword());
            stmt.setString(3, user.getPasswordSalt());
            stmt.setString(4, user.getEmail());
            stmt.setString(5, user.getFullName());
            stmt.setString(6, user.getPhone());
            stmt.setString(7, user.getAddress());
            stmt.setString(8, user.getRole());

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                // Get the generated user_id
                try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        user.setUserId(generatedKeys.getInt(1));
                        return true;
                    }
                }
            }

            return false;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Get a user by their ID
     * @param userId ID of the user to retrieve
     * @return User object if found, null otherwise
     */
    public User getUserById(int userId) {
        String sql = "SELECT * FROM Users WHERE user_id = ?";

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToUser(rs);
                }
            }

            return null;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * Get a user by their username
     * @param username Username of the user to retrieve
     * @return User object if found, null otherwise
     */
    public User getUserByUsername(String username) {
        String sql = "SELECT * FROM Users WHERE username = ?";

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, username);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToUser(rs);
                }
            }

            return null;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * Get a user by their email
     * @param email Email of the user to retrieve
     * @return User object if found, null otherwise
     */
    public User getUserByEmail(String email) {
        String sql = "SELECT * FROM Users WHERE email = ?";

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToUser(rs);
                }
            }

            return null;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * Get a user by their session token
     * @param sessionToken Session token of the user to retrieve
     * @return User object if found and token is valid, null otherwise
     */
    public User getUserBySessionToken(String sessionToken) {
        String sql = "SELECT * FROM Users WHERE session_token = ? AND session_expiry > NOW()";

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, sessionToken);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToUser(rs);
                }
            }

            return null;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * Get all users from the database
     * @return List of User objects
     */
    public List<User> getAllUsers() {
        String sql = "SELECT * FROM Users";
        List<User> users = new ArrayList<>();

        try (Connection conn = DBConnectionUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                users.add(mapResultSetToUser(rs));
            }

            return users;
        } catch (SQLException e) {
            e.printStackTrace();
            return users;
        }
    }

    /**
     * Update a user in the database
     * @param user User object to update
     * @return true if successful, false otherwise
     */
    public boolean updateUser(User user) {
        String sql = "UPDATE Users SET username = ?, password = ?, password_salt = ?, email = ?, " +
                "full_name = ?, phone = ?, address = ?, role = ?, is_active = ?, " +
                "profile_image = ?, session_token = ?, session_expiry = ?, " +
                "reset_token = ?, reset_token_expiry = ?, otp = ?, otp_expiry = ? WHERE user_id = ?";

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getPassword());
            stmt.setString(3, user.getPasswordSalt());
            stmt.setString(4, user.getEmail());
            stmt.setString(5, user.getFullName());
            stmt.setString(6, user.getPhone());
            stmt.setString(7, user.getAddress());
            stmt.setString(8, user.getRole());
            stmt.setBoolean(9, user.isActive());
            stmt.setString(10, user.getProfileImage());
            stmt.setString(11, user.getSessionToken());
            stmt.setTimestamp(12, user.getSessionExpiry());
            stmt.setString(13, user.getResetToken());
            stmt.setTimestamp(14, user.getResetTokenExpiry());
            stmt.setString(15, user.getOtp());
            stmt.setTimestamp(16, user.getOtpExpiry());
            stmt.setInt(17, user.getUserId());

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Update a user's last login time
     * @param userId ID of the user to update
     * @return true if successful, false otherwise
     */
    public boolean updateLastLogin(int userId) {
        String sql = "UPDATE Users SET last_login = CURRENT_TIMESTAMP WHERE user_id = ?";

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Update a user's session token
     * @param userId ID of the user to update
     * @param sessionToken Session token
     * @param sessionExpiry Session expiry timestamp
     * @return true if successful, false otherwise
     */
    public boolean updateSessionToken(int userId, String sessionToken, Timestamp sessionExpiry) {
        String sql = "UPDATE Users SET session_token = ?, session_expiry = ? WHERE user_id = ?";

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, sessionToken);
            stmt.setTimestamp(2, sessionExpiry);
            stmt.setInt(3, userId);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Clear a user's session token
     * @param userId ID of the user
     * @return true if successful, false otherwise
     */
    public boolean clearSessionToken(int userId) {
        String sql = "UPDATE Users SET session_token = NULL, session_expiry = NULL WHERE user_id = ?";

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Delete a user from the database
     * @param userId ID of the user to delete
     * @return true if successful, false otherwise
     */
    public boolean deleteUser(int userId) {
        String sql = "DELETE FROM Users WHERE user_id = ?";

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Set a password reset token for a user
     * @param userId ID of the user
     * @param resetToken Reset token
     * @param expiryHours Hours until the token expires
     * @return true if successful, false otherwise
     */
    public boolean setResetToken(int userId, String resetToken, int expiryHours) {
        String sql = "UPDATE Users SET reset_token = ?, reset_token_expiry = DATE_ADD(NOW(), INTERVAL ? HOUR) WHERE user_id = ?";

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, resetToken);
            stmt.setInt(2, expiryHours);
            stmt.setInt(3, userId);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Get a user by their reset token
     * @param resetToken Reset token
     * @return User object if found and token is valid, null otherwise
     */
    public User getUserByResetToken(String resetToken) {
        String sql = "SELECT * FROM Users WHERE reset_token = ? AND reset_token_expiry > NOW()";

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, resetToken);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToUser(rs);
                }
            }

            return null;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * Clear a user's reset token
     * @param userId ID of the user
     * @return true if successful, false otherwise
     */
    public boolean clearResetToken(int userId) {
        String sql = "UPDATE Users SET reset_token = NULL, reset_token_expiry = NULL WHERE user_id = ?";

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Set an OTP for email verification
     * @param userId ID of the user
     * @param otp OTP to set
     * @param expiryMinutes Minutes until the OTP expires
     * @return true if successful, false otherwise
     */
    public boolean setOTP(int userId, String otp, int expiryMinutes) {
        String sql = "UPDATE Users SET otp = ?, otp_expiry = DATE_ADD(NOW(), INTERVAL ? MINUTE) WHERE user_id = ?";

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, otp);
            stmt.setInt(2, expiryMinutes);
            stmt.setInt(3, userId);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Get a user's OTP
     * @param userId ID of the user
     * @return OTP if found and valid, null otherwise
     */
    public String getOTP(int userId) {
        String sql = "SELECT otp FROM Users WHERE user_id = ? AND otp_expiry > NOW()";

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("otp");
                }
            }

            return null;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * Clear a user's OTP
     * @param userId ID of the user
     * @return true if successful, false otherwise
     */
    public boolean clearOTP(int userId) {
        String sql = "UPDATE Users SET otp = NULL, otp_expiry = NULL WHERE user_id = ?";

        try (Connection conn = DBConnectionUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Map a ResultSet to a User object
     * @param rs ResultSet to map
     * @return User object
     * @throws SQLException if a database access error occurs
     */
    private User mapResultSetToUser(ResultSet rs) throws SQLException {
        User user = new User();
        user.setUserId(rs.getInt("user_id"));
        user.setUsername(rs.getString("username"));
        user.setPassword(rs.getString("password"));
        user.setPasswordSalt(rs.getString("password_salt"));
        user.setEmail(rs.getString("email"));
        user.setFullName(rs.getString("full_name"));
        user.setPhone(rs.getString("phone"));
        user.setAddress(rs.getString("address"));
        user.setRole(rs.getString("role"));
        user.setRegistrationDate(rs.getTimestamp("registration_date"));
        user.setLastLogin(rs.getTimestamp("last_login"));
        user.setActive(rs.getBoolean("is_active"));
        user.setProfileImage(rs.getString("profile_image"));
        user.setSessionToken(rs.getString("session_token"));
        user.setSessionExpiry(rs.getTimestamp("session_expiry"));
        user.setResetToken(rs.getString("reset_token"));
        user.setResetTokenExpiry(rs.getTimestamp("reset_token_expiry"));
        user.setOtp(rs.getString("otp"));
        user.setOtpExpiry(rs.getTimestamp("otp_expiry"));
        return user;
    }
}
