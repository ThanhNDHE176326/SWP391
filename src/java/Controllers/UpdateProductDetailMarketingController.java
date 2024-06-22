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
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

/**
 *
 * @author admin
 */
@WebServlet(name = "UpdateProductDetailMarketingController", urlPatterns = {"/updateProductDetailMarketing"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 50 // 50 MB
)
public class UpdateProductDetailMarketingController extends HttpServlet {

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
            out.println("<title>Servlet UpdateProductDetailMarketingController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProductDetailMarketingController at " + request.getContextPath() + "</h1>");
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
        List<Category> listCategory = categoryDAO.getCategorys();
        request.setAttribute("listCategory", listCategory);

        String idString = request.getParameter("productID");
        int productID = Integer.parseInt(idString);
        Product productDetail = productDAO.getProductDetailByID(productID);
        request.setAttribute("product", productDetail);
        request.getRequestDispatcher("view/marketing/update-product-detail-marketing.jsp").forward(request, response);
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
        ProductDAO productDAO = new ProductDAO();

        String idString = request.getParameter("id");
        int idInt = Integer.parseInt(idString);
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String quantityStr = request.getParameter("quantity");
        int quantityInt = Integer.parseInt(quantityStr);
        String description = request.getParameter("description");
        String categoryIdStr = request.getParameter("category");
        int categoryIdInt = Integer.parseInt(categoryIdStr);
        String originalPriceStr = request.getParameter("originalPrice");
        double originalPriceDou = Double.parseDouble(originalPriceStr);
        String salePriceStr = request.getParameter("salePrice");
        double salePriceDou = Double.parseDouble(salePriceStr);
        //handle File image

        if (title != null) {
            productDAO.updateTitleOfProductById(idInt, title);
        }
        if (author != null) {
            productDAO.updateAuthorOfProductById(idInt, author);
        }
        if (quantityStr != null) {
            productDAO.updateQuantityOfProductById(idInt, quantityInt);
        }
        if (description != null) {
            productDAO.updateDescriptionOfProductById(idInt, description);
        }
        if (categoryIdStr != null) {
            productDAO.updateCategoryOfProductById(idInt, categoryIdInt);
        }
        if (originalPriceStr != null) {
            productDAO.updateOriginalPriceOfProductById(idInt, originalPriceDou);
        }
        if (salePriceStr != null) {
            productDAO.updateSalePriceOfProductById(idInt, salePriceDou);
        }

        if (request.getPart("imageFile") != null) {
            String realPath = "D:\\Web_Project_Java\\SWP391\\web\\images";
            Files.createDirectories(Paths.get(realPath)); // Tạo thư mục nếu chưa tồn tại
            Part part = request.getPart("imageFile");
            String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            part.write(Paths.get(realPath, fileName).toString());
            System.out.println("File uploaded to: " + Paths.get(realPath, fileName).toString());

            productDAO.updateImageOfProductById(idInt, fileName);
        }
//        Product product = new Product();
//        product.setId(id);
//        product.setTitle(title);
//        product.setAuthor(author);
//        product.setQuantity(quantity);
//        product.setDescription(description);
//        product.setCategory(categoryID);
//        product.setOriginalPrice(originalPrice);
//        product.setSalePrice(salePrice);
//        Part imagePart = request.getPart("image");
//
//        // Kiểm tra kích thước file (nếu cần)
//        long fileSize = imagePart.getSize();
//        if (fileSize > 800 * 1024) { // Giới hạn kích thước file 800KB
//            throw new IllegalArgumentException("File size exceeds the limit.");
//        }
//
//        // Đọc hình ảnh từ luồng đầu vào
//        BufferedImage img = ImageIO.read(imagePart.getInputStream());
//
//        // Xác định đường dẫn tuyệt đối và tương đối của thư mục lưu trữ
//        String relativePath = "images";
//        String absolutePath = request.getServletContext().getRealPath(relativePath);
//
//        // Tạo thư mục nếu chưa tồn tại
//        File directory = new File(absolutePath);
//        if (!directory.exists()) {
//            directory.mkdirs(); // Tạo thư mục nếu chưa tồn tại
//        }
        // Tạo tên tệp duy nhất dựa trên thông tin sản phẩm (có thể dùng UUID hoặc timestamp để duy nhất)
//        String fileName = title.replaceAll("\\s+", "_") + "_" + System.currentTimeMillis() + ".jpg";
//
//        // Ghi hình ảnh vào tệp
//        File outputFile = new File(directory, fileName);
//        ImageIO.write(img, "jpg", outputFile);
//
//        // Cập nhật đường dẫn hình ảnh vào cơ sở dữ liệu
//        String imagePath = relativePath + "/" + fileName;
////        product.setImage(imagePath);
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
