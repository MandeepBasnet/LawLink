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
 * Servlet to handle user logout
 */
@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the user from the session
        HttpSession session = request.getSession(false);

        if (session != null) {
            User user = (User) session.getAttribute("user");

            if (user != null) {
                // Clear the user's session token
                userService.clearSessionToken(user.getUserId());
            }

            // Invalidate the session
            session.invalidate();
        }

        // Remove the "Remember Me" cookie
        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("rememberMe")) {
                    cookie.setValue("");
                    cookie.setMaxAge(0);
                    cookie.setPath("/");
                    response.addCookie(cookie);
                    break;
                }
            }
        }

        // Redirect to the login page
        response.sendRedirect(request.getContextPath() + "/login");
    }
}
