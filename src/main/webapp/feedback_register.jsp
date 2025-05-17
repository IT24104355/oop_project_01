<%--
  Created by IntelliJ IDEA.
  User: DASUNI THIWANSHIKA
  Date: 5/17/2025
  Time: 1:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Feedback</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2 class="text-center mb-4">Register New Feedback</h2>
    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>
    <form action="registerFeedback" method="post" class="card p-4 shadow-sm">
        <div class="mb-3">
            <label for="customerId" class="form-label">Customer ID</label>
            <input type="number" class="form-control" id="customerId" name="customerId" required>
        </div>
        <div class="mb-3">
            <label for="rating" class="form-label">Rating (1-5)</label>
            <input type="number" class="form-control" id="rating" name="rating" min="1" max="5" required>
        </div>
        <div class="mb-3">
            <label for="comment" class="form-label">Comment</label>
            <textarea class="form-control" id="comment" name="comment" rows="5" required></textarea>
        </div>
        <div class="mb-3">
            <label for="status" class="form-label">Status</label>
            <select class="form-select" id="status" name="status" required>
                <option value="pending">Pending</option>
                <option value="reviewed">Reviewed</option>
                <option value="archived">Archived</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="feedbackType" class="form-label">Feedback Type</label>
            <select class="form-select" id="feedbackType" name="feedbackType" required>
                <option value="Positive">Positive</option>
                <option value="Negative">Negative</option>
            </select>
        </div>
        <div class="d-grid">
            <button type="submit" class="btn btn-primary">Submit Feedback</button>
        </div>
    </form>
    <div class="text-center mt-3">
        <a href="feedback_list.jsp" class="btn btn-secondary">View All Feedback</a>
        <a href="reservation_list.jsp" class="btn btn-outline-secondary ms-2">Reservations</a>
        <a href="table_list.jsp" class="btn btn-outline-secondary ms-2">Tables</a>
        <a href="inquiry_list.jsp" class="btn btn-outline-secondary ms-2">Inquiries</a>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>