<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Feedback List</title>
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
      margin: 2rem auto;
      overflow: hidden;
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
      padding: 2rem;
    }

    @media (max-width: 480px) {
      .main-container {
        margin: 1rem;
        max-width: 100%;
      }

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
<body>
<div class="container">
  <div class="main-container">
    <div class="nav-tabs">
      <ul>
        <li><a href="reservation_list.jsp">Reservations</a></li>
        <li><a href="table_list.jsp">Tables</a></li>
        <li><a href="inquiry_list.jsp">Inquiries</a></li>
        <li><a href="feedback_register.jsp" class="active">Feedback</a></li>
      </ul>
    </div>
    <div class="content-container">
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
    </div>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
