package com.example.PaymentsManagement;

import java.time.LocalDateTime;

public class CreditCardPayment extends Payment {
    public CreditCardPayment(int paymentId, int customerId, int reservationId, double amount, String status, LocalDateTime paymentDate) {
        super(paymentId, customerId, reservationId, amount, status, paymentDate);
    }

    public CreditCardPayment() {}

    @Override
    public String getPaymentMethod() {
        return "CreditCard";
    }
}