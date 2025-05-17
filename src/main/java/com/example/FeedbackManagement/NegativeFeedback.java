package com.example.FeedbackManagement;

import java.time.LocalDateTime;

public class NegativeFeedback extends Feedback {
    public NegativeFeedback(int feedbackId, int customerId, int rating, String comment, String status, String response, LocalDateTime createdAt) {
        super(feedbackId, customerId, rating, comment, status, response, createdAt);
    }

    public NegativeFeedback() {}

    @Override
    public String getFeedbackType() {
        return "Negative";
    }
}