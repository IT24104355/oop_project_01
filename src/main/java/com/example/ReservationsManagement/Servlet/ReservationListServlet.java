package com.example.ReservationsManagement.Servlet;

import com.example.UserManagement.models.Customer;
import com.example.ReservationsManagement.Reservation;
import com.example.ReservationsManagement.MergeSortReservations; // Import MergeSort
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/listReservations")
public class ReservationListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer currentCustomer = (Customer) session.getAttribute("customer");
        if (currentCustomer == null) {
            response.sendRedirect("user_login.jsp");
            return;
        }

        List<Reservation> reservations = FileHandler.readReservations();
        // Convert List to array for Merge Sort
        Reservation[] reservationArray = reservations.toArray(new Reservation[0]);
        // Sort using Merge Sort
        MergeSortReservations.sortReservations(reservationArray);
        // Set sorted array as request attribute
        request.setAttribute("reservations", reservationArray);
        request.getRequestDispatcher("reservation_list.jsp").forward(request, response);
    }
}