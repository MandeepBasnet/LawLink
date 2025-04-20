package filter;

import model.User;
import service.UserService;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Filter to handle authentication and authorization
 */
@WebFilter(urlPatterns = {"/admin/*", "/lawyer/*", "/client/*"})
public class AuthFilter implements Filter {

    private UserService userService = new UserService();

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization code
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);

        String requestURI = httpRequest.getRequestURI();

        // Check if the user is logged in
        boolean isLoggedIn = (session != null && session.getAttribute("user") != null);

        if (!isLoggedIn) {
            // Check for "Remember Me" cookie
            Cookie[] cookies = httpRequest.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("rememberMe")) {
                        String sessionToken = cookie.getValue();
                        User user = userService.getUserBySessionToken(sessionToken);

                        if (user != null) {
                            // Create a new session
                            session = httpRequest.getSession(true);
                            session.setAttribute("user", user);
                            isLoggedIn = true;
                            break;
                        }
                    }
                }
            }
        }

        if (!isLoggedIn) {
            // User is not logged in, redirect to login page
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login");
            return;
        }

        // User is logged in, check if they have the appropriate role
        User user = (User) session.getAttribute("user");

        if (requestURI.contains("/admin/") && !user.getRole().equals("ADMIN")) {
            // User is not an admin, redirect to access denied page
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/access-denied");
            return;
        } else if (requestURI.contains("/lawyer/") && !user.getRole().equals("LAWYER")) {
            // User is not a lawyer, redirect to access denied page
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/access-denied");
            return;
        } else if (requestURI.contains("/client/") && !user.getRole().equals("CLIENT")) {
            // User is not a client, redirect to access denied page
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/access-denied");
            return;
        }

        // User has the appropriate role, continue with the request
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Cleanup code
    }
}
