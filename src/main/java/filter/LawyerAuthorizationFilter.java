package filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;
import model.User;

import java.io.IOException;

@WebFilter(urlPatterns = {"/lawyerDashboard.jsp", "/aboutLawyer.jsp", "/lawyerProfile.jsp", "/allReviews.jsp"})
public class LawyerAuthorizationFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("currentUser") == null) {
            res.sendRedirect("access-denied.jsp");
            return;
        }

        User user = (User) session.getAttribute("currentUser");

        if (user != null && "LAWYER".equals(user.getRole())) {
            chain.doFilter(request, response);
        } else {
            res.sendRedirect("access-denied.jsp");
        }
    }
}
