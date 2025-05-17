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

@WebServlet("/updateInquiry")
public class InquiryUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer currentCustomer = (Customer) session.getAttribute("customer");
        if (currentCustomer == null) {
            response.sendRedirect("user_login.jsp");
            return;
        }

        String inquiryId = request.getParameter("inquiryId");
        String customerId = request.getParameter("customerId");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");
        String status = request.getParameter("status");
        String responseText = request.getParameter("response");

        // Basic validation
        if (inquiryId == null || inquiryId.isEmpty() || customerId == null || customerId.isEmpty() ||
                subject == null || subject.isEmpty() || message == null || message.isEmpty() ||
                status == null || status.isEmpty()) {
            request.setAttribute("error", "All required fields must be filled");
            request.getRequestDispatcher("inquiry_update.jsp").forward(request, response);
            return;
        }

        int inquiryIdInt, customerIdInt;
        try {
            inquiryIdInt = Integer.parseInt(inquiryId);
            customerIdInt = Integer.parseInt(customerId);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid inquiry ID or customer ID");
            request.getRequestDispatcher("inquiry_update.jsp").forward(request, response);
            return;
        }

        // Validate customer existence
        List<Customer> customers = FileHandler.readCustomers();
        boolean customerExists = customers.stream().anyMatch(c -> c.getCustomerId() == customerIdInt);
        if (!customerExists) {
            request.setAttribute("error", "Customer does not exist");
            request.getRequestDispatcher("inquiry_update.jsp").forward(request, response);
            return;
        }

        List<Inquiry> inquiries = FileHandler.readInquiries();
        boolean inquiryFound = false;
        for (Inquiry inquiry : inquiries) {
            if (inquiry.getInquiryId() == inquiryIdInt) {
                inquiry.setCustomerId(customerIdInt);
                inquiry.setSubject(subject);
                inquiry.setMessage(message);
                inquiry.setStatus(status);
                inquiry.setResponse(responseText);
                inquiryFound = true;
                break;
            }
        }

        if (!inquiryFound) {
            request.setAttribute("error", "Inquiry not found");
            request.getRequestDispatcher("inquiry_update.jsp").forward(request, response);
            return;
        }

        FileHandler.updateInquiries(inquiries);
        response.sendRedirect("listInquiries");
    }
}