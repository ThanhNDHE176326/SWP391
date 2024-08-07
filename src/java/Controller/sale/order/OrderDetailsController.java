/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.sale.order;

import DAO.OrderDAO;
import Models.Order;
import Models.OrderDetail;
import Models.OrderStatus;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Acer
 */
@WebServlet(name = "OrderDetailsController", urlPatterns = {"/saleorderdetails"})
public class OrderDetailsController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
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
            out.println("<title>Servlet OrderDetailsController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderDetailsController at " + request.getContextPath() + "</h1>");
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
        OrderDAO orderDAO = new OrderDAO();
        String id = request.getParameter("id");

        Order order = orderDAO.getOrderById(id);
        List<OrderDetail> orderDetails = orderDAO.getOrderDetailsByOrderId(id);
        List<OrderStatus> orderStatusList = orderDAO.getAllOrderStatus();

        request.setAttribute("order", order);
        request.setAttribute("orderDetails", orderDetails);
        request.setAttribute("orderStatusList", orderStatusList);

        request.getRequestDispatcher("view/sale/orderdetails.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OrderDAO orderDAO = new OrderDAO();
                String id_1 = request.getParameter("id");

        String id = request.getParameter("orderId");
        String statusId = request.getParameter("statusId");

        orderDAO.updateOrderStatus(id, statusId);

        // Retrieve updated order details
        Order order = orderDAO.getOrderById(id_1);
        List<OrderDetail> orderDetails = orderDAO.getOrderDetailsByOrderId(id_1);
        List<OrderStatus> orderStatusList = orderDAO.getAllOrderStatus();
List<OrderStatus> filteredStatusList = new ArrayList<>();
        for (OrderStatus status : orderStatusList) {
           if (status.getId().equals("1") || status.getId().equals("2") || status.getId().equals("9") 
                    || status.getId().equals("4") || status.getId().equals("5") || status.getId().equals("6") || status.getId().equals("7"))  {
                filteredStatusList.add(status);
            }
        }
        
        request.setAttribute("order", order);
        request.setAttribute("orderDetails", orderDetails);
        request.setAttribute("orderStatusList", filteredStatusList);

        request.getRequestDispatcher("view/sale/orderdetails.jsp").forward(request, response);
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
