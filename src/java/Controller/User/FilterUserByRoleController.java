/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.User;

import DAO.UserDAO;
import Models.Role;
import Models.Staff;
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
@WebServlet(name="FilterUserByRoleController", urlPatterns={"/FilterUserByRole"})
public class FilterUserByRoleController extends HttpServlet {
   
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
            out.println("<title>Servlet FilterUserByRoleController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FilterUserByRoleController at " + request.getContextPath () + "</h1>");
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
        
        UserDAO da = new UserDAO();
        String roleSearch = request.getParameter("roleSearch");
        ArrayList<Staff> listUserByRole = new ArrayList<>();
        ArrayList<Role> listrole = da.getRole();

        if (roleSearch != null) {
            switch (roleSearch) {
                case "1":
                    listUserByRole = da.getAdminUser();
                    break;
                case "2":
                    listUserByRole = da.getSaleUser();
                    break;
                case "3":
                    listUserByRole = da.getSaleManagerUser();
                    break;
                case "4":
                    listUserByRole = da.getMarketerUser();
                    break;                
                default:
                    // Xử lý các giá trị không mong muốn nếu cần
                    break;
            }
        }
        request.setAttribute("listrole", listrole);
        request.setAttribute("listuser", listUserByRole);
        request.setAttribute("roleSearch", roleSearch);
        request.getRequestDispatcher("view/admin/listuser.jsp").forward(request, response);
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
