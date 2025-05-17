package com.example.InquiriesManagement;

import java.time.LocalDateTime;

public class ComplaintInquiry extends Inquiry {
    public ComplaintInquiry(int inquiryId, int customerId, String subject, String message, String status, String response, LocalDateTime createdAt) {
        super(inquiryId, customerId, subject, message, status, response, createdAt);
    }

    public ComplaintInquiry() {}

    @Override
    public String getInquiryType() {
        return "Complaint";
    }
}