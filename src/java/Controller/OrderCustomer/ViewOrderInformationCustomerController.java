/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.OrderCustomer;

import DAO.CustomerDAO;
import DAO.OrderCustomerDAO;
import DAO.ProductDAO;
import DAO.ProductDAOByPublic;
import DAO.SendMail;
import Models.Category;
import Models.Customer;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        HttpSession session = request.getSession();
        OrderCustomerDAO dao = new OrderCustomerDAO();
        String customerName = (String) session.getAttribute("usernamecustomer");
        int customer_id = dao.getCustomerIdByUsername(customerName);
        String orderId = request.getParameter("orderId");
        String cancelled = request.getParameter("cancelled");
        String complete = request.getParameter("complete");
        int order_id = Integer.parseInt(orderId);

        ProductDAO productDAO = new ProductDAO();
        ProductDAOByPublic ProductDAOByPublic = new ProductDAOByPublic();
        if (cancelled != null) {
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
        } else if (complete != null) {
            dao.updateOrderComplete(order_id);
            CustomerDAO customerdao = new CustomerDAO();
            SendMail sm = new SendMail();
            String email = customerdao.getInformationCustomer(customerName).getEmail();

            String subject = "Thank You for Your Purchase from BookHaven!";
            String content = "Dear Customer,\n\n"
                    + "We hope this message finds you well.\n\n"
                    + "Thank you for your recent purchase from BookHaven. We are pleased to inform you that your order has been successfully delivered.\n\n"
                    + "We hope you are enjoying your new product and that it meets your expectations.\n"
                    + "Your satisfaction is our priority, and we are always here to assist you with any questions or concerns.\n\n"
                    + "If you have any feedback or need further assistance, please feel free to reach out to our support team.\n\n"
                    + "Thank you once again for choosing BookHaven. We look forward to serving you again in the future.\n\n"
                    + "Best regards,\n"
                    + "The BookHaven Team";
            Customer user = new Customer(customerName, email);
            boolean test = sm.sendEmail(user, subject, content);
        }
        List<OrderDetail> listProductOrder = dao.getProductByOrderId(order_id);
        Map<Integer, Integer> feedbackCounts = new HashMap<>();
        for (OrderDetail orderDetail : listProductOrder) {
            String productOrderId = orderDetail.getProduct_id();
            int productID = Integer.parseInt(productOrderId);
            int countFeedback = dao.countFeedbackProductByCustomer(customer_id, productID);
            feedbackCounts.put(productID, countFeedback);
        }
        List<Product> listNewProduct = ProductDAOByPublic.getTop6ProductNew();
        List<Category> category = ProductDAOByPublic.getCategory();
        Order order = dao.getInfoOrderByOrderId(order_id);
        request.setAttribute("feedbackCounts", feedbackCounts);
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
