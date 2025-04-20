package controller;

import model.Appointment;
import model.Lawyer;
import model.Review;
import model.User;
import service.AppointmentService;
import service.LawyerService;
import service.ReviewService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Controller for the lawyer dashboard
 * This servlet handles displaying the lawyer dashboard with statistics and recent activities
 */
@WebServlet("/lawyer/dashboard")
public class LawyerDashboardController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private LawyerService lawyerService = new LawyerService();
    private AppointmentService appointmentService = new AppointmentService();
    private ReviewService reviewService = new ReviewService();

    /**
     * Handles GET requests for displaying the lawyer dashboard
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

        if (user == null || !user.getRole().equals("LAWYER")) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Get the lawyer's information
        Lawyer lawyer = lawyerService.getLawyerById(user.getUserId());
        if (lawyer == null) {
            session.setAttribute("error", "Lawyer profile not found.");
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Get all appointments for the lawyer
        List<Appointment> allAppointments = appointmentService.getAppointmentsByLawyer(lawyer.getLawyerId());

        // Calculate dashboard statistics
        Map<String, Object> stats = new HashMap<>();
        int totalAppointments = allAppointments.size();
        int completedAppointments = 0;
        int pendingAppointments = 0;
        BigDecimal totalEarnings = BigDecimal.ZERO;

        for (Appointment appointment : allAppointments) {
            if (appointment.getStatus().equals("COMPLETED")) {
                completedAppointments++;
                totalEarnings = totalEarnings.add(appointment.getConsultationFee());
            } else if (appointment.getStatus().equals("PENDING") || appointment.getStatus().equals("CONFIRMED")) {
                pendingAppointments++;
            }
        }

        stats.put("totalAppointments", totalAppointments);
        stats.put("completedAppointments", completedAppointments);
        stats.put("pendingAppointments", pendingAppointments);
        stats.put("totalEarnings", totalEarnings);

        // Get upcoming appointments (5 most recent)
        List<Appointment> upcomingAppointments = appointmentService.getUpcomingAppointmentsByLawyer(lawyer.getLawyerId(), 5);

        // Get recent reviews (5 most recent)
        List<Review> recentReviews = reviewService.getReviewsByLawyer(lawyer.getLawyerId());
        if (recentReviews.size() > 5) {
            recentReviews = recentReviews.subList(0, 5);
        }

        // Set attributes for the JSP
        request.setAttribute("lawyer", lawyer);
        request.setAttribute("stats", stats);
        request.setAttribute("upcomingAppointments", upcomingAppointments);
        request.setAttribute("recentReviews", recentReviews);

        // Forward to the dashboard JSP
        request.getRequestDispatcher("/WEB-INF/views/lawyer/dashboard.jsp").forward(request, response);
    }
}
