package filter;

import dao.UserDAO;
import model.User;
import util.CookieUtil;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;

@WebFilter("/*")
public class RememberMeFilter implements Filter {

    private UserDAO userDAO;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        try {
            this.userDAO = new UserDAO();
        } catch (SQLException e) {
            throw new ServletException("Failed to initialize UserDAO", e);
        }
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("currentUser") == null) {
            String token = CookieUtil.getCookieValue(req, CookieUtil.REMEMBER_ME_COOKIE);
            if (token != null) {
                User user = userDAO.getUserBySessionToken(token);
                if (user != null && user.isActive()) {
                    HttpSession newSession = req.getSession(true);
                    newSession.setAttribute("currentUser", user);
                }
            }
        }

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        if (userDAO != null) {
            userDAO.close();
        }
    }
}
