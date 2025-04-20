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
 * Servlet to handle change password requests
 */
@WebServlet("/change-password")
public class ChangePasswordServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Forward to the change password page
        request.getRequestDispatcher("/WEB-INF/views/change-password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        User user = (User) session.getAttribute("user");
        int userId = user.getUserId();

        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        // Validate input
        if (currentPassword == null || currentPassword.trim().isEmpty() ||
                newPassword == null || newPassword.trim().isEmpty() ||
                confirmPassword == null || confirmPassword.trim().isEmpty()) {

            request.setAttribute("error", "All fields are required");
            request.getRequestDispatcher("/WEB-INF/views/change-password.jsp").forward(request, response);
            return;
        }

        // Check if passwords match
        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match");
            request.getRequestDispatcher("/WEB-INF/views/change-password.jsp").forward(request, response);
            return;
        }

        // Change password
        boolean changeSuccessful = userService.changePassword(userId, currentPassword, newPassword);

        if (changeSuccessful) {
            // Password change successful, redirect to profile page with success message
            request.getSession().setAttribute("message", "Password changed successfully.");
            response.sendRedirect(request.getContextPath() + "/profile");
        } else {
            // Password change failed
            request.setAttribute("error", "Password change failed. Please check your current password.");
            request.getRequestDispatcher("/WEB-INF/views/change-password.jsp").forward(request, response);
        }
    }
}
