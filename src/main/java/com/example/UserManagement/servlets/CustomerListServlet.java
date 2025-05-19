package com.example.UserManagement.servlets;

import com.example.UserManagement.models.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/listCustomers")
public class CustomerListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer currentCustomer = (Customer) session.getAttribute("customer");
        if (currentCustomer == null) {
            response.sendRedirect("user_login.jsp");
            return;
        }

        // Read customers from FileHandler
        List<Customer> customers = FileHandler.readCustomers();
        // Convert List to array for JSP compatibility
        Customer[] customerArray = customers.toArray(new Customer[0]);
        request.setAttribute("customers", customerArray);
        request.getRequestDispatcher("customer_list.jsp").forward(request, response);
    }
}