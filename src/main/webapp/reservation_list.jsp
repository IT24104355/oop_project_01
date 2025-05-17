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
  <style>
    :root {
      --primary: #1a2e35;      /* Dark teal */
      --secondary: #d97b29;    /* Orange-brown */
      --accent: #5c8a8a;       /* Muted teal */
      --light: #f5f5f5;        /* Light gray */
      --dark: #333;            /* Dark gray */
      --highlight: #f8d7a3;    /* Light beige */
    }

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    body {
      background-color: var(--light);
      color: var(--dark);
      min-height: 100vh;
    }

    .container {
      max-width: 1400px;
      margin: 0 auto;
      padding: 1rem;
    }

    .main-container {
      background-color: white;
      border-radius: 8px;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
      width: 100%;
      max-width: 1000px; /* Adjusted for wider table */
      margin: 2rem auto;
      overflow: hidden;
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

    .content-container {
      padding: 2.5rem;
    }

    h2 {
      color: var(--primary);
      margin-bottom: 1.5rem;
      font-size: 1.5rem;
      text-align: center;
    }

    .error-message {
      color: #e74c3c;
      margin-bottom: 1rem;
      text-align: center;
      font-size: 0.9rem;
      padding: 0.75rem;
      background-color: #f8d7da;
      border-radius: 4px;
    }

    .btn {
      padding: 0.8rem 1.5rem;
      border: none;
      border-radius: 4px;
      font-size: 1rem;
      font-weight: 600;
      cursor: pointer;
      transition: background-color 0.3s;
      text-decoration: none;
      display: inline-block;
      margin-bottom: 1rem;
    }

    .btn-primary {
      background-color: var(--secondary);
      color: white;
    }

    .btn-primary:hover {
      background-color: #c56a20;
    }

    .btn-warning {
      background-color: #f1c40f;
      color: var(--dark);
      padding: 0.4rem 0.8rem;
      font-size: 0.9rem;
    }

    .btn-warning:hover {
      background-color: #d4ac0d;
    }

    .btn-danger {
      background-color: #e74c3c;
      color: white;
      padding: 0.4rem 0.8rem;
      font-size: 0.9rem;
    }

    .btn-danger:hover {
      background-color: #c0392b;
    }

    .table {
      width: 100%;
      border-collapse: collapse;
      background-color: white;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
      overflow: hidden;
    }

    .table th,
    .table td {
      padding: 0.75rem;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }

    .table th {
      background-color: var(--primary);
      color: white;
      font-weight: 600;
    }

    .table tbody tr:nth-child(even) {
      background-color: #f9f9f9;
    }

    .table tbody tr:hover {
      background-color: var(--highlight);
    }

    @media (max-width: 480px) {
      .main-container {
        margin: 1rem;
        max-width: 100%;
      }

      .content-container {
        padding: 2rem 1.5rem;
      }

      .nav-tabs ul {
        gap: 0.5rem;
      }

      .nav-tabs a {
        font-size: 0.8rem;
        padding: 0.4rem;
      }

      .table {
        font-size: 0.9rem;
      }

      .table th,
      .table td {
        padding: 0.5rem;
      }
    }
  </style>
</head>
<body>
<div class="container">
  <div class="main-container">
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
    <div class="content-container">
      <h2>All Reservations</h2>
      <c:if test="${not empty error}">
        <div class="error-message">${error}</div>
      </c:if>
      <div>
        <a href="registerReservation" class="btn btn-primary">Add New Reservation</a>
      </div>
      <table class="table">
        <thead>
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
              <a href="reservation_update.jsp?reservationId=${reservation.reservationId}" class="btn btn-warning">Edit</a>
              <form action="deleteReservation" method="post" style="display:inline;">
                <input type="hidden" name="reservationId" value="${reservation.reservationId}">
                <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this reservation?')">Delete</button>
              </form>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
</div>
</body>
</html>