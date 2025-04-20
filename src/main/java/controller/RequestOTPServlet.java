package controller;

import service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet to handle OTP request for password reset
 */
@WebServlet("/request-otp")
public class RequestOTPServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");

        // Validate input
        if (email == null || email.trim().isEmpty()) {
            request.setAttribute("error", "Email is required");
            request.getRequestDispatcher("/WEB-INF/views/forgot-password.jsp").forward(request, response);
            return;
        }

        // Request OTP
        boolean otpRequested = userService.requestOTP(email);

        if (otpRequested) {
            // Get user ID for the session
            int userId = userService.getUserByEmail(email).getUserId();

            // Store user ID in session for OTP verification
            HttpSession session = request.getSession();
            session.setAttribute("userId", userId);

            // Redirect to OTP verification page
            response.sendRedirect(request.getContextPath() + "/verify-otp");
        } else {
            // OTP request failed
            request.setAttribute("error", "Failed to send OTP. Please check your email address and try again.");
            request.getRequestDispatcher("/WEB-INF/views/forgot-password.jsp").forward(request, response);
        }
    }
}
