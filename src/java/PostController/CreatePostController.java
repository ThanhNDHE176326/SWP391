/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package PostController;

import DAO.CategoryBlogDAO;
import DAO.postDAO;
import Models.Blog;
import Models.CategoryBlog;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.util.List;

/**
 *
 * @author Acer
 */
@WebServlet(name = "CreatePostController", urlPatterns = {"/CreatePost"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 50 // 50 MB
)
public class CreatePostController extends HttpServlet {

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
            out.println("<title>Servlet CreatePostController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreatePostController at " + request.getContextPath() + "</h1>");
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
        CategoryBlogDAO categoryBlogDAO = new CategoryBlogDAO();
        List<CategoryBlog> listCategoryBlog = categoryBlogDAO.getAllCategories();
        request.setAttribute("listCategoryBlog", listCategoryBlog);
        request.getRequestDispatcher("view/marketing/createpost.jsp").forward(request, response);
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
        postDAO postDAO = new postDAO();
        
//        String staffId = request.getParameter("staff");
        String title = request.getParameter("title");
        String categoryBlogId = request.getParameter("category"); // Fix parameter name
//        String image = request.getParameter("image");
        String updatedate = String.valueOf(LocalDate.now());
        String description = request.getParameter("description");
        String content = request.getParameter("content");
//        String status = request.getParameter("status");
//        String isDelete = request.getParameter("isDelete"); // Get isDelete parameter
        Part part = request.getPart("imageFile");
        String fileName ="";
         if (part != null && part.getSize() > 0) {
            String realPath = "D:\\Web_Project_Java\\SWP391\\web\\images";
            Files.createDirectories(Paths.get(realPath)); // Tạo thư mục nếu chưa tồn tại
            fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            part.write(Paths.get(realPath, fileName).toString());
            System.out.println("File uploaded to: " + Paths.get(realPath, fileName).toString());
        }
        Blog newPost = new Blog("", "4", title, categoryBlogId, fileName, updatedate, description, content, "1", "1"); // Pass isDelete to Blog constructor
        postDAO.addPost(newPost);

        response.sendRedirect("postlist");

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
