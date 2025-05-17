package com.example.InquiriesManagement;

import java.time.LocalDateTime;

public class GeneralInquiry extends Inquiry {
    public GeneralInquiry(int inquiryId, int customerId, String subject, String message, String status, String response, LocalDateTime createdAt) {
        super(inquiryId, customerId, subject, message, status, response, createdAt);
    }

    public GeneralInquiry() {}

    @Override
    public String getInquiryType() {
        return "General";
    }
}