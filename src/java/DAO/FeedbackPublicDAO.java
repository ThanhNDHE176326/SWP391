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

    public boolean add(int product_id, String customer_id, int ratedStar, String comment ) {
        boolean isSuccess = false;
        try {
            String strSQL = "INSERT INTO [dbo].[Feedbacks]\n"
                    + "           ([customer_id]\n"
                    + "           ,[product_id]\n"
                    + "           ,[date]\n"
                    + "           ,[rated_star]\n"
                    + "           ,[comment]\n"
                    + "           ,[status]\n"
                    + "           ,[isDelete])\n"
                    + "     VALUES\n"
                    + "           (?, ?, GETDATE(), ?, ?, 1, 1)";

            stm = connection.prepareStatement(strSQL);
            stm.setInt(1, Integer.parseInt(customer_id));
            stm.setInt(2, product_id);
            stm.setInt(3, ratedStar);
            
            stm.setString(4, comment); 
            

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
            System.out.println("Lỗi khi đóng tài nguyên: " + e.getMessage());
        }
    }
public static void main(String[] args){
    FeedbackPublicDAO da = new FeedbackPublicDAO();
    da.add(1, "2", 4, "Good");
    System.out.println("oke");
}
}
