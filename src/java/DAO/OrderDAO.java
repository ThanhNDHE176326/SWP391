/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Order;
import Models.OrderDetail;
import Models.OrderStatus;
import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
     public List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT o.*, s.name AS status_name,c.name AS customer_name "
                + "FROM Orders o "
                + "INNER JOIN OrderStatus s ON o.status_id = s.id "
                + "INNER JOIN Customers c ON o.customer_id = c.id "
                + "WHERE o.isDelete = 1";

        try (PreparedStatement stm = connection.prepareStatement(sql); ResultSet rs = stm.executeQuery()) {
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getString("id"));
                order.setCustomer_name(rs.getString("customer_name"));
                order.setTotalCost(rs.getString("total_cost"));
                order.setNote(rs.getString("note"));
                order.setOrderDate(rs.getString("order_date"));
                order.setAddress(rs.getString("address"));
                order.setPhone(rs.getString("phone"));
                order.setStatus_id(rs.getString("status_id"));
                order.setStatus_name(rs.getString("status_name"));
                order.setStaff(rs.getString("staff_id"));
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public Order getOrderById(String id) {
        Order order = null;
        try {
            String sql = "SELECT o.*,c.name AS customer_name "
                + "FROM Orders o "
                
                + "INNER JOIN Customers c ON o.customer_id = c.id "
                + "WHERE o.id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                order = new Order();
                order.setId(rs.getString("id"));
                order.setCustomer_name(rs.getString("customer_name"));
                order.setTotalCost(rs.getString("total_cost"));
                order.setNote(rs.getString("note"));
                order.setOrderDate(rs.getString("order_date"));
                order.setAddress(rs.getString("address"));
                order.setPhone(rs.getString("phone"));
                order.setIsDelete(rs.getString("isDelete"));
                order.setStaff(rs.getString("staff_id"));
                order.setStatus_id(rs.getString("status_id"));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return order;
    }

    public List<Order> getOrdersByDateRange(String fromDate, String toDate) {
        List<Order> orders = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Orders WHERE order_date BETWEEN ? AND ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, fromDate);
            stm.setString(2, toDate);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getString("id"));
                order.setCustomer(rs.getString("customer_id"));
                order.setTotalCost(rs.getString("total_cost"));
                order.setNote(rs.getString("note"));
                order.setOrderDate(rs.getString("order_date"));
                order.setAddress(rs.getString("address"));
                order.setPhone(rs.getString("phone"));
                order.setIsDelete(rs.getString("isDelete"));
                order.setStaff(rs.getString("staff_id"));
                order.setStatus_id(rs.getString("status_id"));

                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public List<OrderDetail> getOrderDetailsByOrderId(String orderId) {
        List<OrderDetail> orderDetails = new ArrayList<>();
        try {
            String sql = "SELECT * FROM OrderDetails WHERE order_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, orderId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setId(rs.getString("id"));
                orderDetail.setOrder(rs.getString("order_id"));
                orderDetail.setProduct(rs.getString("product_id"));
                orderDetail.setQuantity(rs.getString("quantity"));
                orderDetail.setIsDelete(rs.getString("isDelete"));
                orderDetails.add(orderDetail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderDetails;
    }

    public void updateOrderStatus(String orderId, String statusId) {
        String sql = "UPDATE Orders SET id = ? WHERE id = ?";
        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, Integer.parseInt(statusId));
            stm.setInt(2, Integer.parseInt(orderId));
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<OrderStatus> getAllOrderStatus() {
        List<OrderStatus> statuses = new ArrayList<>();
        String sql = "SELECT * FROM OrderStatus WHERE isDelete = 1";
        try (PreparedStatement stm = connection.prepareStatement(sql); ResultSet rs = stm.executeQuery()) {
            while (rs.next()) {
                OrderStatus status = new OrderStatus();
                status.setId(rs.getString("id"));
                status.setName(rs.getString("name"));
                statuses.add(status);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return statuses;

    }
    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
        System.out.println("minDate: " + dao.getDateMinInOrder());
        System.out.println("maxDate: " + dao.getDateMaxInOrder());
    }
}
