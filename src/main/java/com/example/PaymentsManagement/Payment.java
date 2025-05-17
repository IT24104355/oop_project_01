package com.example.PaymentsManagement;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public abstract class Payment {
    private int paymentId;
    private int customerId;
    private int reservationId;
    private double amount;
    private String status; // e.g., "completed", "pending", "failed"
    private LocalDateTime paymentDate;
    private static final DateTimeFormatter FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");

    // Constructor
    public Payment(int paymentId, int customerId, int reservationId, double amount, String status, LocalDateTime paymentDate) {
        this.paymentId = paymentId;
        this.customerId = customerId;
        this.reservationId = reservationId;
        this.amount = amount;
        this.status = status;
        this.paymentDate = paymentDate;
    }

    // Default constructor for file parsing
    public Payment() {}

    // Getters and Setters
    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getReservationId() {
        return reservationId;
    }

    public void setReservationId(int reservationId) {
        this.reservationId = reservationId;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public LocalDateTime getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(LocalDateTime paymentDate) {
        this.paymentDate = paymentDate;
    }

    // Abstract method for polymorphism
    public abstract String getPaymentMethod();

    // Convert Payment object to file string format
    public String toFileString() {
        return paymentId + "," + customerId + "," + reservationId + "," + amount + "," + status + "," +
                paymentDate.format(FORMATTER) + "," + getPaymentMethod();
    }

    // Parse string from file to Payment object
    public static Payment fromFileString(String line) {
        String[] parts = line.split(",");
        if (parts.length == 7) {
            int paymentId = Integer.parseInt(parts[0]);
            int customerId = Integer.parseInt(parts[1]);
            int reservationId = Integer.parseInt(parts[2]);
            double amount = Double.parseDouble(parts[3]);
            String status = parts[4];
            LocalDateTime paymentDate = LocalDateTime.parse(parts[5], FORMATTER);
            String paymentMethod = parts[6];
            if ("CreditCard".equals(paymentMethod)) {
                return new CreditCardPayment(paymentId, customerId, reservationId, amount, status, paymentDate);
            } else {
                return new CashPayment(paymentId, customerId, reservationId, amount, status, paymentDate);
            }
        }
        throw new IllegalArgumentException("Invalid file string format: " + line);
    }
}