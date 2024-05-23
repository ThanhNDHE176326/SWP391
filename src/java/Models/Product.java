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
            description, category, originalPrice, salePrice, staff, status, isDelete;

    public Product() {
    }

    public Product(String id, String title, String image, String author,
            String quantity, String updateDate, String description, String category,
            String originalPrice, String salePrice, String staff, String status, String isDelete) {
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
        this.staff = staff;
        this.status = status;
        this.isDelete = isDelete;
    }

    public Product(String id, String title, String image, String author, String quantity,
            String updateDate, String description, String category, String originalPrice,
            String salePrice, String staff, String status) {
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
        this.staff = staff;
        this.status = status;
    }

    public String getId() {
        return id;
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

    public String getStaff() {
        return staff;
    }

    public void setStaff(String staff) {
        this.staff = staff;
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

}
