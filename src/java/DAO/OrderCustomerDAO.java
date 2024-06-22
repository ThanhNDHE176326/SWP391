/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Customer;
import Models.Order;
import Models.OrderDetail;
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
        String sql = "select o.id, o.total_cost, o.order_date, o.address, o.phone, os.name from Orders as o\n"
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

    public List<OrderDetail> getProductByOrderId(int order_id) {
        List<OrderDetail> listFound = new ArrayList<>();
        String sql = "SELECT od.id AS orderdetail_id, p.id AS product_id, p.title AS product_title, p.image AS product_image,\n"
                + "od.quantity AS order_quantity, c.name AS category_name, p.sale_price AS product_sale_price FROM \n"
                + "OrderDetails as od JOIN Products as p ON od.product_id = p.id\n"
                + "JOIN Categories as c ON p.category_id = c.id where od.order_id = ?;";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, order_id);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = Integer.toString(rs.getInt("orderdetail_id"));
                String product_id = Integer.toString(rs.getInt("product_id"));
                String product_name = rs.getString("product_title");
                String image = rs.getString("product_image");
                String quantity = Integer.toString(rs.getInt("order_quantity"));
                String category_name = rs.getString("category_name");
                String unitprice = Integer.toString(rs.getInt("product_sale_price"));
                OrderDetail orderDetail = new OrderDetail(id, quantity, product_name, image, unitprice, product_id, category_name);
                listFound.add(orderDetail);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return listFound;

    }

    public Order getInfoOrderByOrderId(int order_id) {
        Order order = null;
        String sql = "SELECT o.id, o.total_cost, o.order_date, o.address, o.phone, os.name AS order_status, o.recipient_name AS recipient_name\n"
                + "FROM Orders AS o JOIN OrderStatus AS os ON o.status_id = os.id WHERE o.id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, order_id);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = Integer.toString(rs.getInt("id"));
                String orderDate = rs.getDate("order_date").toString();
                String totalCost = Integer.toString(rs.getInt("total_cost"));
                String address = rs.getString("address");
                String status = rs.getString("order_status");
                String phone = rs.getString("phone");
                String recipient_name = rs.getString("recipient_name");
                order = new Order(id, totalCost, orderDate, address, phone, status, recipient_name);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return order;

    }

    public void updateOrderStatus(int order_id) {
        String sql = "UPDATE Orders SET status_id = 3 WHERE id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, order_id);

            int rowsUpdated = stm.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
    }

    public static void main(String[] args) {
        OrderCustomerDAO dao = new OrderCustomerDAO();
//         dao.updateOrderStatus(1, 4);

        // In ra thông báo sau khi cập nhật thành công (hoặc thông báo lỗi trong trường hợp xảy ra ngoại lệ)
        Order order = dao.getInfoOrderByOrderId(1);
        System.out.println(order);
//        int count = dao.countTotalOrderByCustomer("1");
//        System.out.println(count);
    }
}
