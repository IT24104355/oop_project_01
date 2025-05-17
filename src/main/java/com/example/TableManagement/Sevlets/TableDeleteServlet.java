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
import java.util.stream.Collectors;

@WebServlet("/deleteTable")
public class TableDeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer currentCustomer = (Customer) session.getAttribute("customer");
        if (currentCustomer == null) {
            response.sendRedirect("user_login.jsp");
            return;
        }

        String tableId = request.getParameter("tableId");
        if (tableId == null || tableId.isEmpty()) {
            request.setAttribute("error", "Table ID is required");
            request.getRequestDispatcher("table_list.jsp").forward(request, response);
            return;
        }

        int tableIdInt;
        try {
            tableIdInt = Integer.parseInt(tableId);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid Table ID");
            request.getRequestDispatcher("table_list.jsp").forward(request, response);
            return;
        }

        List<Table> tables = FileHandler.readTables();
        tables = tables.stream()
                .filter(t -> t.getTableId() != tableIdInt)
                .collect(Collectors.toList());
        FileHandler.updateTables(tables);

        response.sendRedirect("listTables");
    }
}