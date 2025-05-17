package com.example.InquiriesManagement.Servlet;

import com.example.UserManagement.models.Customer;
import com.example.InquiriesManagement.Inquiry;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/listInquiries")
public class InquiryListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer currentCustomer = (Customer) session.getAttribute("customer");
        if (currentCustomer == null) {
            response.sendRedirect("user_login.jsp");
            return;
        }

        List<Inquiry> inquiries = FileHandler.readInquiries();
        request.setAttribute("inquiries", inquiries);
        request.getRequestDispatcher("inquiry_list.jsp").forward(request, response);
    }
}