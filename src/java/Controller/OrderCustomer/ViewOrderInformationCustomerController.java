/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.OrderCustomer;

import DAO.OrderCustomerDAO;
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
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ViewOrderInformationCustomerController", urlPatterns = {"/orderInformationCustomer"})
public class ViewOrderInformationCustomerController extends HttpServlet {

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
        String orderId = request.getParameter("orderId");
        String cancelled = request.getParameter("cancelled");
        int order_id = Integer.parseInt(orderId);
        OrderCustomerDAO dao = new OrderCustomerDAO();
        ProductDAOByPublic ProductDAOByPublic = new ProductDAOByPublic();
        if (cancelled != null) {
            dao.updateOrderStatus(order_id);
        }
        List<OrderDetail> listProductOrder = dao.getProductByOrderId(order_id);
        List<Product> listNewProduct = ProductDAOByPublic.getTop6ProductNew();
        List<Category> category = ProductDAOByPublic.getCategory();
        Order order = dao.getInfoOrderByOrderId(order_id);
        request.setAttribute("listNewProduct", listNewProduct);
        request.setAttribute("listProductOrder", listProductOrder);
        request.setAttribute("categories", category);
        request.setAttribute("order", order);
        request.getRequestDispatcher("view/customer/order_information.jsp").forward(request, response);
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
