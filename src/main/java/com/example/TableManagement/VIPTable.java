package com.example.TableManagement;

public class VIPTable extends Table {
    public VIPTable(int tableId, int tableNumber, int capacity, String status) {
        super(tableId, tableNumber, capacity, status);
    }

    public VIPTable() {}

    @Override
    public String getTableType() {
        return "VIP";
    }
}