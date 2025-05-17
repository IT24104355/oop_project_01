package com.example.UserManagement.models;

public class Customer {
    private int customerId;
    private String username;
    private String password;
    private String email;
    private String fullName;
    private String phone;

    // Constructor
    public Customer(int customerId, String username, String password, String email, String fullName, String phone) {
        this.customerId = customerId;
        this.username = username;
        this.password = password;
        this.email = email;
        this.fullName = fullName;
        this.phone = phone;
    }

    // Default constructor for file parsing
    public Customer() {}

    // Getters and Setters
    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    // Convert Customer object to file string format
    public String toFileString() {
        return customerId + "," + username + "," + password + "," + email + "," + fullName + "," + phone;
    }

    // Parse string from file to Customer object
    public static Customer fromFileString(String line) {
        String[] parts = line.split(",");
        if (parts.length == 6) {
            Customer customer = new Customer();
            customer.setCustomerId(Integer.parseInt(parts[0]));
            customer.setUsername(parts[1]);
            customer.setPassword(parts[2]);
            customer.setEmail(parts[3]);
            customer.setFullName(parts[4]);
            customer.setPhone(parts[5]);
            return customer;
        }
        throw new IllegalArgumentException("Invalid file string format: " + line);
    }
}