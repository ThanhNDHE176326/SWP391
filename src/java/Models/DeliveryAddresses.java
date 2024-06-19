/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author HP
 */
public class DeliveryAddresses {

    private String id, customer_id, address, phone, recipient_name, recipient_gender;

    public DeliveryAddresses() {
    }

    public DeliveryAddresses(String id, String customer_id, String address, String phone, String recipient_name, String recipient_gender) {
        this.id = id;
        this.customer_id = customer_id;
        this.address = address;
        this.phone = phone;
        this.recipient_name = recipient_name;
        this.recipient_gender = recipient_gender;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(String customer_id) {
        this.customer_id = customer_id;
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

   
}
