/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author admin
 */
public class Staff {

    String id, fullname, username, password, email, gender, phone, address, role, isDelete, code, status;

    public Staff() {
    }

    public Staff(String id, String fullname, String username, String password, String gender, String phone, String address, String role, String isDelete) {
        this.id = id;
        this.fullname = fullname;
        this.username = username;
        this.password = password;
        this.gender = gender;
        this.phone = phone;
        this.address = address;
        this.role = role;
        this.isDelete = isDelete;
    }

    public Staff(String id, String fullname, String username, String password, String email, String gender, String phone, String address, String role, String isDelete, String code, String status) {
        this.id = id;
        this.fullname = fullname;
        this.username = username;
        this.password = password;
        this.email = email;
        this.gender = gender;
        this.phone = phone;
        this.address = address;
        this.role = role;
        this.isDelete = isDelete;
        this.code = code;
        this.status = status;
    }

    public Staff(String id, String fullname, String email, String gender, String phone, String role, String status) {
        this.id = id;
        this.fullname = fullname;
        this.email = email;
        this.gender = gender;
        this.phone = phone;
        this.role = role;
        this.status = status;
    }
    

    public Staff(String fullname, String username, String password, String gender, String phone, String address, String role, String isDelete) {
        this.fullname = fullname;
        this.username = username;
        this.password = password;
        this.gender = gender;
        this.phone = phone;
        this.address = address;
        this.role = role;
        this.isDelete = isDelete;
    }

    public Staff(String fullname, String username, String password, String role, String isDelete) {
        this.fullname = fullname;
        this.username = username;
        this.password = password;
        this.role = role;
        this.isDelete = isDelete;
    }

    public Staff(String id, String fullname, String username, String password, String email, String gender, String phone, String address, String role, String status) {
        this.id = id;
        this.fullname = fullname;
        this.username = username;
        this.password = password;
        this.email = email;
        this.gender = gender;
        this.phone = phone;
        this.address = address;
        this.role = role;
        this.status = status;
    }
    
    

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
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

}
