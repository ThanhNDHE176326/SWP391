/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author admin
 */
public class OrderDetail {

    String id, order, product, quantity, isDelete, product_name, image, unitprice, total_cost, product_id, category_name;

    public OrderDetail() {
    }

    public OrderDetail(String id, String quantity, String product_name, String image, String unitprice, String product_id, String category_name) {
        this.id = id;
        this.quantity = quantity;
        this.product_name = product_name;
        this.image = image;
        this.unitprice = unitprice;
        this.product_id = product_id;
        this.category_name = category_name;
    }

    public OrderDetail(String quantity, String product_id) {
        this.quantity = quantity;
        this.product_id = product_id;
    }

    
    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getUnitprice() {
        return unitprice;
    }

    public void setUnitprice(String unitprice) {
        this.unitprice = unitprice;
    }

    public String getTotal_cost() {
        return total_cost;
    }

    public void setTotal_cost(String total_cost) {
        this.total_cost = total_cost;
    }

    public OrderDetail(String id, String order, String product, String quantity, String isDelete, String product_name, String image, String unitprice, String total_cost) {
        this.id = id;
        this.order = order;
        this.product = product;
        this.quantity = quantity;
        this.isDelete = isDelete;
        this.product_name = product_name;
        this.image = image;
        this.unitprice = unitprice;
        this.total_cost = total_cost;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public OrderDetail(String id, String order, String product, String quantity, String isDelete, String product_name) {
        this.id = id;
        this.order = order;
        this.product = product;
        this.quantity = quantity;
        this.isDelete = isDelete;
        this.product_name = product_name;
    }

    public OrderDetail(String id, String order, String product, String quantity, String isDelete) {
        this.id = id;
        this.order = order;
        this.product = product;
        this.quantity = quantity;
        this.isDelete = isDelete;
    }

    public OrderDetail(String id, String quantity, String product_id) {
        this.id = id;
        this.quantity = quantity;
        this.product_id = product_id;
    }

    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    public String getProduct() {
        return product;
    }

    public void setProduct(String product) {
        this.product = product;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(String isDelete) {
        this.isDelete = isDelete;
    }

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }

    
    @Override
    public String toString() {
        return "OrderDetail{" + "id=" + id + ", order=" + order + ", product=" + product + ", quantity=" + quantity + ", isDelete=" + isDelete + ", product_name=" + product_name + ", image=" + image + ", unitprice=" + unitprice + ", total_cost=" + total_cost + ", product_id=" + product_id + ", category_name=" + category_name + '}';
    }

    
}
