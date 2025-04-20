package controller;

import model.User;
import service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet to handle user login
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UserService userService = new UserService();

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
        String rememberMe = request.getParameter("rememberMe");

        // Validate input
        if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            request.setAttribute("error", "Username and password are required");
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
            return;
        }

        // Authenticate user
        User user = userService.authenticateUser(username, password);

        if (user != null) {
            // Authentication successful, create session
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            // Check if "Remember Me" is selected
            if (rememberMe != null && rememberMe.equals("on")) {
                // Create a session token
                String sessionToken = userService.createSessionToken(user.getUserId(), true);

                // Create a cookie
                Cookie cookie = new Cookie("rememberMe", sessionToken);
                cookie.setMaxAge(30 * 24 * 60 * 60); // 30 days
                cookie.setPath("/");
                response.addCookie(cookie);
            }

            // Redirect to the appropriate dashboard
            if (user.getRole().equals("ADMIN")) {
                response.sendRedirect(request.getContextPath() + "/admin/dashboard");
            } else if (user.getRole().equals("LAWYER")) {
                response.sendRedirect(request.getContextPath() + "/lawyer/dashboard");
            } else if (user.getRole().equals("CLIENT")) {
                response.sendRedirect(request.getContextPath() + "/client/dashboard");
            }
        } else {
            // Authentication failed
            request.setAttribute("error", "Invalid username or password");
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
        }
    }
}
