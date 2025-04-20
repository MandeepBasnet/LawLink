package controller;

import model.Appointment;
import model.Review;
import model.User;
import service.AppointmentService;
import service.ClientService;
import service.LawyerService;
import service.PracticeAreaService;
import service.ReviewService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Controller for the admin dashboard
 * This servlet handles displaying the admin dashboard with statistics and recent activities
 */
@WebServlet("/admin/dashboard")
public class AdminDashboardController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private LawyerService lawyerService = new LawyerService();
    private ClientService clientService = new ClientService();
    private AppointmentService appointmentService = new AppointmentService();
    private ReviewService reviewService = new ReviewService();
    private PracticeAreaService practiceAreaService = new PracticeAreaService();

    /**
     * Handles GET requests for displaying the admin dashboard
     * @param request The HTTP request
     * @param response The HTTP response
     * @throws ServletException If a servlet-specific error occurs
     * @throws IOException If an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the current user from the session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null || !user.getRole().equals("ADMIN")) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Get dashboard statistics
        Map<String, Object> stats = new HashMap<>();
        stats.put("totalLawyers", lawyerService.getAllLawyers().size());
        stats.put("totalClients", clientService.getAllClients().size());
        stats.put("totalAppointments", appointmentService.getAllAppointments().size());
        stats.put("totalPracticeAreas", practiceAreaService.getAllPracticeAreas().size());

        // Get recent appointments (5 most recent)
        List<Appointment> recentAppointments = appointmentService.getRecentAppointments(5);

        // Get recent reviews (5 most recent)
        List<Review> recentReviews = reviewService.getRecentReviews(5);

        // Set attributes for the JSP
        request.setAttribute("stats", stats);
        request.setAttribute("recentAppointments", recentAppointments);
        request.setAttribute("recentReviews", recentReviews);

        // Forward to the dashboard JSP
        request.getRequestDispatcher("/WEB-INF/views/admin/dashboard.jsp").forward(request, response);
    }
}
