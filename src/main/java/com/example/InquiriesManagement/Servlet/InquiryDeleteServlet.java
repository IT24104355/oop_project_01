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
import java.util.stream.Collectors;

@WebServlet("/deleteInquiry")
public class InquiryDeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer currentCustomer = (Customer) session.getAttribute("customer");
        if (currentCustomer == null) {
            response.sendRedirect("user_login.jsp");
            return;
        }

        String inquiryId = request.getParameter("inquiryId");
        if (inquiryId == null || inquiryId.isEmpty()) {
            request.setAttribute("error", "Inquiry ID is required");
            request.getRequestDispatcher("inquiry_list.jsp").forward(request, response);
            return;
        }

        int inquiryIdInt;
        try {
            inquiryIdInt = Integer.parseInt(inquiryId);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid Inquiry ID");
            request.getRequestDispatcher("inquiry_list.jsp").forward(request, response);
            return;
        }

        List<Inquiry> inquiries = FileHandler.readInquiries();
        inquiries = inquiries.stream()
                .filter(i -> i.getInquiryId() != inquiryIdInt)
                .collect(Collectors.toList());
        FileHandler.updateInquiries(inquiries);

        response.sendRedirect("listInquiries");
    }
}