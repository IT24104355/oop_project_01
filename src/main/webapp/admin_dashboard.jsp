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
            max-width: 1000px;
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
        }

        h2 {
            color: var(--primary);
            margin-bottom: 1.5rem;
            font-size: 1.5rem;
            text-align: center;
        }

        .error-message {
            color: #e74c3c;
            margin-bottom: 1rem;
            text-align: center;
            font-size: 0.9rem;
            padding: 0.75rem;
            background-color: #f8d7da;
            border-radius: 4px;
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
        }

        .btn-primary {
            background-color: var(--secondary);
            color: white;
        }

        .btn-primary:hover {
            background-color: #c56a20;
        }

        .btn-danger {
            background-color: #e74c3c;
            color: white;
        }

        .btn-danger:hover {
            background-color: #c0392b;
        }

        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
        }

        .dashboard-card {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 1.5rem;
            text-align: center;
        }

        .dashboard-card h5 {
            color: var(--primary);
            font-size: 1.2rem;
            margin-bottom: 1rem;
        }

        .dashboard-card p {
            font-size: 2.5rem;
            font-weight: bold;
            color: var(--dark);
            margin-bottom: 1rem;
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

            .dashboard-card {
                padding: 1rem;
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
                <li><a href="table_register.jsp">Tables</a></li>
                <li><a href="inquiry_register.jsp">Inquiries</a></li>
                <li><a href="payment_register.jsp">Payments</a></li>
                <li><a href="feedback_register.jsp">Feedback</a></li>
                <li><a href="admin_login.jsp" class="active">Admin Dashboard</a></li>
                <li><a href="listCustomers">Customers</a></li>
            </ul>
        </div>
        <div class="content-container">
            <% Boolean passwordVerified = (Boolean) request.getAttribute("passwordVerified"); %>
            <% if (passwordVerified != null && passwordVerified) { %>
            <h2>Admin Dashboard</h2>
            <div class="dashboard-grid">
                <div class="dashboard-card">
                    <h5>Total Customers</h5>
                    <p>${dashboard.totalCustomers}</p>
                    <a href="listCustomers" class="btn btn-primary">Manage Customers</a>
                </div>
                <div class="dashboard-card">
                    <h5>Total Tables</h5>
                    <p>${dashboard.totalTables}</p>
                    <a href="listTables" class="btn btn-primary">Manage Tables</a>
                </div>
                <div class="dashboard-card">
                    <h5>Total Reservations</h5>
                    <p>${dashboard.totalReservations}</p>
                    <a href="listReservations" class="btn btn-primary">Manage Reservations</a>
                </div>
                <div class="dashboard-card">
                    <h5>Total Inquiries</h5>
                    <p>${dashboard.totalInquiries}</p>
                    <a href="listInquiries" class="btn btn-primary">Manage Inquiries</a>
                </div>
                <div class="dashboard-card">
                    <h5>Total Feedbacks</h5>
                    <p>${dashboard.totalFeedbacks}</p>
                    <a href="listFeedbacks" class="btn btn-primary">Manage Feedback</a>
                </div>
                <div class="dashboard-card">
                    <h5>Total Payments</h5>
                    <p>$${dashboard.totalPayments}</p>
                    <a href="" class="btn btn-primary">Manage Payments</a>
                </div>
            </div>
            <div class="text-center mt-4">
                <a href="admin_login.jsp" class="btn btn-danger">Logout</a>
            </div>
            <% } else { %>
            <div class="error-message">
                <h4>Access Denied</h4>
                <p>Please enter the correct admin password.</p>
                <a href="admin_login.jsp" class="btn btn-primary">Try Again</a>
            </div>
            <% } %>
        </div>
    </div>
</div>
</body>
</html>