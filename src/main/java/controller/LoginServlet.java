package controller;

import dao.UserDAO;
import model.User;

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
@WebServlet("/login")
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
                response.sendRedirect(request.getContextPath() + "/admin/dashboard");
            } else if (user.getRole().equals("LAWYER")) {
                response.sendRedirect(request.getContextPath() + "/lawyer/dashboard");
            } else if (user.getRole().equals("CLIENT")) {
                response.sendRedirect(request.getContextPath() + "/client/dashboard");
            }

            return;
        }

        // User is not logged in, forward to the login page
        request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean rememberMe = "on".equals(request.getParameter("rememberMe"));

        try {
            UserDAO userDAO = new UserDAO();
            User user = userDAO.authenticate(username, password);

            if (user != null) {
                // Create session
                HttpSession session = request.getSession();
                session.setAttribute("user", user);

                // Create session token if remember me is checked
                if (rememberMe) {
                    userDAO.createSessionToken(user.getUserId(), true);
                }

                // Redirect based on role
                if ("admin".equals(user.getRole())) {
                    response.sendRedirect(request.getContextPath() + "/admin/dashboard");
                } else if ("lawyer".equals(user.getRole())) {
                    response.sendRedirect(request.getContextPath() + "/lawyer/dashboard");
                } else {
                    response.sendRedirect(request.getContextPath() + "/client/dashboard");
                }
            } else {
                request.setAttribute("error", "Invalid username or password");
                request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred. Please try again later.");
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
        }
    }
}
