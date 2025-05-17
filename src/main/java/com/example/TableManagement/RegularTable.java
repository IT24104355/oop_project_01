package com.example.TableManagement;

public class RegularTable extends Table {
    public RegularTable(int tableId, int tableNumber, int capacity, String status) {
        super(tableId, tableNumber, capacity, status);
    }

    public RegularTable() {}

    @Override
    public String getTableType() {
        return "Regular";
    }
}