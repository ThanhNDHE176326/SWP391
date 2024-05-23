/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

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
 * @author admin
 */
@WebServlet(name = "ProductListMarketingController", urlPatterns = {"/productListMarketing"})
public class ProductListMarketingController extends HttpServlet {

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
            out.println("<title>Servlet ProductListMarketingController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductListMarketingController at " + request.getContextPath() + "</h1>");
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

        CategoryDAO categoryDAO = new CategoryDAO();
        List<Category> listCategory = categoryDAO.getCategorys();
        request.setAttribute("listCategory", listCategory);

        ProductDAO productDAO = new ProductDAO();
        List<Product> listProduct = productDAO.getProducts();
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("listTypeFromServlet", "listProduct");
        request.setAttribute("mode", "asc");
        request.getRequestDispatcher("view/ProductListMarketing.jsp").forward(request, response);
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
//        ProductDAO productDAO = new ProductDAO();
//        CategoryDAO categoryDAO = new CategoryDAO();
//
//        //list category in select
//        List<Category> listCategory = categoryDAO.getCategorys();
//        request.setAttribute("listCategory", listCategory);
//
//        //get value from formSearch form
//        String categorySearchID_String = request.getParameter("categorySearch");
//        String statusSearch = request.getParameter("statusSearch");
//        request.setAttribute("categorySearch", categorySearchID_String); // Thêm dòng này
//        request.setAttribute("statusSearch", statusSearch);
//
//        if (!categorySearchID_String.equals("null")) //list product by category
//        {
//            List<Product> listProductByCategoryID = new ArrayList<>();
//            if (categorySearchID_String.equals("0")) {
//                listProductByCategoryID = productDAO.getProducts();
//            } else {
//                int categorySearchID = Integer.parseInt(categorySearchID_String);
//                listProductByCategoryID = productDAO.getProductByCategoryID(categorySearchID);
//            }
//            request.setAttribute("listProduct", listProductByCategoryID);
//        } else if (!statusSearch.equals("null")) {//list product by status
//            List<Product> listProductByStatus = new ArrayList<>();
//            request.setAttribute("statusSearch", statusSearch);
//            if (statusSearch.equals("inStock")) {
//                listProductByStatus = productDAO.getProductByShowStatus();
//            } else if (statusSearch.equals("outStock")) {
//                listProductByStatus = productDAO.getProductByOutStock();
//            } else if (statusSearch.equals("allStock")) {
//                listProductByStatus = productDAO.getProducts();
//            }
//
//            request.setAttribute("listProduct", listProductByStatus);
//        }
//        request.getRequestDispatcher("view/ProductListMarketing.jsp").forward(request, response);
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
