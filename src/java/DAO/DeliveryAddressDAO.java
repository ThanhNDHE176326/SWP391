/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author admin
 */
public class DeliveryAddressDAO extends DBContext {

    PreparedStatement stm; // thực hiện câu lệnh SQL
    ResultSet rs;//lưu trữ dữ liệu được lưu về từ  select

    public String getAddressByIdAndCustomerID(int deliveryAddressID, int customerID) {
        String sql = "SELECT * FROM DeliveryAddresses WHERE id = ? AND customer_id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, deliveryAddressID);
            stm.setInt(2, customerID);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getString("address");
            }
        } catch (SQLException e) {
            System.out.println("getAddressByIdAndCustomerID: " + e.getMessage());
        }
        return null;
    }

    public String getPhoneByIdAndCustomerID(int deliveryAddressID, int customerID) {
        String sql = "SELECT * FROM DeliveryAddresses WHERE id = ? AND customer_id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, deliveryAddressID);
            stm.setInt(2, customerID);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getString("phone");
            }
        } catch (SQLException e) {
            System.out.println("getPhoneByIdAndCustomerID: " + e.getMessage());
        }
        return null;
    }

}
