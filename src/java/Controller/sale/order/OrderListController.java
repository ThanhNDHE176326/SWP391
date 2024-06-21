package Controller.sale.order;

import DAO.OrderDAO;
import DAO.StaffDAO;
import Models.Order;
import Models.OrderStatus;
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

@WebServlet(name = "OrderListController", urlPatterns = {"/saleorderlist"})
public class OrderListController extends HttpServlet {

    private static final int ORDERS_PER_PAGE = 10;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrderListController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderListController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        StaffDAO dao = new StaffDAO();
        String id = dao.getInformationStaff(username).getId();
       

    // Ensure the staffId is available
    if (id == null) {
        response.sendRedirect("view/staff/loginstaff.jsp"); // Redirect to login if not logged in
        return;
    }

    OrderDAO orderDAO = new OrderDAO();
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
        Order order = orderDAO.getOrderByIdAndStaff(orderId, id);
        orders = (order != null) ? List.of(order) : List.of();
        totalOrders = orders.size();
    } else if (statusId != null && !statusId.isEmpty()) {
        // Lọc theo statusId nếu được chỉ định
        orders = orderDAO.getOrdersByStatusAndStaffWithPagination(statusId, id, offset, ORDERS_PER_PAGE);
        totalOrders = orderDAO.getTotalOrderCountByStatusAndStaff(statusId, id);
    } else if (customerName != null && !customerName.isEmpty()) {
        // Lọc theo customerName nếu được chỉ định
        orders = orderDAO.getOrdersByCustomerNameAndStaff(customerName, id);
        totalOrders = orders.size();
    } else {
        // Lấy danh sách đơn hàng bình thường
        orders = orderDAO.getOrdersByStaffWithPagination(id, offset, ORDERS_PER_PAGE);
        totalOrders = orderDAO.getTotalOrderCountByStaff(id);
    }

    int totalPages = (int) Math.ceil(totalOrders / (double) ORDERS_PER_PAGE);

    request.setAttribute("orders", orders);
    request.setAttribute("currentPage", page);
    request.setAttribute("totalPages", totalPages);

    List<OrderStatus> orderStatusList = orderDAO.getAllOrderStatus();
    request.setAttribute("orderStatusList", orderStatusList);

    // Đảm bảo rằng các tham số lọc được truyền tiếp qua request dispatcher
    request.setAttribute("statusId", statusId);
    request.setAttribute("orderId", orderId);
    request.setAttribute("customerName", customerName);

    request.getRequestDispatcher("view/sale/orderlist.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String orderId = request.getParameter("orderId");
        String statusId = request.getParameter("statusId");

        OrderDAO dao = new OrderDAO();
        dao.updateOrderStatus(orderId, statusId);

        response.sendRedirect(request.getContextPath() + "/saleorderlist");
    }

    @Override
    public String getServletInfo() {
        return "Order List Controller";
    }
}
