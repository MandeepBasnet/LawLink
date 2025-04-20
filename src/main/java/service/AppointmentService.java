package service;

import dao.AppointmentDAO;
import dao.ClientDAO;
import dao.LawyerDAO;
import model.Appointment;
import model.Client;
import model.Lawyer;
import util.EmailUtil;

import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * Service class for Appointment-related operations
 * This class provides business logic for managing appointments
 */
public class AppointmentService {

    private AppointmentDAO appointmentDAO = new AppointmentDAO();
    private LawyerDAO lawyerDAO = new LawyerDAO();
    private ClientDAO clientDAO = new ClientDAO();

    /**
     * Book a new appointment
     * @param appointment Appointment object to book
     * @return true if successful, false otherwise
     */
    public boolean bookAppointment(Appointment appointment) {
        // Check if the lawyer is available at the specified date and time
        if (!appointmentDAO.isLawyerAvailable(appointment.getLawyerId(), appointment.getAppointmentDate(), appointment.getAppointmentTime())) {
            return false;
        }

        boolean booked = appointmentDAO.createAppointment(appointment);

        if (booked) {
            // Send confirmation emails
            Lawyer lawyer = lawyerDAO.getLawyerById(appointment.getLawyerId());
            Client client = clientDAO.getClientById(appointment.getClientId());

            if (lawyer != null && client != null) {
                SimpleDateFormat dateFormat = new SimpleDateFormat("EEEE, MMMM d, yyyy");
                SimpleDateFormat timeFormat = new SimpleDateFormat("h:mm a");

                String formattedDate = dateFormat.format(appointment.getAppointmentDate());
                String formattedTime = timeFormat.format(appointment.getAppointmentTime());

                // Send confirmation email to client
                EmailUtil.sendAppointmentConfirmationEmail(
                        client.getEmail(),
                        client.getFullName(),
                        lawyer.getFullName(),
                        formattedDate,
                        formattedTime
                );

                // Send notification email to lawyer
                EmailUtil.sendAppointmentConfirmationEmail(
                        lawyer.getEmail(),
                        lawyer.getFullName(),
                        client.getFullName(),
                        formattedDate,
                        formattedTime
                );
            }
        }

        return booked;
    }

    /**
     * Get an appointment by ID
     * @param appointmentId Appointment ID
     * @return Appointment object if found, null otherwise
     */
    public Appointment getAppointmentById(int appointmentId) {
        return appointmentDAO.getAppointmentById(appointmentId);
    }

    /**
     * Get all appointments for a lawyer
     * @param lawyerId Lawyer ID
     * @return List of Appointment objects
     */
    public List<Appointment> getAppointmentsByLawyer(int lawyerId) {
        return appointmentDAO.getAppointmentsByLawyer(lawyerId);
    }

    /**
     * Get upcoming appointments for a lawyer
     * @param lawyerId Lawyer ID
     * @param limit Maximum number of appointments to return
     * @return List of Appointment objects
     */
    public List<Appointment> getUpcomingAppointmentsByLawyer(int lawyerId, int limit) {
        return appointmentDAO.getUpcomingAppointmentsByLawyer(lawyerId, limit);
    }

    /**
     * Get all appointments for a client
     * @param clientId Client ID
     * @return List of Appointment objects
     */
    public List<Appointment> getAppointmentsByClient(int clientId) {
        return appointmentDAO.getAppointmentsByClient(clientId);
    }

    /**
     * Get all appointments
     * @return List of Appointment objects
     */
    public List<Appointment> getAllAppointments() {
        return appointmentDAO.getAllAppointments();
    }

    /**
     * Get recent appointments
     * @param limit Maximum number of appointments to return
     * @return List of Appointment objects
     */
    public List<Appointment> getRecentAppointments(int limit) {
        return appointmentDAO.getRecentAppointments(limit);
    }

    /**
     * Update an appointment's status
     * @param appointmentId Appointment ID
     * @param status New status
     * @return true if successful, false otherwise
     */
    public boolean updateAppointmentStatus(int appointmentId, String status) {
        Appointment appointment = appointmentDAO.getAppointmentById(appointmentId);

        if (appointment != null) {
            boolean updated = appointmentDAO.updateAppointmentStatus(appointmentId, status);

            if (updated && status.equals("CANCELLED")) {
                // Send cancellation emails
                Lawyer lawyer = lawyerDAO.getLawyerById(appointment.getLawyerId());
                Client client = clientDAO.getClientById(appointment.getClientId());

                if (lawyer != null && client != null) {
                    SimpleDateFormat dateFormat = new SimpleDateFormat("EEEE, MMMM d, yyyy");
                    SimpleDateFormat timeFormat = new SimpleDateFormat("h:mm a");

                    String formattedDate = dateFormat.format(appointment.getAppointmentDate());
                    String formattedTime = timeFormat.format(appointment.getAppointmentTime());

                    // Send cancellation email to client
                    EmailUtil.sendAppointmentCancellationEmail(
                            client.getEmail(),
                            client.getFullName(),
                            lawyer.getFullName(),
                            formattedDate,
                            formattedTime
                    );

                    // Send notification email to lawyer
                    EmailUtil.sendAppointmentCancellationEmail(
                            lawyer.getEmail(),
                            lawyer.getFullName(),
                            client.getFullName(),
                            formattedDate,
                            formattedTime
                    );
                }
            }

            return updated;
        }

        return false;
    }

    /**
     * Cancel an appointment
     * @param appointmentId Appointment ID
     * @return true if successful, false otherwise
     */
    public boolean cancelAppointment(int appointmentId) {
        return updateAppointmentStatus(appointmentId, "CANCELLED");
    }

    /**
     * Complete an appointment
     * @param appointmentId Appointment ID
     * @return true if successful, false otherwise
     */
    public boolean completeAppointment(int appointmentId) {
        return updateAppointmentStatus(appointmentId, "COMPLETED");
    }

    /**
     * Check if a lawyer is available at a specific date and time
     * @param lawyerId Lawyer ID
     * @param appointmentDate Date to check
     * @param appointmentTime Time to check
     * @return true if available, false otherwise
     */
    public boolean isLawyerAvailable(int lawyerId, Date appointmentDate, Time appointmentTime) {
        return appointmentDAO.isLawyerAvailable(lawyerId, appointmentDate, appointmentTime);
    }
}
