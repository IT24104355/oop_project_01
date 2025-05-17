<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment List</title>
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
            padding: 0.8rem;
            background-color: #f8d7da;
            border-radius: 4px;
        }

        .btn {
            padding: 0.8rem 1rem;
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

        .btn-warning {
            background-color: #f0ad4e;
            color: white;
        }

        .btn-warning:hover {
            background-color: #ec971f;
        }

        .btn-danger {
            background-color: #e74c3c;
            color: white;
        }

        .btn-danger:hover {
            background-color: #c0392b;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .table th,
        .table td {
            padding: 0.8rem;
            text-align: left;
            border: 1px solid #ddd;
        }

        .table th {
            background-color: var(--primary);
            color: white;
            font-weight: 600;
        }

        .table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .table tr:hover {
            background-color: #f1f1f1;
        }

        @media (max-width: 480px) {
            .main-container {
                margin: 1rem;
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

            .table th,
            .table td {
                font-size: 0.8rem;
                padding: 0.5rem;
            }
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2 class="text-center mb-4">All Payments</h2>
    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>
    <div class="mb-3">
        <a href="registerPayment" class="btn btn-primary">Add New Payment</a>
    </div>
    <table class="table table-striped table-bordered shadow-sm">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Customer ID</th>
            <th>Reservation ID</th>
            <th>Amount</th>
            <th>Status</th>
            <th>Payment Date</th>
            <th>Method</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="payment" items="${payments}">
            <tr>
                <td>${payment.paymentId}</td>
                <td>${payment.customerId}</td>
                <td>${payment.reservationId}</td>
                <td>${payment.amount}</td>
                <td>${payment.status}</td>
                <td>${payment.paymentDate}</td>
                <td>${payment.paymentMethod}</td>
                <td>
                    <a href="payment_update.jsp?paymentId=${payment.paymentId}" class="btn btn-sm btn-warning">Edit</a>
                    <form action="deletePayment" method="post" style="display:inline;">
                        <input type="hidden" name="paymentId" value="${payment.paymentId}">
                        <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this payment?')">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="text-center">
        <a href="registerPayment" class="btn btn-outline-secondary">Add Payment</a>
        <a href="listReservations" class="btn btn-outline-secondary ms-2">Reservations</a>
        <a href="listTables" class="btn btn-outline-secondary ms-2">Tables</a>
        <a href="listInquiries" class="btn btn-outline-secondary ms-2">Inquiries</a>
        <a href="listFeedbacks" class="btn btn-outline-secondary ms-2">Feedback</a>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
