/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.cart;

import DAO.CustomerDAO;
import DAO.OrderCustomerDAO;
import DAO.OrderDAO;
import DAO.ProductDAO;
import Models.OrderDetail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CheckOutSuccessfully", urlPatterns = {"/checkOutSuccessfully"})
public class CheckOutSuccessfully extends HttpServlet {

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
        HttpSession session = request.getSession();
        CustomerDAO customerDAO = new CustomerDAO();
        OrderCustomerDAO orderCustomerDAO = new OrderCustomerDAO();
        OrderDAO orderDAO = new OrderDAO();
        ProductDAO productDAO = new ProductDAO();
        String customerName = (String) session.getAttribute("usernamecustomer");
        int customerID = Integer.parseInt(customerDAO.getInformationCustomer(customerName).getId());
        int orderID = orderDAO.getOrderIDLatestByCustomerID(customerID);
        String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");

        if ("00".equals(vnp_ResponseCode)) {
            // Thanh toán thành công
            orderDAO.updateOrderStatusConfirmById(orderID);
            request.getRequestDispatcher("view/customer/cart-completion.jsp").forward(request, response);
        } else {
            // Thanh toán không thành công
            orderCustomerDAO.updateOrderStatus(orderID);
            //từ order_id lấy ra list order_detail
            List<Integer> orderDetailIds = orderCustomerDAO.getOrderDetailIdsByOrderId(orderID);
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
            request.setAttribute("message", "Payment failed");
            request.getRequestDispatcher("view/customer/homepage.jsp").forward(request, response);
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
        processRequest(request, response);
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
