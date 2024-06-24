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
public class AdminAccessConfig {

    private static final List<String> adminUrls = Arrays.asList(
            // jsp
            "/view/admin/addnewuser.jsp", "/view/admin/edituser.jsp", "/view/admin/headeradmin.jsp", "/view/admin/homedashboardadmin.jsp", "/view/admin/listuser.jsp",
            "/view/admin/navbaradmin.jsp", "/view/admin/searchuser.jsp", "/view/admin/signupstaff.jsp", "/view/admin/userdetail.jsp",
            // Servlet
            "/listuser", "/adduser" , "/edituser" , "/FilterUserByGender" , "/FilterUserByRole", "/FilterUserByStatus", "/searchuser", "/addfeedbackpublic"
    );

    public static List<String> getAdminUrls() {
        return adminUrls;
    }
}
