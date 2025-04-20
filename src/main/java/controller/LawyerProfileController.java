package controller;

import model.Lawyer;
import model.PracticeArea;
import model.Review;
import service.LawyerService;
import service.PracticeAreaService;
import service.ReviewService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet to handle individual lawyer profile pages
 */
@WebServlet("/lawyers/*")
public class LawyerProfileController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private LawyerService lawyerService = new LawyerService();
    private ReviewService reviewService = new ReviewService();
    private PracticeAreaService practiceAreaService = new PracticeAreaService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Extract the lawyer ID from the URL
        String pathInfo = request.getPathInfo();

        if (pathInfo == null || pathInfo.equals("/")) {
            // If no specific lawyer is requested, redirect to the lawyers listing
            response.sendRedirect(request.getContextPath() + "/lawyers");
            return;
        }

        // Remove the leading slash and parse the ID
        String lawyerId = pathInfo.substring(1);

        try {
            int id = Integer.parseInt(lawyerId);
            Lawyer lawyer = lawyerService.getLawyerById(id);

            if (lawyer != null) {
                // Get reviews for this lawyer
                List<Review> reviews = reviewService.getReviewsByLawyer(id);

                // Get practice areas for this lawyer
                List<PracticeArea> practiceAreas = practiceAreaService.getPracticeAreasByLawyer(id);

                // Get related lawyers (same practice area)
                List<Lawyer> relatedLawyers = new ArrayList<>();
                if (!practiceAreas.isEmpty()) {
                    String mainPracticeArea = practiceAreas.get(0).getAreaName();
                    relatedLawyers = lawyerService.getLawyersByPracticeArea(mainPracticeArea);

                    // Remove the current lawyer from related lawyers
                    relatedLawyers.removeIf(l -> l.getLawyerId() == id);

                    // Limit to 3 related lawyers
                    if (relatedLawyers.size() > 3) {
                        relatedLawyers = relatedLawyers.subList(0, 3);
                    }
                }

                // Set attributes for the JSP
                request.setAttribute("lawyer", lawyer);
                request.setAttribute("reviews", reviews);
                request.setAttribute("practiceAreas", practiceAreas);
                request.setAttribute("relatedLawyers", relatedLawyers);

                // Forward to the lawyer profile JSP
                request.getRequestDispatcher("/WEB-INF/views/lawyer-profile.jsp").forward(request, response);
            } else {
                // Lawyer not found
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Lawyer not found");
            }
        } catch (NumberFormatException e) {
            // Invalid lawyer ID format
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid lawyer ID");
        }
    }
}
