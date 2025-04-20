package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.EmailUtil;
import java.io.IOException;

@WebServlet("/contact")
public class ContactController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/contact.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        // Validate input
        if (name == null || email == null || subject == null || message == null ||
                name.trim().isEmpty() || email.trim().isEmpty() ||
                subject.trim().isEmpty() || message.trim().isEmpty()) {

            request.getSession().setAttribute("error", "Please fill in all fields.");
            response.sendRedirect(request.getContextPath() + "/contact");
            return;
        }

        // Send email
        boolean emailSent = EmailUtil.sendContactEmail(name, email, subject, message);

        if (emailSent) {
            request.getSession().setAttribute("message",
                    "Thank you for your message. We will get back to you soon!");
        } else {
            request.getSession().setAttribute("error",
                    "Sorry, there was an error sending your message. Please try again later.");
        }

        response.sendRedirect(request.getContextPath() + "/contact");
    }
}
