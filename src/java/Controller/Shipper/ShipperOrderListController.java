/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Shipper;

import DAO.OrderDAO;
import DAO.StaffDAO;
import Models.Order;
import Models.OrderStatus;
import Models.Staff;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author Acer
 */
@WebServlet(name = "ShipperOrderListController", urlPatterns = {"/shipperorderlist"})
public class ShipperOrderListController extends HttpServlet {

    private static final int ORDERS_PER_PAGE = 10;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet WarehouseOrderListController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet WarehouseOrderListController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OrderDAO orderDAO = new OrderDAO();
        StaffDAO staffDAO = new StaffDAO();
        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
        int offset = (page - 1) * ORDERS_PER_PAGE;

        // Lấy các tham số từ request để lọc
        String orderId = request.getParameter("orderId");
        String statusId = request.getParameter("statusId");
        String customerName = request.getParameter("customerName");

        List<Order> orders;
        int totalOrders;

        if (orderId != null && !orderId.isEmpty()) {
            // Lọc theo orderId nếu được chỉ định
            Order order = orderDAO.getOrderById(orderId);
            orders = (order != null) ? List.of(order) : List.of();
            totalOrders = orders.size();
        } else if (statusId != null && !statusId.isEmpty()) {
            // Lọc theo statusId nếu được chỉ định
            orders = orderDAO.getOrdersByStatusWithPagination(statusId, offset, ORDERS_PER_PAGE);
            totalOrders = orderDAO.getTotalOrderCountByStatus(statusId);
        } else if (customerName != null && !customerName.isEmpty()) {
            // Lọc theo customerName nếu được chỉ định
            orders = orderDAO.getOrdersByCustomerName(customerName);
            totalOrders = orders.size();
        } else {
            // Lấy danh sách đơn hàng bình thường
            orders = orderDAO.getPackedOrdersForWarehouse(offset, ORDERS_PER_PAGE);
            totalOrders = orderDAO.getTotalPackedOrderCountForWarehouse();
        }

        int totalPages = (int) Math.ceil(totalOrders / (double) ORDERS_PER_PAGE);
        List<Staff> staffList = staffDAO.getSalesStaffWithOrderCount();

        request.setAttribute("orders", orders);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("staffList", staffList);

        // Đảm bảo rằng các tham số lọc được truyền tiếp qua request dispatcher
        List<OrderStatus> orderStatusList = orderDAO.getAllOrderStatus();
        List<OrderStatus> shipperOrderStatusList = orderStatusList.stream()
                .filter(status -> List.of("4", "5", "6", "7").contains(status.getId()))
                .collect(Collectors.toList());
        request.setAttribute("orderStatusList", shipperOrderStatusList);

        request.setAttribute("statusId", statusId);
        request.setAttribute("orderId", orderId);
        request.setAttribute("customerName", customerName);

        request.getRequestDispatcher("view/shiper/orderlistshipper.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        
String orderId = request.getParameter("orderId");
    String newStatus = request.getParameter("newStatus");

    OrderDAO dao = new OrderDAO();
    Order order = dao.getOrderById(orderId);

    // Cập nhật trạng thái nếu đơn hàng chưa hoàn thành
    if (!"7".equals(order.getStatus_id())) {
        dao.updateOrderStatus(orderId, newStatus);
    }

        response.sendRedirect(request.getContextPath() + "/shipperorderlist");
    }

    @Override
    public String getServletInfo() {
        return "Warehouse Order List Controller";
    }
}
