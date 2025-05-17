package com.example.InquiriesManagement;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public abstract class Inquiry {
    private static int inquiryId;
    private int customerId;
    private String subject;
    private String message;
    private String status; // e.g., "open", "resolved", "closed"
    private String response;
    private LocalDateTime createdAt;
    private static final DateTimeFormatter FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");

    // Constructor
    public Inquiry(int inquiryId, int customerId, String subject, String message, String status, String response, LocalDateTime createdAt) {
        Inquiry.inquiryId = inquiryId;
        this.customerId = customerId;
        this.subject = subject;
        this.message = message;
        this.status = status;
        this.response = response;
        this.createdAt = createdAt;
    }

    // Default constructor for file parsing
    public Inquiry() {}

    // Getters and Setters
    public int getInquiryId() {
        return inquiryId;
    }

    public void setInquiryId(int inquiryId) {
        Inquiry.inquiryId = inquiryId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
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
    public abstract String getInquiryType();

    // Convert Inquiry object to file string format
    public String toFileString() {
        return inquiryId + "," + customerId + "," + subject + "," + message + "," + status + "," +
                (response != null ? response : "") + "," + createdAt.format(FORMATTER) + "," + getInquiryType();
    }

    // Parse string from file to Inquiry object
    public static Inquiry fromFileString(String line) {
        String[] parts = line.split(",", 8);
        if (parts.length == 8) {
            int inquiryId = Integer.parseInt(parts[0]);
            int customerId = Integer.parseInt(parts[1]);
            String subject = parts[2];
            String message = parts[3];
            String status = parts[4];
            String response = parts[5].isEmpty() ? null : parts[5];
            LocalDateTime createdAt = LocalDateTime.parse(parts[6], FORMATTER);
            String inquiryType = parts[7];
            if ("Complaint".equals(inquiryType)) {
                return new ComplaintInquiry(inquiryId, customerId, subject, message, status, response, createdAt);
            } else {
                return new GeneralInquiry(inquiryId, customerId, subject, message, status, response, createdAt);
            }
        }
        throw new IllegalArgumentException("Invalid file string format: " + line);
    }

}