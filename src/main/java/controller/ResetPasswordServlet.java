package controller;

import dao.UserDAO;
import util.ValidationUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

/**
 * Servlet to handle password reset
 */
@WebServlet("/reset-password")
public class ResetPasswordServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        try {
            userDAO = new UserDAO();
        } catch (SQLException e) {
            throw new ServletException("Failed to initialize UserDAO", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String token = request.getParameter("token");
        if (token == null || token.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/forgot-password");
            return;
        }

        // Verify token validity
        if (userDAO.getUserByResetToken(token) == null) {
            request.setAttribute("error", "Invalid or expired reset token");
            request.getRequestDispatcher("/WEB-INF/views/reset-password.jsp").forward(request, response);
            return;
        }

        request.setAttribute("token", token);
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
            request.getRequestDispatcher("/WEB-INF/views/reset-password.jsp").forward(request, response);
            return;
        }

        // Validate password
        if (!ValidationUtil.isValidPassword(newPassword)) {
            request.setAttribute("error", "Password must be at least 8 characters and contain both letters and numbers");
            request.setAttribute("token", token);
            request.getRequestDispatcher("/WEB-INF/views/reset-password.jsp").forward(request, response);
            return;
        }

        // Check if passwords match
        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match");
            request.setAttribute("token", token);
            request.getRequestDispatcher("/WEB-INF/views/reset-password.jsp").forward(request, response);
            return;
        }

        boolean resetSuccessful = userDAO.resetPassword(token, newPassword);

        if (resetSuccessful) {
            // Password reset successful, redirect to login page with success message
            request.getSession().setAttribute("message", "Password reset successful. Please login with your new password.");
            response.sendRedirect(request.getContextPath() + "/log-in");
        } else {
            // Password reset failed
            request.setAttribute("error", "Password reset failed. Please try again.");
            request.setAttribute("token", token);
            request.getRequestDispatcher("/WEB-INF/views/reset-password.jsp").forward(request, response);
        }
    }
}
