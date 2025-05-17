package com.example.AdminDashboard.Servlet;

import com.example.UserManagement.models.Customer;
import com.example.AdminDashboard.Dashboard;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/adminDashboard")
public class AdminDashboardServlet extends HttpServlet {
    private static final String ADMIN_PASSWORD = "admin123"; // Hardcoded for simplicity; consider secure storage

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer currentCustomer = (Customer) session.getAttribute("customer");
        if (currentCustomer == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String password = request.getParameter("adminPassword");
        if (password == null || !password.equals(ADMIN_PASSWORD)) {
            request.setAttribute("error", "Invalid admin password");
            request.getRequestDispatcher("admin_login.jsp").forward(request, response);
            return;
        }

        // Load dashboard metrics
        Dashboard dashboard = new Dashboard();
        request.setAttribute("dashboard", dashboard);
        request.setAttribute("passwordVerified", true);
        request.getRequestDispatcher("admin_dashboard.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer currentCustomer = (Customer) session.getAttribute("customer");
        if (currentCustomer == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        request.getRequestDispatcher("admin_login.jsp").forward(request, response);
    }
}
