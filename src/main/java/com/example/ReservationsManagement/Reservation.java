package com.example.ReservationsManagement;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public abstract class Reservation {
    private int reservationId;
    private int customerId;
    private int tableId;
    private LocalDateTime reservationDateTime;
    private String status; // e.g., "confirmed", "pending", "cancelled"
    private static final DateTimeFormatter FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");

    // Constructor
    public Reservation(int reservationId, int customerId, int tableId, LocalDateTime reservationDateTime, String status) {
        this.reservationId = reservationId;
        this.customerId = customerId;
        this.tableId = tableId;
        this.reservationDateTime = reservationDateTime;
        this.status = status;
    }

    // Default constructor for file parsing
    public Reservation() {}

    // Getters and Setters
    public int getReservationId() {
        return reservationId;
    }

    public void setReservationId(int reservationId) {
        this.reservationId = reservationId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getTableId() {
        return tableId;
    }

    public void setTableId(int tableId) {
        this.tableId = tableId;
    }

    public LocalDateTime getReservationDateTime() {
        return reservationDateTime;
    }

    public void setReservationDateTime(LocalDateTime reservationDateTime) {
        this.reservationDateTime = reservationDateTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    // Abstract method for polymorphism
    public abstract String getReservationType();

    // Convert Reservation object to file string format
    public String toFileString() {
        return reservationId + "," + customerId + "," + tableId + "," +
                reservationDateTime.format(FORMATTER) + "," + status + "," + getReservationType();
    }

    // Parse string from file to Reservation object
    public static Reservation fromFileString(String line) {
        String[] parts = line.split(",");
        if (parts.length == 6) {
            int reservationId = Integer.parseInt(parts[0]);
            int customerId = Integer.parseInt(parts[1]);
            int tableId = Integer.parseInt(parts[2]);
            LocalDateTime reservationDateTime = LocalDateTime.parse(parts[3], FORMATTER);
            String status = parts[4];
            String reservationType = parts[5];
            if ("Group".equals(reservationType)) {
                return new GroupReservation(reservationId, customerId, tableId, reservationDateTime, status);
            } else {
                return new IndividualReservation(reservationId, customerId, tableId, reservationDateTime, status);
            }
        }
        throw new IllegalArgumentException("Invalid file string format: " + line);
    }
}
