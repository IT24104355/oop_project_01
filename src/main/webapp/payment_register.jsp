<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Payment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2 class="text-center mb-4">Register New Payment</h2>
    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>
    <form action="registerPayment" method="post" class="card p-4 shadow-sm">
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
        <div class="mb-3">
            <label for="paymentMethod" class="form-label">Payment Method</label>
            <select class="form-select" id="paymentMethod" name="paymentMethod" required>
                <option value="CreditCard">Credit Card</option>
                <option value="Cash">Cash</option>
            </select>
        </div>
        <div class="d-grid">
            <button type="submit" class="btn btn-primary">Submit Payment</button>
        </div>
    </form>
    <div class="text-center mt-3">
        <a href="payment_list.jsp" class="btn btn-secondary">View All Payments</a>
        <a href="reservation_list.jsp" class="btn btn-outline-secondary ms-2">Reservations</a>
        <a href="table_list.jsp" class="btn btn-outline-secondary ms-2">Tables</a>
        <a href="inquiry_list.jsp" class="btn btn-outline-secondary ms-2">Inquiries</a>
        <a href="feedback_list.jsp" class="btn btn-outline-secondary ms-2">Feedback</a>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
