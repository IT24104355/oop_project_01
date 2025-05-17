package com.example.ReservationsManagement;

import java.time.LocalDateTime;

public class IndividualReservation extends Reservation {
    public IndividualReservation(int reservationId, int customerId, int tableId, LocalDateTime reservationDateTime, String status) {
        super(reservationId, customerId, tableId, reservationDateTime, status);
    }

    public IndividualReservation() {}

    @Override
    public String getReservationType() {
        return "Individual";
    }
}