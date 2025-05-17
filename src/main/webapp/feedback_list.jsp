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
  <title>Feedback List</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
  <h2 class="text-center mb-4">All Feedback</h2>
  <c:if test="${not empty error}">
    <div class="alert alert-danger">${error}</div>
  </c:if>
  <div class="mb-3">
    <a href="registerFeedback" class="btn btn-primary">Add New Feedback</a>
  </div>
  <table class="table table-striped table-bordered shadow-sm">
    <thead class="table-dark">
    <tr>
      <th>ID</th>
      <th>Customer ID</th>
      <th>Rating</th>
      <th>Comment</th>
      <th>Status</th>
      <th>Type</th>
      <th>Created At</th>
      <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="feedback" items="${feedbacks}">
      <tr>
        <td>${feedback.feedbackId}</td>
        <td>${feedback.customerId}</td>
        <td>${feedback.rating}</td>
        <td>${feedback.comment}</td>
        <td>${feedback.status}</td>
        <td>${feedback.feedbackType}</td>
        <td>${feedback.createdAt}</td>
        <td>
          <a href="feedback_update.jsp?feedbackId=${feedback.feedbackId}" class="btn btn-sm btn-warning">Edit</a>
          <form action="deleteFeedback" method="post" style="display:inline;">
            <input type="hidden" name="feedbackId" value="${feedback.feedbackId}">
            <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this feedback?')">Delete</button>
          </form>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
  <div class="text-center">
    <a href="feedback_register.jsp" class="btn btn-outline-secondary">Add Feedback</a>
    <a href="reservation_list.jsp" class="btn btn-outline-secondary ms-2">Reservations</a>
    <a href="table_list.jsp" class="btn btn-outline-secondary ms-2">Tables</a>
    <a href="inquiry_list.jsp" class="btn btn-outline-secondary ms-2">Inquiries</a>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>