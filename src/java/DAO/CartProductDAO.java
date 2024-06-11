/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author admin
 */
public class CartProductDAO extends DBContext {

    PreparedStatement stm; // thực hiện câu lệnh SQL
    ResultSet rs;//lưu trữ dữ liệu được lưu về từ  select

    public void addToCart(int cartID, int productID) {
        String sql = "INSERT INTO [dbo].[CartProducts]\n"
                + "           ([cart_id]\n"
                + "           ,[product_id]\n"
                + "           ,[quantity])\n"
                + "     VALUES  (? ,? ,1)";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, cartID);
            stm.setInt(2, productID);
            stm.execute();
        } catch (SQLException e) {
            System.out.println("addToCartFirst: " + e.getMessage());
            e.printStackTrace();
        }
    }

  

    public int getProductIDFromByCartID(int cartID, int productID) {
        String sql = "SELECT * FROM CartProducts WHERE cart_id = ? AND product_id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, cartID);
            stm.setInt(2, productID);
            rs=stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("product_id");
            }
        } catch (SQLException e) {
            System.out.println("getProductIDFromByCartID: " + e.getMessage());
        }
        return 0;
    }

    public int getQuantityByCartIdAndProductID(int cartID, int productID) {
        String sql = "SELECT * FROM CartProducts WHERE cart_id = ? AND product_id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, cartID);
            stm.setInt(2, productID);
            rs=stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("quantity");
            }
        } catch (SQLException e) {
            System.out.println("getProductIDFromByCartID: " + e.getMessage());
            e.printStackTrace();
        }
        return 0;
    }

    public void updateQuantityByCartID(int cartID, int productIDFromCart, int quantityFromCart) {
        String sql = "UPDATE [dbo].[CartProducts]\n"
                + "   SET [quantity] = ?\n"
                + " WHERE cart_id = ? AND product_id =?";
        try {
            stm= connection.prepareStatement(sql);
            stm.setInt(1, quantityFromCart);
            stm.setInt(2, cartID);
            stm.setInt(3, productIDFromCart);
            stm.execute();
        } catch (SQLException e) {
            System.out.println("updateQuantityByCartID: " + e.getMessage());
        }
    }
}
