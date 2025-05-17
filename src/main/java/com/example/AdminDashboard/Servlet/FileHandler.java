package com.example.AdminDashboard.Servlet;

import com.example.UserManagement.models.Customer;
import com.example.TableManagement.Table;
import com.example.ReservationsManagement.Reservation;
import com.example.InquiriesManagement.Inquiry;
import com.example.FeedbackManagement.Feedback;
import com.example.PaymentsManagement.Payment;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FileHandler {
    private static final String CUSTOMERS_FILE = "C:\\Users\\DASUNI THIWANSHIKA\\OneDrive\\Desktop\\final-OOP\\demo\\src\\main\\webapp\\data\\customers.txt";
    private static final String TABLES_FILE = "C:\\Users\\DASUNI THIWANSHIKA\\OneDrive\\Desktop\\final-OOP\\demo\\src\\main\\webapp\\data\\tables.txt";
    private static final String RESERVATIONS_FILE = "C:\\Users\\DASUNI THIWANSHIKA\\OneDrive\\Desktop\\final-OOP\\demo\\src\\main\\webapp\\data\\reservations.txt";
    private static final String INQUIRIES_FILE = "C:\\Users\\DASUNI THIWANSHIKA\\OneDrive\\Desktop\\final-OOP\\demo\\src\\main\\webapp\\data\\inquiries.txt";
    private static final String FEEDBACKS_FILE = "C:\\Users\\DASUNI THIWANSHIKA\\OneDrive\\Desktop\\final-OOP\\demo\\src\\main\\webapp\\data\\feedbacks.txt";
    private static final String PAYMENTS_FILE = "C:\\Users\\DASUNI THIWANSHIKA\\OneDrive\\Desktop\\final-OOP\\demo\\src\\main\\webapp\\data\\payments.txt";

    // Generate a unique customer ID
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

    // Generate a unique reservation ID
    public static synchronized int generateReservationId() throws IOException {
        List<Reservation> reservations = readReservations();
        if (reservations.isEmpty()) {
            return 1;
        }
        int maxId = reservations.stream()
                .mapToInt(Reservation::getReservationId)
                .max()
                .orElse(0);
        return maxId + 1;
    }

    // Save a new reservation
    public static synchronized void saveReservation(Reservation reservation) throws IOException {
        if (reservation.getReservationId() == 0) {
            int newId = generateReservationId();
            reservation.setReservationId(newId);
        }
        try (PrintWriter out = new PrintWriter(new FileWriter(RESERVATIONS_FILE, true))) {
            out.println(reservation.toFileString());
        }
    }

    // Read all reservations
    public static synchronized List<Reservation> readReservations() throws IOException {
        List<Reservation> reservations = new ArrayList<>();
        File file = new File(RESERVATIONS_FILE);
        if (!file.exists()) {
            file.createNewFile();
            return reservations;
        }
        try (BufferedReader reader = new BufferedReader(new FileReader(RESERVATIONS_FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (!line.trim().isEmpty()) {
                    try {
                        reservations.add(Reservation.fromFileString(line));
                    } catch (Exception e) {
                        System.err.println("Error parsing line: " + line);
                    }
                }
            }
        }
        return reservations;
    }

    // Update the entire reservation list
    public static synchronized void updateReservations(List<Reservation> reservations) throws IOException {
        try (PrintWriter out = new PrintWriter(new FileWriter(RESERVATIONS_FILE))) {
            for (Reservation reservation : reservations) {
                out.println(reservation.toFileString());
            }
        }
    }

    // Generate a unique inquiry ID
    public static synchronized int generateInquiryId() throws IOException {
        List<Inquiry> inquiries = readInquiries();
        if (inquiries.isEmpty()) {
            return 1;
        }
        int maxId = inquiries.stream()
                .mapToInt(Inquiry::getInquiryId)
                .max()
                .orElse(0);
        return maxId + 1;
    }

    // Save a new inquiry
    public static synchronized void saveInquiry(Inquiry inquiry) throws IOException {
        if (inquiry.getInquiryId() == 0) {
            int newId = generateInquiryId();
            inquiry.setInquiryId(newId);
        }
        try (PrintWriter out = new PrintWriter(new FileWriter(INQUIRIES_FILE, true))) {
            out.println(inquiry.toFileString());
        }
    }

    // Read all inquiries
    public static synchronized List<Inquiry> readInquiries() throws IOException {
        List<Inquiry> inquiries = new ArrayList<>();
        File file = new File(INQUIRIES_FILE);
        if (!file.exists()) {
            file.createNewFile();
            return inquiries;
        }
        try (BufferedReader reader = new BufferedReader(new FileReader(INQUIRIES_FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (!line.trim().isEmpty()) {
                    try {
                        inquiries.add(Inquiry.fromFileString(line));
                    } catch (Exception e) {
                        System.err.println("Error parsing line: " + line);
                    }
                }
            }
        }
        return inquiries;
    }

    // Update the entire inquiry list
    public static synchronized void updateInquiries(List<Inquiry> inquiries) throws IOException {
        try (PrintWriter out = new PrintWriter(new FileWriter(INQUIRIES_FILE))) {
            for (Inquiry inquiry : inquiries) {
                out.println(inquiry.toFileString());
            }
        }
    }

    // Generate a unique feedback ID
    public static synchronized int generateFeedbackId() throws IOException {
        List<Feedback> feedbacks = readFeedbacks();
        if (feedbacks.isEmpty()) {
            return 1;
        }
        int maxId = feedbacks.stream()
                .mapToInt(Feedback::getFeedbackId)
                .max()
                .orElse(0);
        return maxId + 1;
    }

    // Save a new feedback
    public static synchronized void saveFeedback(Feedback feedback) throws IOException {
        if (feedback.getFeedbackId() == 0) {
            int newId = generateFeedbackId();
            feedback.setFeedbackId(newId);
        }
        try (PrintWriter out = new PrintWriter(new FileWriter(FEEDBACKS_FILE, true))) {
            out.println(feedback.toFileString());
        }
    }

    // Read all feedbacks
    public static synchronized List<Feedback> readFeedbacks() throws IOException {
        List<Feedback> feedbacks = new ArrayList<>();
        File file = new File(FEEDBACKS_FILE);
        if (!file.exists()) {
            file.createNewFile();
            return feedbacks;
        }
        try (BufferedReader reader = new BufferedReader(new FileReader(FEEDBACKS_FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (!line.trim().isEmpty()) {
                    try {
                        feedbacks.add(Feedback.fromFileString(line));
                    } catch (Exception e) {
                        System.err.println("Error parsing line: " + line);
                    }
                }
            }
        }
        return feedbacks;
    }

    // Update the entire feedback list
    public static synchronized void updateFeedbacks(List<Feedback> feedbacks) throws IOException {
        try (PrintWriter out = new PrintWriter(new FileWriter(FEEDBACKS_FILE))) {
            for (Feedback feedback : feedbacks) {
                out.println(feedback.toFileString());
            }
        }
    }

    // Generate a unique payment ID
    public static synchronized int generatePaymentId() throws IOException {
        List<Payment> payments = readPayments();
        if (payments.isEmpty()) {
            return 1;
        }
        int maxId = payments.stream()
                .mapToInt(Payment::getPaymentId)
                .max()
                .orElse(0);
        return maxId + 1;
    }

    // Save a new payment
    public static synchronized void savePayment(Payment payment) throws IOException {
        if (payment.getPaymentId() == 0) {
            int newId = generatePaymentId();
            payment.setPaymentId(newId);
        }
        try (PrintWriter out = new PrintWriter(new FileWriter(PAYMENTS_FILE, true))) {
            out.println(payment.toFileString());
        }
    }

    // Read all payments
    public static synchronized List<Payment> readPayments() throws IOException {
        List<Payment> payments = new ArrayList<>();
        File file = new File(PAYMENTS_FILE);
        if (!file.exists()) {
            file.createNewFile();
            return payments;
        }
        try (BufferedReader reader = new BufferedReader(new FileReader(PAYMENTS_FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (!line.trim().isEmpty()) {
                    try {
                        payments.add(Payment.fromFileString(line));
                    } catch (Exception e) {
                        System.err.println("Error parsing line: " + line);
                    }
                }
            }
        }
        return payments;
    }

    // Update the entire payment list
    public static synchronized void updatePayments(List<Payment> payments) throws IOException {
        try (PrintWriter out = new PrintWriter(new FileWriter(PAYMENTS_FILE))) {
            for (Payment payment : payments) {
                out.println(payment.toFileString());
            }
        }
    }
}