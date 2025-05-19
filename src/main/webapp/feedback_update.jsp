<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Update Feedback</title>
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
        background-image: linear-gradient(rgba(26, 46, 53, 0.7), rgba(26, 46, 53, 0.7)),
        url('https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
        background-size: cover;
        background-position: center;
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
      max-width: 600px;
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

    .form-container {
      padding: 2.5rem;
    }

    h2 {
      color: var(--primary);
      margin-bottom: 1.5rem;
      font-size: 1.5rem;
      text-align: center;
    }

    .form-group {
      margin-bottom: 1.5rem;
    }

    .form-group label {
      display: block;
      margin-bottom: 0.5rem;
      color: var(--primary);
      font-weight: 600;
      font-size: 0.9rem;
    }

    .form-group input,
    .form-group textarea,
    .form-group select {
      width: 100%;
      padding: 0.8rem 1rem;
      border: 1px solid #ddd;
      border-radius: 4px;
      font-size: 1rem;
      transition: border 0.3s;
    }

    .form-group input:focus,
    .form-group textarea:focus,
    .form-group select:focus {
      outline: none;
      border-color: var(--accent);
    }

    .btn {
      width: 100%;
      padding: 0.8rem;
      border: none;
      border-radius: 4px;
      font-size: 1rem;
      font-weight: 600;
      cursor: pointer;
      transition: background-color 0.3s;
    }

    .btn-primary {
      background-color: var(--secondary);
      color: white;
    }

    .btn-primary:hover {
      background-color: #c56a20;
    }

    .alert {
      color: #e74c3c;
      margin-bottom: 1rem;
      text-align: center;
      font-size: 0.9rem;
      padding: 0.8rem;
      border: 1px solid #e74c3c;
      border-radius: 4px;
    }

    @media (max-width: 480px) {
      .main-container {
        margin: 1rem;
        max-width: 100%;
      }

      .form-container {
        padding: 2rem 1.5rem;
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
        <li><a href="feedback_list.jsp" class="active">Feedback</a></li>
        <li><a href="reservation_list.jsp">Reservations</a></li>
        <li><a href="table_list.jsp">Tables</a></li>
        <li><a href="inquiry_list.jsp">Inquiries</a></li>
      </ul>
    </div>
    <div class="form-container">
      <h2>Update Feedback</h2>
      <c:if test="${not empty error}">
        <div class="alert">${error}</div>
      </c:if>
      <form action="updateFeedback" method="post">
        <input type="hidden" name="feedbackId" value="${param.feedbackId}">
        <div class="form-group">
          <label for="customerId">Customer ID</label>
          <input type="number" id="customerId" name="customerId" required>
        </div>
        <div class="form-group">
          <label for="rating">Rating (1-5)</label>
          <input type="number" id="rating" name="rating" min="1" max="5" required>
        </div>
        <div class="form-group">
          <label for="comment">Comment</label>
          <textarea id="comment" name="comment" rows="5" required></textarea>
        </div>
        <div class="form-group">
          <label for="status">Status</label>
          <select id="status" name="status" required>
            <option value="pending">Pending</option>
            <option value="reviewed">Reviewed</option>
            <option value="archived">Archived</option>
          </select>
        </div>
        <div class="form-group">
          <label for="response">Response (Optional)</label>
          <textarea id="response" name="response" rows="3"></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Update Feedback</button>
      </form>
    </div>
  </div>
</div>
</body>
</html>
