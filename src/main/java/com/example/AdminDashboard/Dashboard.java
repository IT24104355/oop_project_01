package com.example.AdminDashboard;

import com.example.AdminDashboard.Servlet.FileHandler;
import com.example.InquiriesManagement.Inquiry;
import com.example.PaymentsManagement.Payment;
import com.example.ReservationsManagement.Reservation;
import com.example.TableManagement.Table;
import com.example.UserManagement.models.Customer;
import com.example.FeedbackManagement.Feedback;
import java.io.IOException;
import java.util.List;

public class Dashboard {
    private int totalCustomers;
    private int totalTables;
    private int totalReservations;
    private int totalInquiries;
    private int totalFeedbacks;
    private double totalPayments;

    // Constructor
    public Dashboard() throws IOException {
        loadMetrics();
    }

    // Load metrics from files
    private void loadMetrics() throws IOException {
        List<Customer> customers = FileHandler.readCustomers();
        List<Table> tables = FileHandler.readTables();
        List<Reservation> reservations = FileHandler.readReservations();
        List<Inquiry> inquiries = FileHandler.readInquiries();
        List<Feedback> feedbacks = FileHandler.readFeedbacks();
        List<Payment> payments = FileHandler.readPayments();

        this.totalCustomers = customers.size();
        this.totalTables = tables.size();
        this.totalReservations = reservations.size();
        this.totalInquiries = inquiries.size();
        this.totalFeedbacks = feedbacks.size();
        this.totalPayments = payments.stream().mapToDouble(Payment::getAmount).sum();
    }

    // Getters
    public int getTotalCustomers() {
        return totalCustomers;
    }

    public int getTotalTables() {
        return totalTables;
    }

    public int getTotalReservations() {
        return totalReservations;
    }

    public int getTotalInquiries() {
        return totalInquiries;
    }

    public int getTotalFeedbacks() {
        return totalFeedbacks;
    }

    public double getTotalPayments() {
        return totalPayments;
    }
}
