package com.example.PaymentsManagement.Servlet;

import com.example.UserManagement.models.Customer;
import com.example.PaymentsManagement.Payment;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/deletePayment")
public class PaymentDeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer currentCustomer = (Customer) session.getAttribute("customer");
        if (currentCustomer == null) {
            response.sendRedirect("user_login.jsp");
            return;
        }

        String paymentId = request.getParameter("paymentId");
        if (paymentId == null || paymentId.isEmpty()) {
            request.setAttribute("error", "Payment ID is required");
            request.getRequestDispatcher("payment_list.jsp").forward(request, response);
            return;
        }

        int paymentIdInt;
        try {
            paymentIdInt = Integer.parseInt(paymentId);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid Payment ID");
            request.getRequestDispatcher("payment_list.jsp").forward(request, response);
            return;
        }

        List<Payment> payments = FileHandler.readPayments();
        payments = payments.stream()
                .filter(p -> p.getPaymentId() != paymentIdInt)
                .collect(Collectors.toList());
        FileHandler.updatePayments(payments);

        response.sendRedirect("listPayments");
    }
}