package filter;

import java.io.IOException;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

@WebFilter(urlPatterns = {
    "/profile/*", 
    "/appointments/*", 
    "/book-appointment",
    "/lawyer-profile/*",
    "/my-appointments",
    "/reviews/*"
})
public class AuthenticationFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization code if needed
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        
        String requestURI = httpRequest.getRequestURI();
        
        // Check for public resources that should bypass authentication
        if (isPublicResource(requestURI)) {
            chain.doFilter(request, response);
            return;
        }
        
        HttpSession session = httpRequest.getSession(false);
        boolean isLoggedIn = (session != null && session.getAttribute("user") != null);
        
        if (isLoggedIn) {
            chain.doFilter(request, response);
        } else {
            String originalURL = httpRequest.getRequestURL().toString();
            if (httpRequest.getQueryString() != null) {
                originalURL += "?" + httpRequest.getQueryString();
            }
            
            httpRequest.getSession().setAttribute("originalURL", originalURL);
            httpRequest.setAttribute("errorMessage", "Please log in to access this page");
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login");
        }
    }
    
    private boolean isPublicResource(String requestURI) {
        return requestURI.endsWith(".css") || 
               requestURI.endsWith(".js") || 
               requestURI.endsWith(".jpg") || 
               requestURI.endsWith(".jpeg") || 
               requestURI.endsWith(".png") || 
               requestURI.endsWith(".gif") ||
               requestURI.contains("/assets/") ||
               requestURI.contains("/public/");
    }

    @Override
    public void destroy() {
        // Cleanup code if needed
    }
} 