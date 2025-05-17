package com.example.UserManagement.servlets;

import com.example.UserManagement.models.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/register")
public class CustomerRegistrationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");

        // Basic validation
        if (username == null || username.isEmpty() || password == null || password.isEmpty() ||
                email == null || email.isEmpty() || fullName == null || fullName.isEmpty() ||
                phone == null || phone.isEmpty()) {
            request.setAttribute("error", "All fields are required");
            request.getRequestDispatcher("user_register.jsp").forward(request, response);
            return;
        }

        // Check if username already exists
        List<Customer> customers = FileHandler.readCustomers();
        boolean usernameExists = customers.stream().anyMatch(c -> c.getUsername().equals(username));
        if (usernameExists) {
            request.setAttribute("error", "Username already exists");
            request.getRequestDispatcher("user_register.jsp").forward(request, response);
            return;
        }

        Customer customer = new Customer(0, username, password, email, fullName, phone);
        FileHandler.saveCustomer(customer);

        response.sendRedirect("user_registration_success.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("user_register.jsp").forward(request, response);
    }
}