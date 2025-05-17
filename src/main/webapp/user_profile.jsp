<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.UserManagement.models.Customer" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PrimeTable - Customer Profile</title>
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
            max-width: 1400px; /* Increased container width */
            margin: 0 auto;
            padding: 1rem;
        }

        .main-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 600px; /* Increased max-width for main container */
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
            gap: 1rem; /* Reduced gap to fit all tabs */
            flex-wrap: nowrap; /* Prevent wrapping */
        }

        .nav-tabs li {
            flex: 1; /* Equal width for each tab */
            text-align: center;
        }

        .nav-tabs a {
            color: white;
            text-decoration: none;
            font-weight: 600;
            font-size: 0.9rem; /* Slightly smaller font to fit all tabs */
            padding: 0.5rem;
            border-radius: 4px;
            transition: background-color 0.3s;
            display: block;
            white-space: nowrap; /* Prevent text wrapping */
        }

        .nav-tabs a:hover {
            background-color: var(--secondary);
        }

        .nav-tabs a.active {
            background-color: var(--secondary);
        }

        .profile-container {
            padding: 2.5rem;
            text-align: center;
        }

        h1 {
            color: var(--primary);
            margin-bottom: 1.5rem;
            font-size: 1.5rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
            text-align: left;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: var(--primary);
            font-weight: 600;
            font-size: 0.9rem;
        }

        .form-group input {
            width: 100%;
            padding: 0.8rem 1rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1rem;
            transition: border 0.3s;
        }

        .form-group input:focus {
            outline: none;
            border-color: var(--accent);
        }

        .form-group input[disabled] {
            background-color: #f9f9f9;
            color: #666;
            cursor: not-allowed;
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
            margin-top: 0.5rem;
        }

        .btn-update {
            background-color: var(--secondary);
            color: white;
        }

        .btn-update:hover {
            background-color: #c56a20;
        }

        .btn-delete {
            background-color: #e74c3c;
            color: white;
        }

        .btn-delete:hover {
            background-color: #c0392b;
        }

        .error-message {
            color: #e74c3c;
            margin-bottom: 1rem;
            text-align: center;
            font-size: 0.9rem;
        }

        .login-link {
            margin-top: 1.5rem;
            color: var(--primary);
            font-size: 0.9rem;
        }

        .login-link a {
            color: var(--secondary);
            text-decoration: none;
            font-weight: 600;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        @media (max-width: 480px) {
            .main-container {
                margin: 1rem;
                max-width: 100%; /* Full width on small screens */
            }

            .profile-container {
                padding: 2rem 1.5rem;
            }

            .nav-tabs ul {
                gap: 0.5rem; /* Tighter gap on small screens */
            }

            .nav-tabs a {
                font-size: 0.8rem; /* Smaller font on mobile */
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
                <li><a href="reservation_register.jsp" class="active">Reservations</a></li>
                <li><a href="table_register.jsp">Tables</a></li>
                <li><a href="inquiry_register.jsp">Inquiries</a></li>
                <li><a href="payment_register.jsp">Payments</a></li>
                <li><a href="feedback_register.jsp">Feedback</a></li>
                <li><a href="admin_login.jsp">Admin Dashboard</a></li>
            </ul>
        </div>
        <div class="profile-container">
            <h1>Customer Profile</h1>
            <% Customer customer = (Customer) session.getAttribute("customer"); %>
            <% if (customer != null) { %>
            <% if (request.getAttribute("error") != null) { %>
            <p class="error-message"><%= request.getAttribute("error") %></p>
            <% } %>
            <form action="updateCustomer" method="post">
                <div class="form-group">
                    <label for="customerId">Customer ID</label>
                    <input type="text" id="customerId" value="<%= customer.getCustomerId() %>" disabled>
                </div>
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" value="<%= customer.getUsername() %>" disabled>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Enter new password">
                </div>
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" id="email" name="email" value="<%= customer.getEmail() %>" placeholder="Enter your email" required>
                </div>
                <div class="form-group">
                    <label for="fullName">Full Name</label>
                    <input type="text" id="fullName" name="fullName" value="<%= customer.getFullName() %>" placeholder="Enter your full name" required>
                </div>
                <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <input type="text" id="phone" name="phone" value="<%= customer.getPhone() %>" placeholder="Enter your phone number" required>
                </div>
                <button type="submit" class="btn btn-update">Update Profile</button>
            </form>
            <form action="deleteCustomer" method="post" class="mt-4">
                <button type="submit" class="btn btn-delete">Delete Account</button>
            </form>
            <% } else { %>
            <p class="error-message">Please log in to view your profile.</p>
            <div class="login-link">
                <a href="user_login.jsp">Go to Login</a>
            </div>
            <% } %>
        </div>
    </div>
</div>
</body>
</html>