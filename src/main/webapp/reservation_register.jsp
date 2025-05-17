<%--
  Created by IntelliJ IDEA.
  User: DASUNI THIWANSHIKA
  Date: 5/17/2025
  Time: 12:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Register Reservation</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    :root {
      --primary: #1a2e35;      /* Dark teal */
      --secondary: #d97b29;    /* Orange-brown */
      --accent: #5c8a8a;       /* Muted teal */
      --light: #f5f5f5;        /* Light gray */
      --dark: #333;            /* Dark gray */
      --highlight: #f8d7a3;    /* Light beige */
    }

    .logo {
      font-size: 2rem;
      font-weight: bold;
      color: var(--primary);
      text-align: center;
      padding: 1.5rem;
      background-color: var(--highlight);
    }

    .logo span {
      color: var(--secondary);
    }

    .nav-tabs {
      background-color: var(--primary);
      padding: 1rem;
      border-radius: 8px 8px 0 0;
    }

    .nav-tabs ul {
      display: flex;
      list-style: none;
      justify-content: center;
      gap: 1rem;
      flex-wrap: nowrap;
      margin: 0;
      padding: 0;
    }

    .nav-tabs li {
      flex: 1;
      text-align: center;
    }

    .nav-tabs a {
      color: white;
      text-decoration: none;
      font-weight: 600;
      font-size: 0.9rem;
      padding: 0.5rem;
      border-radius: 4px;
      transition: background-color 0.3s;
      display: block;
      white-space: nowrap;
    }

    .nav-tabs a:hover {
      background-color: var(--secondary);
    }

    .nav-tabs a.active {
      background-color: var(--secondary);
    }

    @media (max-width: 480px) {
      .nav-tabs ul {
        gap: 0.5rem;
      }

      .nav-tabs a {
        font-size: 0.8rem;
        padding: 0.4rem;
      }
    }
  </style>
</head>
<body class="bg-light">
<div class="container mt-5">
  <div class="card shadow-sm">
    <div class="logo">Prime<span>Table</span></div>
    <div class="nav-tabs">
      <ul>
        <li><a href="reservation_register.jsp" class="active">Reservations</a></li>
        <li><a href="table_register.jsp">Tables</a></li>
        <li><a href="inquiry_register.jsp">Inquiries</a></li>
        <li><a href="payment_register.jsp">Payments</a></li>
        <li><a href="feedback_register.jsp">Feedback</a></li>
        <li><a href="admin_login.jsp">Admin Dashboard</a></li>
      </ul>
    </div>
    <div class="card-body">
      <h2 class="text-center mb-4">Register New Reservation</h2>
      <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
      </c:if>
      <form action="registerReservation" method="post" class="p-4">
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
        <div class="mb-3">
          <label for="reservationType" class="form-label">Reservation Type</label>
          <select class="form-select" id="reservationType" name="reservationType" required>
            <option value="Individual">Individual</option>
            <option value="Group">Group</option>
          </select>
        </div>
        <div class="d-grid">
          <button type="submit" class="btn btn-primary">Register Reservation</button>
        </div>
      </form>
      <div class="text-center mt-3">
        <a href="reservation_list.jsp" class="btn btn-secondary">View All Reservations</a>
      </div>
    </div>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>