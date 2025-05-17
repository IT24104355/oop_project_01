package com.example.FeedbackManagement;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public abstract class Feedback {
    private int feedbackId;
    private int customerId;
    private int rating; // 1 to 5
    private String comment;
    private String status; // e.g., "pending", "reviewed", "archived"
    private String response;
    private LocalDateTime createdAt;
    private static final DateTimeFormatter FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");

    // Constructor
    public Feedback(int feedbackId, int customerId, int rating, String comment, String status, String response, LocalDateTime createdAt) {
        this.feedbackId = feedbackId;
        this.customerId = customerId;
        this.rating = rating;
        this.comment = comment;
        this.status = status;
        this.response = response;
        this.createdAt = createdAt;
    }

    // Default constructor for file parsing
    public Feedback() {}

    // Getters and Setters
    public int getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(int feedbackId) {
        this.feedbackId = feedbackId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getResponse() {
        return response;
    }

    public void setResponse(String response) {
        this.response = response;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    // Abstract method for polymorphism
    public abstract String getFeedbackType();

    // Convert Feedback object to file string format
    public String toFileString() {
        return feedbackId + "," + customerId + "," + rating + "," + comment + "," + status + "," +
                (response != null ? response : "") + "," + createdAt.format(FORMATTER) + "," + getFeedbackType();
    }

    // Parse string from file to Feedback object
    public static Feedback fromFileString(String line) {
        String[] parts = line.split(",", 8);
        if (parts.length == 8) {
            int feedbackId = Integer.parseInt(parts[0]);
            int customerId = Integer.parseInt(parts[1]);
            int rating = Integer.parseInt(parts[2]);
            String comment = parts[3];
            String status = parts[4];
            String response = parts[5].isEmpty() ? null : parts[5];
            LocalDateTime createdAt = LocalDateTime.parse(parts[6], FORMATTER);
            String feedbackType = parts[7];
            if ("Negative".equals(feedbackType)) {
                return new NegativeFeedback(feedbackId, customerId, rating, comment, status, response, createdAt);
            } else {
                return new PositiveFeedback(feedbackId, customerId, rating, comment, status, response, createdAt);
            }
        }
        throw new IllegalArgumentException("Invalid file string format: " + line);
    }
}