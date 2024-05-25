/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.cs;

import DAO.CustomerDAO;
import DAO.SendMail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import Models.Customer;

/**
 *
 * @author HP
 */
public class SignUpCustomerController extends HttpServlet {

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
            out.println("<title>Servlet SignUpCustomerController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignUpCustomerController at " + request.getContextPath() + "</h1>");
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
        String name = request.getParameter("name");
        String username = request.getParameter("username1");
        String password = request.getParameter("password1");
        String repassword = request.getParameter("repassword");
        String email = request.getParameter("email");
        String address = request.getParameter("address"); // Corrected variable name from re_password to address
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender"); // Corrected variable name from phone to gender

// Store all parameters in session
        HttpSession session = request.getSession();
        session.setAttribute("name", name);
        session.setAttribute("username", username);
        session.setAttribute("password", password);
        session.setAttribute("repassword", repassword);
        session.setAttribute("email", email);
        session.setAttribute("address", address);
        session.setAttribute("phone", phone);
        session.setAttribute("gender", gender);


            CustomerDAO dao = new CustomerDAO();
            // Check if username already exists
            Customer a = dao.checkCustomerAccountExits(username);
            if (a == null) {
                // Uncomment the following lines if you want to enable sign-up
                // dao.singUp(name, username, password, email, phone, address, true, true);
                // request.setAttribute("messen", "Sign Up Success");
                // request.getRequestDispatcher("login.jsp").forward(request, response);

                SendMail sm = new SendMail();
                String code = sm.getRandom();
                Customer user = new Customer(username, email, code);

                boolean test = sm.sendEmail(user);
                if (test) {
                    session.setAttribute("authcode", user);
                    response.sendRedirect("verify.jsp");
                }
            } else {
                request.setAttribute("messen", "Username exist");
                // response.sendRedirect("Signup.jsp");
                request.getRequestDispatcher("signupcustomer.jsp").forward(request, response);
            }

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
