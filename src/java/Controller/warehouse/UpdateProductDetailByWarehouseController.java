/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.warehouse;

import DAO.CategoryDAO;
import DAO.ProductDAO;
import Models.Category;
import Models.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name="UpdateProductDetailByWarehouseController", urlPatterns={"/updateProductDetailByWarehouse"})
public class UpdateProductDetailByWarehouseController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet UpdateProductDetailByWarehouseController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProductDetailByWarehouseController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();
        CategoryDAO categoryDAO = new CategoryDAO();
        
        String message = request.getParameter("message"); // Lấy thông điệp từ tham số URL
        if (message != null) {
            request.setAttribute("message", URLDecoder.decode(message, "UTF-8")); // Giải mã thông điệp
        }

        String idString = request.getParameter("productID");
        int productID = Integer.parseInt(idString);
        Product productDetail = productDAO.getProductDetailByID(productID);
        request.setAttribute("product", productDetail);
        request.getRequestDispatcher("view/warehouse/updateproductdetailwarehouse.jsp").forward(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();

        String idString = request.getParameter("id");
        int idInt = Integer.parseInt(idString);
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String quantityStr = request.getParameter("quantity");
        int quantityInt = Integer.parseInt(quantityStr);
        String description = request.getParameter("description");
        String originalPriceStr = request.getParameter("originalPrice");
        double originalPriceDou = Double.parseDouble(originalPriceStr);
        String salePriceStr = request.getParameter("salePrice");
        double salePriceDou = Double.parseDouble(salePriceStr);
        
        if (quantityStr != null) {
            productDAO.updateQuantityOfProductById(idInt, quantityInt);
        }
        
        if (originalPriceStr != null) {
            productDAO.updateOriginalPriceOfProductById(idInt, originalPriceDou);
        }
        
        String message = "Update successfully";
        String encodedMessage = URLEncoder.encode(message, "UTF-8"); // Mã hóa thông điệp
        response.sendRedirect(request.getContextPath() + "/updateProductDetailByWarehouse?productID=" + idInt + "&message=" + encodedMessage);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
