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

@WebServlet("/listPayments")
public class PaymentListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer currentCustomer = (Customer) session.getAttribute("customer");
        if (currentCustomer == null) {
            response.sendRedirect("user_login.jsp");
            return;
        }

        List<Payment> payments = FileHandler.readPayments();
        request.setAttribute("payments", payments);
        request.getRequestDispatcher("payment_list.jsp").forward(request, response);
    }
}