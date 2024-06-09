/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package PostController;

import DAO.BlogDAO;
import DAO.CategoryBlogDAO;
import Models.Blog;
import DAO.postDAO;
import Models.CategoryBlog;
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
 * @author Acer
 */
@WebServlet(name = "PostListController", urlPatterns = {"/postlist"})
public class PostListController extends HttpServlet {

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

        BlogDAO blogDAO = new BlogDAO();
        postDAO postDAO = new postDAO();
        CategoryBlogDAO categoryBlogDAO = new CategoryBlogDAO();

        // Fetch query parameters
        String searchTitle = request.getParameter("searchTitle");
        String filterCategory = request.getParameter("filterCategory");
        String filterStatus = request.getParameter("filterStatus");
        String sortField = request.getParameter("sortField");

        // Pagination
        int page = 1;
        int recordsPerPage = 10;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }


        List<Blog> posts;
        int totalPosts;

        // Apply filters and sorting
        if ((searchTitle == null || searchTitle.isEmpty()) &&
                (filterCategory == null || filterCategory.isEmpty()) &&
                (filterStatus == null || filterStatus.isEmpty())) {
            posts = postDAO.getAllPosts(page, recordsPerPage);
            totalPosts = postDAO.getTotalPosts();
        } else {
            posts = postDAO.getFilteredAndSortedPosts(searchTitle, filterCategory, filterStatus, sortField, page, recordsPerPage);
            totalPosts = postDAO.getNoOfRecords();
        }

        int noOfPages = (int) Math.ceil(totalPosts * 1.0 / recordsPerPage);

        List<CategoryBlog> categories = categoryBlogDAO.getAllCategories();
        List<Blog> recentPosts = blogDAO.getRecentBlogs();

        request.setAttribute("posts", posts);
        request.setAttribute("categories", categories);
        request.setAttribute("recentPosts", recentPosts);
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);

        request.getRequestDispatcher("view/marketing/postlist.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
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
