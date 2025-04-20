package controller;

import service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet to handle forgot password requests
 */
@WebServlet("/forgot-password")
public class ForgotPasswordServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Forward to the forgot password page
        request.getRequestDispatcher("/WEB-INF/views/forgot-password.jsp").forward(request, response);
    }

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

        // Request password reset
        boolean resetRequested = userService.requestPasswordReset(email);

        if (resetRequested) {
            // Reset request successful
            request.setAttribute("message", "Password reset instructions have been sent to your email");
            request.getRequestDispatcher("/WEB-INF/views/forgot-password.jsp").forward(request, response);
        } else {
            // Reset request failed
            request.setAttribute("error", "Failed to send password reset instructions. Please try again.");
            request.getRequestDispatcher("/WEB-INF/views/forgot-password.jsp").forward(request, response);
        }
    }
}
