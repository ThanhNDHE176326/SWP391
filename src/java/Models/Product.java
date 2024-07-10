/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author admin
 */
public class Product {

    String id, title, image, author, quantity, updateDate,
            description, category, originalPrice, salePrice, status, isDelete, customer, order;

    int stock, hold;
    float total_cost;
    public Product() {
    }

    public Product(String id, String title, String image, String author,
            String quantity, String updateDate, String description, String category,
            String originalPrice, String salePrice, String status, String isDelete) {
        this.id = id;
        this.title = title;
        this.image = image;
        this.author = author;
        this.quantity = quantity;
        this.updateDate = updateDate;
        this.description = description;
        this.category = category;
        this.originalPrice = originalPrice;
        this.salePrice = salePrice;
        this.status = status;
        this.isDelete = isDelete;
    }

    public Product(String id, String title, String image, String author, String quantity,
            String updateDate, String description, String category, String originalPrice,
            String salePrice, String status) {
        this.id = id;
        this.title = title;
        this.image = image;
        this.author = author;
        this.quantity = quantity;
        this.updateDate = updateDate;
        this.description = description;
        this.category = category;
        this.originalPrice = originalPrice;
        this.salePrice = salePrice;
        this.status = status;
    }

    public Product(String id, String title, String image, String description, String originalPrice, String salePrice, String quantity, int hold, String status) {
        this.id = id;
        this.title = title;
        this.image = image;
        this.description = description;
        this.originalPrice = originalPrice;
        this.salePrice = salePrice;
        this.quantity = quantity;
        this.hold = hold;
        this.status = status;
    }

    public Product(String title, String image, String description) {
        this.title = title;
        this.image = image;
        this.description = description;
    }

    public Product(String id, String title, String image, String description) {
        this.id = id;
        this.title = title;
        this.image = image;
        this.description = description;
    }

    
    public Product(String id, String title, String image, String author, String quantity, String updateDate, String description, String category, String originalPrice, String salePrice) {
        this.id = id;
        this.title = title;
        this.image = image;
        this.author = author;
        this.quantity = quantity;
        this.updateDate = updateDate;
        this.description = description;
        this.category = category;
        this.originalPrice = originalPrice;
        this.salePrice = salePrice;
    }

    public Product(String id, String title, String image, String author, String quantity, String updateDate, String description, int hold, String category, String originalPrice, String salePrice) {
        this.id = id;
        this.title = title;
        this.image = image;
        this.author = author;
        this.quantity = quantity;
        this.updateDate = updateDate;
        this.description = description;
        this.hold = hold;
        this.category = category;
        this.originalPrice = originalPrice;
        this.salePrice = salePrice;
    }
    
    public Product(String id, String title, String author, String image,String description, String customer, String order) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.image = image;
        this.description = description;
        this.customer = customer;
        this.order = order;
    }
    public Product(String id, String title, String image, int stock, String salePrice, String cartQuantity){
        this.id = id;
        this.title = title;
        this.image = image;
        this.stock = stock;
        this.salePrice = salePrice;
        this.quantity = cartQuantity;
    }
    
    public Product(String id, String title, String image, int hold, int stock, String salePrice, String cartQuantity){
        this.id = id;
        this.title = title;
        this.image = image;
        this.hold = hold;
        this.stock = stock;
        this.salePrice = salePrice;
        this.quantity = cartQuantity;
    }
    public Product(String id, String title, String image, String quantity, String salePrice, float total_cost) {
        this.id = id;
        this.title = title;
        this.image = image;
        this.quantity = quantity;
        this.salePrice = salePrice;
        this.total_cost = total_cost;
    }
    
    public Product(String id) {
        this.id = id;
    }
    
    
    public String getId() {
        return id;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(String updateDate) {
        this.updateDate = updateDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getOriginalPrice() {
        return originalPrice;
    }

    public void setOriginalPrice(String originalPrice) {
        this.originalPrice = originalPrice;
    }

    public String getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(String salePrice) {
        this.salePrice = salePrice;
    }

   
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(String isDelete) {
        this.isDelete = isDelete;
    }

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    public int getHold() {
        return hold;
    }

    public void setHold(int hold) {
        this.hold = hold;
    }

    public float getTotal_cost() {
        return total_cost;
    }

    public void setTotal_cost(float total_cost) {
        this.total_cost = total_cost;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", title=" + title + ", image=" + image + ", author=" + author + ", quantity=" + quantity + ", updateDate=" + updateDate + ", description=" + description + ", category=" + category + ", originalPrice=" + originalPrice + ", salePrice=" + salePrice + ", status=" + status + ", isDelete=" + isDelete + ", customer=" + customer + ", order=" + order + ", stock=" + stock + ", hold=" + hold + ", total_cost=" + total_cost + '}';
    }

    
    
    

}
