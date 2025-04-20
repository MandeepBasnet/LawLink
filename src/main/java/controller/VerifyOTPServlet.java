package controller;

import model.User;
import service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet to handle OTP verification
 */
@WebServlet("/verify-otp")
public class VerifyOTPServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Forward to the verify OTP page
        request.getRequestDispatcher("/WEB-INF/views/verify-otp.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int userId = (int) session.getAttribute("userId");
        String otp = request.getParameter("otp");

        // Validate input
        if (otp == null || otp.trim().isEmpty()) {
            request.setAttribute("error", "OTP is required");
            request.getRequestDispatcher("/WEB-INF/views/verify-otp.jsp").forward(request, response);
            return;
        }

        // Verify OTP
        boolean otpVerified = userService.verifyOTP(userId, otp);

        if (otpVerified) {
            // OTP verification successful, redirect to reset password page
            request.setAttribute("token", request.getParameter("token"));
            request.setAttribute("userId", userId);
            request.getSession().removeAttribute("userId");
            request.getRequestDispatcher("/WEB-INF/views/reset-password.jsp").forward(request, response);
        } else {
            // OTP verification failed
            request.setAttribute("error", "Invalid or expired OTP. Please try again.");
            request.getRequestDispatcher("/WEB-INF/views/verify-otp.jsp").forward(request, response);
        }
    }
}
