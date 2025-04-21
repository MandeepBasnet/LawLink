package controller;

import dao.UserDAO;
import model.User;
import util.ValidationUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Servlet to handle user login
 */
@WebServlet("/log-in")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Check if the user is already logged in
        HttpSession session = request.getSession(false);

        if (session != null && session.getAttribute("user") != null) {
            // User is already logged in, redirect to the appropriate dashboard
            User user = (User) session.getAttribute("user");

            if (user.getRole().equals("ADMIN")) {
                response.sendRedirect(request.getContextPath() + "/admin/admin-dashboard");
            } else if (user.getRole().equals("LAWYER")) {
                response.sendRedirect(request.getContextPath() + "/lawyer/lawyer-dashboard");
            } else if (user.getRole().equals("CLIENT")) {
                response.sendRedirect(request.getContextPath() + "/client/my-appointments");
            }

            return;
        }

        // User is not logged in, forward to the login page
        request.getRequestDispatcher("/WEB-INF/views/log-in.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = ValidationUtil.sanitizeInput(request.getParameter("email"));
        String password = request.getParameter("password");
        boolean rememberMe = "on".equals(request.getParameter("rememberMe"));

        if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            request.setAttribute("error", "Email and password are required");
            request.getRequestDispatcher("/WEB-INF/views/log-in.jsp").forward(request, response);
            return;
        }

        if (!ValidationUtil.isValidEmail(email)) {
            request.setAttribute("error", "Invalid email format");
            request.getRequestDispatcher("/WEB-INF/views/log-in.jsp").forward(request, response);
            return;
        }

        try {
            UserDAO userDAO = new UserDAO();
            User user = userDAO.authenticateByEmail(email, password);

            if (user != null) {
                // Create session
                HttpSession session = request.getSession();
                session.setAttribute("user", user);

                // Create session token if remember me is checked
                if (rememberMe) {
                    userDAO.createSessionToken(user.getUserId(), true);
                }

                // Redirect based on role
                if ("ADMIN".equalsIgnoreCase(user.getRole())) {
                    response.sendRedirect(request.getContextPath() + "/admin/admin-dashboard");
                } else if ("LAWYER".equalsIgnoreCase(user.getRole())) {
                    response.sendRedirect(request.getContextPath() + "/lawyer/lawyer-dashboard");
                } else if ("CLIENT".equalsIgnoreCase(user.getRole())) {
                    response.sendRedirect(request.getContextPath() + "/client/my-appointments");
                } else {
                    // If role is not recognized, redirect to home
                    response.sendRedirect(request.getContextPath() + "/home");
                }
            } else {
                request.setAttribute("error", "Invalid email or password");
                request.getRequestDispatcher("/WEB-INF/views/log-in.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred. Please try again later.");
            request.getRequestDispatcher("/WEB-INF/views/log-in.jsp").forward(request, response);
        }
    }
}
