/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.cart;

import DAO.CartProductDAO;
import DAO.ProductDAO;
import Models.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name = "PushToCartContactController", urlPatterns = {"/pushToCartContact"})
public class PushToCartContactController extends HttpServlet {

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
            out.println("<title>Servlet PushToCartContactController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PushToCartContactController at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        int cartID = Integer.parseInt(session.getAttribute("cartID"));
        String[] selectedProductIds = request.getParameterValues("selectedProducts");

        if (selectedProductIds != null && selectedProductIds.length > 0) {
            List<Product> selectedProducts = new ArrayList<>();

            // Vòng lặp để lấy thông tin chi tiết của từng sản phẩm từ CSDL hoặc từ dữ liệu có sẵn
            CartProductDAO dao = new CartProductDAO();// Thay thế bằng DAO tương ứng của bạn
            for (String productId : selectedProductIds) {
                try {
                    int id = Integer.parseInt(productId);
                    // Lấy thông tin chi tiết của sản phẩm từ CSDL hoặc dữ liệu có sẵn
                    Product product = dao.getProductInCartIDPush(cartID, cartID);
                    if (product != null) {
                        selectedProducts.add(product);
                    } else {
                        // Xử lý trường hợp không tìm thấy sản phẩm với id tương ứng
                        // Có thể bỏ qua hoặc xử lý lỗi tùy theo logic của bạn
                    }
                } catch (NumberFormatException e) {
                    // Xử lý nếu không thể chuyển đổi thành số nguyên
                    e.printStackTrace();
                    // Có thể bỏ qua hoặc xử lý lỗi tùy theo logic của bạn
                }
            }

            // Thực hiện các xử lý với danh sách sản phẩm được chọn ở đây (ví dụ: lưu vào session, đẩy sang trang khác, ...)
            // Ví dụ: Lưu danh sách sản phẩm vào session để sử dụng ở trang khác
            request.getSession().setAttribute("selectedProducts", selectedProducts);

            // Chuyển hướng đến trang khác sau khi xử lý
            response.sendRedirect(request.getContextPath() + "/view/customer/cartcontact.jsp");
        } else {
            // Xử lý nếu không có sản phẩm nào được chọn
            response.sendRedirect(request.getContextPath() + "/view/customer/cartcontact.jsp");
        }
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
