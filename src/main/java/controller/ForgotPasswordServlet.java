package controller;

import model.User;
import dao.UserDAO;
import util.StringUtil;
import util.EmailUtil;
import exception.ServiceException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Random;

/**
 * Servlet to handle forgot password requests
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

        String email = request.getParameter("email");

        // Validate email
        if (email == null || email.trim().isEmpty()) {
            request.setAttribute("error", "Email is required");
            request.getRequestDispatcher("/WEB-INF/views/forgot-password.jsp").forward(request, response);
            return;
        }

        // Check if user exists
        User user = userDAO.getUserByEmail(email);
        if (user == null) {
            request.setAttribute("error", "No account found with this email");
            request.getRequestDispatcher("/WEB-INF/views/forgot-password.jsp").forward(request, response);
            return;
        }

        // Generate and set reset token
        String otp = generateOTP();
        if (userDAO.setResetToken(user.getUserId(), otp, 1)) { // 1 hour expiry
            request.setAttribute("message", "Password reset instructions have been sent to your email");
        } else {
            request.setAttribute("error", "Failed to process password reset request. Please try again.");
        }

        request.getRequestDispatcher("/WEB-INF/views/forgot-password.jsp").forward(request, response);
    }

    private String generateOTP() {
        return String.format("%06d", new java.util.Random().nextInt(1000000));
    }
}
