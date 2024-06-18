/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.cart;

import DAO.CartDAO;
import DAO.CartProductDAO;
import DAO.CustomerDAO;
import DAO.DeliveryAddressDAO;
import DAO.OrderDAO;
import DAO.ProductDAO;
import DAO.StaffDAO;
import Models.Customer;
import Models.Order;
import Models.Staff;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 *
 * @author admin
 */
@WebServlet(name = "CartCompletionController", urlPatterns = {"/cartCompletion"})
public class CartCompletionController extends HttpServlet {

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
            out.println("<title>Servlet CartCompletionController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartCompletionController at " + request.getContextPath() + "</h1>");
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

        HttpSession session = request.getSession();
        ProductDAO productDAO = new ProductDAO();
        CartDAO cartDAO = new CartDAO();
        CartProductDAO cartProductDAO = new CartProductDAO();
        OrderDAO orderDAO = new OrderDAO();
        StaffDAO staffDAO = new StaffDAO();
        CustomerDAO customerDAO = new CustomerDAO();
        DeliveryAddressDAO deliveryAddressDAO = new DeliveryAddressDAO();

        String customerName = (String) session.getAttribute("username");
        int customerID = Integer.parseInt(customerDAO.getInformationCustomer(customerName).getId());
        int cartID = cartDAO.getCartIdByCustomerID(customerID);

        List<Staff> listSaler = staffDAO.getSalers();
        Random random = new Random();
        int randomIndex = random.nextInt(listSaler.size());
        Staff salerRandom = listSaler.get(randomIndex);
        int salerRandomID = Integer.parseInt(salerRandom.getId());//staff_id in Orders

//        Customer customerCreateOrder = (Customer) session.getAttribute("userCreateOrder");

        String selectedAddressDefault = request.getParameter("selectedAddressDefault"); //id cua bang Customers
        String selectedAddressChange = request.getParameter("selectedAddressChange"); // id cua bang Address
        String addressOrder="";
        String phoneOrder="";
        if(selectedAddressDefault != null){
//            int customerID = Integer.parseInt(selectedAddressDefault);
            addressOrder = customerDAO.getAddressByCustomerId(customerID);
            phoneOrder = customerDAO.getPhoneByCustomerId(customerID);
        }
        if(selectedAddressChange != null){
            int deliveryAddressID = Integer.parseInt(selectedAddressChange);
            addressOrder = deliveryAddressDAO.getAddressByIdAndCustomerID(deliveryAddressID, customerID);
            phoneOrder = deliveryAddressDAO.getPhoneByIdAndCustomerID(deliveryAddressID, customerID);
        }
        String[] productIds = request.getParameterValues("productId");
        for (String productId : productIds) {
            int productID = Integer.parseInt(productId);
            int quatityInCartProduct = cartProductDAO.getQuantityByCartIdAndProductID(cartID, productID);
            int quantityInProducts = productDAO.getQuantityByProductID(productID);
            int quantityChanged = quantityInProducts - quatityInCartProduct;
            productDAO.updateQuantityAfterCart(productID, quantityChanged);
        }
        String totalCost = request.getParameter("totalCost");
        LocalDate orderDate = LocalDate.now();
//        Order order = new Order(customerID,totalCost,orderDate,addressOrder,phoneOrder,salerRandomID);
//        orderDAO.createOrder(order);
        orderDAO.insertOrder(customerID, totalCost, orderDate, addressOrder, phoneOrder, salerRandomID);
        request.getRequestDispatcher("view/customer/cart-completion.jsp").forward(request, response);
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
