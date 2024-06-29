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
import java.util.List;

/**
 *
 * @author dat ngo huy
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 50 // 50 MB
)
public class EditController extends HttpServlet {

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
            out.println("<title>Servlet editSlider</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet editSlider at " + request.getContextPath() + "</h1>");
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
        String id = request.getParameter("id");
        DAO sliderDAO = new DAO();

        if (request.getParameter("mode") != null && request.getParameter("mode").equals("1")) {
            Slider slider = sliderDAO.getSliderByID(id);
//            List<Integer> listStatus = new ArrayList<>();
//            listStatus.add(0);
//            listStatus.add(1);
            request.setAttribute("slider", slider);
//            request.setAttribute("listStatus", listStatus);
            request.getRequestDispatcher("view/marketing/editslider.jsp").forward(request, response);
        }
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
        
        String id = request.getParameter("id");
        String title = request.getParameter("title");
        String note = request.getParameter("note");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String status = request.getParameter("status");
        
        if(!title.isBlank()) sliderDAO.updateTitleOfSlider(id, title);
        if(!note.isBlank()) sliderDAO.updateNoteOfSlider(id, note);
        if(!startDate.isBlank()) sliderDAO.updateStartDateOfSlider(id, startDate);
        if(!endDate.isBlank()) sliderDAO.updateEndDateOfSlider(id, endDate);
        if(!status.isBlank()) sliderDAO.updateStatusOfSlider(id, status);
                
        Part part = request.getPart("imageUpload");
        if (part != null && part.getSize() > 0) {
            String realPath = "D:\\Web_Project_Java\\SWP391\\web\\images";
            Files.createDirectories(Paths.get(realPath)); // Tạo thư mục nếu chưa tồn tại
            String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            part.write(Paths.get(realPath, fileName).toString());
            System.out.println("File Slider uploaded to: " + Paths.get(realPath, fileName).toString());
            sliderDAO.updateImageSlider(id, fileName);
        }

        ArrayList<Slider> listslider = sliderDAO.getSlider();
        request.setAttribute("listslider", listslider);
        request.getRequestDispatcher("view/marketing/listslider.jsp").forward(request, response);
    
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
