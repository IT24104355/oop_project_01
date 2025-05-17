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
import java.util.stream.Collectors;

@WebServlet("/deleteFeedback")
public class FeedbackDeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer currentCustomer = (Customer) session.getAttribute("customer");
        if (currentCustomer == null) {
            response.sendRedirect("user_login.jsp");
            return;
        }

        String feedbackId = request.getParameter("feedbackId");
        if (feedbackId == null || feedbackId.isEmpty()) {
            request.setAttribute("error", "Feedback ID is required");
            request.getRequestDispatcher("feedback_list.jsp").forward(request, response);
            return;
        }

        int feedbackIdInt;
        try {
            feedbackIdInt = Integer.parseInt(feedbackId);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid Feedback ID");
            request.getRequestDispatcher("feedback_list.jsp").forward(request, response);
            return;
        }

        List<Feedback> feedbacks = FileHandler.readFeedbacks();
        feedbacks = feedbacks.stream()
                .filter(f -> f.getFeedbackId() != feedbackIdInt)
                .collect(Collectors.toList());
        FileHandler.updateFeedbacks(feedbacks);

        response.sendRedirect("listFeedbacks");
    }
}