<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Payment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2 class="text-center mb-4">Update Payment</h2>
    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>
    <form action="updatePayment" method="post" class="card p-4 shadow-sm">
        <input type="hidden" name="paymentId" value="${param.paymentId}">
        <div class="mb-3">
            <label for="customerId" class="form-label">Customer ID</label>
            <input type="number" class="form-control" id="customerId" name="customerId" required>
        </div>
        <div class="mb-3">
            <label for="reservationId" class="form-label">Reservation ID</label>
            <input type="number" class="form-control" id="reservationId" name="reservationId" required>
        </div>
        <div class="mb-3">
            <label for="amount" class="form-label">Amount</label>
            <input type="number" step="0.01" class="form-control" id="amount" name="amount" required>
        </div>
        <div class="mb-3">
            <label for="status" class="form-label">Status</label>
            <select class="form-select" id="status" name="status" required>
                <option value="completed">Completed</option>
                <option value="pending">Pending</option>
                <option value="failed">Failed</option>
            </select>
        </div>
        <div class="d-grid">
            <button type="submit" class="btn btn-primary">Update Payment</button>
        </div>
    </form>
    <div class="text-center mt-3">
        <a href="listPayments" class="btn btn-secondary">Back to Payments</a>
        <a href="listReservations" class="btn btn-outline-secondary ms-2">Reservations</a>
        <a href="listTables" class="btn btn-outline-secondary ms-2">Tables</a>
        <a href="listInquiries" class="btn btn-outline-secondary ms-2">Inquiries</a>
        <a href="listFeedbacks" class="btn btn-outline-secondary ms-2">Feedback</a>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>