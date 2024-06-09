package Controller.cs;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import Models.Staff;
import DAO.StaffDAO;
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
 * @author HP
 */
@WebServlet(urlPatterns = {"/loginstaff"})
public class LoginStaffController extends HttpServlet {

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
            out.println("<title>Servlet LoginStaffController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginStaffController at " + request.getContextPath() + "</h1>");
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
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        StaffDAO dao = new StaffDAO();
        Staff s = dao.loginStaff(username);

        HttpSession session = request.getSession();
        Integer loginAttempts = (Integer) session.getAttribute("loginAttempts");
        if (loginAttempts == null) {
            loginAttempts = 0;
        }

// Check if login attempts exceed 5
        if (loginAttempts >= 5) {
            // Change isDelete to 0 if login attempts exceed 5
            dao.updateIsDeleteStaff(username, 0);// Assuming updateIsDelete method exists
            session.removeAttribute("loginAttempts");
            request.setAttribute("error", "You have exceeded the maximum number of login attempts. Your account has been locked.");
            request.getRequestDispatcher("view/staff/loginstaff.jsp").forward(request, response);
            return; // Stop further execution
        }

        if (s == null) {
            request.setAttribute("error", "Username or Password invalid");
            request.getRequestDispatcher("view/staff/loginstaff.jsp").forward(request, response);
            return; // Stop further execution
        }
        if (!"1".equals(s.getIsDelete())) {
            request.setAttribute("error", "Your account has been locked.");
            request.getRequestDispatcher("view/staff/loginstaff.jsp").forward(request, response);
            return;
        }

        if (!s.getPassword().equals(password)) {
            loginAttempts++;
            session.setAttribute("loginAttempts", loginAttempts);
            request.setAttribute("error", "You have entered the wrong password " + loginAttempts + " times");
            request.getRequestDispatcher("view/staff/loginstaff.jsp").forward(request, response);
            return; // Stop further execution
        }

// Reset login attempts on successful login
        session.removeAttribute("loginAttempts");
        session.setAttribute("acc", s);
        session.setAttribute("username", username); // Set the username into session
        session.setAttribute("password", password); // Set the password into session
        session.setMaxInactiveInterval(1800); // 30'
        response.sendRedirect("homepage.jsp");

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
