/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author admin
 */
public class Feedback {

    String id, customer, product, date, ratedStar, comment, isDelete;

    public Feedback() {
    }

    public Feedback(String id, String customer, String product, String date, String ratedStar, String comment, String isDelete) {
        this.id = id;
        this.customer = customer;
        this.product = product;
        this.date = date;
        this.ratedStar = ratedStar;
        this.comment = comment;
        this.isDelete = isDelete;
    }

    public Feedback(String customer, String date, String ratedStar, String comment) {
        this.customer = customer;
        this.date = date;
        this.ratedStar = ratedStar;
        this.comment = comment;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    public String getProduct() {
        return product;
    }

    public void setProduct(String product) {
        this.product = product;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getRatedStar() {
        return ratedStar;
    }

    public void setRatedStar(String ratedStar) {
        this.ratedStar = ratedStar;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(String isDelete) {
        this.isDelete = isDelete;
    }

    @Override
    public String toString() {
        return "Feedback{" + "customer=" + customer + ", date=" + date + ", ratedStar=" + ratedStar + ", comment=" + comment + '}';
    }

    
}
