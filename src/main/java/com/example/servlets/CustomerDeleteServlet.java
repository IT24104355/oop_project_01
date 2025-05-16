package com.example.servlets;

import com.example.models.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/deleteCustomer")
public class CustomerDeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer currentCustomer = (Customer) session.getAttribute("customer");

        if (currentCustomer == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Customer> customers = FileHandler.readCustomers();
        customers = customers.stream()
                .filter(c -> c.getCustomerId() != currentCustomer.getCustomerId())
                .collect(Collectors.toList());
        FileHandler.updateCustomers(customers);

        session.invalidate();
        response.sendRedirect("login.jsp");
    }
}