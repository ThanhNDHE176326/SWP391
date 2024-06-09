/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.mkt;

import DAO.CustomerByMaketingDAO;
import Models.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Admin
 */
public class FifterStatusCustomerByMarketingController extends HttpServlet {

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
        CustomerByMaketingDAO dao = new CustomerByMaketingDAO();
        String statusFilter = request.getParameter("statusFilter");
        List<Customer> customer;
        String sort = request.getParameter("sort");
        String order = request.getParameter("order");

        String indexPage = request.getParameter("index");
        if (indexPage == null) {
            indexPage = "1";
        }
        int pageIndex = Integer.parseInt(indexPage);
        int pageSize = 7; // Số lượng khách hàng mỗi trang

        int count;
        int endPage;

// Kiểm tra và tính toán số lượng khách hàng và số trang dựa trên statusFilter
        if (statusFilter == null || statusFilter.isEmpty()) {
            count = dao.getTotalCustomer();
            endPage = count / pageSize;
            if (count % pageSize != 0) {
                endPage++;
            }
        } else {
            count = dao.countCustomerByStatus(statusFilter);
            endPage = count / pageSize;
            if (count % pageSize != 0) {
                endPage++;
            }
        }

        if (statusFilter == null || statusFilter.isEmpty()) {
            // Nếu statusFilter là null hoặc rỗng, lấy dữ liệu phân trang cho tất cả khách hàng
            if (sort != null && order != null) {
                customer = dao.getSortedAllCustomers(pageIndex, sort, order);
            } else {
                customer = dao.pagingCustomer(pageIndex);
            }
        } else{
            // Nếu statusFilter là "Đang sử dụng", lấy dữ liệu khách hàng đang sử dụng theo trạng thái và phân trang
            if (sort != null && order != null) {
                customer = dao.getSortedStatusCustomers(statusFilter, pageIndex, sort, order);
            } else {
                customer = dao.getSortedStatusCustomers(statusFilter, pageIndex, sort, order);
            }
        } 

        request.setAttribute("customer", customer);
        request.setAttribute("endP", endPage);
        request.setAttribute("tag", pageIndex);
        request.setAttribute("statusFilter", statusFilter);
        request.getRequestDispatcher("view/marketing/customerlist.jsp").forward(request, response);

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
