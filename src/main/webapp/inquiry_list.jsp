<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inquiry List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2 class="text-center mb-4">All Inquiries</h2>
    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>
    <div class="mb-3">
        <a href="registerInquiry" class="btn btn-primary">Add New Inquiry</a>
    </div>
    <table class="table table-striped table-bordered shadow-sm">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Customer ID</th>
            <th>Subject</th>
            <th>Status</th>
            <th>Type</th>
            <th>Created At</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="inquiry" items="${inquiries}">
            <tr>
                <td>${inquiry.inquiryId}</td>
                <td>${inquiry.customerId}</td>
                <td>${inquiry.subject}</td>
                <td>${inquiry.status}</td>
                <td>${inquiry.inquiryType}</td>
                <td>${inquiry.createdAt}</td>
                <td>
                    <a href="inquiry_update.jsp?inquiryId=${inquiry.inquiryId}" class="btn btn-sm btn-warning">Edit</a>
                    <form action="deleteInquiry" method="post" style="display:inline;">
                        <input type="hidden" name="inquiryId" value="${inquiry.inquiryId}">
                        <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this inquiry?')">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="text-center">
        <a href="inquiry_register.jsp" class="btn btn-outline-secondary">Add Inquiry</a>
        <a href="reservation_list.jsp" class="btn btn-outline-secondary ms-2">Reservations</a>
        <a href="table_list.jsp" class="btn btn-outline-secondary ms-2">Tables</a>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>