package Controller.FeedbackPublic;

import DAO.CustomerDAO;
import DAO.FeedbackPublicDAO;
import Models.Customer;
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

        String ratedStarStr = request.getParameter("ratedStar");
        String comment = request.getParameter("comment");
        String product_idStr = request.getParameter("productId");

        int ratedStar = 0;
        int product_id = 0;

        try {
            ratedStar = Integer.parseInt(ratedStarStr);
            product_id = Integer.parseInt(product_idStr);
        } catch (NumberFormatException e) {          
            e.printStackTrace();
            request.setAttribute("message", "Đánh giá không thành công. Vui lòng thử lại sau.");
            request.getRequestDispatcher("/view/customer/FeedbackPublic.jsp").forward(request, response);
            return;
        }

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("usernamecustomer");

        CustomerDAO dao = new CustomerDAO();

        Customer customer = dao.getInformationCustomer(username);

        String customer_id = customer.getId();

        FeedbackPublicDAO da = new FeedbackPublicDAO();
        boolean isSuccess = da.add(product_id,customer_id,ratedStar,comment);

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
