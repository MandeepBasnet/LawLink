package service;

import dao.ReviewDAO;
import model.Review;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

/**
 * Service class for Review-related operations
 * This class provides business logic for managing reviews
 */
public class ReviewService {

    private ReviewDAO reviewDAO = new ReviewDAO();

    /**
     * Create a new review
     * @param review Review object to create
     * @return true if successful, false otherwise
     */
    public boolean createReview(Review review) {
        return reviewDAO.createReview(review);
    }

    /**
     * Get a review by ID
     * @param reviewId Review ID
     * @return Review object if found, null otherwise
     */
    public Review getReviewById(int reviewId) {
        return reviewDAO.getReviewById(reviewId);
    }

    /**
     * Get a review by appointment ID
     * @param appointmentId Appointment ID
     * @return Review object if found, null otherwise
     */
    public Review getReviewByAppointmentId(int appointmentId) {
        return reviewDAO.getReviewByAppointmentId(appointmentId);
    }

    /**
     * Get all reviews for a lawyer
     * @param lawyerId Lawyer ID
     * @return List of Review objects
     */
    public List<Review> getReviewsByLawyer(int lawyerId) {
        return reviewDAO.getReviewsByLawyer(lawyerId);
    }

    /**
     * Get all reviews by a client
     * @param clientId Client ID
     * @return List of Review objects
     */
    public List<Review> getReviewsByClient(int clientId) {
        return reviewDAO.getReviewsByClient(clientId);
    }

    /**
     * Get review statistics for a lawyer
     * @param lawyerId Lawyer ID
     * @return Map containing review statistics
     */
    public Map<String, Object> getReviewStatsByLawyer(int lawyerId) {
        List<Review> reviews = reviewDAO.getReviewsByLawyer(lawyerId);
        Map<String, Object> stats = new HashMap<>();

        int totalReviews = reviews.size();
        int fiveStarCount = 0;
        int fourStarCount = 0;
        int threeStarCount = 0;
        int twoStarCount = 0;
        int oneStarCount = 0;

        for (Review review : reviews) {
            switch (review.getRating()) {
                case 5:
                    fiveStarCount++;
                    break;
                case 4:
                    fourStarCount++;
                    break;
                case 3:
                    threeStarCount++;
                    break;
                case 2:
                    twoStarCount++;
                    break;
                case 1:
                    oneStarCount++;
                    break;
            }
        }

        stats.put("totalReviews", totalReviews);
        stats.put("fiveStarCount", fiveStarCount);
        stats.put("fourStarCount", fourStarCount);
        stats.put("threeStarCount", threeStarCount);
        stats.put("twoStarCount", twoStarCount);
        stats.put("oneStarCount", oneStarCount);

        // Calculate percentages
        stats.put("fiveStarPercentage", totalReviews > 0 ? (fiveStarCount * 100.0 / totalReviews) : 0);
        stats.put("fourStarPercentage", totalReviews > 0 ? (fourStarCount * 100.0 / totalReviews) : 0);
        stats.put("threeStarPercentage", totalReviews > 0 ? (threeStarCount * 100.0 / totalReviews) : 0);
        stats.put("twoStarPercentage", totalReviews > 0 ? (twoStarCount * 100.0 / totalReviews) : 0);
        stats.put("oneStarPercentage", totalReviews > 0 ? (oneStarCount * 100.0 / totalReviews) : 0);

        return stats;
    }

    /**
     * Get recent reviews
     * @param limit Maximum number of reviews to return
     * @return List of Review objects
     */
    public List<Review> getRecentReviews(int limit) {
        return reviewDAO.getRecentReviews(limit);
    }

    /**
     * Update a review
     * @param review Review object to update
     * @return true if successful, false otherwise
     */
    public boolean updateReview(Review review) {
        return reviewDAO.updateReview(review);
    }

    /**
     * Delete a review
     * @param reviewId Review ID
     * @return true if successful, false otherwise
     */
    public boolean deleteReview(int reviewId) {
        return reviewDAO.deleteReview(reviewId);
    }
}
