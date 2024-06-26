/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.time.LocalDate;

/**
 *
 * @author admin
 */
public class Order {

    String id, customer, totalCost, note, orderDate, address, phone, isDelete, staff, status_id, status_name, customer_name, staff_name, recipient_name, recipient_gender, payment_name, nextStatusName;

    public Order() {
    }

    public String getNextStatusName() {
        return nextStatusName;
    }

    public void setNextStatusName(String nextStatusName) {
        this.nextStatusName = nextStatusName;
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

    public Order(String id, String totalCost, String orderDate, String address, String status_name) {
        this.id = id;
        this.totalCost = totalCost;
        this.orderDate = orderDate;
        this.address = address;
        this.status_name = status_name;
    }

    public Order(String id, String totalCost, String orderDate, String address, String phone, String status_name, String customer_name) {
        this.id = id;
        this.totalCost = totalCost;
        this.orderDate = orderDate;
        this.address = address;
        this.phone = phone;
        this.status_name = status_name;
        this.customer_name = customer_name;
    }

    public Order(String orderDate, String address, String phone, String recipient_name, String recipient_gender, String payment_name) {
        this.orderDate = orderDate;
        this.address = address;
        this.phone = phone;
        this.recipient_name = recipient_name;
        this.recipient_gender = recipient_gender;
        this.payment_name = payment_name;
    }

//    public Order(String id, String totalCost, LocalDate orderDate, String addressOrder, String phoneOrder, int salerRandomID) {
//        this
//    }
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

    public String getStaff_name() {
        return staff_name;
    }

    public void setStaff_name(String staff_name) {
        this.staff_name = staff_name;
    }

    public String getRecipient_name() {
        return recipient_name;
    }

    public void setRecipient_name(String recipient_name) {
        this.recipient_name = recipient_name;
    }

    public String getRecipient_gender() {
        return recipient_gender;
    }

    public void setRecipient_gender(String recipient_gender) {
        this.recipient_gender = recipient_gender;
    }

    public String getPayment_name() {
        return payment_name;
    }

    public void setPayment_name(String payment_name) {
        this.payment_name = payment_name;
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

    @Override
    public String toString() {
        return "Order{" + "id=" + id + ", customer=" + customer + ", totalCost=" + totalCost + ", note=" + note + ", orderDate=" + orderDate + ", address=" + address + ", phone=" + phone + ", isDelete=" + isDelete + ", staff=" + staff + ", status_id=" + status_id + ", status_name=" + status_name + ", customer_name=" + customer_name + ", staff_name=" + staff_name + ", recipient_name=" + recipient_name + ", recipient_gender=" + recipient_gender + ", payment_name=" + payment_name + '}';
    }

}
