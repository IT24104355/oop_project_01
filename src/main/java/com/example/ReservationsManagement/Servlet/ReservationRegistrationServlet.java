package com.example.ReservationsManagement.Servlet;

import com.example.UserManagement.models.Customer;
import com.example.ReservationsManagement.Reservation;
import com.example.ReservationsManagement.IndividualReservation;
import com.example.ReservationsManagement.GroupReservation;
import com.example.ReservationsManagement.ReservationQueue; // Import the new Queue
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

@WebServlet("/registerReservation")
public class ReservationRegistrationServlet extends HttpServlet {
    private static final DateTimeFormatter FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
    private static final ReservationQueue reservationQueue = new ReservationQueue(); // Static queue instance

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer currentCustomer = (Customer) session.getAttribute("customer");
        if (currentCustomer == null) {
            response.sendRedirect("user_login.jsp");
            return;
        }

        String customerId = request.getParameter("customerId");
        String tableId = request.getParameter("tableId");
        String reservationDateTime = request.getParameter("reservationDateTime");
        String status = request.getParameter("status");
        String reservationType = request.getParameter("reservationType");

        // Basic validation
        if (customerId == null || customerId.isEmpty() || tableId == null || tableId.isEmpty() ||
                reservationDateTime == null || reservationDateTime.isEmpty() || status == null || status.isEmpty() ||
                reservationType == null || reservationType.isEmpty()) {
            request.setAttribute("error", "All fields are required");
            request.getRequestDispatcher("reservation_register.jsp").forward(request, response);
            return;
        }

        int customerIdInt, tableIdInt;
        LocalDateTime dateTime;
        try {
            customerIdInt = Integer.parseInt(customerId);
            tableIdInt = Integer.parseInt(tableId);
            dateTime = LocalDateTime.parse(reservationDateTime, FORMATTER);
        } catch (Exception e) {
            request.setAttribute("error", "Invalid customer ID, table ID, or date/time format");
            request.getRequestDispatcher("reservation_register.jsp").forward(request, response);
            return;
        }

        // Validate customer and table existence
        List<Customer> customers = FileHandler.readCustomers();
        List<Table> tables = FileHandler.readTables();
        boolean customerExists = customers.stream().anyMatch(c -> c.getCustomerId() == customerIdInt);
        boolean tableExists = tables.stream().anyMatch(t -> t.getTableId() == tableIdInt);
        if (!customerExists || !tableExists) {
            request.setAttribute("error", "Customer or table does not exist");
            request.getRequestDispatcher("reservation_register.jsp").forward(request, response);
            return;
        }

        // Check table availability
        List<Reservation> reservations = FileHandler.readReservations();
        boolean tableBooked = reservations.stream()
                .anyMatch(r -> r.getTableId() == tableIdInt &&
                        r.getReservationDateTime().equals(dateTime) &&
                        r.getStatus().equals("confirmed"));
        if (tableBooked) {
            request.setAttribute("error", "Table is already booked for the selected time");
            request.getRequestDispatcher("reservation_register.jsp").forward(request, response);
            return;
        }

        // Create reservation and add to queue
        Reservation reservation = "Group".equals(reservationType) ?
                new GroupReservation(0, customerIdInt, tableIdInt, dateTime, status) :
                new IndividualReservation(0, customerIdInt, tableIdInt, dateTime, status);
        reservationQueue.enqueue(reservation); // Add to queue instead of saving directly

        // Optionally process the queue immediately (for simplicity in demo)
        if (!reservationQueue.isEmpty()) {
            Reservation queuedReservation = reservationQueue.dequeue();
            FileHandler.saveReservation(queuedReservation);
        }

        response.sendRedirect("reservation_success.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("reservation_register.jsp").forward(request, response);
    }

    // Method to view queue contents (for demonstration)
    public static ReservationQueue getReservationQueue() {
        return reservationQueue;
    }
}