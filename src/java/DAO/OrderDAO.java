/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Order;
import Models.OrderDetail;
import Models.OrderStatus;
import Models.Product;
import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.sql.Date;
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
     public List<Order> getOrdersByDateRange(Date startDate, Date endDate) {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM Orders WHERE order_date BETWEEN ? AND ? AND isDelete = 1";

        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setDate(1, startDate);
            stm.setDate(2, endDate);
            try (ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    Order order = new Order();
                    order.setId(rs.getString("id"));
                    order.setTotalCost(rs.getString("total_cost"));
                    order.setOrderDate(rs.getString("order_date"));
                    order.setStatus_id(rs.getString("status_id"));
                    orders.add(order);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return orders;
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

    public List<Order> getOrdersByCustomerNameAndStaff(String customerName, String staffId) {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT o.*, s.name AS status_name, c.name AS customer_name "
                + "FROM Orders o "
                + "INNER JOIN OrderStatus s ON o.status_id = s.id "
                + "INNER JOIN Customers c ON o.customer_id = c.id "
                + "WHERE o.isDelete = 1 AND c.name LIKE ? AND o.staff_id = ? "
                + "ORDER BY o.order_date DESC";
        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setString(1, "%" + customerName + "%");
            stm.setString(2, staffId);
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

    public List<Order> getOrdersByStaffWithPagination(String staffId, int offset, int limit) {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT o.*, s.name AS status_name, c.name AS customer_name "
                + "FROM Orders o "
                + "INNER JOIN OrderStatus s ON o.status_id = s.id "
                + "INNER JOIN Customers c ON o.customer_id = c.id "
                + "WHERE o.isDelete = 1 AND o.staff_id = ? "
                + "ORDER BY o.order_date DESC "
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setString(1, staffId);
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

    public int getTotalOrderCountByStaff(String staffId) {
        String sql = "SELECT COUNT(*) AS total FROM Orders WHERE isDelete = 1 AND staff_id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, staffId);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public Order getOrderByIdAndStaff(String id, String staffId) {
        Order order = null;
        try {
            String sql = "SELECT o.*, c.name AS customer_name "
                    + "FROM Orders o "
                    + "INNER JOIN Customers c ON o.customer_id = c.id "
                    + "WHERE o.id = ? AND o.staff_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, id);
            stm.setString(2, staffId);
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

    public List<Order> getOrdersByStatusAndStaffWithPagination(String statusId, String staffId, int offset, int limit) {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT o.*, s.name AS status_name, c.name AS customer_name "
                + "FROM Orders o "
                + "INNER JOIN OrderStatus s ON o.status_id = s.id "
                + "INNER JOIN Customers c ON o.customer_id = c.id "
                + "WHERE o.isDelete = 1 AND o.status_id = ? AND o.staff_id = ? "
                + "ORDER BY o.order_date DESC "
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setString(1, statusId);
            stm.setString(2, staffId);
            stm.setInt(3, offset);
            stm.setInt(4, limit);
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

    public int getTotalOrderCountByStatusAndStaff(String statusId, String staffId) {
        String sql = "SELECT COUNT(*) AS total "
                + "FROM Orders "
                + "WHERE isDelete = 1 AND status_id = ? AND staff_id = ?";
        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setString(1, statusId);
            stm.setString(2, staffId);
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

    public void createOrder(Order order) {
        String sql = "INSERT INTO [dbo].[Orders]\n"
                + "           ([customer_id]\n"
                + "           ,[total_cost]\n"
                + "           ,[order_date]\n"
                + "           ,[address]\n"
                + "           ,[phone]\n"
                + "           ,[isDelete]\n"
                + "           ,[staff_id]\n"
                + "           ,[status_id])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,1,?,1)";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, Integer.parseInt(order.getCustomer()));
            stm.setDouble(2, Double.parseDouble(order.getTotalCost()));
            stm.setString(3, order.getOrderDate());
            stm.setString(4, order.getAddress());
            stm.setString(5, order.getPhone());
            stm.setInt(6, Integer.parseInt(order.getStaff()));
            stm.execute();
        } catch (SQLException e) {
            System.out.println("createOrder: " + e.getMessage());
        }
    }

    public void insertOrder(int customerID, double totalCost, LocalDate orderDate, String addressOrder, String phoneOrder, String recipient_name, boolean isMale, int paymentID, int salerRandomID) {
        String sql = "INSERT INTO [Orders] "
                + "([customer_id], [total_cost], [note], [order_date], [address], [phone], [recipient_name], [recipient_gender], [isDelete], [staff_id], [status_id], [payment_id]) "
                + "VALUES (?, ?, N'Không có yêu cầu đặc biệt', ?, ?, ?, ?, ?, 1, ?, 1, ?)";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, customerID);
            ps.setDouble(2, totalCost);
            ps.setDate(3, java.sql.Date.valueOf(orderDate));
            ps.setString(4, addressOrder);
            ps.setString(5, phoneOrder);
            ps.setString(6, recipient_name);
            ps.setBoolean(7, isMale);
            ps.setInt(8, salerRandomID);
            ps.setInt(9, paymentID);

            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("insertOrder: " + e.getMessage());
        }
    }

    public int getOrderIDByCustomerID(int customerID) {
        String sql = "SELECT MAX(id) AS latest_order_id FROM Orders\n"
                + "WHERE customer_id = ? AND isDelete = 1; ";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, customerID);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt("latest_order_id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public void insertOrderDetail(int orderId, int productID, int quantity) {
        String sql = "INSERT INTO OrderDetails (order_id, product_id, quantity, isDelete) VALUES (?, ?, ?, 1)";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, orderId);
            stm.setInt(2, productID);
            stm.setInt(3, quantity);

            int rowsAffected = stm.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Đã thêm chi tiết đơn hàng thành công.");
            } else {
                System.out.println("Không thể thêm chi tiết đơn hàng.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Product> getProductByOrderID(int orderId) {
        String sql = "SELECT p.image AS product_image, p.title AS product_title, p.id AS product_id,\n"
                + "p.sale_price AS sale_price, od.quantity AS quantity, o.total_cost AS total_cost\n"
                + "FROM OrderDetails od INNER JOIN Orders o ON od.order_id = o.id INNER JOIN Products p ON od.product_id = p.id\n"
                + "WHERE o.id = ? and o.isDelete = 1 AND p.isDelete = 1 AND od.isDelete = 1";

        List<Product> products = new ArrayList<>();

        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, orderId);

            try (ResultSet resultSET = preparedStatement.executeQuery()) {
                while (resultSET.next()) {
                    String image = resultSET.getString("product_image");
                    String title = resultSET.getString("product_title");
                    String id = Integer.toString(resultSET.getInt("product_id"));
                    String salePrice = Float.toString(resultSET.getFloat("sale_price"));
                    String quantity = Integer.toString(resultSET.getInt("quantity"));
                    float totalCost = resultSET.getFloat("total_cost");

                    Product product = new Product(id, title, image, quantity, salePrice, totalCost);
                    products.add(product);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return products;
    }

    
    public Order getInfoByOrderID(int orderId) {
        String sql = "SELECT o.order_date AS order_date, o.address AS address, o.phone AS phone, " +
                     "o.recipient_name AS recipient_name, o.recipient_gender AS recipient_gender, pm.name AS payment_name " +
                     "FROM Orders o " +
                     "INNER JOIN Payments pm ON o.payment_id = pm.id " +
                     "WHERE o.id = ? AND o.isDelete = 1";

        Order order = null;

        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, orderId);

            try (ResultSet resultSET = preparedStatement.executeQuery()) {
                if (resultSET.next()) {
                    String orderDate = resultSET.getString("order_date");
                    String address = resultSET.getString("address");
                    String phone = resultSET.getString("phone");
                    String recipient_name = resultSET.getString("recipient_name");
                    String recipient_gender = Boolean.toString(resultSET.getBoolean("recipient_gender"));
                    String payment_name = resultSET.getString("payment_name");

                    order = new Order(orderDate, address, phone, recipient_name, recipient_gender, payment_name) ;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return order;
    }
    
    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
        Order order = dao.getInfoByOrderID(44);
        System.out.println(order);
    }
    
    // cac method danh cho sale-admin
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

    public List<Order> getOrdersWithPagination(int offset, int limit) {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT o.*,st.fullname AS staff_name , s.name AS status_name, c.name AS customer_name "
                + "FROM Orders o "
                + "INNER JOIN OrderStatus s ON o.status_id = s.id "
                + "INNER JOIN Customers c ON o.customer_id = c.id "
                + "INNER JOIN Staffs st ON o.staff_id = st.id "
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
                    order.setStaff_name(rs.getString("staff_name"));
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

    public void updateOrderStaff(String orderId, String staffId) {
        String sql = "UPDATE Orders SET staff_id = ? WHERE id = ?";

        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setString(1, staffId);
            stm.setString(2, orderId);
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
