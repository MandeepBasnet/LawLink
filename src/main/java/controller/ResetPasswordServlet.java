package controller;

import service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet to handle password reset
 */
@WebServlet("/reset-password")
public class ResetPasswordServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String token = request.getParameter("token");
        String userId = request.getParameter("userId");

        // Validate input
        if (token == null || token.trim().isEmpty() || userId == null || userId.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        // Store token and userId in request attributes
        request.setAttribute("token", token);
        request.setAttribute("userId", userId);

        // Forward to the reset password page
        request.getRequestDispatcher("/WEB-INF/views/reset-password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String token = request.getParameter("token");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        // Validate input
        if (token == null || token.trim().isEmpty() ||
                newPassword == null || newPassword.trim().isEmpty() ||
                confirmPassword == null || confirmPassword.trim().isEmpty()) {

            request.setAttribute("error", "All fields are required");
            request.setAttribute("token", token);
            request.setAttribute("userId", request.getParameter("userId"));
            request.getRequestDispatcher("/WEB-INF/views/reset-password.jsp").forward(request, response);
            return;
        }

        // Check if passwords match
        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match");
            request.setAttribute("token", token);
            request.setAttribute("userId", request.getParameter("userId"));
            request.getRequestDispatcher("/WEB-INF/views/reset-password.jsp").forward(request, response);
            return;
        }

        // Reset password
        boolean resetSuccessful = userService.resetPassword(token, newPassword);

        if (resetSuccessful) {
            // Password reset successful, redirect to login page with success message
            request.getSession().setAttribute("message", "Password reset successful. Please log in with your new password.");
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        } else {
            // Password reset failed
            request.setAttribute("error", "Password reset failed. The link may have expired or is invalid.");
            request.setAttribute("token", token);
            request.setAttribute("userId", request.getParameter("userId"));
            request.getRequestDispatcher("/WEB-INF/views/reset-password.jsp").forward(request, response);
        }
    }
}
