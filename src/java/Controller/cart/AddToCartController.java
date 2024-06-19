/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.cart;

import DAO.CartDAO;
import DAO.CartProductDAO;
import DAO.CustomerDAO;
import Models.Cart;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author admin
 */
@WebServlet(name = "AddToCartController", urlPatterns = {"/addToCart"})
public class AddToCartController extends HttpServlet {

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
            out.println("<title>Servlet AddToCartController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddToCartController at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        CustomerDAO customerDAO = new CustomerDAO();
        CartDAO cartDAO = new CartDAO();
        CartProductDAO cartProductDAO = new CartProductDAO();

        int productID = Integer.parseInt(request.getParameter("productID"));
        String customerName = (String) session.getAttribute("username");
        String customerID_STR = customerDAO.getInformationCustomer(customerName).getId();
        int customerID = Integer.parseInt(customerID_STR);
        Cart cartCustomer = cartDAO.getCartByCustomerID(customerID);

        //check cart cua customer ton tai chua?
        if (cartCustomer == null) {
//            int cartID = Integer.parseInt(cartCustomer.getId());
            cartDAO.addNewCartByCustomerID(customerID);
            int cartID = cartDAO.getCartIdByCustomerID(customerID);
            cartProductDAO.addToCart(cartID, productID);
//            response.sendRedirect("ProductListPublic");
        } else {
            int cartID = Integer.parseInt(cartCustomer.getId());
            //check product xem ton tai trong Cart Product chua?
            int productIDFromCart = cartProductDAO.getProductIDFromByCartID(cartID, productID);
            if (productIDFromCart == 0) {
                //neu chua thi add cart voi quantity = 1
                cartProductDAO.addToCart(cartID, productID);
//                response.sendRedirect("ProductListPublic");
            } else {
                //neu roi thi upade cart voi quantity + 1
                int quantityFromCart = cartProductDAO.getQuantityByCartIdAndProductID(cartID, productID);
                quantityFromCart += 1;
                cartProductDAO.updateQuantityByCartID(cartID, productIDFromCart, quantityFromCart);
//                response.sendRedirect("ProductListPublic");
            }
            //neu chua thi add cart voi quantity = 1
            //neu roi thi upade cart voi quantity + 1
        }
        String location = request.getParameter("location");
        if (location.equals("list")) {
            response.sendRedirect("ProductListPublic");
        }
        if (location.equals("detail")) {
//            request.setAttribute("productId", productID);
            System.out.println("ID gui di tu add: " + productID); // Debug print
//            request.getRequestDispatcher("ProductDetailPublic").forward(request, response);
            response.sendRedirect("ProductDetailPublic?productId=" + productID);
        }
        if (location.equals("cart")) {
            response.sendRedirect("viewCartDetail");

        }
        if (location.equals("myorders")) {
            response.sendRedirect("listOrderCustomer");

        }
        if (location.equals("orderinfo")) {
            response.sendRedirect("orderInformationCustomer");

        }
        if (location.equals("home")) {
            response.sendRedirect("view/customer/homepage.jsp");

        }
        session.setAttribute("customerID", customerID_STR);

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
