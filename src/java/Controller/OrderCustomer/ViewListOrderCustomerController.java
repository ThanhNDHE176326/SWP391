/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.OrderCustomer;

import DAO.OrderCustomerDAO;
import DAO.ProductDAO;
import DAO.ProductDAOByPublic;
import Models.Category;
import Models.Order;
import Models.OrderDetail;
import Models.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ViewListOrderCustomerController", urlPatterns = {"/listOrderCustomer"})
public class ViewListOrderCustomerController extends HttpServlet {

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
        OrderCustomerDAO dao = new OrderCustomerDAO();
        ProductDAO productDAO = new ProductDAO();
        ProductDAOByPublic productDAOByPublic = new ProductDAOByPublic();

        String orderId = request.getParameter("orderId");
        String customerName = (String) session.getAttribute("usernamecustomer");
        String customer_id = String.valueOf(dao.getCustomerIdByUsername(customerName));
        if (orderId != null) {
            int order_id = Integer.parseInt(orderId);
            dao.updateOrderStatus(order_id);
            //từ order_id lấy ra list order_detail
            List<Integer> orderDetailIds = dao.getOrderDetailIdsByOrderId(order_id);
            // dùng for each lặp qua order_detail lấy id, quantity product
            for (int orderDetailId : orderDetailIds) {
                OrderDetail orderDetail = dao.getOrderDetailById(orderDetailId);
                String id = orderDetail.getId();
                String productId = orderDetail.getProduct_id();
                int productID = Integer.parseInt(productId);
                String quantity = orderDetail.getQuantity();
                int quantityInOrderProduct = Integer.parseInt(quantity);
                //lấy ra hold của product hiện tại
                int holdInProducts = productDAO.getHoldByProductID(productID);
                //tình toán lại hold
                int holdChanged = holdInProducts - quantityInOrderProduct;
                //update quantity mới vào product
                productDAO.updateHoldProductAfterCart(productID, holdChanged);
            }
        }

        String indexPage = request.getParameter("index");
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);

        String startDateParam = request.getParameter("startDate");
        String endDateParam = request.getParameter("endDate");

        LocalDate startDate = null;
        LocalDate endDate = null;
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        if (startDateParam != null && !startDateParam.isEmpty()) {
            startDate = LocalDate.parse(startDateParam, formatter);
        }
        if (endDateParam != null && !endDateParam.isEmpty()) {
            endDate = LocalDate.parse(endDateParam, formatter);
        }

        java.sql.Date startSqlDate = null;
        java.sql.Date endSqlDate = null;

        if (startDate != null) {
            startSqlDate = java.sql.Date.valueOf(startDate.toString());
        }
        if (endDate != null) {
            endSqlDate = java.sql.Date.valueOf(endDate.toString());
        }

        List<Order> orderList;
        int endPage = 0;

        try {
            if (startSqlDate != null || endSqlDate != null) {
                int count = dao.countFilterOrderByCustomer(customer_id, startSqlDate, endSqlDate);
                endPage = count / 5;
                if (count % 5 != 0) {
                    endPage++;
                }
                orderList = dao.getFilteredOrders(customer_id, startSqlDate, endSqlDate, index);
            } else {
                int count = dao.countTotalOrderByCustomer(customer_id);
                endPage = count / 5;
                if (count % 5 != 0) {
                    endPage++;
                }
                orderList = dao.getAllOrderById(customer_id, index);
            }

            List<Product> listNewProduct = productDAOByPublic.getTop6ProductNew();
            List<Category> categories = productDAOByPublic.getCategory();

            request.setAttribute("categories", categories);
            request.setAttribute("listNewProduct", listNewProduct);
            request.setAttribute("orderList", orderList);
            request.setAttribute("endP", endPage);
            request.setAttribute("tag", index);
        } catch (Exception e) {
            throw new ServletException("Error retrieving orders", e);
        }

        request.getRequestDispatcher("view/customer/MyOrders.jsp").forward(request, response);
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
