package com.example.FeedbackManagement.Servlet;

import com.example.UserManagement.models.Customer;
import com.example.FeedbackManagement.Feedback;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/updateFeedback")
public class FeedbackUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer currentCustomer = (Customer) session.getAttribute("customer");
        if (currentCustomer == null) {
            response.sendRedirect("user_login.jsp");
            return;
        }

        String feedbackId = request.getParameter("feedbackId");
        String customerId = request.getParameter("customerId");
        String rating = request.getParameter("rating");
        String comment = request.getParameter("comment");
        String status = request.getParameter("status");
        String responseText = request.getParameter("response");

        // Basic validation
        if (feedbackId == null || feedbackId.isEmpty() || customerId == null || customerId.isEmpty() ||
                rating == null || rating.isEmpty() || comment == null || comment.isEmpty() ||
                status == null || status.isEmpty()) {
            request.setAttribute("error", "All required fields must be filled");
            request.getRequestDispatcher("feedback_update.jsp").forward(request, response);
            return;
        }

        int feedbackIdInt, customerIdInt, ratingInt;
        try {
            feedbackIdInt = Integer.parseInt(feedbackId);
            customerIdInt = Integer.parseInt(customerId);
            ratingInt = Integer.parseInt(rating);
            if (ratingInt < 1 || ratingInt > 5) {
                throw new NumberFormatException("Rating must be between 1 and 5");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid feedback ID, customer ID, or rating");
            request.getRequestDispatcher("feedback_update.jsp").forward(request, response);
            return;
        }

        // Validate customer existence
        List<Customer> customers = FileHandler.readCustomers();
        boolean customerExists = customers.stream().anyMatch(c -> c.getCustomerId() == customerIdInt);
        if (!customerExists) {
            request.setAttribute("error", "Customer does not exist");
            request.getRequestDispatcher("feedback_update.jsp").forward(request, response);
            return;
        }

        List<Feedback> feedbacks = FileHandler.readFeedbacks();
        boolean feedbackFound = false;
        for (Feedback feedback : feedbacks) {
            if (feedback.getFeedbackId() == feedbackIdInt) {
                feedback.setCustomerId(customerIdInt);
                feedback.setRating(ratingInt);
                feedback.setComment(comment);
                feedback.setStatus(status);
                feedback.setResponse(responseText);
                feedbackFound = true;
                break;
            }
        }

        if (!feedbackFound) {
            request.setAttribute("error", "Feedback not found");
            request.getRequestDispatcher("feedback_update.jsp").forward(request, response);
            return;
        }

        FileHandler.updateFeedbacks(feedbacks);
        response.sendRedirect("listFeedbacks");
    }
}