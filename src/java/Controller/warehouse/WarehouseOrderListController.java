/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.warehouse;

import DAO.OrderCustomerDAO;
import DAO.OrderDAO;
import DAO.ProductDAO;
import DAO.StaffDAO;
import Models.Order;
import Models.OrderDetail;
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

@WebServlet(name = "WarehouseOrderListController", urlPatterns = {"/warehouseorderlist"})
public class WarehouseOrderListController extends HttpServlet {

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
            orders = orderDAO.getConfirmedOrdersForWarehouse(offset, ORDERS_PER_PAGE);
            totalOrders = orderDAO.getTotalConfirmedOrderCountForWarehouse();
        }

        int totalPages = (int) Math.ceil(totalOrders / (double) ORDERS_PER_PAGE);
        List<Staff> staffList = staffDAO.getSalesStaffWithOrderCount();

        request.setAttribute("orders", orders);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("staffList", staffList);

        // Đảm bảo rằng các tham số lọc được truyền tiếp qua request dispatcher
        List<OrderStatus> orderStatusList = orderDAO.getAllOrderStatus();
        List<OrderStatus> warehouseOrderStatusList = new ArrayList<>();
        for (OrderStatus status : orderStatusList) {
            if (status.getId().equals("2") || status.getId().equals("3") || status.getId().equals("8")
                    || status.getId().equals("4")) {
                warehouseOrderStatusList.add(status);
            }
        }
        request.setAttribute("orderStatusList", orderStatusList);

        request.setAttribute("warehouseOrderStatusList", warehouseOrderStatusList);

        request.setAttribute("statusId", statusId);
        request.setAttribute("orderId", orderId);
        request.setAttribute("customerName", customerName);

        request.getRequestDispatcher("view/warehouse/orderlistwarehouse.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String orderId = request.getParameter("orderId");
        int order_id = Integer.parseInt(orderId);
        String statusId = request.getParameter("statusId");

        OrderCustomerDAO orderCustomerDAO = new OrderCustomerDAO();
        ProductDAO productDAO = new ProductDAO();
        OrderDAO dao = new OrderDAO();

        if (statusId != null && statusId.equals("9")) {
            dao.updateInventory(order_id);
            dao.updateOrderStatus(orderId, statusId);
        } else {
            dao.updateOrderStatus(orderId, statusId);

            if (statusId != null && statusId.equals("4")) {
                List<Integer> orderDetailIds = orderCustomerDAO.getOrderDetailIdsByOrderId(order_id);
                for (int orderDetailId : orderDetailIds) {
                    OrderDetail orderDetail = orderCustomerDAO.getOrderDetailById(orderDetailId);
                    int productID = Integer.parseInt(orderDetail.getProduct_id());
                    int quantityInOrderProduct = Integer.parseInt(orderDetail.getQuantity());
                    int quantityInProducts = productDAO.getQuantityByProductID(productID);
                    int currentHold = productDAO.getHoldByProductID(productID);

                    int quantityChanged = quantityInProducts - quantityInOrderProduct;
                    int newHold = currentHold - quantityInOrderProduct;

                    productDAO.updateProductQuantityAndHold(productID, quantityChanged, newHold);
                }
            }
        }

        response.sendRedirect(request.getContextPath() + "/warehouseorderlist");
    }

    @Override
    public String getServletInfo() {
        return "Warehouse Order List Controller";
    }
}
