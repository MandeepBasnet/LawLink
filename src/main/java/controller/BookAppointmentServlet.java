package controller;

import dao.AppointmentDAO;
import dao.LawyerDAO;
import dao.UserDAO;
import model.Appointment;
import model.Lawyer;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;

@WebServlet({"/client/book-appointment-page", "/client/book-appointment"})
public class BookAppointmentServlet extends HttpServlet {
    private AppointmentDAO appointmentDAO;
    private LawyerDAO lawyerDAO;
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        try {
            appointmentDAO = new AppointmentDAO();
            lawyerDAO = new LawyerDAO();
            userDAO = new UserDAO();
        } catch (SQLException e) {
            throw new ServletException("Failed to initialize DAOs", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("getTimeSlots".equals(action)) {
            handleTimeSlotsRequest(request, response);
            return;
        }

        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null || !"CLIENT".equals(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/log-in");
            return;
        }

        try {
            String lawyerIdStr = request.getParameter("lawyerId");
            if (lawyerIdStr == null || lawyerIdStr.trim().isEmpty()) {
                request.setAttribute("error", "Invalid lawyer selection.");
                request.getRequestDispatcher("/WEB-INF/views/book-appointment.jsp").forward(request, response);
                return;
            }

            int lawyerId = Integer.parseInt(lawyerIdStr);
            Lawyer lawyer = lawyerDAO.getLawyerById(lawyerId);

            if (lawyer == null) {
                request.setAttribute("error", "Lawyer not found.");
                request.getRequestDispatcher("/WEB-INF/views/book-appointment.jsp").forward(request, response);
                return;
            }

            request.setAttribute("lawyer", lawyer);
            request.getRequestDispatcher("/WEB-INF/views/book-appointment.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid lawyer ID format.");
            request.getRequestDispatcher("/WEB-INF/views/book-appointment.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error loading booking page.");
            request.getRequestDispatcher("/WEB-INF/views/book-appointment.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null || !"CLIENT".equals(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/log-in");
            return;
        }

        try {
            int lawyerId = Integer.parseInt(request.getParameter("lawyerId"));
            Date date = Date.valueOf(request.getParameter("appointmentDate"));
            Time time = Time.valueOf(request.getParameter("appointmentTime"));
            int duration = Integer.parseInt(request.getParameter("duration"));
            String notes = request.getParameter("notes");

            // Verify lawyer availability
            if (!appointmentDAO.isLawyerAvailable(lawyerId, date, time)) {
                request.setAttribute("error", "Selected time slot is not available.");
                doGet(request, response);
                return;
            }

            Appointment appointment = new Appointment();
            appointment.setLawyerId(lawyerId);
            appointment.setClientId(user.getUserId());
            appointment.setAppointmentDate(date);
            appointment.setAppointmentTime(time);
            appointment.setDuration(duration);
            appointment.setNotes(notes);
            appointment.setStatus("PENDING");

            boolean success = appointmentDAO.createAppointment(appointment);

            if (success) {
                response.sendRedirect("my-appointments");
            } else {
                request.setAttribute("error", "Failed to book appointment.");
                doGet(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error while booking appointment.");
            doGet(request, response);
        }
    }

    private void handleTimeSlotsRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int lawyerId = Integer.parseInt(request.getParameter("lawyerId"));
            String dateStr = request.getParameter("date");
            Date date = Date.valueOf(dateStr);

            List<Appointment> appointments = appointmentDAO.getAppointmentsByLawyer(lawyerId);
            List<String> bookedSlots = new ArrayList<>();

            for (Appointment appt : appointments) {
                if (appt.getAppointmentDate().equals(date) && !appt.getStatus().equals("CANCELLED")) {
                    bookedSlots.add(appt.getAppointmentTime().toString().substring(0, 5));
                }
            }

            Map<String, Object> responseData = new HashMap<>();
            responseData.put("bookedSlots", bookedSlots);

            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.print(new Gson().toJson(responseData));
            out.flush();

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.print("{\"error\": \"Failed to fetch time slots.\"}");
            out.flush();
        }
    }
}