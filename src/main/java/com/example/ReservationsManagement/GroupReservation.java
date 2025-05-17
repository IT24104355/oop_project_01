package com.example.ReservationsManagement;

import java.time.LocalDateTime;

public class GroupReservation extends Reservation {
    public GroupReservation(int reservationId, int customerId, int tableId, LocalDateTime reservationDateTime, String status) {
        super(reservationId, customerId, tableId, reservationDateTime, status);
    }

    public GroupReservation() {}

    @Override
    public String getReservationType() {
        return "Group";
    }
}
