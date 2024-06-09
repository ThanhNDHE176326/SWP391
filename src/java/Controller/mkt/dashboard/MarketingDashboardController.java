/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.mkt.dashboard;

import DAO.BlogDAO;
import DAO.CategoryBlogDAO;
import DAO.CategoryDAO;
import DAO.CustomerDAO;
import DAO.FeedbackMKTDAO;
import DAO.OrderDAO;
import DAO.ProductDAO;
import Models.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.Instant;
import java.time.LocalDate;
import java.util.Date;

/**
 *
 * @author admin
 */
@WebServlet(name = "MarketingDashboardController", urlPatterns = {"/marketingDashboard"})
public class MarketingDashboardController extends HttpServlet {

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
            out.println("<title>Servlet MarketingDashboardController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MarketingDashboardController at " + request.getContextPath() + "</h1>");
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
        BlogDAO blogDAO = new BlogDAO();
        CategoryBlogDAO categoryBlogDAO = new CategoryBlogDAO();
        ProductDAO productDAO = new ProductDAO();
        CategoryDAO categoryDAO = new CategoryDAO();
        CustomerDAO customerDAO = new CustomerDAO();
        FeedbackMKTDAO feedbackDAO = new FeedbackMKTDAO();
        OrderDAO orderDAO = new OrderDAO();

        //Post
        int totalPost = blogDAO.getTotalNumberOfBlogs();
        int totalCategoryPost = categoryBlogDAO.getTotalCategoryPost();

        //Product
        int totalProduct = productDAO.getTotalProduct();
        int totalCategory = categoryDAO.getTotalCategory();
        int totalQuantityOfProduct = productDAO.getTotalQuantity();

        //Customer
        int totalCustomer = customerDAO.getTotalCustomer();

        //Feedback
        int totalFeedback = feedbackDAO.getTotalFeedback();

        //trend of Customer
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        if (startDate == null && endDate == null) {
            startDate = orderDAO.getDateMinInOrder();
            endDate = orderDAO.getDateMaxInOrder();
        }
        Product trendProduct = productDAO.getMostOrderedProductBetweenDates(startDate, endDate);
        //set Attribute Post
        request.setAttribute("totalPost", totalPost);
        request.setAttribute("totalCategoryPost", totalCategoryPost);

        //set Attribute Product
        request.setAttribute("totalProduct", totalProduct);
        request.setAttribute("totalCategory", totalCategory);
        request.setAttribute("totalQuantityOfProduct", totalQuantityOfProduct);
        //set Attribute Customer
        request.setAttribute("totalCustomer", totalCustomer);
        //set Attribute Feedback
        request.setAttribute("totalFeedback", totalFeedback);
        //set Attribute trend
        request.setAttribute("trendProduct", trendProduct);
        request.setAttribute("startDate", startDate);
        request.setAttribute("endDate", endDate);
        
        request.getRequestDispatcher("view/marketing/dashboard.jsp").forward(request, response);
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
