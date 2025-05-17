package com.example.PaymentsManagement.Servlet;

import com.example.UserManagement.models.Customer;
import com.example.ReservationsManagement.Reservation;
import com.example.PaymentsManagement.Payment;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/updatePayment")
public class PaymentUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer currentCustomer = (Customer) session.getAttribute("customer");
        if (currentCustomer == null) {
            response.sendRedirect("user_login.jsp");
            return;
        }

        String paymentId = request.getParameter("paymentId");
        String customerId = request.getParameter("customerId");
        String reservationId = request.getParameter("reservationId");
        String amount = request.getParameter("amount");
        String status = request.getParameter("status");

        // Basic validation
        if (paymentId == null || paymentId.isEmpty() || customerId == null || customerId.isEmpty() ||
                reservationId == null || reservationId.isEmpty() || amount == null || amount.isEmpty() ||
                status == null || status.isEmpty()) {
            request.setAttribute("error", "All required fields must be filled");
            request.getRequestDispatcher("payment_update.jsp").forward(request, response);
            return;
        }

        int paymentIdInt, customerIdInt, reservationIdInt;
        double amountDouble;
        try {
            paymentIdInt = Integer.parseInt(paymentId);
            customerIdInt = Integer.parseInt(customerId);
            reservationIdInt = Integer.parseInt(reservationId);
            amountDouble = Double.parseDouble(amount);
            if (amountDouble <= 0) {
                throw new NumberFormatException("Amount must be positive");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid payment ID, customer ID, reservation ID, or amount");
            request.getRequestDispatcher("payment_update.jsp").forward(request, response);
            return;
        }

        // Validate customer and reservation existence
        List<Customer> customers = FileHandler.readCustomers();
        List<Reservation> reservations = FileHandler.readReservations();
        boolean customerExists = customers.stream().anyMatch(c -> c.getCustomerId() == customerIdInt);
        boolean reservationExists = reservations.stream().anyMatch(r -> r.getReservationId() == reservationIdInt);
        if (!customerExists || !reservationExists) {
            request.setAttribute("error", "Customer or reservation does not exist");
            request.getRequestDispatcher("payment_update.jsp").forward(request, response);
            return;
        }

        List<Payment> payments = FileHandler.readPayments();
        boolean paymentFound = false;
        for (Payment payment : payments) {
            if (payment.getPaymentId() == paymentIdInt) {
                payment.setCustomerId(customerIdInt);
                payment.setReservationId(reservationIdInt);
                payment.setAmount(amountDouble);
                payment.setStatus(status);
                paymentFound = true;
                break;
            }
        }

        if (!paymentFound) {
            request.setAttribute("error", "Payment not found");
            request.getRequestDispatcher("payment_update.jsp").forward(request, response);
            return;
        }

        FileHandler.updatePayments(payments);
        response.sendRedirect("listPayments");
    }
}