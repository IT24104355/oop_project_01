package com.example.PaymentsManagement;

import java.time.LocalDateTime;

public class CashPayment extends Payment {
    public CashPayment(int paymentId, int customerId, int reservationId, double amount, String status, LocalDateTime paymentDate) {
        super(paymentId, customerId, reservationId, amount, status, paymentDate);
    }

    public CashPayment() {}

    @Override
    public String getPaymentMethod() {
        return "Cash";
    }
}