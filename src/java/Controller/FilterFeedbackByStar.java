/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAO.FeedbackDAO;
import Models.Feedback;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author dat ngo huy
 */
@WebServlet(name="FilterFeedbackByStar", urlPatterns={"/FilterFeedbackByStar"})
public class FilterFeedbackByStar extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet FilterFeedbackByStar</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FilterFeedbackByStar at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        FeedbackDAO da = new FeedbackDAO();
        String starSearch = request.getParameter("starSearch");
        ArrayList<Feedback> listFeedbackByStar = new ArrayList<>();

        if (starSearch != null) {
            switch (starSearch) {
                case "1":
                    listFeedbackByStar = da.getFeedBackBy1Star();
                    break;
                case "2":
                    listFeedbackByStar = da.getFeedBackBy2Star();
                    break;
                case "3":
                    listFeedbackByStar = da.getFeedBackBy3Star();
                    break;
                case "4":
                    listFeedbackByStar = da.getFeedBackBy4Star();
                    break;
                case "5":
                    listFeedbackByStar = da.getFeedBackBy5Star();
                    break;
                default:
                    // Xử lý các giá trị không mong muốn nếu cần
                    break;
            }
        }

        request.setAttribute("allfeedback", listFeedbackByStar);
        request.setAttribute("starSearch", starSearch);
        request.getRequestDispatcher("view/marketing/listfeedback.jsp").forward(request, response);
    }


    

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
