<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>PrimeTable - Table Registration Success</title>
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
      text-align: center;
    }

    h2 {
      color: var(--primary);
      margin-bottom: 1.5rem;
      font-size: 1.5rem;
    }

    .alert-success {
      background-color: #dff0d8;
      color: #3c763d;
      padding: 1rem;
      border-radius: 4px;
      margin-bottom: 1.5rem;
      font-size: 1rem;
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
      margin: 0.5rem;
    }

    .btn-primary {
      background-color: var(--secondary);
      color: white;
    }

    .btn-primary:hover {
      background-color: #c56a20;
    }

    .btn-secondary {
      background-color: var(--accent);
      color: white;
    }

    .btn-secondary:hover {
      background-color: #4a7070;
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
    }
  </style>
</head>
<body>
<div class="container">
  <div class="main-container">
    <div class="logo">Prime<span>Table</span></div>
    <div class="nav-tabs">
      <ul>
        <li><a href="reservation_register.jsp">Reservations</a></li>
        <li><a href="table_register.jsp" class="active">Tables</a></li>
        <li><a href="inquiry_register.jsp">Inquiries</a></li>
        <li><a href="payment_register.jsp">Payments</a></li>
        <li><a href="feedback_register.jsp">Feedback</a></li>
        <li><a href="admin_login.jsp">Admin Dashboard</a></li>
      </ul>
    </div>
    <div class="content-container">
      <h2>Table Registered Successfully</h2>
      <div class="alert-success">
        The table has been added to the system.
      </div>
      <a href="table_register.jsp" class="btn btn-primary">Add Another Table</a>
      <a href="table_list.jsp" class="btn btn-secondary">View All Tables</a>
    </div>
  </div>
</div>
</body>
</html>