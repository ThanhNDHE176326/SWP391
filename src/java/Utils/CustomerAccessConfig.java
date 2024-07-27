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
public class CustomerAccessConfig {

    private static final List<String> customerUrls = Arrays.asList(
            //jsp           
            "/view/customer/homepage.jsp", "/view/customer/MyOrders.jsp", "/view/customer/Slider.jsp", "/view/customer/blogdetails.jsp", "/view/customer/bloglist.jsp",
            "/view/customer/cart-completion.jsp", "/view/customer/cart.jsp", "/view/customer/cartcontact.jsp", "/view/customer/changepasswordcustomer.jsp", "/view/customer/checkout.jsp",
            "/view/customer/contact-us.jsp", "/view/customer/footer.jsp", "/view/customer/forgetpasswordcustomer.jsp", "/view/customer/header.jsp", "/view/customer/index_1.jsp",
            "/view/customer/leftsidebar.jsp", "/view/customer/order_information.jsp", "/view/customer/product-details.jsp", "/view/customer/profilecustomer.jsp",
            "/view/customer/resetpasswordcustomer.jsp", "/view/customer/shop.jsp", "/view/customer/signupcustomer.jsp",
            "/view/customer/verifyresetpasswordcustomer.jsp", "/view/customer/verifysignupcustomer.jsp",
            //Servlet           
            "/logincustomer", "/marketingDashboard", "/listOrderCustomer", "/orderInformationCustomer", "/ProductPublicByCategory", "/signupcustomer","/confirmsignupcus","/updateuser",
            "/ProductPublicByPrice", "/ProductDetailPublic", "/ProductListPublic", "/ProductListPublicByUpdateDate", "/SeachPopularProductPublic","/changepassword",
            "/SearchProductPulbic", "/addToCart", "/viewCartDetail", "/updateQuantityCartProduct", "/deleteCart", "/cartCompletion", "/addDeliveryAddress", "/bloglist", "/blogdetail",
            "/deleteDeliveryAddress", "/pushToCartContact", "/viewCartDetail", "/addfeedbackpublic", "/logout", "/informationuser", "/updateAddressDefault", "/checkOutSuccessfully"
    );

    public static List<String> getCustomerUrls() {
        return customerUrls;
    }
}
