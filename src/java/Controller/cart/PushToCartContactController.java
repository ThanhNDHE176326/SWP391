/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.cart;

import DAO.CartDAO;
import DAO.CartProductDAO;
import DAO.CustomerDAO;
import DAO.ProductDAO;
import DAO.ProductDAOByPublic;
import Models.Category;
import Models.Customer;
import Models.DeliveryAddresses;
import Models.Product;
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
 * @author Admin
 */
@WebServlet(name = "PushToCartContactController", urlPatterns = {"/pushToCartContact"})
public class PushToCartContactController extends HttpServlet {

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
            out.println("<title>Servlet PushToCartContactController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PushToCartContactController at " + request.getContextPath() + "</h1>");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Redirecting...</title>");
            out.println("<script type='text/javascript'>");
            out.println("function redirectPost() {");
            out.println("var form = document.createElement('form');");
            out.println("form.method = 'POST';");
            out.println("form.action = '" + request.getContextPath() + "/pushToCartContact';");
            out.println("document.body.appendChild(form);");
            out.println("form.submit();");
            out.println("}");
            out.println("</script>");
            out.println("</head>");
            out.println("<body onload='redirectPost()'>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
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
        String customerName = (String) session.getAttribute("username");
        CustomerDAO customerDAO = new CustomerDAO();
        Customer userCreateOrder = customerDAO.getInformationCustomer(customerName);
        session.setAttribute("userCreateOrder", userCreateOrder);
        List<DeliveryAddresses> shippingaddress = customerDAO.getAllAddress(userCreateOrder.getId());
        session.setAttribute("shippingaddress", shippingaddress);
        CartProductDAO cartProductDAO = new CartProductDAO();
        ProductDAO productDAO = new ProductDAO();
        CartDAO cartDAO = new CartDAO();
        ProductDAOByPublic productDAOByPublic = new ProductDAOByPublic();
        if (customerName == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "User not logged in.");
            return;
        }

        int customerID = Integer.parseInt(customerDAO.getInformationCustomer(customerName).getId());
        int cartID = cartDAO.getCartIdByCustomerID(customerID);

        String[] selectedProductIds = request.getParameterValues("selectedProducts");

        List<Category> categories = productDAOByPublic.getCategory();

        if (selectedProductIds != null && selectedProductIds.length > 0) {
            List<Product> selectedProducts = new ArrayList<>();

            for (String productId : selectedProductIds) {
                try {
                    int id = Integer.parseInt(productId);
                    Product product = cartProductDAO.getProductInCartIDPush(cartID, id);

                    if (product != null) {
                        selectedProducts.add(product);
                    } else {
                        System.out.println("Product not found with ID: " + id);
                    }
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                }
            }
            session.setAttribute("categories", categories);
            session.setAttribute("selectedProducts", selectedProducts);

            response.sendRedirect(request.getContextPath() + "/view/customer/cartcontact.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/view/customer/cartcontact.jsp");
        }

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
