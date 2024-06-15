/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author admin
 */
public class Order {

    String id, customer, totalCost, note, orderDate, address, phone, isDelete, staff,status_id,status_name, customer_name;

    public Order() {
    }

    public Order(String id, String customer, String totalCost, String note, String orderDate, String address, String phone, String isDelete, String staff, String status_id, String status_name, String customer_name) {
        this.id = id;
        this.customer = customer;
        this.totalCost = totalCost;
        this.note = note;
        this.orderDate = orderDate;
        this.address = address;
        this.phone = phone;
        this.isDelete = isDelete;
        this.staff = staff;
        this.status_id = status_id;
        this.status_name = status_name;
        this.customer_name = customer_name;
    }
    

    public String getCustomer_name() {
        return customer_name;
    }

    public void setCustomer_name(String customer_name) {
        this.customer_name = customer_name;
    }

    public String getStatus_name() {
        return status_name;
    }

    public void setStatus_name(String status_name) {
        this.status_name = status_name;
    }

    public Order(String id, String customer, String totalCost, String note, String orderDate, String address, String phone, String isDelete, String staff, String status_id, String status_name) {
        this.id = id;
        this.customer = customer;
        this.totalCost = totalCost;
        this.note = note;
        this.orderDate = orderDate;
        this.address = address;
        this.phone = phone;
        this.isDelete = isDelete;
        this.staff = staff;
        this.status_id = status_id;
        this.status_name = status_name;
    }
    

    public String getStatus_id() {
        return status_id;
    }

    public void setStatus_id(String status_id) {
        this.status_id = status_id;
    }

  
    

    public Order(String id, String customer, String totalCost, String note, String orderDate, String address, String phone, String isDelete, String staff) {
        this.id = id;
        this.customer = customer;
        this.totalCost = totalCost;
        this.note = note;
        this.orderDate = orderDate;
        this.address = address;
        this.phone = phone;
        this.isDelete = isDelete;
        this.staff = staff;
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

    public String getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(String totalCost) {
        this.totalCost = totalCost;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(String isDelete) {
        this.isDelete = isDelete;
    }

    public String getStaff() {
        return staff;
    }

    public void setStaff(String staff) {
        this.staff = staff;
    }

}
