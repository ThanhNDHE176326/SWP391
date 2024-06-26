package Controller.sale.order;

import DAO.OrderCustomerDAO;
import DAO.OrderDAO;
import DAO.ProductDAO;
import DAO.StaffDAO;
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
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

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
        String username = (String) session.getAttribute("usernamestaff");
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
        List<OrderStatus> filteredStatusList = new ArrayList<>();
        for (OrderStatus status : orderStatusList) {
            if (status.getId().equals("1") || status.getId().equals("2") || status.getId().equals("9")) {
                filteredStatusList.add(status);
            }
        }

        request.setAttribute("orderStatusList", filteredStatusList);

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
        int order_id = Integer.parseInt(orderId);
        String statusId = request.getParameter("statusId");
        OrderCustomerDAO orderCustomerDAO = new OrderCustomerDAO();
        ProductDAO productDAO = new ProductDAO();
        OrderDAO dao = new OrderDAO();
        dao.updateOrderStatus(orderId, statusId);
        if (statusId.equals("9")) {
            List<Integer> orderDetailIds = orderCustomerDAO.getOrderDetailIdsByOrderId(order_id);
            // dùng for each lặp qua order_detail lấy id, quantity product
            for (int orderDetailId : orderDetailIds) {
                OrderDetail orderDetail = orderCustomerDAO.getOrderDetailById(orderDetailId);
                String id = orderDetail.getId();
                String productId = orderDetail.getProduct_id();
                int productID = Integer.parseInt(productId);
                String quantity = orderDetail.getQuantity();
                int quantityInOrderProduct = Integer.parseInt(quantity);
                //lấy ra quantity của product trong kho
                int quantityInProducts = productDAO.getQuantityByProductID(productID);
                //tình toán lại quantity
                int quantityChanged = quantityInProducts + quantityInOrderProduct;
                //update quantity mới vào product
                productDAO.updateQuantityAfterCart(productID, quantityChanged);
            }
        }
        response.sendRedirect(request.getContextPath() + "/saleorderlist");
    }

    @Override
    public String getServletInfo() {
        return "Order List Controller";
    }
}
