package DAO;

import Models.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class FeedbackPublicDAO extends dal.DBContext {

    PreparedStatement stm; // Dùng để thực hiện câu lệnh SQL
    ResultSet rs;

    public Product getProductById(String id) {
        Product product = null;
        try {
            String strSQL = "SELECT title, image, description FROM Products WHERE id = ?";
            stm = connection.prepareStatement(strSQL);
            stm.setInt(1, Integer.parseInt(id));

            rs = stm.executeQuery();
            if (rs.next()) {
                String title = rs.getString("title");
                String image = rs.getString("image");
                String description = rs.getString("description");

                product = new Product(title, image, description);
            }
        } catch (SQLException | NumberFormatException e) {
            System.out.println("Lỗi khi lấy sản phẩm theo ID: " + e.getMessage());
        } finally {
            closeResources();
        }
        return product;
    }

    public boolean add(String ratedStar, String comment, String username, String productId) {
        boolean isSuccess = false;
        try {
            String strSQL = "INSERT INTO Feedbacks (date, rated_star, comment, customer_id, status, isDelete, product_id) " +
                            "SELECT GETDATE(), ?, ?, (SELECT id FROM Customers WHERE username = ?), 1, 1, p.id " +
                            "FROM Products p " +
                            "WHERE p.id = ?";
            
            stm = connection.prepareStatement(strSQL);
            
            stm.setString(1, ratedStar); // Điểm đánh giá
            stm.setString(2, comment); // Bình luận
            stm.setString(3, username); // Username của khách hàng
            stm.setString(4, productId); // ID của sản phẩm

            int rowsAffected = stm.executeUpdate();
            
            // Kiểm tra xem có insert thành công hay không
            if (rowsAffected > 0) {
                isSuccess = true;
            }

        } catch (SQLException e) {
            System.out.println("Lỗi khi thêm feedback: " + e.getMessage());
        } finally {
            closeResources();
        }
        return isSuccess;
    }

    private void closeResources() {
        try {
            if (rs != null) rs.close();
            if (stm != null) stm.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            System.out.println("Lỗi khi đóng tài nguyên: " + e.getMessage());
        }
    }

   
}
