<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Inquiry</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2 class="text-center mb-4">Update Inquiry</h2>
    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>
    <form action="updateInquiry" method="post" class="card p-4 shadow-sm">
        <input type="hidden" name="inquiryId" value="${param.inquiryId}">
        <div class="mb-3">
            <label for="customerId" class="form-label">Customer ID</label>
            <input type="number" class="form-control" id="customerId" name="customerId" required>
        </div>
        <div class="mb-3">
            <label for="subject" class="form-label">Subject</label>
            <input type="text" class="form-control" id="subject" name="subject" maxlength="100" required>
        </div>
        <div class="mb-3">
            <label for="message" class="form-label">Message</label>
            <textarea class="form-control" id="message" name="message" rows="5" required></textarea>
        </div>
        <div class="mb-3">
            <label for="status" class="form-label">Status</label>
            <select class="form-select" id="status" name="status" required>
                <option value="open">Open</option>
                <option value="resolved">Resolved</option>
                <option value="closed">Closed</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="response" class="form-label">Response (Optional)</label>
            <textarea class="form-control" id="response" name="response" rows="3"></textarea>
        </div>
        <div class="d-grid">
            <button type="submit" class="btn btn-primary">Update Inquiry</button>
        </div>
    </form>
    <div class="text-center mt-3">
        <a href="inquiry_list.jsp" class="btn btn-secondary">Back to Inquiries</a>
        <a href="reservation_list.jsp" class="btn btn-outline-secondary ms-2">Reservations</a>
        <a href="table_list.jsp" class="btn btn-outline-secondary ms-2">Tables</a>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>