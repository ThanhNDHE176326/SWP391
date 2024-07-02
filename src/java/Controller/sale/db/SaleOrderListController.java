/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.sale.db;

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

/**
 *
 * @author Acer
 */
@WebServlet(name = "SaleOrderListController", urlPatterns = {"/saleadminorderlist"})
public class SaleOrderListController extends HttpServlet {

    private static final int ORDERS_PER_PAGE = 10;

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
            out.println("<title>Servlet SaleOrderListController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SaleOrderListController at " + request.getContextPath() + "</h1>");
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

    List<Order> orders = new ArrayList<>();
    int totalOrders = 0;

    if (orderId != null && !orderId.isEmpty()) {
        System.out.println("Filtering by Order ID: " + orderId);
        Order order = orderDAO.getOrderById(orderId);
        orders = (order != null) ? List.of(order) : List.of();
        totalOrders = orders.size();
    } else if (statusId != null && !statusId.isEmpty()) {
        System.out.println("Filtering by Status ID: " + statusId);
        orders = orderDAO.getOrdersByStatusWithPagination(statusId, offset, ORDERS_PER_PAGE);
        totalOrders = orderDAO.getTotalOrderCountByStatus(statusId);
    } else if (customerName != null && !customerName.isEmpty()) {
        System.out.println("Filtering by Customer Name: " + customerName);
        orders = orderDAO.getOrdersByCustomerName(customerName);
        totalOrders = orders.size();
    } else {
        System.out.println("Retrieving all orders with pagination");
        orders = orderDAO.getOrdersWithPagination(offset, ORDERS_PER_PAGE);
        totalOrders = orderDAO.getTotalOrderCount();
    }

    int totalPages = (int) Math.ceil(totalOrders / (double) ORDERS_PER_PAGE);
    System.out.println("Total Orders: " + totalOrders + ", Total Pages: " + totalPages);

    List<Staff> staffList = staffDAO.getSalesStaffWithOrderCount();
    
    request.setAttribute("orders", orders);
    request.setAttribute("currentPage", page);
    request.setAttribute("totalPages", totalPages);
    request.setAttribute("staffList", staffList);

    List<OrderStatus> orderStatusList = orderDAO.getAllOrderStatus(); 
    List<OrderStatus> filteredStatusList = new ArrayList<>();
    for (OrderStatus status : orderStatusList) {
        if (status.getId().equals("1") || status.getId().equals("2") || status.getId().equals("9") 
                    || status.getId().equals("4") || status.getId().equals("5") || status.getId().equals("6") || status.getId().equals("7"))  {
            filteredStatusList.add(status);
        }
    }
    request.setAttribute("OrderStatusList", filteredStatusList);

    // Đảm bảo rằng các tham số lọc được truyền tiếp qua request dispatcher
    request.setAttribute("statusId", statusId);
    request.setAttribute("orderId", orderId);
    request.setAttribute("customerName", customerName);

    request.getRequestDispatcher("view/saleadmin/orderlistsale.jsp").forward(request, response);
    }
//      public static void main(String[] args) {
//        OrderDAO dao = new OrderDAO();
//        Order order = dao.getOrderById("1");
//        System.out.println(order);
//    }

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
        OrderDAO orderDAO = new OrderDAO();
        StaffDAO staffDAO = new StaffDAO();
        OrderCustomerDAO orderCustomerDAO = new OrderCustomerDAO();
        ProductDAO productDAO = new ProductDAO();
        String orderId = request.getParameter("orderId");
        int order_id = Integer.parseInt(orderId);
        String statusId = request.getParameter("statusId");
        String staffId = request.getParameter("staffId");

        if (orderId != null && statusId != null) {
            orderDAO.updateOrderStatus(orderId, statusId);
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
                OrderDAO dao = new OrderDAO();
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
            } else {
                OrderDAO dao = new OrderDAO();
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
        }

        if (orderId != null && staffId != null) {
            orderDAO.updateOrderStaff(orderId, staffId);
        }

        response.sendRedirect(request.getContextPath() + "/saleadminorderlist");
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
