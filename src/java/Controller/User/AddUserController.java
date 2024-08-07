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
@WebServlet(name="AddUserController", urlPatterns={"/adduser"})
public class AddUserController extends HttpServlet {
   
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
            out.println("<title>Servlet AddUserController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddUserController at " + request.getContextPath () + "</h1>");
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
       ArrayList<Role> listrole = da.getRole();
       request.setAttribute("listrole", listrole);
       request.getRequestDispatcher("view/admin/addnewuser.jsp").forward(request, response);
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
          
    String email = request.getParameter("email");
    String fullname = request.getParameter("fullname");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String gender = request.getParameter("gender");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    String role = request.getParameter("role");
    String status = request.getParameter("status");
    
    UserDAO da = new UserDAO();
    
    // Check if the email, phone, or username already exists
    if (da.isEmailExists(email)) {
        request.setAttribute("error", "Email already exists.");
        request.getRequestDispatcher("view/admin/addnewuser.jsp").forward(request, response);
        return;
    }
    
    if (da.isPhoneExists(phone)) {
        request.setAttribute("error", "Phone number already exists.");
        request.getRequestDispatcher("view/admin/addnewuser.jsp").forward(request, response);
        return;
    }
    
    if (da.isUsernameExists(username)) {
        request.setAttribute("error", "Username already exists.");
        request.getRequestDispatcher("view/admin/addnewuser.jsp").forward(request, response);
        return;
    }
    
    // Add the new user if no conflicts are found
    da.add(email, fullname, username, password, gender, phone, address, role, status);
    
    // Set success message
    request.setAttribute("success", "User added successfully.");
    
    // Optionally, retrieve updated list of users and forward to list view
    ArrayList<Staff> listuser = da.getAllStaff();
    request.setAttribute("userList", listuser);
    request.getRequestDispatcher("view/admin/listuser.jsp").forward(request, response);
}



// Add the following methods to UserDAO


    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
