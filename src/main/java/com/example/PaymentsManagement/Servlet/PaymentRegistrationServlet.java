package com.example.PaymentsManagement.Servlet;

import com.example.UserManagement.models.Customer;
import com.example.ReservationsManagement.Reservation;
import com.example.PaymentsManagement.Payment;
import com.example.PaymentsManagement.CreditCardPayment;
import com.example.PaymentsManagement.CashPayment;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet("/registerPayment")
public class PaymentRegistrationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer currentCustomer = (Customer) session.getAttribute("customer");
        if (currentCustomer == null) {
            response.sendRedirect("user_login.jsp");
            return;
        }

        String customerId = request.getParameter("customerId");
        String reservationId = request.getParameter("reservationId");
        String amount = request.getParameter("amount");
        String status = request.getParameter("status");
        String paymentMethod = request.getParameter("paymentMethod");

        // Basic validation
        if (customerId == null || customerId.isEmpty() || reservationId == null || reservationId.isEmpty() ||
                amount == null || amount.isEmpty() || status == null || status.isEmpty() ||
                paymentMethod == null || paymentMethod.isEmpty()) {
            request.setAttribute("error", "All fields are required");
            request.getRequestDispatcher("payment_register.jsp").forward(request, response);
            return;
        }

        int customerIdInt, reservationIdInt;
        double amountDouble;
        try {
            customerIdInt = Integer.parseInt(customerId);
            reservationIdInt = Integer.parseInt(reservationId);
            amountDouble = Double.parseDouble(amount);
            if (amountDouble <= 0) {
                throw new NumberFormatException("Amount must be positive");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid customer ID, reservation ID, or amount");
            request.getRequestDispatcher("payment_register.jsp").forward(request, response);
            return;
        }

        // Validate customer and reservation existence
        List<Customer> customers = FileHandler.readCustomers();
        List<Reservation> reservations = FileHandler.readReservations();
        boolean customerExists = customers.stream().anyMatch(c -> c.getCustomerId() == customerIdInt);
        boolean reservationExists = reservations.stream().anyMatch(r -> r.getReservationId() == reservationIdInt);
        if (!customerExists || !reservationExists) {
            request.setAttribute("error", "Customer or reservation does not exist");
            request.getRequestDispatcher("payment_register.jsp").forward(request, response);
            return;
        }

        Payment payment = "CreditCard".equals(paymentMethod) ?
                new CreditCardPayment(0, customerIdInt, reservationIdInt, amountDouble, status, LocalDateTime.now()) :
                new CashPayment(0, customerIdInt, reservationIdInt, amountDouble, status, LocalDateTime.now());
        FileHandler.savePayment(payment);

        response.sendRedirect("payment_success.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("payment_register.jsp").forward(request, response);
    }
}