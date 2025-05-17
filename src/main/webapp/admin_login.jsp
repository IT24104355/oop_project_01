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
    <title>Admin Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2 class="text-center mb-4">Admin Dashboard Access</h2>
    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>
    <form action="adminDashboard" method="post" class="card p-4 shadow-sm mx-auto" style="max-width: 400px;">
        <div class="mb-3">
            <label for="adminPassword" class="form-label">Admin Password</label>
            <input type="password" class="form-control" id="adminPassword" name="adminPassword" required>
        </div>
        <div class="d-grid">
            <button type="submit" class="btn btn-primary">Access Dashboard</button>
        </div>
    </form>
    <div class="text-center mt-3">
        <a href="admin_login.jsp" class="btn btn-outline-secondary">Back to Login</a>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>