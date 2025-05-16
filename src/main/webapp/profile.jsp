<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.models.Customer" %>
<html>
<head>
    <title>Customer Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 flex items-center justify-center h-screen">
<div class="bg-white p-8 rounded shadow-md w-full max-w-md">
    <h2 class="text-2xl font-bold mb-6 text-center">Customer Profile</h2>
    <% Customer customer = (Customer) session.getAttribute("customer"); %>
    <% if (customer != null) { %>
    <% if (request.getAttribute("error") != null) { %>
    <p class="text-red-500 text-center"><%= request.getAttribute("error") %></p>
    <% } %>
    <form action="updateCustomer" method="post">
        <div class="mb-4">
            <label class="block text-gray-700">Customer ID</label>
            <input type="text" value="<%= customer.getCustomerId() %>" class="w-full p-2 border rounded" disabled>
        </div>
        <div class="mb-4">
            <label class="block text-gray-700">Username</label>
            <input type="text" value="<%= customer.getUsername() %>" class="w-full p-2 border rounded" disabled>
        </div>
        <div class="mb-4">
            <label class="block text-gray-700">Password</label>
            <input type="password" name="password" class="w-full p-2 border rounded" placeholder="Enter new password">
        </div>
        <div class="mb-4">
            <label class="block text-gray-700">Email</label>
            <input type="email" name="email" value="<%= customer.getEmail() %>" class="w-full p-2 border rounded" required>
        </div>
        <div class="mb-4">
            <label class="block text-gray-700">Full Name</label>
            <input type="text" name="fullName" value="<%= customer.getFullName() %>" class="w-full p-2 border rounded" required>
        </div>
        <div class="mb-4">
            <label class="block text-gray-700">Phone</label>
            <input type="text" name="phone" value="<%= customer.getPhone() %>" class="w-full p-2 border rounded" required>
        </div>
        <button type="submit" class="w-full bg-blue-500 text-white p-2 rounded hover:bg-blue-600">Update Profile</button>
    </form>
    <form action="deleteCustomer" method="post" class="mt-4">
        <button type="submit" class="w-full bg-red-500 text-white p-2 rounded hover:bg-red-600">Delete Account</button>
    </form>
    <% } else { %>
    <p class="text-red-500 text-center">Please log in to view your profile.</p>
    <a href="login.jsp" class="block text-center text-blue-500 hover:underline">Go to Login</a>
    <% } %>
</div>
</body>
</html>