/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.DAO;
import Models.Slider;
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
import java.util.ArrayList;

/**
 *
 * @author admin
 */
@WebServlet(name = "CreateNewSliderController", urlPatterns = {"/createNewSlider"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 50 // 50 MB
)
public class CreateNewSliderController extends HttpServlet {

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
            out.println("<title>Servlet CreateNewSliderController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateNewSliderController at " + request.getContextPath() + "</h1>");
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
        DAO sliderDAO = new DAO();
        
        String title = request.getParameter("title");
        String note = request.getParameter("note");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        
        Part part = request.getPart("imageFile");
        String realPath = "C:\\Users\\84987\\Documents\\SU24\\SWP391\\SWP391\\web\\images";
        Files.createDirectories(Paths.get(realPath)); // Tạo thư mục nếu chưa tồn tại
        String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
        part.write(Paths.get(realPath, fileName).toString());
        System.out.println("File uploaded new slider to: " + Paths.get(realPath, fileName).toString());
        
        Slider slider = new Slider("", title, fileName, note, "4", startDate, endDate, "1", "1");
        sliderDAO.insertNewSlider(slider);
        DAO da = new DAO();                       
        ArrayList<Slider> listslider = da.getSlider();
        request.setAttribute("listslider", listslider);
        request.getRequestDispatcher("view/marketing/listslider.jsp").forward(request, response); // tu dien link response vao day
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
