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

@WebServlet("/updateCustomer")
public class CustomerUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer currentCustomer = (Customer) session.getAttribute("customer");

        if (currentCustomer == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String email = request.getParameter("email");
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        // Basic validation
        if (email == null || email.isEmpty() || fullName == null || fullName.isEmpty() || phone == null || phone.isEmpty()) {
            request.setAttribute("error", "Email, full name, and phone are required");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
            return;
        }

        List<Customer> customers = FileHandler.readCustomers();
        for (Customer customer : customers) {
            if (customer.getCustomerId() == currentCustomer.getCustomerId()) {
                customer.setEmail(email);
                customer.setFullName(fullName);
                customer.setPhone(phone);
                if (password != null && !password.isEmpty()) {
                    customer.setPassword(password);
                }
                break;
            }
        }
        FileHandler.updateCustomers(customers);
        session.setAttribute("customer", customers.stream()
                .filter(c -> c.getCustomerId() == currentCustomer.getCustomerId())
                .findFirst().orElse(currentCustomer));
        response.sendRedirect("profile.jsp");
    }
}