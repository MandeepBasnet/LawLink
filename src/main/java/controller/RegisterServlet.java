package controller;

import model.Client;
import service.ClientService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet to handle client registration
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ClientService clientService = new ClientService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Forward to the registration page
        request.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String email = request.getParameter("email");
        String fullName = request.getParameter("fullName");

        // Validate input
        if (username == null || username.trim().isEmpty() ||
                password == null || password.trim().isEmpty() ||
                confirmPassword == null || confirmPassword.trim().isEmpty() ||
                email == null || email.trim().isEmpty() ||
                fullName == null || fullName.trim().isEmpty()) {

            request.setAttribute("error", "All fields are required");
            request.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(request, response);
            return;
        }

        // Check if passwords match
        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match");
            request.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(request, response);
            return;
        }

        // Create client object
        Client client = new Client(username, password, email, fullName);

        // Register client
        boolean registered = clientService.registerClient(client);

        if (registered) {
            // Registration successful, redirect to login page with success message
            request.getSession().setAttribute("message", "Registration successful. Please log in.");
            response.sendRedirect(request.getContextPath() + "/login");
        } else {
            // Registration failed
            request.setAttribute("error", "Registration failed. Please try again.");
            request.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(request, response);
        }
    }
}
