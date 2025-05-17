<%--
  Created by IntelliJ IDEA.
  User: DASUNI THIWANSHIKA
  Date: 5/17/2025
  Time: 1:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback Success</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5 text-center">
    <h2 class="mb-4 text-success">Feedback Submitted Successfully!</h2>
    <p>Your feedback has been added to the system.</p>
    <div class="mt-3">
        <a href="feedback_register.jsp" class="btn btn-primary">Add Another Feedback</a>
        <a href="feedback_list.jsp" class="btn btn-secondary">View All Feedback</a>
        <a href="reservation_list.jsp" class="btn btn-outline-secondary ms-2">Reservations</a>
        <a href="table_list.jsp" class="btn btn-outline-secondary ms-2">Tables</a>
        <a href="inquiry_list.jsp" class="btn btn-outline-secondary ms-2">Inquiries</a>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
