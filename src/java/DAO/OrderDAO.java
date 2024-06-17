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
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class OrderDAO extends DBContext {

    PreparedStatement stm; // thực hiện câu lệnh SQL
    ResultSet rs;//lưu trữ dữ liệu được lưu về từ  select

    public String getDateMinInOrder() {
        String sql = "SELECT TOP 1 * FROM Orders\n"
                + "ORDER BY order_date ASC";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getString("order_date");
            }
        } catch (SQLException e) {
            System.out.println("getDateMinInOrder:" + e.getMessage());
        }
        return null;
    }

    public String getDateMaxInOrder() {
        String sql = "SELECT TOP 1 * FROM Orders\n"
                + "ORDER BY order_date DESC";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getString("order_date");
            }
        } catch (SQLException e) {
            System.out.println("getDateMinInOrder:" + e.getMessage());
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
            String sql = "SELECT o.*, c.name AS customer_name "
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

    public List<Order> getOrdersByDateRange(LocalDate fromDate, LocalDate toDate) {
        List<Order> orders = new ArrayList<>();

        try {
            // Get connection from DBContext
            String sql = "SELECT o.*, c.name AS customer_name "
                    + " FROM Orders o "
                    + "INNER JOIN Customers c ON o.customer_id = c.id "
                    + " WHERE order_date >= ? AND order_date <= ?";
            stm = connection.prepareStatement(sql);
            stm.setObject(1, fromDate);
            stm.setObject(2, toDate);
            rs = stm.executeQuery();

            while (rs.next()) {
                Order order = new Order();
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

                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return orders;
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

    public List<Order> getOrdersByCustomerName(String customerName) {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT o.id,s.name AS status_name, c.name as customer_name,  o.total_cost, o.order_date "
                + "FROM Orders o "
                + "INNER JOIN Customers c ON o.customer_id = c.id "
                + "INNER JOIN OrderStatus s ON o.status_id = s.id "
                + "WHERE c.name LIKE ? AND o.isDelete = 1";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, "%" + customerName + "%");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getString("id"));
                order.setCustomer_name(rs.getString("customer_name"));
                order.setOrderDate(rs.getString("order_date"));
                order.setTotalCost(rs.getString("total_cost"));
                order.setStatus_name(rs.getString("status_name"));

                orders.add(order);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return orders;
    }

    public List<Order> getOrdersByStaffName(String staffName) {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT o.id, c.name as customer_name, s.fullname as staff_name, o.total_cost, o.order_date "
                + "FROM Orders o "
                + "INNER JOIN Customers c ON o.customer_id = c.id "
                + "INNER JOIN Staffs s ON o.staff_id = s.id "
                + "WHERE s.fullname LIKE ? AND o.isDelete = 0";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, "%" + staffName + "%");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getString("id"));
                order.setCustomer_name(rs.getString("customer_name"));
                order.setOrderDate(rs.getString("order_date"));
                order.setTotalCost(rs.getString("total_cost"));
                order.setStatus_name(rs.getString("status_name"));

                orders.add(order);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return orders;
    }

    public List<OrderDetail> getOrderDetailsByOrderId(String orderId) {
        List<OrderDetail> orderDetails = new ArrayList<>();
        try {
            String sql = "SELECT od.id, od.order_id,od.product_id, od.quantity, p.title, p.image, p.sale_price, (od.quantity * p.sale_price) AS total_cost "
                    + "FROM OrderDetails od "
                    + "JOIN Products p ON od.product_id = p.id "
                    + "WHERE od.id = ?";
            stm = connection.prepareStatement(sql);
            stm.setString(1, orderId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setId(rs.getString("id"));
                orderDetail.setOrder(rs.getString("order_id"));
                orderDetail.setProduct(rs.getString("product_id"));
                orderDetail.setQuantity(rs.getString("quantity"));
                orderDetail.setProduct_name(rs.getString("title"));
                orderDetail.setImage(rs.getString("image"));
                orderDetail.setUnitprice(rs.getString("sale_price"));
                orderDetail.setTotal_cost(rs.getString("total_cost"));
                orderDetails.add(orderDetail);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderDetails;
    }

    public List<Order> getOrdersWithPagination(int offset, int limit) {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT o.*, s.name AS status_name, c.name AS customer_name "
                + "FROM Orders o "
                + "INNER JOIN OrderStatus s ON o.status_id = s.id "
                + "INNER JOIN Customers c ON o.customer_id = c.id "
                + "WHERE o.isDelete = 1 "
                + "ORDER BY o.order_date DESC "
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, offset);
            stm.setInt(2, limit);
            try (ResultSet rs = stm.executeQuery()) {
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
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public int getTotalOrderCount() {
        String sql = "SELECT COUNT(*) AS total FROM Orders WHERE isDelete = 1";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
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

    public void updateOrderStatus(String orderId, String statusId) {
        String sql = "UPDATE Orders SET status_id = ? WHERE id = ?";
        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, Integer.parseInt(statusId));
            stm.setInt(2, Integer.parseInt(orderId));
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Order> getOrdersByStatus(String statusId) {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT o.*, s.name AS status_name, c.name AS customer_name "
                + "FROM Orders o "
                + "INNER JOIN OrderStatus s ON o.status_id = s.id "
                + "INNER JOIN Customers c ON o.customer_id = c.id "
                + "WHERE o.isDelete = 1 AND o.status_id = ?";
        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setString(1, statusId);
            try (ResultSet rs = stm.executeQuery()) {
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
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public List<Order> getOrdersByStatusWithPagination(String statusId, int offset, int limit) {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT o.*, s.name AS status_name, c.name AS customer_name "
                + "FROM Orders o "
                + "INNER JOIN OrderStatus s ON o.status_id = s.id "
                + "INNER JOIN Customers c ON o.customer_id = c.id "
                + "WHERE o.isDelete = 1 AND o.status_id = ? "
                + "ORDER BY o.order_date DESC "
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setString(1, statusId);
            stm.setInt(2, offset);
            stm.setInt(3, limit);
            try (ResultSet rs = stm.executeQuery()) {
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
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public int getTotalOrderCountByStatus(String statusId) {
        String sql = "SELECT COUNT(*) AS total "
                + "FROM Orders "
                + "WHERE isDelete = 1 AND status_id = ?";
        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setString(1, statusId);
            try (ResultSet rs = stm.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("total");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String fromDate = LocalDate.of(2024, 5, 1).format(formatter);
        String toDate = LocalDate.of(2024, 6, 17).format(formatter);
        System.out.println("Orders: " + dao.getOrdersByDateRange(fromDate, toDate));
        System.out.println("maxDate: " + dao.getDateMaxInOrder());
    }
}
