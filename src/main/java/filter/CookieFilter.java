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
 * Filter to handle cookie-based authentication
 */
@WebFilter(urlPatterns = {"/*"})
public class CookieFilter implements Filter {

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

        // Skip filter for static resources
        String requestURI = httpRequest.getRequestURI();
        if (isStaticResource(requestURI)) {
            chain.doFilter(request, response);
            return;
        }

        // Check if the user is already logged in
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
                            break;
                        } else {
                            // Invalid or expired token, remove the cookie
                            Cookie rememberMeCookie = new Cookie("rememberMe", "");
                            rememberMeCookie.setMaxAge(0);
                            rememberMeCookie.setPath("/");
                            httpResponse.addCookie(rememberMeCookie);
                        }
                    }
                }
            }
        }

        // Continue with the request
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Cleanup code
    }

    /**
     * Check if the requested resource is a static resource
     * @param requestURI The request URI
     * @return true if the resource is static, false otherwise
     */
    private boolean isStaticResource(String requestURI) {
        return requestURI.endsWith(".css") ||
                requestURI.endsWith(".js") ||
                requestURI.endsWith(".jpg") ||
                requestURI.endsWith(".jpeg") ||
                requestURI.endsWith(".png") ||
                requestURI.endsWith(".gif") ||
                requestURI.endsWith(".ico") ||
                requestURI.endsWith(".svg");
    }
}
