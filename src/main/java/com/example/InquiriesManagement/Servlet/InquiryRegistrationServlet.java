package com.example.InquiriesManagement.Servlet;

import com.example.UserManagement.models.Customer;
import com.example.InquiriesManagement.Inquiry;
import com.example.InquiriesManagement.GeneralInquiry;
import com.example.InquiriesManagement.ComplaintInquiry;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet("/registerInquiry")
public class InquiryRegistrationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer currentCustomer = (Customer) session.getAttribute("customer");
        if (currentCustomer == null) {
            response.sendRedirect("user_login.jsp");
            return;
        }

        String customerId = request.getParameter("customerId");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");
        String status = request.getParameter("status");
        String inquiryType = request.getParameter("inquiryType");

        // Basic validation
        if (customerId == null || customerId.isEmpty() || subject == null || subject.isEmpty() ||
                message == null || message.isEmpty() || status == null || status.isEmpty() ||
                inquiryType == null || inquiryType.isEmpty()) {
            request.setAttribute("error", "All fields are required");
            request.getRequestDispatcher("inquiry_register.jsp").forward(request, response);
            return;
        }

        int customerIdInt;
        try {
            customerIdInt = Integer.parseInt(customerId);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid customer ID");
            request.getRequestDispatcher("inquiry_register.jsp").forward(request, response);
            return;
        }

        // Validate customer existence
        List<Customer> customers = FileHandler.readCustomers();
        boolean customerExists = customers.stream().anyMatch(c -> c.getCustomerId() == customerIdInt);
        if (!customerExists) {
            request.setAttribute("error", "Customer does not exist");
            request.getRequestDispatcher("inquiry_register.jsp").forward(request, response);
            return;
        }

        Inquiry inquiry = "Complaint".equals(inquiryType) ?
                new ComplaintInquiry(0, customerIdInt, subject, message, status, null, LocalDateTime.now()) :
                new GeneralInquiry(0, customerIdInt, subject, message, status, null, LocalDateTime.now());
        FileHandler.saveInquiry(inquiry);

        response.sendRedirect("inquiry_success.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("inquiry_register.jsp").forward(request, response);
    }
}