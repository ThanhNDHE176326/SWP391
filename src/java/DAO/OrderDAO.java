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
public class OrderDAO extends DBContext{

    PreparedStatement stm; // thực hiện câu lệnh SQL
    ResultSet rs;//lưu trữ dữ liệu được lưu về từ  select

    public String getDateMinInOrder() {
        String sql = "SELECT TOP 1 * FROM Orders\n"
                + "ORDER BY order_date ASC";
        try {
            stm=connection.prepareStatement(sql);
            rs=stm.executeQuery();
            if (rs.next()) {
                return rs.getString("order_date");
            }
        } catch (SQLException e) {
            System.out.println("getDateMinInOrder:" +e.getMessage());
        }
        return null;
    }
    public String getDateMaxInOrder() {
        String sql = "SELECT TOP 1 * FROM Orders\n"
                + "ORDER BY order_date DESC";
        try {
            stm=connection.prepareStatement(sql);
            rs=stm.executeQuery();
            if (rs.next()) {
                return rs.getString("order_date");
            }
        } catch (SQLException e) {
            System.out.println("getDateMinInOrder:" +e.getMessage());
        }
        return null;
    }
    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
        System.out.println("minDate: " + dao.getDateMinInOrder());
        System.out.println("maxDate: " + dao.getDateMaxInOrder());
    }
}
