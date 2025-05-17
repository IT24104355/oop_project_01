package com.example.ReservationsManagement.Servlet;

import com.example.UserManagement.models.Customer;
import com.example.ReservationsManagement.Reservation;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/deleteReservation")
public class ReservationDeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer currentCustomer = (Customer) session.getAttribute("customer");
        if (currentCustomer == null) {
            response.sendRedirect("user_login.jsp");
            return;
        }

        String reservationId = request.getParameter("reservationId");
        if (reservationId == null || reservationId.isEmpty()) {
            request.setAttribute("error", "Reservation ID is required");
            request.getRequestDispatcher("reservation_list.jsp").forward(request, response);
            return;
        }

        int reservationIdInt;
        try {
            reservationIdInt = Integer.parseInt(reservationId);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid Reservation ID");
            request.getRequestDispatcher("reservation_list.jsp").forward(request, response);
            return;
        }

        List<Reservation> reservations = FileHandler.readReservations();
        reservations = reservations.stream()
                .filter(r -> r.getReservationId() != reservationIdInt)
                .collect(Collectors.toList());
        FileHandler.updateReservations(reservations);

        response.sendRedirect("listReservations");
    }
}