/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Blog;
import Models.Product;
import Models.Slider;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author dat ngo huy
 */
public class HomePageDAO extends dal.DBContext {

    PreparedStatement stm; // dung de thuc hien cau lenh sql
    ResultSet rs;

    public Slider getImage1ByShowStatus() {
        try {
            String strSQL = "SELECT TOP 1 s.image, s.title, p.id AS product_id\n"
                    + "FROM sliders s\n"
                    + "JOIN products p ON s.id = p.slider_id\n"
                    + "WHERE s.status = 1 \n"
                    + "ORDER BY s.start_date DESC;";
            stm = connection.prepareStatement(strSQL);

            rs = stm.executeQuery();
            if (rs.next()) {
                String title = rs.getString("title");
                String image = rs.getString("image");
                String product_id = rs.getString("product_id");

                return new Slider(title, image, product_id);
            }
        } catch (Exception e) {
            System.out.println("getImageByShowStatus:" + e.getMessage());
        }

        return null;

    }

    public Slider getImage2ByShowStatus() {
        try {
            String strSQL = "SELECT TOP 1 s.image, s.title, p.id AS product_id\n"
                    + "FROM sliders s\n"
                    + "JOIN products p ON s.id = p.slider_id\n"
                    + "WHERE s.status = 1 \n"
                    + "AND s.start_date < (SELECT MAX(s2.start_date) \n"
                    + "                    FROM sliders s2 \n"
                    + "                    WHERE s2.status = 1)\n"
                    + "ORDER BY s.start_date DESC;";
            stm = connection.prepareStatement(strSQL);

            rs = stm.executeQuery();
            if (rs.next()) {

                String title = rs.getString("title");
                String image = rs.getString("image");
                String product_id = rs.getString("product_id");

                return new Slider(title, image, product_id);
            }
        } catch (Exception e) {
            System.out.println("getImageByShowStatus:" + e.getMessage());
        }

        return null;

    }

    public Slider getImage3ByShowStatus() {
        try {
            String strSQL = "SELECT TOP 1 s.image, s.title, p.id AS product_id\n"
                    + "FROM sliders s\n"
                    + "JOIN products p ON s.id = p.slider_id\n"
                    + "WHERE s.status = 1 \n"
                    + "AND s.start_date < (\n"
                    + "    SELECT MAX(s2.start_date) \n"
                    + "    FROM sliders s2 \n"
                    + "    WHERE s2.status = 1 \n"
                    + "    AND s2.start_date < (SELECT MAX(s3.start_date) \n"
                    + "                         FROM sliders s3 \n"
                    + "                         WHERE s3.status = 1)\n"
                    + ")\n"
                    + "ORDER BY s.start_date DESC;";
            stm = connection.prepareStatement(strSQL);

            rs = stm.executeQuery();
            if (rs.next()) {
                String title = rs.getString("title");
                String image = rs.getString("image");
                String product_id = rs.getString("product_id");

                return new Slider(title, image, product_id);
            }
        } catch (Exception e) {
            System.out.println("getImageByShowStatus:" + e.getMessage());
        }

        return null;

    }

    public Blog getTop1Blog() {
        try {
            String strSQL = "SELECT top 1 * FROM Blogs ORDER BY update_date DESC";
            stm = connection.prepareStatement(strSQL);

            rs = stm.executeQuery();
            if (rs.next()) {
                String id = rs.getString("id");
                String staffId = rs.getString("staff_id");
                String title = rs.getString("title");
                String categoryBlogId = rs.getString("category_blog_id");
                String image = rs.getString("image");
                String updateDate = rs.getString("update_date");
                String description = rs.getString("description");
                String content = rs.getString("content");
                String isDelete = rs.getString("isDelete");
                return new Blog(id, staffId, title, categoryBlogId, image, updateDate, description, content, isDelete);

            }
        } catch (Exception e) {
            System.out.println("getTop1Blog:" + e.getMessage());
        }

        return null;

    }

    public ArrayList<Product> getPopularProducts() {
        ArrayList<Product> list = new ArrayList<Product>();
        try {
            String strSQL = "SELECT TOP 6 p.id, p.title, p.image, p.description, p.original_price, p.sale_price, p.quantity, p.hold, p.status, " +
                "COALESCE(SUM(od.quantity), 0) AS total_sold " +
                "FROM Products p " +
                "LEFT JOIN OrderDetails od ON p.id = od.product_id " +
                "GROUP BY p.id, p.title, p.image, p.description, p.original_price, p.sale_price, p.quantity, p.hold, p.status " +
                "ORDER BY total_sold DESC;";

            stm = connection.prepareStatement(strSQL);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getInt("id"));
                String title = rs.getString("title");
                String image = rs.getString("image");
                String description = rs.getString("description");
                String originalPrice = String.valueOf(rs.getInt("original_price"));
                String salePrice = String.valueOf(rs.getInt("sale_price"));
                String quantity = String.valueOf(rs.getInt("quantity"));
                int hold = rs.getInt("hold");
                String status = String.valueOf(rs.getInt("status"));
                Product product = new Product(id, title, image, description, originalPrice, salePrice, quantity, hold, status);
                list.add(product);
            }
            return list;
        } catch (Exception e) {
            System.out.println("getPopularProducts:" + e.getMessage());
        }
        return null;
    }

    public static void main(String[] args) {
        HomePageDAO da = new HomePageDAO();
        ArrayList<Product> list = da.getPopularProducts();
        for (Product product : list) {
            System.out.println(product);
        }

    }
}
