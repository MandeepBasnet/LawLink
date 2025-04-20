package controller;

import model.Review;
import model.User;
import service.ReviewService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;
import java.util.Map;

/**
 * Controller for handling lawyer reviews
 */
@WebServlet("/lawyer/reviews")
public class LawyerReviewsController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ReviewService reviewService = new ReviewService();

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

        // Get page number
        int page = 1;
        int recordsPerPage = 10;

        try {
            String pageParam = request.getParameter("page");
            if (pageParam != null) {
                page = Integer.parseInt(pageParam);
                if (page < 1) {
                    page = 1;
                }
            }
        } catch (NumberFormatException e) {
            // Default to page 1
        }

        // Get reviews for the lawyer
        List<Review> reviews = reviewService.getReviewsByLawyer(user.getUserId());

        // Calculate total pages
        int totalReviews = reviews.size();
        int totalPages = (int) Math.ceil((double) totalReviews / recordsPerPage);

        // Apply pagination
        int start = (page - 1) * recordsPerPage;
        int end = Math.min(start + recordsPerPage, totalReviews);

        List<Review> paginatedReviews = reviews.subList(start, end);

        // Get review statistics
        Map<String, Object> stats = reviewService.getReviewStatsByLawyer(user.getUserId());

        // Calculate average rating
        BigDecimal averageRating = BigDecimal.ZERO;
        if (totalReviews > 0) {
            int totalStars = 0;
            for (Review review : reviews) {
                totalStars += review.getRating();
            }
            averageRating = new BigDecimal(totalStars).divide(new BigDecimal(totalReviews), 1, RoundingMode.HALF_UP);
        }

        // Set attributes for the JSP
        request.setAttribute("reviews", paginatedReviews);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("totalReviews", totalReviews);
        request.setAttribute("averageRating", averageRating);
        request.setAttribute("stats", stats);

        // Forward to the reviews JSP
        request.getRequestDispatcher("/WEB-INF/views/lawyer/reviews.jsp").forward(request, response);
    }
}
