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
 * Servlet to handle the home page
 */
@WebServlet(name = "HomeController", urlPatterns = {"", "/home"})
public class HomeController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private LawyerService lawyerService = new LawyerService();
    private PracticeAreaService practiceAreaService = new PracticeAreaService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get top lawyers
        List<Lawyer> topLawyers = lawyerService.getTopLawyers(8);
        request.setAttribute("topLawyers", topLawyers);

        // Get practice areas
        List<PracticeArea> practiceAreas = practiceAreaService.getAllPracticeAreas();
        request.setAttribute("practiceAreas", practiceAreas);

        // Forward to the home page
        request.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(request, response);
    }
}
