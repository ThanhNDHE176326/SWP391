/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.ProductPublic;

import DAO.ProductDAOByPublic;
import Models.Category;
import Models.Feedback;
import Models.Product;
import jakarta.servlet.RequestDispatcher;
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
@WebServlet(name = "ProductDetailPublicController", urlPatterns = {"/ProductDetailPublic"})
public class ProductDetailPublicController extends HttpServlet {

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
        String productId = request.getParameter("productId");
        System.out.println("ID nhan duoc ben Detail: " + productId); // Debug print
        String indexPage = request.getParameter("index");

        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);
        int indexId;

        try {
            if (productId != null && !productId.isEmpty()) {
                indexId = Integer.parseInt(productId);
            } else {
                // Xử lý lỗi nếu không có id được gửi từ request
                indexId = 1; // Sử dụng giá trị mặc định
            }
//            indexId = Integer.parseInt(productId);

            ProductDAOByPublic dao = new ProductDAOByPublic();
            int count = dao.countFeedbackOfAProduct(indexId);
            int endPage = count / 5;
            if (count % 5 != 0) {
                endPage++;
            }

            Product product = dao.getProductPublicDetail(indexId);
            List<Category> categories = dao.getCategory();
            List<Feedback> feedback = dao.getFeedbackByIdProduct(indexId, index);
            List<Product> listProduct = dao.getTop6ProductNew();
            request.setAttribute("categories", categories);
            request.setAttribute("product", product);
            request.setAttribute("feedback", feedback);
            request.setAttribute("endP", endPage);
            request.setAttribute("tag", index);
            request.setAttribute("count", count);
            request.setAttribute("listProduct", listProduct);
            RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/product-details.jsp");
            dispatcher.forward(request, response);

        } catch (NumberFormatException e) {
            // Xử lý lỗi nếu id không phải là một số nguyên
            e.printStackTrace();
            response.sendRedirect("404.jsp");
        } catch (Exception e) {
            // Xử lý lỗi chung khác
            e.printStackTrace();
            response.sendRedirect("404.jsp");
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
