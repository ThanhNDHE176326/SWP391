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
public class WarehouseAccessConfig {
    private static final List<String> warehouseUrls = Arrays.asList(
            // jsp
            "/view/warehouse/headerwarehouse.jsp", "/view/warehouse/navbarwarehouse.jsp", "/view/warehouse/orderdetailswarehouse.jsp", "/view/warehouse/orderlistwarehouse.jsp",
            "/view/warehouse/productlistwarehouse.jsp","/view/warehouse/updateproductdetailwarehouse.jsp", 
            // Servlet
            "/filterCategoryProduct", "/filterStatusProductWH", "/searchProductList", "/updateProductDetailByWarehouse", "/warehouseorderdetails", "/warehouseorderlist","/warehouseorderlist"
    );

    public static List<String> getWarehouseUrls() {
        return warehouseUrls;
    }
}
