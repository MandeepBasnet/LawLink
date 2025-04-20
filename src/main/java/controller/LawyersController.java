package controller;

import model.Lawyer;
import model.PracticeArea;
import service.LawyerService;
import service.PracticeAreaService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Servlet to handle the lawyers listing page
 */
@WebServlet("/lawyers")
public class LawyersController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private LawyerService lawyerService = new LawyerService();
    private PracticeAreaService practiceAreaService = new PracticeAreaService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get parameters for filtering and pagination
        String search = request.getParameter("search");
        String practiceArea = request.getParameter("area");
        String availableParam = request.getParameter("available");
        String pageParam = request.getParameter("page");

        boolean available = "true".equals(availableParam);
        int page = 1;
        int recordsPerPage = 9;

        try {
            if (pageParam != null) {
                page = Integer.parseInt(pageParam);
                if (page < 1) {
                    page = 1;
                }
            }
        } catch (NumberFormatException e) {
            // Default to page 1
        }

        // Get lawyers based on filters
        List<Lawyer> lawyers;
        int totalLawyers;

        if (search != null && !search.trim().isEmpty()) {
            lawyers = lawyerService.searchLawyers(search);
            totalLawyers = lawyers.size();
        } else if (practiceArea != null && !practiceArea.trim().isEmpty()) {
            lawyers = lawyerService.getLawyersByPracticeArea(practiceArea);
            totalLawyers = lawyers.size();
        } else if (available) {
            lawyers = lawyerService.getAvailableLawyers();
            totalLawyers = lawyers.size();
        } else {
            lawyers = lawyerService.getAllLawyers();
            totalLawyers = lawyers.size();
        }

        // Apply pagination
        int totalPages = (int) Math.ceil((double) totalLawyers / recordsPerPage);
        int start = (page - 1) * recordsPerPage;
        int end = Math.min(start + recordsPerPage, totalLawyers);

        if (start < totalLawyers) {
            lawyers = lawyers.subList(start, end);
        } else {
            lawyers.clear();
        }

        // Get practice areas for filtering
        List<PracticeArea> practiceAreas = practiceAreaService.getAllPracticeAreas();

        // Set attributes for the JSP
        request.setAttribute("lawyers", lawyers);
        request.setAttribute("practiceAreas", practiceAreas);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

        // Forward to the lawyers JSP
        request.getRequestDispatcher("/WEB-INF/views/lawyers.jsp").forward(request, response);
    }
}
