package com.example.TableManagement.Sevlets;

import com.example.TableManagement.VIPTable;
import com.example.UserManagement.models.Customer;
import com.example.TableManagement.RegularTable;
import com.example.TableManagement.Table;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/registerTable")
public class TableRegistrationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer currentCustomer = (Customer) session.getAttribute("customer");
        if (currentCustomer == null) {
            response.sendRedirect("user_login.jsp");
            return;
        }

        String tableNumber = request.getParameter("tableNumber");
        String capacity = request.getParameter("capacity");
        String status = request.getParameter("status");
        String tableType = request.getParameter("tableType");

        // Basic validation
        if (tableNumber == null || tableNumber.isEmpty() || capacity == null || capacity.isEmpty() ||
                status == null || status.isEmpty() || tableType == null || tableType.isEmpty()) {
            request.setAttribute("error", "All fields are required");
            request.getRequestDispatcher("table_register.jsp").forward(request, response);
            return;
        }

        int tableNumberInt;
        int capacityInt;
        try {
            tableNumberInt = Integer.parseInt(tableNumber);
            capacityInt = Integer.parseInt(capacity);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Table number and capacity must be numbers");
            request.getRequestDispatcher("table_register.jsp").forward(request, response);
            return;
        }

        // Check if table number already exists
        List<Table> tables = FileHandler.readTables();
        boolean tableExists = tables.stream().anyMatch(t -> t.getTableNumber() == tableNumberInt);
        if (tableExists) {
            request.setAttribute("error", "Table number already exists");
            request.getRequestDispatcher("table_register.jsp").forward(request, response);
            return;
        }

        Table table = "VIP".equals(tableType) ?
                new VIPTable(0, tableNumberInt, capacityInt, status) :
                new RegularTable(0, tableNumberInt, capacityInt, status);
        FileHandler.saveTable(table);

        response.sendRedirect("table_success.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("table_register.jsp").forward(request, response);
    }
}