<%--
  Created by IntelliJ IDEA.
  User: DASUNI THIWANSHIKA
  Date: 5/17/2025
  Time: 6:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2 class="text-center mb-4">All Payments</h2>
    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>
    <div class="mb-3">
        <a href="registerPayment" class="btn btn-primary">Add New Payment</a>
    </div>
    <table class="table table-striped table-bordered shadow-sm">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Customer ID</th>
            <th>Reservation ID</th>
            <th>Amount</th>
            <th>Status</th>
            <th>Payment Date</th>
            <th>Method</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="payment" items="${payments}">
            <tr>
                <td>${payment.paymentId}</td>
                <td>${payment.customerId}</td>
                <td>${payment.reservationId}</td>
                <td>${payment.amount}</td>
                <td>${payment.status}</td>
                <td>${payment.paymentDate}</td>
                <td>${payment.paymentMethod}</td>
                <td>
                    <a href="payment_update.jsp?paymentId=${payment.paymentId}" class="btn btn-sm btn-warning">Edit</a>
                    <form action="deletePayment" method="post" style="display:inline;">
                        <input type="hidden" name="paymentId" value="${payment.paymentId}">
                        <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this payment?')">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="text-center">
        <a href="registerPayment" class="btn btn-outline-secondary">Add Payment</a>
        <a href="listReservations" class="btn btn-outline-secondary ms-2">Reservations</a>
        <a href="listTables" class="btn btn-outline-secondary ms-2">Tables</a>
        <a href="listInquiries" class="btn btn-outline-secondary ms-2">Inquiries</a>
        <a href="listFeedbacks" class="btn btn-outline-secondary ms-2">Feedback</a>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
