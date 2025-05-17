<%--
  Created by IntelliJ IDEA.
  User: DASUNI THIWANSHIKA
  Date: 5/17/2025
  Time: 12:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Update Table</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
  <h2 class="text-center">Update Table</h2>
  <% if (request.getAttribute("error") != null) { %>
  <div class="alert alert-danger" role="alert">
    <%= request.getAttribute("error") %>
  </div>
  <% } %>
  <form action="updateTable" method="post" class="mt-4">
    <input type="hidden" name="tableId" value="<%= request.getParameter("tableId") %>">
    <div class="mb-3">
      <label for="tableNumber" class="form-label">Table Number</label>
      <input type="number" class="form-control" id="tableNumber" name="tableNumber" value="<%= request.getParameter("tableNumber") %>" required>
    </div>
    <div class="mb-3">
      <label for="capacity" class="form-label">Capacity</label>
      <input type="number" class="form-control" id="capacity" name="capacity" value="<%= request.getParameter("capacity") %>" required>
    </div>
    <div class="mb-3">
      <label for="status" class="form-label">Status</label>
      <select class="form-select" id="status" name="status" required>
        <option value="available" <%= "available".equals(request.getParameter("status")) ? "selected" : "" %>>Available</option>
        <option value="occupied" <%= "occupied".equals(request.getParameter("status")) ? "selected" : "" %>>Occupied</option>
        <option value="reserved" <%= "reserved".equals(request.getParameter("status")) ? "selected" : "" %>>Reserved</option>
      </select>
    </div>
    <button type="submit" class="btn btn-primary">Update Table</button>
    <a href="table_list.jsp" class="btn btn-secondary">Back to Table List</a>
  </form>
  </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
