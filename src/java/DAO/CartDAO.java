/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Cart;
import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author admin
 */
public class CartDAO extends DBContext {

    PreparedStatement stm; // thực hiện câu lệnh SQL
    ResultSet rs;//lưu trữ dữ liệu được lưu về từ  select

    public Cart getCartByCustomerID(int customerID) {
        String sql = "SELECT * FROM Carts WHERE customer_id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, customerID);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getInt("id"));
                String customer = rs.getString("customer_id");
                Cart cart = new Cart(id, customer);
                return cart;
            }
        } catch (SQLException e) {
            System.out.println("getCartByCustomerID: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

    public void addNewCartByCustomerID(int customerID) {
        String sql = "INSERT INTO [dbo].[Carts]\n"
                + "           ([customer_id])\n"
                + "     VALUES (?)";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, customerID);
            stm.execute();
        } catch (SQLException e) {
            System.out.println("addCartByCustomerID: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public int getCartIdByCustomerID(int customerID) {
        String sql = "SELECT * FROM Carts WHERE customer_id = ?";
        try {
            stm=connection.prepareStatement(sql);
            stm.setInt(1, customerID);
            rs=stm.executeQuery();
            while (rs.next()) {                
                return rs.getInt("id");
            }
        } catch (SQLException e) {
            System.out.println("getCartIdByCustomerID: " +e.getMessage());
            e.printStackTrace();
        }
        return 0;
    }

}
