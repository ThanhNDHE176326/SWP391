package Controller.FeedbackPublic;

import DAO.FeedbackPublicDAO;
import Models.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author dat ngo huy
 */
@WebServlet(name = "AddFeedbackController", urlPatterns = {"/addfeedbackpublic"})
public class AddFeedbackController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddFeedbackController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddFeedbackController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("productId");
        FeedbackPublicDAO da = new FeedbackPublicDAO();
        Product product = da.getProductById(id); // Chỉ trả về một đối tượng Product

        if (product != null) {
            request.setAttribute("product", product);
        } else {
            request.setAttribute("error", "Sản phẩm không tồn tại.");
        }
        request.getRequestDispatcher("/view/customer/FeedbackPublic.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String ratedStar = request.getParameter("ratedStar");
        String comment = request.getParameter("comment");
        String product = request.getParameter("productId");

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("usernamecustomer");

        FeedbackPublicDAO da = new FeedbackPublicDAO();
        boolean isSuccess = da.add(ratedStar, comment, username, product);

        if (isSuccess) {
            request.setAttribute("message", "Đánh giá thành công.");
        } else {
            request.setAttribute("message", "Đánh giá không thành công. Vui lòng thử lại sau.");
        }

        // Điều hướng về trang feedback với thông điệp
        request.getRequestDispatcher("/view/customer/FeedbackPublic.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
