/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.sale.db;

import DAO.OrderDAO;
import com.google.gson.Gson;

import Models.Order;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Acer
 */
@WebServlet(name = "SaleDashBoardController", urlPatterns = {"/saledashboard"})
public class SaleDashBoardController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error 
     * occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SaleDashBoardController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SaleDashBoardController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LocalDate endDate = LocalDate.now();
    LocalDate startDate = endDate.minusDays(6); // Adjusted to cover 7 days including endDate

    // Assuming you have a way to get the database connection
    // Connection connection = Database.getConnection();

    OrderDAO orderDAO = new OrderDAO(/*connection*/); // Pass the connection object here
    List<Order> orders = orderDAO.getOrdersByDateRange(Date.valueOf(startDate), Date.valueOf(endDate));

    int[] successOrders = new int[7];
    int[] totalOrders = new int[7];
    float[] revenues = new float[7];

    for (Order order : orders) {
        LocalDate orderLocalDate = Date.valueOf(order.getOrderDate()).toLocalDate();
        int dayIndex = (int) (orderLocalDate.toEpochDay() - startDate.toEpochDay());
        
        // Ensure dayIndex is within bounds
        if (dayIndex >= 0 && dayIndex < 7) {
            totalOrders[dayIndex]++;
            if (Integer.parseInt(order.getStatus_id()) == 1) { // Assuming status 1 means success
                successOrders[dayIndex]++;
                revenues[dayIndex] += Float.parseFloat(order.getTotalCost());
            }
        } else {
            // Handle the case where the order date is outside the 7-day range
            // This can occur if there are orders outside the expected date range
            // You can choose to log this or handle it differently based on your application logic.
            System.out.println("Order date outside expected range: " + order.getOrderDate());
        }
    }

    Map<String, Object> data = new HashMap<>();
    data.put("successOrders", successOrders);
    data.put("totalOrders", totalOrders);
    data.put("revenues", revenues);

    String json = new Gson().toJson(data);
    response.setContentType("application/json");
    response.getWriter().write(json);
    
    }



/**
 * Handles the HTTP <code>POST</code> method.
 *
 * @param request servlet request
 * @param response servlet response
 * @throws ServletException if a servlet-specific error occurs
 * @throws IOException if an I/O error occurs
 */
@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
