/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.ProductPublic;

import DAO.ProductDAOByPublic;
import Models.Category;
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
@WebServlet(name="FilterProductPublicByCategoryController", urlPatterns={"/ProductPublicByCategory"})
public class FilterProductPublicByCategoryController extends HttpServlet {
   
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
        String category = request.getParameter("category");
                String indexString = request.getParameter("index");

        if (category == null) {
           indexString = "1" ; // Handle the case when no category is selected
        }

        ProductDAOByPublic dao = new ProductDAOByPublic();

        int index = Integer.parseInt(indexString);

        int count = dao.countProductPublicByCategory(category);
        int pageSize = 6;
        int endPage = count / pageSize;
        if (count % pageSize != 0) {
            endPage++;
        }

        List<Product> product = dao.filterProductPublicByCatgory(category, index);
        List<Category> categories = dao.getCategory(); // Make sure you have a method to get all categories

        request.setAttribute("endP", endPage);
        request.setAttribute("product", product);
        request.setAttribute("tag", index);
        request.setAttribute("category", category);
        request.setAttribute("categories", categories); // Set categories attribute

        request.getRequestDispatcher("view/customer/shop.jsp").forward(request, response);
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
        processRequest(request, response);
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
