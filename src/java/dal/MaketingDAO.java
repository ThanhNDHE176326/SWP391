/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Models.CustomerUpdateHistory;
import Models.Customer;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import java.util.Date;

/**
 *
 * @author Admin
 */
public class MaketingDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;

    // Phương thức để lấy tất cả dữ liệu khách hàng
    public List<Customer> findAll() {
        List<Customer> listFound = new ArrayList<>();
        //- connect with DB
        connection = connection;
        //- chuẩn bị câu lệnh SQL
        String sql = "SELECT c.*, CASE WHEN EXISTS (SELECT 1 FROM Orders AS o WHERE o.customer_id = c.id) THEN 'Customer' "
                + "WHEN EXISTS (SELECT 1 FROM Carts AS ca WHERE ca.customer_id = c.id) THEN 'Potential' "
                + "ELSE 'Contact' END AS customerType FROM Customers AS c";

        try {
            //- Tạo đối tượng Preparestm
            stm = connection.prepareStatement(sql);
            //- Set parameter ( optional )
            //- Thực thi câu lệnh
            rs = stm.executeQuery();
            //- trả về kết quả
            while (rs.next()) {
                String id = Integer.toString(rs.getInt("id"));
                String name = rs.getString("name");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                String gender = Boolean.toString(rs.getBoolean("gender"));
                String status = rs.getString("customerType");

                Customer customer = new Customer(id, name, username, password, email, phone, address, gender, status);
                listFound.add(customer);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return listFound;
    }

    public boolean addCustomer(String name, String username, String email, String password, String phone, String address, int gender, int status) {
        try {
            connection = connection;
            String sql = "INSERT INTO Customers (name, username, email, password, phone, address, gender, isDelete) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            stm.setString(2, username);
            stm.setString(3, email);
            stm.setString(4, password);
            stm.setString(5, phone);
            stm.setString(6, address);
            stm.setInt(7, gender);
            stm.setInt(8, status);
            int rowsInserted = stm.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public Customer getCustomerById(int customerId) {
        Customer customer = null;
        try {
            connection = connection;
            String sql = "SELECT c.*, CASE WHEN EXISTS (SELECT 1 FROM Orders AS o WHERE o.customer_id = c.id) THEN 'Customer' "
                    + "WHEN EXISTS (SELECT 1 FROM Carts AS ca WHERE ca.customer_id = c.id) THEN 'Potential' "
                    + "ELSE 'Contact' END AS customerType FROM Customers AS c WHERE id = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, customerId);
            rs = stm.executeQuery();

            if (rs.next()) {
                String id = Integer.toString(rs.getInt("id"));
                String name = rs.getString("name");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                String gender = Boolean.toString(rs.getBoolean("gender"));
                String status = rs.getString("customerType");
                customer = new Customer(id, name, username, password, email, phone, address, gender, status);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return customer;
    }

    public boolean updateCustomer(int id, String name, String username, String email, String phone, String address, int gender) {
        try {
            connection = connection;
            String sql = "UPDATE Customers SET name = ?, username = ?, email = ?, phone = ?, address = ?, gender = ? WHERE id = ?";
            stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            stm.setString(2, username);
            stm.setString(3, email);
            stm.setString(4, phone);
            stm.setString(5, address);
            stm.setInt(6, gender);
            stm.setInt(7, id);
            int rowsUpdated = stm.executeUpdate();

            if (rowsUpdated > 0) {
                // Ghi log cập nhật vào bảng CustomerUpdateLogs
                logCustomerUpdate(id, name, email, phone, address, gender);
            }

            return rowsUpdated > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

// Phương thức để ghi log cập nhật vào bảng CustomerUpdateLogs
    private void logCustomerUpdate(int customerId, String name, String email, String phone, String address, int gender) {
        try {
            connection = connection;
            String sql = "INSERT INTO CustomerUpdateLogs (customer_id, staff_id, update_date, email_new, name_new, gender_new, phone_new, address_new) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, customerId);
            // staff_id có thể lấy từ người đăng nhập hoặc một giá trị mặc định
            stm.setInt(2, 1); // Ví dụ, giá trị 1 là ID của nhân viên
            stm.setTimestamp(3, new java.sql.Timestamp(System.currentTimeMillis()));

            // Lưu giá trị mới của các trường
            stm.setString(4, email); // email_new
            stm.setString(5, name); // name_new
            stm.setString(6, gender == 1 ? "Nam" : "Nữ"); // gender_new
            stm.setString(7, phone); // phone_new
            stm.setString(8, address); // address_new

            stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public List<CustomerUpdateHistory> getCustomerUpdateHistory() {
        List<CustomerUpdateHistory> historyList = new ArrayList<>();
        try {
            connection = connection;
            String sql = "SELECT cu.id AS log_id, cu.update_date, cu.email_new, cu.name_new, cu.gender_new, cu.phone_new, cu.address_new, "
                    + "s.fullname AS updater_name "
                    + "FROM CustomerUpdateLogs cu "
                    + "JOIN Staffs s ON cu.staff_id = s.id "
                    + "ORDER BY cu.update_date DESC";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int logId = rs.getInt("log_id");
                Date updateDate = rs.getDate("update_date");
                String emailNew = rs.getString("email_new");
                String nameNew = rs.getString("name_new");
                String genderNew = rs.getString("gender_new");
                String phoneNew = rs.getString("phone_new");
                String addressNew = rs.getString("address_new");
                String updaterName = rs.getString("updater_name");

                // Tạo một đối tượng CustomerUpdateHistory và thêm vào danh sách
                CustomerUpdateHistory history = new CustomerUpdateHistory(logId, updateDate, emailNew, nameNew, genderNew, phoneNew, addressNew, updaterName);
                historyList.add(history);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return historyList;
    }

    public int getTotalCustomer() {
        connection = connection;
        String sql = "SELECT count(*) FROM [dbo].[Customers]";

        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();

            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return 0;
    }

    public List<Customer> pagingCustomer(int index) {
        List<Customer> listFound = new ArrayList<>();
        connection = connection;
        String sql = "SELECT c.*, CASE WHEN EXISTS (SELECT 1 FROM Orders AS o WHERE o.customer_id = c.id) THEN 'Customer' "
                + "WHEN EXISTS (SELECT 1 FROM Carts AS ca WHERE ca.customer_id = c.id) THEN 'Potential' "
                + "ELSE 'Contact' END AS customerType FROM Customers AS c "
                + "ORDER BY id OFFSET ? ROWS FETCH NEXT 7 ROWS ONLY";

        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, (index - 1) * 7);
            rs = stm.executeQuery();

            while (rs.next()) {
                String id = Integer.toString(rs.getInt("id"));
                String name = rs.getString("name");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                String gender = Boolean.toString(rs.getBoolean("gender"));
                String status = rs.getString("customerType");
                Customer customer = new Customer(id, name, username, password, email, phone, address, gender, status);
                listFound.add(customer);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return listFound;
    }

    public int countCustomerBySearch(String txtSearch) {
        connection = connection;
        String sql = "SELECT COUNT(*) FROM Customers WHERE username LIKE ? OR email LIKE ? OR phone LIKE ?";

        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + txtSearch + "%");
            stm.setString(2, "%" + txtSearch + "%");
            stm.setString(3, "%" + txtSearch + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return 0;
    }

    public List<Customer> searchCustomer(String txtSearch, int index) {
        List<Customer> listFound = new ArrayList<>();
        connection = connection;
        String sql = "SELECT c.*, CASE WHEN EXISTS (SELECT 1 FROM Orders AS o WHERE o.customer_id = c.id) THEN 'Customer' "
                + "WHEN EXISTS (SELECT 1 FROM Carts AS ca WHERE ca.customer_id = c.id) THEN 'Potential' "
                + "ELSE 'Contact' END AS customerType FROM Customers AS c "
                + "WHERE username LIKE ? OR email LIKE ? OR phone LIKE ? ORDER BY id OFFSET ? ROWS FETCH NEXT 7 ROWS ONLY;";

        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + txtSearch + "%");
            stm.setString(2, "%" + txtSearch + "%");
            stm.setString(3, "%" + txtSearch + "%");
            stm.setInt(4, index);
            rs = stm.executeQuery();

            while (rs.next()) {
                String id = Integer.toString(rs.getInt("id"));
                String name = rs.getString("name");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                String gender = Boolean.toString(rs.getBoolean("gender"));
                String status = rs.getString("customerType");
                Customer customer = new Customer(id, name, username, password, email, phone, address, gender, status);
                listFound.add(customer);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return listFound;
    }

    public int countCustomerByStatus(String statusFilter) {
        connection = connection;

        try {
            if ("Customer".equals(statusFilter)) {
                String sql = "SELECT COUNT(*) FROM Customers AS c WHERE c.id IN (SELECT DISTINCT o.customer_id FROM Orders AS o)";
                stm = connection.prepareStatement(sql);
            } else if ("Potential".equals(statusFilter)) {
                String sql = "SELECT COUNT(*) FROM Customers AS c WHERE c.id IN (SELECT DISTINCT ca.customer_id FROM Carts AS ca) AND c.id NOT IN (SELECT DISTINCT o.customer_id FROM Orders AS o)";
                stm = connection.prepareStatement(sql);
            } else if ("Contact".equals(statusFilter)) {
                String sql = "SELECT COUNT(*) FROM Customers AS c WHERE c.id NOT IN (SELECT DISTINCT cp.customer_id FROM Carts AS cp)";
                stm = connection.prepareStatement(sql);
            }

            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return 0;
    }

    public List<Customer> getSortedAllCustomers(int index, String sortBy, String sortOrder) {
        List<Customer> listFound = new ArrayList<>();

        // Thêm điều kiện sắp xếp nếu được chỉ định
        try {
            connection = connection;
            String sql = "SELECT c.*, CASE WHEN EXISTS (SELECT 1 FROM Orders AS o WHERE o.customer_id = c.id) THEN 'Customer' "
                    + "WHEN EXISTS (SELECT 1 FROM Carts AS ca WHERE ca.customer_id = c.id) THEN 'Potential' "
                    + "ELSE 'Contact' END AS customerType FROM Customers AS c";
            if (sortBy != null && !sortBy.isEmpty() && sortOrder != null && !sortOrder.isEmpty()) {
                sql += " ORDER BY " + sortBy + " " + sortOrder;
            }
            sql += " OFFSET ? ROWS FETCH NEXT 7 ROWS ONLY";
            stm = connection.prepareStatement(sql);
            if (index > 0) {
                stm.setInt(1, (index - 1) * 7); // Vị trí bắt đầu dòng
            }
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = Integer.toString(rs.getInt("id"));
                String name = rs.getString("name");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                String gender = Boolean.toString(rs.getBoolean("gender"));
                String status = rs.getString("customerType");

                Customer customer = new Customer(id, name, username, password, email, phone, address, gender, status);
                listFound.add(customer);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return listFound;
    }

    public List<Customer> getSortedStatusCustomers(String statusFilter, int index, String sortBy, String sortOrder) {
        List<Customer> listFound = new ArrayList<>();
        String sql = ""; // Khai báo và khởi tạo biến sql

        try {
            connection = connection;

            // Thêm điều kiện trạng thái khách hàng
            if ("Customer".equals(statusFilter)) {
                sql = "SELECT c.*, CASE "
                        + "WHEN c.id IN (SELECT DISTINCT o.customer_id FROM Orders AS o) THEN 'Customer' "
                        + "WHEN c.id IN (SELECT DISTINCT ca.customer_id FROM Carts AS ca) AND c.id NOT IN (SELECT DISTINCT o.customer_id FROM Orders AS o) THEN 'Potential' "
                        + "ELSE 'Contact' "
                        + "END AS customerType "
                        + "FROM Customers AS c "
                        + "WHERE c.id IN (SELECT DISTINCT o.customer_id FROM Orders AS o)";
            } else if ("Potential".equals(statusFilter)) {
                sql = "SELECT c.*, CASE "
                        + "WHEN c.id IN (SELECT DISTINCT o.customer_id FROM Orders AS o) THEN 'Customer' "
                        + "WHEN c.id IN (SELECT DISTINCT ca.customer_id FROM Carts AS ca) AND c.id NOT IN (SELECT DISTINCT o.customer_id FROM Orders AS o) THEN 'Potential' "
                        + "ELSE 'Contact' "
                        + "END AS customerType "
                        + "FROM Customers AS c "
                        + "WHERE c.id IN (SELECT DISTINCT ca.customer_id FROM Carts AS ca) AND c.id NOT IN (SELECT DISTINCT o.customer_id FROM Orders AS o)";
            } else if ("Contact".equals(statusFilter)) {
                sql = "SELECT c.*, CASE "
                        + "WHEN c.id IN (SELECT DISTINCT o.customer_id FROM Orders AS o) THEN 'Customer' "
                        + "WHEN c.id IN (SELECT DISTINCT ca.customer_id FROM Carts AS ca) AND c.id NOT IN (SELECT DISTINCT o.customer_id FROM Orders AS o) THEN 'Potential' "
                        + "ELSE 'Contact' "
                        + "END AS customerType "
                        + "FROM Customers AS c "
                        + "WHERE c.id NOT IN (SELECT DISTINCT cp.customer_id FROM Carts AS cp)";
            }

            // Thêm điều kiện sắp xếp nếu được chỉ định
            if (sortBy != null && !sortBy.isEmpty() && sortOrder != null && !sortOrder.isEmpty()) {
                sql += " ORDER BY " + sortBy + " " + sortOrder;
            } else {
                sql += " ORDER BY c.id ASC"; // Mặc định sắp xếp theo id tăng dần nếu không có sortBy và sortOrder
            }

            sql += " OFFSET ? ROWS FETCH NEXT 7 ROWS ONLY";

            stm = connection.prepareStatement(sql);

            if (index > 0) {
                stm.setInt(1, (index - 1) * 7); // Vị trí bắt đầu dòng
            } else {
                stm.setInt(1, 0); // Bắt đầu từ dòng đầu tiên nếu index <= 0
            }

            rs = stm.executeQuery();
            while (rs.next()) {
                String id = Integer.toString(rs.getInt("id"));
                String name = rs.getString("name");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                String gender = Boolean.toString(rs.getBoolean("gender"));
                String status = rs.getString("customerType"); // Sử dụng cột mới customerType

                Customer customer = new Customer(id, name, username, password, email, phone, address, gender, status);
                listFound.add(customer);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return listFound;
    }

    public boolean checkIfUsernameExists(String username) {
        //- connect with DB
        connection = connection;
        //- chuẩn bị câu lệnh SQL
        String sql = "SELECT COUNT(*) AS count\n"
                + "FROM [dbo].[Customers]\n"
                + "WHERE username = ?";

        try {
            //- Tạo đối tượng Preparestm
            stm = connection.prepareStatement(sql);
            //- Set parameter
            stm.setString(1, username);
            //- Thực thi câu lệnh
            rs = stm.executeQuery();
            //- trả về kết quả
            if (rs.next()) {
                int count = rs.getInt("count");
                return count > 0; // Trả về true nếu username đã tồn tại, ngược lại trả về false
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return false; // Trả về false nếu có lỗi xảy ra
    }

    public static void main(String[] args) {
        // Khởi tạo đối tượng để truy cập cơ sở dữ liệu
        MaketingDAO dao = new MaketingDAO();
        // Gọi phương thức để lấy lịch sử cập nhật khách hàng
        String name = "John ";
        String username = "johndoe";
        String email = "johndoe@example.com";
        String password = "password123";
        String phone = "1234567890";
        String address = "123 Main St, City, Country";
        int gender = 1; // Đặt giá trị tương ứng với giới tính (ví dụ: 1 cho Nam, 2 cho Nữ)
        int status = 0; 
         boolean result = dao.addCustomer(name, username, email, password, phone, address, gender, status);
            if (result) {
                System.out.println("Thêm khách hàng thành công!");
            } else {
                System.out.println("Thêm khách hàng thất bại!");
            }
    }
}
