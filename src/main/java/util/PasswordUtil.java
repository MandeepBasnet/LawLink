package util;

import org.mindrot.jbcrypt.BCrypt;

/**
 * Utility class for password hashing and verification using BCrypt
 */
public class PasswordUtil {

    public static String hashPassword(String password) {
        return BCrypt.hashpw(password, BCrypt.gensalt());
    }

    public static boolean verifyPassword(String password, String hashedPassword) {
        if (password == null || hashedPassword == null) return false;
        return BCrypt.checkpw(password, hashedPassword);
    }

    public static void main(String[] args) {
        String password = "password";
        String hashedPassword = hashPassword(password);
        System.out.println(password);
        System.out.println(hashedPassword);
        boolean status = PasswordUtil.verifyPassword("password", "$2a$12$Tu40ThZpwoSj444PuLtM..r85s9RpXX/k3v1Ml/QFwo9.sULkolDm");
        System.out.println(status);
    }
}
