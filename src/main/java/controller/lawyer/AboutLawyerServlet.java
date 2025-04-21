package controller.lawyer;

import dao.LawyerDAO;
import model.Lawyer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Logger;

@WebServlet("/lawyer/about")
public class AboutLawyerServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(AboutLawyerServlet.class.getName());
    private LawyerDAO lawyerDAO;

    @Override
    public void init() throws ServletException {
        try {
            lawyerDAO = new LawyerDAO();
        } catch (SQLException e) {
            logger.severe("Failed to initialize LawyerDAO: " + e.getMessage());
            throw new ServletException("Failed to initialize LawyerDAO", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Lawyer lawyer = (Lawyer) request.getSession().getAttribute("lawyer");
        if (lawyer == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        request.setAttribute("lawyer", lawyer);
        request.getRequestDispatcher("about-lawyer.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Lawyer lawyer = (Lawyer) request.getSession().getAttribute("lawyer");
        if (lawyer == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String aboutMe = request.getParameter("aboutMe");
        String education = request.getParameter("education");
        int experienceYears = Integer.parseInt(request.getParameter("experienceYears"));
        String specialization = request.getParameter("specialization");

        lawyer.setAboutMe(aboutMe);
        lawyer.setEducation(education);
        lawyer.setExperienceYears(experienceYears);
        lawyer.setSpecialization(specialization);

        if (lawyerDAO.updateLawyer(lawyer)) {
            request.getSession().setAttribute("lawyer", lawyer);
            request.setAttribute("success", "Profile updated successfully");
        } else {
            request.setAttribute("error", "Failed to update profile");
        }

        request.getRequestDispatcher("about-lawyer.jsp").forward(request, response);
    }
}

