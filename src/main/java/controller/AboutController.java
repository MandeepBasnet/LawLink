package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/about")
public class AboutController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Add any data needed for the about page
        request.setAttribute("teamSize", "50+");
        request.setAttribute("experienceYears", "10+");
        request.setAttribute("clientsServed", "10,000+");
        request.setAttribute("successRate", "98%");

        request.getRequestDispatcher("/WEB-INF/views/about.jsp").forward(request, response);
    }
}
