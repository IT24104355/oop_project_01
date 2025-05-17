package com.example.TableManagement.Sevlets;

import com.example.UserManagement.models.Customer;
import com.example.TableManagement.Table;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/updateTable")
public class TableUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer currentCustomer = (Customer) session.getAttribute("customer");
        if (currentCustomer == null) {
            response.sendRedirect("user_login.jsp");
            return;
        }

        String tableId = request.getParameter("tableId");
        String tableNumber = request.getParameter("tableNumber");
        String capacity = request.getParameter("capacity");
        String status = request.getParameter("status");

        // Basic validation
        if (tableId == null || tableId.isEmpty() || tableNumber == null || tableNumber.isEmpty() ||
                capacity == null || capacity.isEmpty() || status == null || status.isEmpty()) {
            request.setAttribute("error", "All fields are required");
            request.getRequestDispatcher("table_update.jsp").forward(request, response);
            return;
        }

        int tableIdInt, tableNumberInt, capacityInt;
        try {
            tableIdInt = Integer.parseInt(tableId);
            tableNumberInt = Integer.parseInt(tableNumber);
            capacityInt = Integer.parseInt(capacity);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Table ID, number, and capacity must be numbers");
            request.getRequestDispatcher("table_update.jsp").forward(request, response);
            return;
        }

        List<Table> tables = FileHandler.readTables();
        boolean tableFound = false;
        for (Table table : tables) {
            if (table.getTableId() == tableIdInt) {
                table.setTableNumber(tableNumberInt);
                table.setCapacity(capacityInt);
                table.setStatus(status);
                tableFound = true;
                break;
            }
        }

        if (!tableFound) {
            request.setAttribute("error", "Table not found");
            request.getRequestDispatcher("table_update.jsp").forward(request, response);
            return;
        }

        FileHandler.updateTables(tables);
        response.sendRedirect("listTables");
    }
}