package controller.client;

import dao.AppointmentDAO;
import model.Appointment;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/my-appointments")
public class MyAppointmentServlet extends HttpServlet {
    private AppointmentDAO appointmentDAO = new AppointmentDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User currentUser = (session != null) ? (User) session.getAttribute("currentUser") : null;

        if (currentUser == null || !"CLIENT".equals(currentUser.getRole())) {
            response.sendRedirect("log-in.jsp");
            return;
        }

        try {
            List<Appointment> appointments = appointmentDAO.getAppointmentsByClient(currentUser.getUserId());
            request.setAttribute("appointments", appointments);
            request.getRequestDispatcher("MyAppointments.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Unable to load your appointments.");
            request.getRequestDispatcher("MyAppointments.jsp").forward(request, response);
        }
    }
}
