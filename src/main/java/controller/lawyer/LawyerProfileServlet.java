package controller.lawyer;

import dao.LawyerDAO;
import model.Lawyer;
import model.User;
import util.StringUtil;
import util.ValidationUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Logger;

@WebServlet("/lawyer-profile")
public class LawyerProfileServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(LawyerProfileServlet.class.getName());
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
        HttpSession session = request.getSession(false);
        User currentUser = (session != null) ? (User) session.getAttribute("currentUser") : null;

        if (currentUser == null || !"LAWYER".equals(currentUser.getRole())) {
            response.sendRedirect("access-denied.jsp");
            return;
        }

        Lawyer lawyer = lawyerDAO.getLawyerById(currentUser.getUserId());

        if (lawyer != null) {
            request.setAttribute("lawyer", lawyer);
            request.getRequestDispatcher("lawyerProfile.jsp").forward(request, response);
        } else {
            response.sendRedirect("error.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User currentUser = (session != null) ? (User) session.getAttribute("currentUser") : null;

        if (currentUser == null || !"LAWYER".equals(currentUser.getRole())) {
            response.sendRedirect("access-denied.jsp");
            return;
        }

        try {
            Lawyer lawyer = lawyerDAO.getLawyerById(currentUser.getUserId());

            if (lawyer == null) {
                response.sendRedirect("error.jsp");
                return;
            }

            String fullName = StringUtil.safeString(request.getParameter("fullName"));
            String phone = StringUtil.safeString(request.getParameter("phone"));
            String address = StringUtil.safeString(request.getParameter("address"));
            String specialization = StringUtil.safeString(request.getParameter("specialization"));
            String practiceAreas = StringUtil.safeString(request.getParameter("practiceAreas"));
            String aboutMe = StringUtil.safeString(request.getParameter("aboutMe"));

            // Basic validations
            if (!ValidationUtil.isValidPhone(phone)) {
                request.setAttribute("error", "Invalid phone format.");
                request.setAttribute("lawyer", lawyer);
                request.getRequestDispatcher("lawyerProfile.jsp").forward(request, response);
                return;
            }

            lawyer.setFullName(fullName);
            lawyer.setPhone(phone);
            lawyer.setAddress(address);
            lawyer.setSpecialization(specialization);
            lawyer.setPracticeAreas(practiceAreas);
            lawyer.setAboutMe(aboutMe);

            if (lawyerDAO.updateLawyer(lawyer)) {
                request.setAttribute("success", "Profile updated successfully");
                request.setAttribute("lawyer", lawyer);
            } else {
                request.setAttribute("error", "Failed to update profile");
            }
        } catch (Exception e) {
            logger.severe("Error updating lawyer profile: " + e.getMessage());
            request.setAttribute("error", "An error occurred while updating your profile");
        }

        request.getRequestDispatcher("lawyerProfile.jsp").forward(request, response);
    }
}

