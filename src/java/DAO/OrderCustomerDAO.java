/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Customer;
import Models.Order;
import dal.DBContext;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class OrderCustomerDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;

    public List<Order> getAllOrderById(String customer_id, int index) {
        List<Order> listOrder = new ArrayList<>();
        String sql = "select o.id, o.total_cost, o.order_date, o.address, os.name from Orders as o\n"
                + "join OrderStatus as os on o.status_id = os.id  where o.customer_id = ? ORDER BY o.id ASC OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, customer_id);
            stm.setInt(2, (index - 1) * 5);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = Integer.toString(rs.getInt("id"));
                String orderDate = rs.getDate("order_date").toString();
                String totalCost = Integer.toString(rs.getInt("total_cost"));
                String address = rs.getString("address");
                String status = rs.getString("name");
                Order order = new Order(id, totalCost, orderDate, address, status);
                listOrder.add(order);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return listOrder;

    }

    public int getCustomerIdByUsername(String username) {
        int customerId = -1;
        String sql = "SELECT id FROM Customers WHERE username = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                customerId = rs.getInt("id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return customerId;
    }

    public int countTotalOrderByCustomer(String customer_id) {
        String sql = "select count(*) from Orders where customer_id = ?";

        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, customer_id);
            rs = stm.executeQuery();

            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return 0;
    }

    public static void main(String[] args) {
        OrderCustomerDAO dao = new OrderCustomerDAO();
        List<Order> order = dao.getAllOrderById("1", 1);
        for (Order order1 : order) {
            System.out.println(order1);
        }
//        int count = dao.countTotalOrderByCustomer("1");
//        System.out.println(count);
    }
}
