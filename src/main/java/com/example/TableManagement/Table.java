package com.example.TableManagement;

public abstract class Table {
    private int tableId;
    private int tableNumber;
    private int capacity;
    private String status; // e.g., "available", "occupied", "reserved"

    // Constructor
    public Table(int tableId, int tableNumber, int capacity, String status) {
        this.tableId = tableId;
        this.tableNumber = tableNumber;
        this.capacity = capacity;
        this.status = status;
    }

    // Default constructor for file parsing
    public Table() {}

    // Getters and Setters
    public int getTableId() {
        return tableId;
    }

    public void setTableId(int tableId) {
        this.tableId = tableId;
    }

    public int getTableNumber() {
        return tableNumber;
    }

    public void setTableNumber(int tableNumber) {
        this.tableNumber = tableNumber;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    // Abstract method for polymorphism
    public abstract String getTableType();

    // Convert Table object to file string format
    public String toFileString() {
        return tableId + "," + tableNumber + "," + capacity + "," + status + "," + getTableType();
    }

    // Parse string from file to Table object
    public static Table fromFileString(String line) {
        String[] parts = line.split(",");
        if (parts.length == 5) {
            int tableId = Integer.parseInt(parts[0]);
            int tableNumber = Integer.parseInt(parts[1]);
            int capacity = Integer.parseInt(parts[2]);
            String status = parts[3];
            String tableType = parts[4];
            if ("VIP".equals(tableType)) {
                return new VIPTable(tableId, tableNumber, capacity, status);
            } else {
                return new RegularTable(tableId, tableNumber, capacity, status);
            }
        }
        throw new IllegalArgumentException("Invalid file string format: " + line);
    }
}