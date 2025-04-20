package controller;

import model.Appointment;
import model.Review;
import model.User;
import service.AppointmentService;
import service.ReviewService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Controller for handling review-related operations
 * This servlet handles creating, viewing, and managing reviews
 */
@WebServlet("/client/appointments/*/review")
public class ReviewController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ReviewService reviewService = new ReviewService();
    private AppointmentService appointmentService = new AppointmentService();

    /**
     * Handles POST requests for creating a new review
     * @param request The HTTP request
     * @param response The HTTP response
     * @throws ServletException If a servlet-specific error occurs
     * @throws IOException If an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the current user from the session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null || !user.getRole().equals("CLIENT")) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Extract the appointment ID from the URL
        String pathInfo = request.getPathInfo();
        if (pathInfo == null || pathInfo.length() <= 1) {
            response.sendRedirect(request.getContextPath() + "/client/appointments");
            return;
        }

        String[] pathParts = pathInfo.split("/");
        if (pathParts.length < 2) {
            response.sendRedirect(request.getContextPath() + "/client/appointments");
            return;
        }

        int appointmentId;
        try {
            appointmentId = Integer.parseInt(pathParts[1]);
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/client/appointments");
            return;
        }

        // Get the appointment to verify it belongs to the current user
        Appointment appointment = appointmentService.getAppointmentById(appointmentId);

        if (appointment == null || appointment.getClientId() != user.getUserId()) {
            session.setAttribute("error", "You do not have permission to review this appointment.");
            response.sendRedirect(request.getContextPath() + "/client/appointments");
            return;
        }

        // Check if the appointment is completed
        if (!appointment.getStatus().equals("COMPLETED")) {
            session.setAttribute("error", "You can only review completed appointments.");
            response.sendRedirect(request.getContextPath() + "/client/appointments");
            return;
        }

        // Check if a review already exists for this appointment
        Review existingReview = reviewService.getReviewByAppointmentId(appointmentId);
        if (existingReview != null) {
            session.setAttribute("error", "You have already reviewed this appointment.");
            response.sendRedirect(request.getContextPath() + "/client/appointments");
            return;
        }

        // Get the review data from the form
        int rating;
        try {
            rating = Integer.parseInt(request.getParameter("rating"));
            if (rating < 1 || rating > 5) {
                throw new NumberFormatException("Rating must be between 1 and 5");
            }
        } catch (NumberFormatException e) {
            session.setAttribute("error", "Invalid rating. Please provide a rating between 1 and 5.");
            response.sendRedirect(request.getContextPath() + "/client/appointments");
            return;
        }

        String comment = request.getParameter("comment");
        if (comment == null || comment.trim().isEmpty()) {
            session.setAttribute("error", "Please provide a comment for your review.");
            response.sendRedirect(request.getContextPath() + "/client/appointments");
            return;
        }

        // Create the review
        Review review = new Review(appointmentId, rating, comment);
        boolean created = reviewService.createReview(review);

        if (created) {
            session.setAttribute("message", "Your review has been submitted successfully.");
        } else {
            session.setAttribute("error", "Failed to submit your review. Please try again.");
        }

        response.sendRedirect(request.getContextPath() + "/client/appointments");
    }
}
