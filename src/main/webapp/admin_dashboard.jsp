<%--
  Created by IntelliJ IDEA.
  User: DASUNI THIWANSHIKA
  Date: 5/17/2025
  Time: 7:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <c:if test="${passwordVerified}">
        <h2 class="text-center mb-4">Admin Dashboard</h2>
        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
            <div class="col">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Total Customers</h5>
                        <p class="card-text display-4">${dashboard.totalCustomers}</p>
                        <a href="listCustomers" class="btn btn-primary">Manage Customers</a>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Total Tables</h5>
                        <p class="card-text display-4">${dashboard.totalTables}</p>
                        <a href="listTables" class="btn btn-primary">Manage Tables</a>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Total Reservations</h5>
                        <p class="card-text display-4">${dashboard.totalReservations}</p>
                        <a href="listReservations" class="btn btn-primary">Manage Reservations</a>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Total Inquiries</h5>
                        <p class="card-text display-4">${dashboard.totalInquiries}</p>
                        <a href="listInquiries" class="btn btn-primary">Manage Inquiries</a>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Total Feedbacks</h5>
                        <p class="card-text display-4">${dashboard.totalFeedbacks}</p>
                        <a href="listFeedbacks" class="btn btn-primary">Manage Feedback</a>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Total Payments</h5>
                        <p class="card-text display-4">$${dashboard.totalPayments}</p>
                        <a href="" class="btn btn-primary">Manage Payments</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="text-center mt-4">
            <a href="admin_login.jsp" class="btn btn-danger">Logout</a>
        </div>
    </c:if>
    <c:if test="${not passwordVerified}">
        <div class="alert alert-warning text-center">
            <h4>Access Denied</h4>
            <p>Please enter the correct admin password.</p>
            <a href="admin_login.jsp" class="btn btn-primary">Try Again</a>
        </div>
    </c:if>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
