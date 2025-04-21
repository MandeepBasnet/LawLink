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
 * Servlet to handle forgot password functionality
 */
@WebServlet("/forgot-password")
public class ForgotPasswordServlet extends HttpServlet {

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
        request.getRequestDispatcher("/WEB-INF/views/forgot-password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = ValidationUtil.sanitizeInput(request.getParameter("email"));

        if (email == null || email.trim().isEmpty()) {
            request.setAttribute("error", "Email is required");
            request.getRequestDispatcher("/WEB-INF/views/forgot-password.jsp").forward(request, response);
            return;
        }

        if (!ValidationUtil.isValidEmail(email)) {
            request.setAttribute("error", "Invalid email format");
            request.getRequestDispatcher("/WEB-INF/views/forgot-password.jsp").forward(request, response);
            return;
        }

        try {
            boolean success = userDAO.sendPasswordResetEmail(email);
            if (success) {
                request.setAttribute("message", "If an account exists with this email, you will receive a password reset link.");
            } else {
                request.setAttribute("message", "If an account exists with this email, you will receive a password reset link.");
                // We show the same message regardless for security reasons
            }
            request.getRequestDispatcher("/WEB-INF/views/forgot-password.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred. Please try again later.");
            request.getRequestDispatcher("/WEB-INF/views/forgot-password.jsp").forward(request, response);
        }
    }
}
