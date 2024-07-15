/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.warehouse;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import Models.Category;
import DAO.CategoryDAO;
import DAO.ProductDAO;
import Models.Product;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
@WebServlet(name="WarehouseProductListController", urlPatterns={"/warehouseProductList"})
public class WarehouseProductListController extends HttpServlet {
   
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
            out.println("<title>Servlet WarehouseProductListController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet WarehouseProductListController at " + request.getContextPath () + "</h1>");
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
        List<Category> listCategory = categoryDAO.getCategorys();
        request.setAttribute("listCategory", listCategory);

        String indexString = request.getParameter("index");
        if(indexString == null) indexString = "1";
        int index = Integer.parseInt(indexString);
        
        int totalRecordProduct = productDAO.getTotalProduct();
        int recordPerPage = 10;
        int endPage = totalRecordProduct / recordPerPage;
        if (totalRecordProduct % recordPerPage != 0) {
            endPage++;
        }

        List<Product> listProduct = productDAO.getProductsByPaging(index);
        
        request.setAttribute("urlServlet", "productListMarketing");
        request.setAttribute("endPage", endPage);
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("listTypeFromServlet", "listProduct");
        request.setAttribute("mode", "asc");
        request.getRequestDispatcher("view/warehouse/productlistwarehouse.jsp").forward(request, response);
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
        processRequest(request, response);
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
