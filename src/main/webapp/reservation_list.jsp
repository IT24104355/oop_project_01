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
  <title>Reservation List</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
  <h2 class="text-center mb-4">All Reservations</h2>
  <c:if test="${not empty error}">
    <div class="alert alert-danger">${error}</div>
  </c:if>
  <div class="mb-3">
    <a href="registerReservation" class="btn btn-primary">Add New Reservation</a>
  </div>
  <table class="table table-striped table-bordered shadow-sm">
    <thead class="table-dark">
    <tr>
      <th>ID</th>
      <th>Customer ID</th>
      <th>Table ID</th>
      <th>Date & Time</th>
      <th>Status</th>
      <th>Type</th>
      <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="reservation" items="${reservations}">
      <tr>
        <td>${reservation.reservationId}</td>
        <td>${reservation.customerId}</td>
        <td>${reservation.tableId}</td>
        <td>${reservation.reservationDateTime}</td>
        <td>${reservation.status}</td>
        <td>${reservation.reservationType}</td>
        <td>
          <a href="reservation_update.jsp?reservationId=${reservation.reservationId}" class="btn btn-sm btn-warning">Edit</a>
          <form action="deleteReservation" method="post" style="display:inline;">
            <input type="hidden" name="reservationId" value="${reservation.reservationId}">
            <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this reservation?')">Delete</button>
          </form>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
