
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.sale.db;

import DAO.OrderDAO;
import Models.Order;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.time.LocalDate;
import java.sql.Date;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtils;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;

/**
 *
 * @author Acer
 */
    @WebServlet(name = "SaleDashBoardController", urlPatterns = {"/saledashboard"})
public class SaleDashBoardController extends HttpServlet {

    private static final long serialVersionUID = 1L;

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
            out.println("<title>Servlet SaleDashBoardController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SaleDashBoardController at " + request.getContextPath() + "</h1>");
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

    LocalDate endDate = LocalDate.now();
        LocalDate startDate = endDate.minusDays(6);

        OrderDAO orderDAO = new OrderDAO();
        List<Order> orders = orderDAO.getOrdersByDateRange(Date.valueOf(startDate), Date.valueOf(endDate));

        DefaultCategoryDataset dataset = new DefaultCategoryDataset();

        for (Order order : orders) {
            LocalDate orderLocalDate = Date.valueOf(order.getOrderDate()).toLocalDate();
            int dayIndex = (int) (orderLocalDate.toEpochDay() - startDate.toEpochDay());

            if (dayIndex >= 0 && dayIndex < 7) {
                dataset.addValue(1, "Total Orders", "Day " + (dayIndex + 1));
                if (Integer.parseInt(order.getStatus_id()) == 6) {
                    dataset.addValue(1, "Success Orders", "Day " + (dayIndex + 1));
                    dataset.addValue(Float.parseFloat(order.getTotalCost()), "Revenues", "Day " + (dayIndex + 1));
                }
            }
        }

        JFreeChart barChart = ChartFactory.createBarChart(
                "Bar Chart Example",
                "Days",
                "Count",
                dataset,
                PlotOrientation.VERTICAL,
                true, true, false);

        int width = 640;    // Width of the image
        int height = 480;   // Height of the image

        // Create a temporary file to save the chart image
        File barChartFile = new File(request.getServletContext().getRealPath("/") + "chart.png");
    ChartUtils.saveChartAsPNG(barChartFile, barChart, width, height);

    // Redirect to JSP to display the chart image
    request.setAttribute("chartFileName", "chart.png");
    request.getRequestDispatcher("view/saleadmin/saleadmindashboard.jsp").forward(request, response);

        // Flush and close the output stream
        
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
        processRequest(request, response);
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

