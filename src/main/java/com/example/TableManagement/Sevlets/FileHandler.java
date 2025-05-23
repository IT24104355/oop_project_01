package com.example.TableManagement.Sevlets;

import com.example.UserManagement.models.Customer;
import com.example.TableManagement.Table;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FileHandler {
    private static final String CUSTOMERS_FILE = "C:\\Users\\DASUNI THIWANSHIKA\\OneDrive\\Desktop\\final-OOP\\demo\\src\\main\\webapp\\data\\customers.txt";
    private static final String TABLES_FILE = "C:\\Users\\DASUNI THIWANSHIKA\\OneDrive\\Desktop\\final-OOP\\demo\\src\\main\\webapp\\data\\tables.txt";

    // Generate a unique customer id
    public static synchronized int generateCustomerId() throws IOException {
        List<Customer> customers = readCustomers();
        if (customers.isEmpty()) {
            return 1;
        }
        int maxId = customers.stream()
                .mapToInt(Customer::getCustomerId)
                .max()
                .orElse(0);
        return maxId + 1;
    }

    // Save a new customer
    public static synchronized void saveCustomer(Customer customer) throws IOException {
        if (customer.getCustomerId() == 0) {
            int newId = generateCustomerId();
            customer.setCustomerId(newId);
        }
        try (PrintWriter out = new PrintWriter(new FileWriter(CUSTOMERS_FILE, true))) {
            out.println(customer.toFileString());
        }
    }

    // Read all customers
    public static synchronized List<Customer> readCustomers() throws IOException {
        List<Customer> customers = new ArrayList<>();
        File file = new File(CUSTOMERS_FILE);
        if (!file.exists()) {
            file.createNewFile();
            return customers;
        }
        try (BufferedReader reader = new BufferedReader(new FileReader(CUSTOMERS_FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (!line.trim().isEmpty()) {
                    try {
                        customers.add(Customer.fromFileString(line));
                    } catch (Exception e) {
                        System.err.println("Error parsing line: " + line);
                    }
                }
            }
        }
        return customers;
    }

    // Update the entire customer list
    public static synchronized void updateCustomers(List<Customer> customers) throws IOException {
        try (PrintWriter out = new PrintWriter(new FileWriter(CUSTOMERS_FILE))) {
            for (Customer customer : customers) {
                out.println(customer.toFileString());
            }
        }
    }

    // Generate a unique table ID
    public static synchronized int generateTableId() throws IOException {
        List<Table> tables = readTables();
        if (tables.isEmpty()) {
            return 1;
        }
        int maxId = tables.stream()
                .mapToInt(Table::getTableId)
                .max()
                .orElse(0);
        return maxId + 1;
    }

    // Save a new table
    public static synchronized void saveTable(Table table) throws IOException {
        if (table.getTableId() == 0) {
            int newId = generateTableId();
            table.setTableId(newId);
        }
        try (PrintWriter out = new PrintWriter(new FileWriter(TABLES_FILE, true))) {
            out.println(table.toFileString());
        }
    }

    // Read all tables
    public static synchronized List<Table> readTables() throws IOException {
        List<Table> tables = new ArrayList<>();
        File file = new File(TABLES_FILE);
        if (!file.exists()) {
            file.createNewFile();
            return tables;
        }
        try (BufferedReader reader = new BufferedReader(new FileReader(TABLES_FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (!line.trim().isEmpty()) {
                    try {
                        tables.add(Table.fromFileString(line));
                    } catch (Exception e) {
                        System.err.println("Error parsing line: " + line);
                    }
                }
            }
        }
        return tables;
    }

    // Update the entire table list
    public static synchronized void updateTables(List<Table> tables) throws IOException {
        try (PrintWriter out = new PrintWriter(new FileWriter(TABLES_FILE))) {
            for (Table table : tables) {
                out.println(table.toFileString());
            }
        }
    }
}