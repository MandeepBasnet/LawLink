package util;

import org.mindrot.jbcrypt.BCrypt;

import java.security.SecureRandom;
import java.util.Base64;

/**
 * Utility class for password hashing and verification
 */
public class PasswordUtil {

    /**
     * Generate a random salt
     * @return Salt string
     */
    public static String generateSalt() {
        return BCrypt.gensalt();
    }

    /**
     * Hash a password with a given salt
     * @param password Password to hash
     * @param salt Salt to use
     * @return Hashed password
     */
    public static String hashPassword(String password, String salt) {
        return BCrypt.hashpw(password, salt);
    }

    /**
     * Verify a password against a hashed password
     * @param password Password to verify
     * @param hashedPassword Hashed password to verify against
     * @return true if the password matches, false otherwise
     */
    public static boolean verifyPassword(String password, String hashedPassword) {
        return BCrypt.checkpw(password, hashedPassword);
    }

    /**
     * Generate a random token
     * @param length Length of the token
     * @return Random token
     */
    public static String generateToken(int length) {
        SecureRandom random = new SecureRandom();
        byte[] bytes = new byte[length];
        random.nextBytes(bytes);
        return Base64.getUrlEncoder().withoutPadding().encodeToString(bytes);
    }
}
