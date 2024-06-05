/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.mkt;

import ControllerValidation.Validation;
import DAO.CustomerByMaketingDAO;
import Models.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet("/AddCustomer")
public class AddCustomerByMarketingController extends HttpServlet {

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
            out.println("<title>Servlet addCustomer</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addCustomer at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");

        // Lấy thông tin từ request
        String name = request.getParameter("Name");
        String username = request.getParameter("Username");
        String email = request.getParameter("Email");
        String password = request.getParameter("Password");
        String phone = request.getParameter("Phone");
        String address = request.getParameter("Address");
        String gender = request.getParameter("Gender");
        String status = request.getParameter("isDelete");

        // Chuyển đổi giá trị gender từ chuỗi thành bit
        int genderBit = "male".equals(gender) ? 1 : 0;

        // Chuyển đổi giá trị status từ chuỗi thành bit
        int statusBit = "1".equals(status) ? 1 : 0;
        Validation validation = new Validation();
        // Kiểm tra tính hợp lệ của dữ liệu
        List<String> errorMessages = new ArrayList<>();
        CustomerByMaketingDAO dao = new CustomerByMaketingDAO();
        if (dao.checkIfUsernameExists(username)) {
            errorMessages.add("Username already exists. Please choose another username.");
        }
        // Kiểm tra mật khẩu
        errorMessages.addAll(validation.validatePassword(password));

        // Kiểm tra số điện thoại
        errorMessages.addAll(validation.validatePhoneNumber(phone));

        // Nếu có lỗi, hiển thị thông báo lỗi và không thêm khách hàng vào cơ sở dữ liệu
        if (!errorMessages.isEmpty()) {
            request.setAttribute("errorMessages", errorMessages);
            // Thiết lập các thuộc tính để giữ lại dữ liệu người dùng đã nhập
            request.setAttribute("name", name);
            request.setAttribute("username", username);
            request.setAttribute("email", email);
            request.setAttribute("password", password);
            request.setAttribute("phone", phone);
            request.setAttribute("address", address);
            request.setAttribute("gender", gender);
            request.setAttribute("status", status);

            // Forward hoặc redirect đến trang JSP để hiển thị thông báo lỗi
            request.getRequestDispatcher("AddCustomer.jsp").forward(request, response);
            return;
        }

        // Thêm khách hàng vào cơ sở dữ liệu
        boolean addSuccess = dao.addCustomer(name, username, email, password, phone, address, genderBit, statusBit);

        // Hiển thị thông báo kết quả
        if (addSuccess) {
            request.setAttribute("message", "Customer added successfully!");
        } else {
            request.setAttribute("message", "Failed to add customer. Please try again.");
        }
        request.getRequestDispatcher("AddCustomer.jsp").forward(request, response);
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
