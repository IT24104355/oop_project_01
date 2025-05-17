<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.TableManagement.Table" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Table List</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
  <h2 class="text-center">Table Management</h2>
  <% if (request.getAttribute("error") != null) { %>
  <div class="alert alert-danger" role="alert">
    <%= request.getAttribute("error") %>
  </div>
  <% } %>
  <a href="table_register.jsp" class="btn btn-primary mb-3">Add New Table</a>
  <table class="table table-striped">
    <thead>
    <tr>
      <th>ID</th>
      <th>Table Number</th>
      <th>Capacity</th>
      <th>Status</th>
      <th>Type</th>
      <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <%
      List<Table> tables = (List<Table>) request.getAttribute("tables");
      if (tables != null) {
        for (Table table : tables) {
    %>
    <tr>
      <td><%= table.getTableId() %></td>
      <td><%= table.getTableNumber() %></td>
      <td><%= table.getCapacity() %></td>
      <td><%= table.getStatus() %></td>
      <td><%= table.getTableType() %></td>
      <td>
        <a href="table_update.jsp?tableId=<%= table.getTableId() %>&tableNumber=<%= table.getTableNumber() %>&capacity=<%= table.getCapacity() %>&status=<%= table.getStatus() %>" class="btn btn-sm btn-warning">Edit</a>
        <form action="deleteTable" method="post" style="display:inline;">
          <input type="hidden" name="tableId" value="<%= table.getTableId() %>">
          <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this table?')">Delete</button>
        </form>
      </td>
    </tr>
    <%
        }
      }
    %>
    </tbody>
  </table>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
