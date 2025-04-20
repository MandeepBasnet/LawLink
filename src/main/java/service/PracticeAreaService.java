package service;

import dao.PracticeAreaDAO;
import model.PracticeArea;

import java.util.List;

/**
 * Service class for PracticeArea-related operations
 */
public class PracticeAreaService {

    private PracticeAreaDAO practiceAreaDAO = new PracticeAreaDAO();

    /**
     * Get all practice areas
     * @return List of PracticeArea objects
     */
    public List<PracticeArea> getAllPracticeAreas() {
        return practiceAreaDAO.getAllPracticeAreas();
    }

    /**
     * Get a practice area by ID
     * @param areaId Practice area ID
     * @return PracticeArea object if found, null otherwise
     */
    public PracticeArea getPracticeAreaById(int areaId) {
        return practiceAreaDAO.getPracticeAreaById(areaId);
    }

    /**
     * Create a new practice area
     * @param practiceArea PracticeArea object to create
     * @return true if successful, false otherwise
     */
    public boolean createPracticeArea(PracticeArea practiceArea) {
        return practiceAreaDAO.createPracticeArea(practiceArea);
    }

    /**
     * Update a practice area
     * @param practiceArea PracticeArea object to update
     * @return true if successful, false otherwise
     */
    public boolean updatePracticeArea(PracticeArea practiceArea) {
        return practiceAreaDAO.updatePracticeArea(practiceArea);
    }

    /**
     * Delete a practice area
     * @param areaId Practice area ID
     * @return true if successful, false otherwise
     */
    public boolean deletePracticeArea(int areaId) {
        return practiceAreaDAO.deletePracticeArea(areaId);
    }

    /**
     * Get practice areas for a specific lawyer
     * @param lawyerId Lawyer ID
     * @return List of PracticeArea objects
     */
    public List<PracticeArea> getPracticeAreasByLawyer(int lawyerId) {
        return practiceAreaDAO.getPracticeAreasByLawyer(lawyerId);
    }
}
