package controller;

import dao.LawyerDAO;
import model.Lawyer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.logging.Logger;

@WebServlet("/appointment")
public class AppointmentServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(AppointmentServlet.class.getName());
    private LawyerDAO lawyerDAO;

    @Override
    public void init() throws ServletException {
        try {
            lawyerDAO = new LawyerDAO();
        } catch (Exception e) {
            logger.severe("Failed to initialize LawyerDAO: " + e.getMessage());
            throw new ServletException("Failed to initialize LawyerDAO", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int lawyerId = Integer.parseInt(request.getParameter("lawyerId"));
            Lawyer lawyer = lawyerDAO.getLawyerById(lawyerId);

            if (lawyer != null) {
                request.setAttribute("lawyer", lawyer);
                request.getRequestDispatcher("appointment.jsp").forward(request, response);
            } else {
                logger.warning("Lawyer not found with ID: " + lawyerId);
                response.sendRedirect("lawyers");
            }
        } catch (NumberFormatException e) {
            logger.warning("Invalid lawyer ID format: " + request.getParameter("lawyerId"));
            response.sendRedirect("lawyers");
        } catch (Exception e) {
            logger.severe("Error processing appointment request: " + e.getMessage());
            response.sendRedirect("lawyers");
        }
    }
}
