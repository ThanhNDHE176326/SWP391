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

    String id, order, product, quantity, isDelete,product_name,image,unitprice,total_cost;

    public OrderDetail() {
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

}
