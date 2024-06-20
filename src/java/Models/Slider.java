/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author admin
 */
public class Slider {

    String id, title, image, note, staff, startDate, endDate, isDelete ,status,product_id;

    public Slider() {
    }

    public Slider(String title, String image, String product_id) {
        this.title = title;
        this.image = image;
        this.product_id = product_id;
    }

    public Slider(String image) {
        this.image = image;
    }
    

    public Slider(String id, String title, String image, String note, String staff, String startDate, String endDate, String isDelete) {
        this.id = id;
        this.title = title;
        this.image = image;
        this.note = note;
        this.staff = staff;
        this.startDate = startDate;
        this.endDate = endDate;
        this.isDelete = isDelete;
    }

    public Slider(String id, String title, String image, String note, String staff, String startDate, String endDate, String isDelete, String status) {
        this.id = id;
        this.title = title;
        this.image = image;
        this.note = note;
        this.staff = staff;
        this.startDate = startDate;
        this.endDate = endDate;
        this.isDelete = isDelete;
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

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getStaff() {
        return staff;
    }

    public void setStaff(String staff) {
        this.staff = staff;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(String isDelete) {
        this.isDelete = isDelete;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

}
