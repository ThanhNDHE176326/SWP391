package Controller.sale.order;

import DAO.CustomerDAO;
import DAO.OrderCustomerDAO;
import DAO.OrderDAO;
import DAO.ProductDAO;
import DAO.SendMail;
import DAO.StaffDAO;
import Models.Customer;
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

        List<OrderStatus> OrderStatusList = orderDAO.getAllOrderStatus();
        List<OrderStatus> orderStatusList = orderDAO.getAllOrderStatus();
        List<OrderStatus> filteredStatusList = new ArrayList<>();
        for (OrderStatus status : orderStatusList) {
            if (status.getId().equals("1") || status.getId().equals("2") || status.getId().equals("3") || status.getId().equals("9") 
                    || status.getId().equals("4") || status.getId().equals("5") || status.getId().equals("6") || status.getId().equals("7"))  {
                filteredStatusList.add(status);
            }
        }

        request.setAttribute("OrderStatusList", OrderStatusList);

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
        if (statusId.equals("7")) {
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
//                int quantityInProducts = productDAO.getQuantityByProductID(productID);
                int currentHold = productDAO.getHoldByProductID(productID);
                //tình toán lại quantity
//                int quantityChanged = quantityInProducts - quantityInOrderProduct;
                int newHold = currentHold - quantityInOrderProduct;
                //update quantity mới vào product
                productDAO.updateProductHold(productID, newHold);
            }
        }
        
        
        if (statusId.equals("8")) {
            List<Integer> orderDetailIds = orderCustomerDAO.getOrderDetailIdsByOrderId(order_id);
            // dùng for each lặp qua order_detail lấy id, quantity product
//            for (int orderDetailId : orderDetailIds) {
//                OrderDetail orderDetail = orderCustomerDAO.getOrderDetailById(orderDetailId);
//                String id = orderDetail.getId();
//                String productId = orderDetail.getProduct_id();
//                int productID = Integer.parseInt(productId);
//                String quantity = orderDetail.getQuantity();
//                int quantityInOrderProduct = Integer.parseInt(quantity);
//                //lấy ra quantity của product trong kho
//                int quantityInProducts = productDAO.getQuantityByProductID(productID);
//                //tình toán lại quantity
//                int quantityChanged = quantityInProducts + quantityInOrderProduct;
//                //update quantity mới vào product
//                productDAO.updateQuantityAfterCart(productID, quantityChanged);
//            }
            String customer_id = dao.getCustomerIdByOrderId(order_id);
            CustomerDAO customerdao = new CustomerDAO();
            String usernamecustomer = customerdao.getUsernameCustomer(customer_id);
            SendMail sm = new SendMail();
            String email = customerdao.getInformationCustomer(usernamecustomer).getEmail();

            String subject = "Order Cancellation from BookHaven";
            String content = "Dear Customer,\n\n"
                    + "We regret to inform you that your order with ID: " + orderId + " has been cancelled.\n\n"
                    + "Thank you for choosing our product.\n"
                    + "We apologize for any inconvenience this may have caused.\n"
                    + "If you have any questions or need further assistance, please feel free to contact our support team.\n\n"
                    + "Best regards,\n"
                    + "The BookHaven Team";

            Customer user = new Customer(usernamecustomer, email);
            boolean test = sm.sendEmail(user, subject, content);

        }
        if (statusId.equals("2")) {
            String customer_id = dao.getCustomerIdByOrderId(order_id);
            CustomerDAO customerdao = new CustomerDAO();
            String usernamecustomer = customerdao.getUsernameCustomer(customer_id);
            SendMail sm = new SendMail();
            String email = customerdao.getInformationCustomer(usernamecustomer).getEmail();

            String subject = "From BookHaven With Love <3";
            String content = "ORDER CONFIRMED\n\n"
                    + "Dear Customer,\n\n"
                    + "We are pleased to inform you that your order with ID: " + orderId + " has been confirmed.\n\n"
                    + "Thank you for choosing our product.\n"
                    + "The product will be delivered to you as soon as possible.\n"
                    + "We hope you have a wonderful experience with our product.\n\n"
                    + "Best regards,\n"
                    + "The BookHaven Team";

            Customer user = new Customer(usernamecustomer, email);
            boolean test = sm.sendEmail(user, subject, content);
        }
        if (statusId.equals("4")) {
            String customer_id = dao.getCustomerIdByOrderId(order_id);
            CustomerDAO customerdao = new CustomerDAO();
            String usernamecustomer = customerdao.getUsernameCustomer(customer_id);
            SendMail sm = new SendMail();
            String email = customerdao.getInformationCustomer(usernamecustomer).getEmail();

            String subject = "Order Cancellation from BookHaven";
            String content = "Dear Customer,\n\n"
                    + "We regret to inform you that your order with ID: " + orderId + " has been cancelled.\n\n"
                    + "Thank you for choosing our product.\n"
                    + "We apologize for any inconvenience this may have caused.\n"
                    + "If you have any questions or need further assistance, please feel free to contact our support team.\n\n"
                    + "Best regards,\n"
                    + "The BookHaven Team";

            Customer user = new Customer(usernamecustomer, email);
            boolean test = sm.sendEmail(user, subject, content);
        }

        response.sendRedirect(request.getContextPath() + "/saleorderlist");
    }

    @Override
    public String getServletInfo() {
        return "Order List Controller";
    }
}
