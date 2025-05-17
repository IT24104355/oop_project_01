package com.example.ReservationsManagement.Servlet;

import com.example.UserManagement.models.Customer;
import com.example.ReservationsManagement.Reservation;
import com.example.TableManagement.Table;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet("/updateReservation")
public class ReservationUpdateServlet extends HttpServlet {
    private static final DateTimeFormatter FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer currentCustomer = (Customer) session.getAttribute("customer");
        if (currentCustomer == null) {
            response.sendRedirect("user_login.jsp");
            return;
        }

        String reservationId = request.getParameter("reservationId");
        String customerId = request.getParameter("customerId");
        String tableId = request.getParameter("tableId");
        String reservationDateTime = request.getParameter("reservationDateTime");
        String status = request.getParameter("status");

        // Basic validation
        if (reservationId == null || reservationId.isEmpty() || customerId == null || customerId.isEmpty() ||
                tableId == null || tableId.isEmpty() || reservationDateTime == null || reservationDateTime.isEmpty() ||
                status == null || status.isEmpty()) {
            request.setAttribute("error", "All fields are required");
            request.getRequestDispatcher("reservation_update.jsp").forward(request, response);
            return;
        }

        int reservationIdInt, customerIdInt, tableIdInt;
        LocalDateTime dateTime;
        try {
            reservationIdInt = Integer.parseInt(reservationId);
            customerIdInt = Integer.parseInt(customerId);
            tableIdInt = Integer.parseInt(tableId);
            dateTime = LocalDateTime.parse(reservationDateTime, FORMATTER);
        } catch (Exception e) {
            request.setAttribute("error", "Invalid reservation ID, customer ID, table ID, or date/time format");
            request.getRequestDispatcher("reservation_update.jsp").forward(request, response);
            return;
        }

        // Validate customer and table existence
        List<Customer> customers = FileHandler.readCustomers();
        List<Table> tables = FileHandler.readTables();
        boolean customerExists = customers.stream().anyMatch(c -> c.getCustomerId() == customerIdInt);
        boolean tableExists = tables.stream().anyMatch(t -> t.getTableId() == tableIdInt);
        if (!customerExists || !tableExists) {
            request.setAttribute("error", "Customer or table does not exist");
            request.getRequestDispatcher("reservation_update.jsp").forward(request, response);
            return;
        }

        List<Reservation> reservations = FileHandler.readReservations();
        boolean reservationFound = false;
        for (Reservation reservation : reservations) {
            if (reservation.getReservationId() == reservationIdInt) {
                reservation.setCustomerId(customerIdInt);
                reservation.setTableId(tableIdInt);
                reservation.setReservationDateTime(dateTime);
                reservation.setStatus(status);
                reservationFound = true;
                break;
            }
        }

        if (!reservationFound) {
            request.setAttribute("error", "Reservation not found");
            request.getRequestDispatcher("reservation_update.jsp").forward(request, response);
            return;
        }

        FileHandler.updateReservations(reservations);
        response.sendRedirect("listReservations");
    }
}