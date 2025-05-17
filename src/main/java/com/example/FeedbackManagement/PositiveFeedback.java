package com.example.FeedbackManagement;

import java.time.LocalDateTime;

public class PositiveFeedback extends Feedback {
    public PositiveFeedback(int feedbackId, int customerId, int rating, String comment, String status, String response, LocalDateTime createdAt) {
        super(feedbackId, customerId, rating, comment, status, response, createdAt);
    }

    public PositiveFeedback() {}

    @Override
    public String getFeedbackType() {
        return "Positive";
    }
}