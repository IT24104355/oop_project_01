package com.example.servlets;

import com.example.models.Customer;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FileHandler {
    private static final String CUSTOMERS_FILE = "C:\\Users\\DASUNI THIWANSHIKA\\OneDrive\\Desktop\\final-OOP\\demo\\src\\main\\webapp\\data\\customers.txt";

    // Generate a unique customer ID
    private static synchronized int generateCustomerId() throws IOException {
        List<Customer> customers = readCustomers();
        if (customers.isEmpty()) {
            return 1; // Start with ID 1 if no customers exist
        }
        int maxId = customers.stream()
                .mapToInt(Customer::getCustomerId)
                .max()
                .orElse(0);
        return maxId + 1; // Increment the highest ID
    }

    // Save a new customer with a generated customerId
    public static synchronized void saveCustomer(Customer customer) throws IOException {
        if (customer.getCustomerId() == 0) { // Only generate ID if not already set
            int newId = generateCustomerId();
            customer.setCustomerId(newId);
        }
        try (PrintWriter out = new PrintWriter(new FileWriter(CUSTOMERS_FILE, true))) {
            out.println(customer.toFileString());
        }
    }

    // Read all customers from the file
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
}