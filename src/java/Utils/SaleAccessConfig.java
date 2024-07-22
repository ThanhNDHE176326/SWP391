/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Utils;

import java.util.Arrays;
import java.util.List;

/**
 *
 * @author HP
 */
public class SaleAccessConfig {

    private static final List<String> saleUrls = Arrays.asList(
            //jsp
            "/view/sale/headersale.jsp", "/view/sale/homedashboardsale.jsp", "/view/sale/navbarsale.jsp", "/view/sale/orderdetails.jsp", "/view/sale/orderlist.jsp",
            "/view/sale/saledashboard.jsp",
            //
            //Servlet
            "/saleorderdetails", "/saleorderlist","/logoutstaff","/updatestaff","/resetpasswordstaff","/informationstaff","/forgotpasswordstaff","/confirmresetpwdstaff",
            "/changepasswordstaff"
    );

    public static List<String> getSaleUrls() {
        return saleUrls;
    }
}
