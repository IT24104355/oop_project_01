<%--
  Created by IntelliJ IDEA.
  User: DASUNI THIWANSHIKA
  Date: 5/17/2025
  Time: 12:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Reservation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2 class="text-center mb-4">Update Reservation</h2>
    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>
    <form action="updateReservation" method="post" class="card p-4 shadow-sm">
        <input type="hidden" name="reservationId" value="${param.reservationId}">
        <div class="mb-3">
            <label for="customerId" class="form-label">Customer ID</label>
            <input type="number" class="form-control" id="customerId" name="customerId" required>
        </div>
        <div class="mb-3">
            <label for="tableId" class="form-label">Table ID</label>
            <input type="number" class="form-control" id="tableId" name="tableId" required>
        </div>
        <div class="mb-3">
            <label for="reservationDateTime" class="form-label">Reservation Date & Time</label>
            <input type="datetime-local" class="form-control" id="reservationDateTime" name="reservationDateTime" required>
        </div>
        <div class="mb-3">
            <label for="status" class="form-label">Status</label>
            <select class="form-select" id="status" name="status" required>
                <option value="confirmed">Confirmed</option>
                <option value="pending">Pending</option>
                <option value="cancelled">Cancelled</option>
            </select>
        </div>
        <div class="d-grid">
            <button type="submit" class="btn btn-primary">Update Reservation</button>
        </div>
    </form>
    <div class="text-center mt-3">
        <a href="reservation_list.jsp" class="btn btn-secondary">Back to Reservations</a>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>