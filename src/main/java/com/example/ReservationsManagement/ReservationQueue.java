package com.example.ReservationsManagement;

public class ReservationQueue {
    // Node class for the linked list
    private class Node {
        Reservation reservation;
        Node next;

        Node(Reservation reservation) {
            this.reservation = reservation;
            this.next = null;
        }
    }

    private Node front; // Head of the queue
    private Node rear;  // Tail of the queue
    private int size;   // Size of the queue

    public ReservationQueue() {
        this.front = null;
        this.rear = null;
        this.size = 0;
    }

    // Enqueue: Add a reservation request to the rear
    public void enqueue(Reservation reservation) {
        Node newNode = new Node(reservation);
        if (isEmpty()) {
            front = newNode;
            rear = newNode;
        } else {
            rear.next = newNode;
            rear = newNode;
        }
        size++;
    }

    // Dequeue: Remove and return the reservation at the front
    public Reservation dequeue() {
        if (isEmpty()) {
            throw new IllegalStateException("Queue is empty");
        }
        Reservation reservation = front.reservation;
        front = front.next;
        size--;
        if (isEmpty()) {
            rear = null;
        }
        return reservation;
    }

    // Check if queue is empty
    public boolean isEmpty() {
        return size == 0;
    }

    // Get size of the queue
    public int size() {
        return size;
    }

    // Peek at the front reservation without removing it
    public Reservation peek() {
        if (isEmpty()) {
            throw new IllegalStateException("Queue is empty");
        }
        return front.reservation;
    }
}