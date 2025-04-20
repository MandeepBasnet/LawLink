package util;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;

/**
 * Utility class for sending emails
 */
public class EmailUtil {

    private static final String HOST = "smtp.gmail.com";
    private static final String PORT = "587";
    private static final String USERNAME = "your-email@gmail.com"; // Replace with your email
    private static final String PASSWORD = "your-app-password"; // Replace with your app password

    /**
     * Send an email
     * @param to Recipient email address
     * @param subject Email subject
     * @param body Email body
     * @return true if successful, false otherwise
     */
    public static boolean sendEmail(String to, String subject, String body) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", HOST);
        props.put("mail.smtp.port", PORT);

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(USERNAME, PASSWORD);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(USERNAME));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setContent(body, "text/html; charset=utf-8");

            Transport.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Generate a random OTP
     * @return OTP string
     */
    public static String generateOTP() {
        Random random = new Random();
        int otp = 100000 + random.nextInt(900000);
        return String.valueOf(otp);
    }

    /**
     * Send an OTP email
     * @param to Recipient email address
     * @param otp OTP to send
     * @return true if successful, false otherwise
     */
    public static boolean sendOTPEmail(String to, String otp) {
        String subject = "LawLink Email Verification OTP";
        String body = "<html><body>"
                + "<h2>LawLink Email Verification</h2>"
                + "<p>Your OTP for email verification is:</p>"
                + "<h3>" + otp + "</h3>"
                + "<p>This OTP will expire in 5 minutes.</p>"
                + "</body></html>";

        return sendEmail(to, subject, body);
    }

    /**
     * Send a password reset email
     * @param to Recipient email address
     * @param resetToken Reset token
     * @param userId User ID
     * @return true if successful, false otherwise
     */
    public static boolean sendPasswordResetEmail(String to, String resetToken, int userId) {
        String subject = "LawLink Password Reset";
        String resetLink = "http://localhost:8080/LawLink/reset-password?token=" + resetToken + "&userId=" + userId;

        String body = "<html><body>"
                + "<h2>LawLink Password Reset</h2>"
                + "<p>You have requested to reset your password. Click the link below to reset your password:</p>"
                + "<p><a href=\"" + resetLink + "\">Reset Password</a></p>"
                + "<p>If you did not request a password reset, please ignore this email.</p>"
                + "<p>This link will expire in 24 hours.</p>"
                + "</body></html>";

        return sendEmail(to, subject, body);
    }

    /**
     * Send a welcome email
     * @param to Recipient email address
     * @param fullName Full name of the recipient
     * @return true if successful, false otherwise
     */
    public static boolean sendWelcomeEmail(String to, String fullName) {
        String subject = "Welcome to LawLink";

        String body = "<html><body>"
                + "<h2>Welcome to LawLink!</h2>"
                + "<p>Dear " + fullName + ",</p>"
                + "<p>Thank you for registering with LawLink. We are excited to have you on board!</p>"
                + "<p>With LawLink, you can:</p>"
                + "<ul>"
                + "<li>Find and book appointments with trusted lawyers</li>"
                + "<li>Manage your appointments</li>"
                + "<li>Leave reviews for lawyers</li>"
                + "</ul>"
                + "<p>If you have any questions, please don't hesitate to contact us.</p>"
                + "<p>Best regards,<br>The LawLink Team</p>"
                + "</body></html>";

        return sendEmail(to, subject, body);
    }

    /**
     * Send an appointment confirmation email
     * @param to Recipient email address
     * @param fullName Full name of the recipient
     * @param lawyerName Name of the lawyer
     * @param appointmentDate Date of the appointment
     * @param appointmentTime Time of the appointment
     * @return true if successful, false otherwise
     */
    public static boolean sendAppointmentConfirmationEmail(String to, String fullName, String lawyerName,
                                                           String appointmentDate, String appointmentTime) {
        String subject = "LawLink Appointment Confirmation";

        String body = "<html><body>"
                + "<h2>Appointment Confirmation</h2>"
                + "<p>Dear " + fullName + ",</p>"
                + "<p>Your appointment with " + lawyerName + " has been confirmed for:</p>"
                + "<p><strong>Date:</strong> " + appointmentDate + "</p>"
                + "<p><strong>Time:</strong> " + appointmentTime + "</p>"
                + "<p>If you need to cancel or reschedule your appointment, please log in to your account.</p>"
                + "<p>Best regards,<br>The LawLink Team</p>"
                + "</body></html>";

        return sendEmail(to, subject, body);
    }

    /**
     * Send an appointment cancellation email
     * @param to Recipient email address
     * @param fullName Full name of the recipient
     * @param lawyerName Name of the lawyer
     * @param appointmentDate Date of the appointment
     * @param appointmentTime Time of the appointment
     * @return true if successful, false otherwise
     */
    public static boolean sendAppointmentCancellationEmail(String to, String fullName, String lawyerName,
                                                           String appointmentDate, String appointmentTime) {
        String subject = "LawLink Appointment Cancellation";

        String body = "<html><body>"
                + "<h2>Appointment Cancellation</h2>"
                + "<p>Dear " + fullName + ",</p>"
                + "<p>Your appointment with " + lawyerName + " scheduled for:</p>"
                + "<p><strong>Date:</strong> " + appointmentDate + "</p>"
                + "<p><strong>Time:</strong> " + appointmentTime + "</p>"
                + "<p>has been cancelled.</p>"
                + "<p>If you would like to book a new appointment, please log in to your account.</p>"
                + "<p>Best regards,<br>The LawLink Team</p>"
                + "</body></html>";

        return sendEmail(to, subject, body);
    }

    /**
     * Send a contact form email
     * @param name Name of the sender
     * @param email Email of the sender
     * @param subject Subject of the message
     * @param message Message content
     * @return true if successful, false otherwise
     */
    public static boolean sendContactEmail(String name, String email, String subject, String message) {
        String emailSubject = "Contact Form: " + subject;

        String emailBody = "<html><body>"
                + "<h2>New Contact Form Submission</h2>"
                + "<p><strong>Name:</strong> " + name + "</p>"
                + "<p><strong>Email:</strong> " + email + "</p>"
                + "<p><strong>Subject:</strong> " + subject + "</p>"
                + "<p><strong>Message:</strong></p>"
                + "<p>" + message + "</p>"
                + "</body></html>";

        return sendEmail(USERNAME, emailSubject, emailBody);
    }
}
