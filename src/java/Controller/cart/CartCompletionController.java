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
import Models.Config;
import Models.Customer;
import Models.Order;
import Models.Product;
import Models.Staff;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
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

        String customerName = (String) session.getAttribute("usernamecustomer");
        int customerID = Integer.parseInt(customerDAO.getInformationCustomer(customerName).getId());
        int cartID = cartDAO.getCartIdByCustomerID(customerID);

        List<Staff> listSaler = staffDAO.getSalers();
        Random random = new Random();
        int randomIndex = random.nextInt(listSaler.size());
        Staff salerRandom = listSaler.get(randomIndex);
        int salerRandomID = Integer.parseInt(salerRandom.getId()); // staff_id in Orders

        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String gender = request.getParameter("gender");
        boolean isMale = "Male".equals(gender);
        String newName = request.getParameter("newName");
        String newPhone = request.getParameter("newPhone");
        String newAddress = request.getParameter("newAddress");
        String newGender = request.getParameter("newGender");
        boolean isMaleNew = "1".equals(newGender);
        String paymentMethod = request.getParameter("paymentMethod");
        int paymentID = Integer.parseInt(paymentMethod);

        String totalCostStr = request.getParameter("totalCost");
        double totalCost = Double.parseDouble(totalCostStr);
        LocalDate orderDate = LocalDate.now();

        if (newName != null && !newName.isEmpty()
                && newPhone != null && !newPhone.isEmpty()
                && newAddress != null && !newAddress.isEmpty()
                && newGender != null && !newGender.isEmpty()) {
            orderDAO.insertOrder(customerID, totalCost, orderDate, newAddress, newPhone, newName, isMaleNew, paymentID, salerRandomID);
        } else {
            orderDAO.insertOrder(customerID, totalCost, orderDate, address, phone, name, isMale, paymentID, salerRandomID);
        }

        int orderID = orderDAO.getOrderIDByCustomerID(customerID);
        String[] productIds = request.getParameterValues("productId");
        for (String productId : productIds) {
            int productID = Integer.parseInt(productId);
            int quatityInCartProduct = cartProductDAO.getQuantityByCartIdAndProductID(cartID, productID);
            int quantityInProducts = productDAO.getQuantityByProductID(productID);
            int quantityChanged = quantityInProducts - quatityInCartProduct;
            productDAO.updateQuantityAfterCart(productID, quantityChanged);
            orderDAO.insertOrderDetail(orderID, productID, cartID);
        }

        if (paymentID == 3) {
            processVnpayment(request, response, totalCost, orderID);
        } else {
            processNonVnpayment(request, response, orderID);
        }

        // Ensure no forwarding after sendRedirect
    }

    private void processVnpayment(HttpServletRequest request, HttpServletResponse response, double totalCost, int orderID)
            throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        int total_cost = (int) totalCost;
        String vnp_Version = "2.1.0";
        String vnp_Command = "pay";
        String vnp_OrderInfo = "" + orderID;
        String orderType = "billpayment";
        String vnp_TxnRef = orderID + "";
        String vnp_IpAddr = Config.getIpAddress(request);
        String vnp_TmnCode = Config.vnp_TmnCode;

        int amount = Math.round(total_cost) * 100;
        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", "VND");
        String bank_code = "";
        if (bank_code != null && !bank_code.isEmpty()) {
            vnp_Params.put("vnp_BankCode", bank_code);
        }
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", vnp_OrderInfo);
        vnp_Params.put("vnp_OrderType", orderType);

        String locate = "vi";
        if (locate != null && !locate.isEmpty()) {
            vnp_Params.put("vnp_Locale", locate);
        } else {
            vnp_Params.put("vnp_Locale", "vn");
        }
        vnp_Params.put("vnp_ReturnUrl", Config.vnp_Returnurl);
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

        Date dt = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String dateString = formatter.format(dt);
        String vnp_CreateDate = dateString;
        String vnp_TransDate = vnp_CreateDate;
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

        // Build data to hash and querystring
        List<String> fieldNames = new ArrayList<>(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        for (Iterator<String> itr = fieldNames.iterator(); itr.hasNext();) {
            String fieldName = itr.next();
            String fieldValue = vnp_Params.get(fieldName);
            if (fieldValue != null && fieldValue.length() > 0) {
                // Build hash data
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(fieldValue);
                // Build query
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }
        String queryUrl = query.toString();
        String vnp_SecureHash = Config.Sha256(Config.vnp_HashSecret + hashData.toString());
        queryUrl += "&vnp_SecureHashType=SHA256&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;
        response.sendRedirect(paymentUrl); // Ensure no further action after redirect
    }

    private void processNonVnpayment(HttpServletRequest request, HttpServletResponse response, int orderID)
            throws ServletException, IOException {
        OrderDAO orderDAO = new OrderDAO();
        List<Product> listProduct = orderDAO.getProductByOrderID(orderID);
        Order orderInfo = orderDAO.getInfoByOrderID(orderID);
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("orderInfo", orderInfo);
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
