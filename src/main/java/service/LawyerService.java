package service;

import dao.LawyerDAO;
import model.Lawyer;
import util.EmailUtil;
import util.PasswordUtil;

import java.util.List;

/**
 * Service class for Lawyer-related operations
 */
public class LawyerService {

    private LawyerDAO lawyerDAO = new LawyerDAO();

    /**
     * Add a new lawyer
     * @param lawyer Lawyer object to add
     * @return true if successful, false otherwise
     */
    public boolean addLawyer(Lawyer lawyer) {
        // Generate salt and hash password
        String salt = PasswordUtil.generateSalt();
        String hashedPassword = PasswordUtil.hashPassword(lawyer.getPassword(), salt);

        lawyer.setPassword(hashedPassword);
        lawyer.setPasswordSalt(salt);

        boolean added = lawyerDAO.createLawyer(lawyer);

        if (added) {
            // Send welcome email
            EmailUtil.sendWelcomeEmail(lawyer.getEmail(), lawyer.getFullName());
        }

        return added;
    }

    /**
     * Get a lawyer by ID
     * @param lawyerId Lawyer ID
     * @return Lawyer object if found, null otherwise
     */
    public Lawyer getLawyerById(int lawyerId) {
        return lawyerDAO.getLawyerById(lawyerId);
    }

    /**
     * Get all lawyers
     * @return List of Lawyer objects
     */
    public List<Lawyer> getAllLawyers() {
        return lawyerDAO.getAllLawyers();
    }

    /**
     * Get top lawyers based on rating
     * @param limit Maximum number of lawyers to return
     * @return List of Lawyer objects
     */
    public List<Lawyer> getTopLawyers(int limit) {
        return lawyerDAO.getTopLawyers(limit);
    }

    /**
     * Get lawyers by practice area
     * @param practiceArea Practice area to filter by
     * @return List of Lawyer objects
     */
    public List<Lawyer> getLawyersByPracticeArea(String practiceArea) {
        return lawyerDAO.getLawyersByPracticeArea(practiceArea);
    }

    /**
     * Get available lawyers
     * @return List of available Lawyer objects
     */
    public List<Lawyer> getAvailableLawyers() {
        return lawyerDAO.getAvailableLawyers();
    }

    /**
     * Update a lawyer's profile
     * @param lawyer Lawyer object to update
     * @return true if successful, false otherwise
     */
    public boolean updateLawyerProfile(Lawyer lawyer) {
        return lawyerDAO.updateLawyer(lawyer);
    }

    /**
     * Update a lawyer's availability
     * @param lawyerId Lawyer ID
     * @param isAvailable New availability status
     * @return true if successful, false otherwise
     */
    public boolean updateLawyerAvailability(int lawyerId, boolean isAvailable) {
        return lawyerDAO.updateLawyerAvailability(lawyerId, isAvailable);
    }

    /**
     * Search for lawyers by name or specialization
     * @param query Search query
     * @return List of matching Lawyer objects
     */
    public List<Lawyer> searchLawyers(String query) {
        return lawyerDAO.searchLawyers(query);
    }
}
