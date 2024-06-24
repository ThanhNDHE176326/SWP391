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
public class SaleAdminAccessConfig {

    private static final List<String> saleAdminUrls = Arrays.asList(
            //jsp
            "/view/saleadmin/headersaleadmin.jsp", "/view/saleadmin/homedashboardsaleadmin.jsp", "/view/saleadmin/navbarsaleadmin.jsp", "/view/saleadmin/orderlistsale.jsp", "/view/saleadmin/saledashboard.jsp",
            //Servlet
            "/saledashboard", "/saleadminorderlist","/saleorderlist","/logoutstaff"
    );

    public static List<String> getSaleAdminUrls() {
        return saleAdminUrls;
    }
}
