package com.example.FeedbackManagement.Servlet;

import com.example.ReservationsManagement.Reservation;
import com.example.UserManagement.models.Customer;
import com.example.FeedbackManagement.Feedback;
import com.example.FeedbackManagement.PositiveFeedback;
import com.example.FeedbackManagement.NegativeFeedback;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet("/registerFeedback")
public class FeedbackRegistrationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer currentCustomer = (Customer) session.getAttribute("customer");
        if (currentCustomer == null) {
            response.sendRedirect("user_login.jsp");
            return;
        }

        String customerId = request.getParameter("customerId");
        String rating = request.getParameter("rating");
        String comment = request.getParameter("comment");
        String status = request.getParameter("status");
        String feedbackType = request.getParameter("feedbackType");

        // Basic validation
        if (customerId == null || customerId.isEmpty() || rating == null || rating.isEmpty() ||
                comment == null || comment.isEmpty() || status == null || status.isEmpty() ||
                feedbackType == null || feedbackType.isEmpty()) {
            request.setAttribute("error", "All fields are required");
            request.getRequestDispatcher("feedback_register.jsp").forward(request, response);
            return;
        }

        int customerIdInt, ratingInt;
        try {
            customerIdInt = Integer.parseInt(customerId);
            ratingInt = Integer.parseInt(rating);
            if (ratingInt < 1 || ratingInt > 5) {
                throw new NumberFormatException("Rating must be between 1 and 5");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid customer ID or rating");
            request.getRequestDispatcher("feedback_register.jsp").forward(request, response);
            return;
        }

        // Validate customer existence
        List<Customer> customers = FileHandler.readCustomers();
        boolean customerExists = customers.stream().anyMatch(c -> c.getCustomerId() == customerIdInt);
        if (!customerExists) {
            request.setAttribute("error", "Customer does not exist");
            request.getRequestDispatcher("feedback_register.jsp").forward(request, response);
            return;
        }

        // Example: Check if customer has a reservation (if needed)
        List<Reservation> reservations = FileHandler.readReservations(); // This should now work
        // Add logic here if feedback requires a reservation (optional)

        Feedback feedback = "Negative".equals(feedbackType) ?
                new NegativeFeedback(0, customerIdInt, ratingInt, comment, status, null, LocalDateTime.now()) :
                new PositiveFeedback(0, customerIdInt, ratingInt, comment, status, null, LocalDateTime.now());
        FileHandler.saveFeedback(feedback);

        response.sendRedirect("feedback_success.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("feedback_register.jsp").forward(request, response);
    }
}