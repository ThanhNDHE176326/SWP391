/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAO.CategoryDAO;
import DAO.ProductDAO;
import Models.Category;
import Models.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class SortListProductMarketingController extends HttpServlet {

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
            out.println("<title>Servlet SortListProductMarketingController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SortListProductMarketingController at " + request.getContextPath() + "</h1>");
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
        ProductDAO productDAO = new ProductDAO();
        CategoryDAO categoryDAO = new CategoryDAO();

        //list category in select
        List<Category> listCategory = categoryDAO.getCategorys();
        request.setAttribute("listCategory", listCategory);
        
        
        // listType - type of list product
        String listType = request.getParameter("listType");
        //field - order by field
        String field = request.getParameter("field");
        //mode - asc/desc - ascending/descending
        String mode = request.getParameter("mode");
        //statusMode - all/in/out - allStock/inStock/outStock
        String statusMode =request.getParameter("statusMode");
        int categoryID = Integer.parseInt(request.getParameter("categoryID"));
        List<Product> listProduct = new ArrayList<>();
//        sortByFieldAndMode(listProduct, listType, field, mode, productDAO, categoryID, statusMode);
        
        request.setAttribute("listProduct", listProduct);
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

//    private void sortByFieldAndMode(List<Product> listProduct, String listType, String field, String mode, ProductDAO productDAO, int categoryID, String statusMode) {
//        if (listType.equalsIgnoreCase("listProduct")) {
//            if (mode.equalsIgnoreCase("asc")) {
//                listProduct = productDAO.getProductOrderByFieldAsc(field);
//                mode = "desc";
//            }
//            if (mode.equalsIgnoreCase("desc")) {
//                listProduct = productDAO.getProductOrderByFieldDesc(field);
//                mode = "asc";
//            }
//        }
//        if (listType.equalsIgnoreCase("productByCategory")) {
//            if (mode.equalsIgnoreCase("asc")) {
//                listProduct = productDAO.getProductByCategoryOrderByFieldAsc(field, categoryID);
//                mode = "desc";
//            }
//            if (mode.equalsIgnoreCase("desc")) {
//                listProduct = productDAO.getProductByCategoryOrderByFieldDesc(field, categoryID);
//                mode = "asc";
//            }
//        }
//        if (listType.equalsIgnoreCase("productByStatus")) {
//            
//            if (mode.equalsIgnoreCase("asc")) {
//                listProduct = productDAO.getProductByStatusOrderByFieldAsc(field);
//                mode = "desc";
//            }
//            if (mode.equalsIgnoreCase("desc")) {
//                listProduct = productDAO.getProductByStatusOrderByFieldDesc(field);
//                mode = "asc";
//            }
//        }
//        if (listType.equalsIgnoreCase("productByBriefInfo")) {
//            if (mode.equalsIgnoreCase("asc")) {
//                listProduct = productDAO.getProductByBriefInfoOrderByFieldAsc(field);
//                mode = "desc";
//            }
//            if (mode.equalsIgnoreCase("desc")) {
//                listProduct = productDAO.getProductByBriefInfoOrderByFieldDesc(field);
//                mode = "asc";
//            }
//        }
//        if (listType.equalsIgnoreCase("productByTitle")) {
//            if (mode.equalsIgnoreCase("asc")) {
//                listProduct = productDAO.getProductByTitleOrderByFieldAsc(field);
//                mode = "desc";
//            }
//            if (mode.equalsIgnoreCase("desc")) {
//                listProduct = productDAO.getProductByTitleOrderByFieldDesc(field);
//                mode = "asc";
//            }
//        }
//    }
}
