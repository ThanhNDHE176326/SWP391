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
public class MarketingAccessConfig {

    private static final List<String> marketingUrls = Arrays.asList(
            //jsp
            "/view/marketing/addcustomer.jsp", "/view/marketing/create-new-product.jsp", "/view/marketing/createpost.jsp", "/view/marketing/customerdetail.jsp", "/view/marketing/customerlist.jsp",
            "/view/marketing/detailslider.jsp", "/view/marketing/editslider.jsp", "/view/marketing/feedbackdetail.jsp", "/view/marketing/headermarketing.jsp", "/view/marketing/homedashboardmarketing.jsp",
            "/view/marketing/listfeedback.jsp", "/view/marketing/listslider.jsp", "/view/marketing/navbarmarketing.jsp", "/view/marketing/postlist.jsp", "/view/marketing/product-detail-marketing.jsp",
            "/view/marketing/product-list-marketing.jsp", "/view/marketing/profilemarketing.jsp", "/view/marketing/searchfeedback.jsp", "/view/marketing/searchslider.jsp", "/view/marketing/update-product-detail-marketing.jsp",
            "/view/marketing/updatepost.jsp", "/view/marketing/viewpost.jsp",
            //Servlet
            "/marketingDashboard", "/detail", "/edit", "/filter", "/search", "/slider", "/FilterFeedbackByCategories", "/FilterFeedbackByStar",
            "/FilterFeedbackByStatus", "/listfeedback", "/searchfeedback", "/updatefeedback", "/CustomerList", "/StatusCustomer", "/AddCustomer", "/EditCustomer", "/UpdateCustomer",
            "/Pagination", "/SearchControl", "/CreatePost", "/deletePost", "/postlist", "/ShowHide", "/updatepost", "/viewPost", "/productListMarketing", "/changeStatus", "/sortList", "/productMarketingSearchByBriefInfo", "/productMarketingSearchByTitle",
            "/productMarketingFilterByStatus", "/productMarketingFilterByCategory", "/createNewProductMarketing", "/updateProductDetailMarketing",
            "/viewProductDetailMarketing", "/marketingDashboard"
    );

    public static List<String> getMarketingUrls() {
        return marketingUrls;
    }
}
