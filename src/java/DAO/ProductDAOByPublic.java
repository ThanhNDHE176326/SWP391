/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Category;
import Models.Feedback;
import Models.Product;
import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

/**
 *
 * @author Admin
 */
public class ProductDAOByPublic extends DBContext {

    PreparedStatement stm;
    ResultSet rs;

    public List<Category> getCategory() {
        List<Category> listFound = new ArrayList<>();
        //- connect with DB
        connection = connection;
        //- chuẩn bị câu lệnh SQL
        String sql = "select name from Categories";

        try {
            //- Tạo đối tượng Preparestm
            stm = connection.prepareStatement(sql);
            //- Set parameter ( optional )
            //- Thực thi câu lệnh
            rs = stm.executeQuery();
            //- trả về kết quả
            while (rs.next()) {
                String name = rs.getString("name");
                Category category = new Category(name);
                listFound.add(category);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return listFound;
    }

    public List<Product> getAllProduct(int index) {
        List<Product> listFound = new ArrayList<>();
        //- connect with DB
        connection = connection;
        //- chuẩn bị câu lệnh SQL
        String sql = "select id,title,image,description,original_price,sale_price,quantity,status from Products order by id desc "
                + "offset ? rows fetch next 6 rows only";

        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, (index - 1) * 6);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getInt("id"));
                String title = rs.getString("title");
                String image = rs.getString("image");
                String description = rs.getString("description");
                String originalPrice = String.valueOf(rs.getInt("original_price"));
                String salePrice = String.valueOf(rs.getInt("sale_price"));
                String quantity = String.valueOf(rs.getInt("quantity"));
                String status = String.valueOf(rs.getInt("status"));
                Product product = new Product(id, title, image, description, originalPrice, salePrice, quantity, status);
                listFound.add(product);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return listFound;
    }

    public int getTotalProduct() {
        connection = connection;
        String sql = "Select count(*) from Products";

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

    public List<Product> searchProductPublic(String txtSearch, int index) {
        List<Product> listFound = new ArrayList<>();
        connection = connection;
        String sql = "SELECT id, title, image, description, original_price, sale_price, quantity,status FROM Products \n"
                + "WHERE title LIKE ? \n"
                + "ORDER BY id DESC OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY;";

        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + txtSearch + "%");
            stm.setInt(2, (index - 1) * 6);
            rs = stm.executeQuery();

            while (rs.next()) {
                String id = String.valueOf(rs.getInt("id"));
                String title = rs.getString("title");
                String image = rs.getString("image");
                String description = rs.getString("description");
                String originalPrice = String.valueOf(rs.getInt("original_price"));
                String salePrice = String.valueOf(rs.getInt("sale_price"));
                String quantity = String.valueOf(rs.getInt("quantity"));
                String status = String.valueOf(rs.getInt("status"));
                Product product = new Product(id, title, image, description, originalPrice, salePrice, quantity, status);
                listFound.add(product);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return listFound;
    }

    public int countProductPublicBySearch(String txtSearch) {
        connection = connection;
        String sql = "Select count(*) from Products where title like ?";

        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + txtSearch + "%");
            rs = stm.executeQuery();

            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return 0;
    }

    public int countProductPublicByCategory(String category) {
        connection = connection;
        String sql = "SELECT count(*) FROM Products p JOIN Categories c ON p.category_id = c.id\n"
                + "WHERE c.name = N'" + category + "'";

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

    public List<Product> filterProductPublicByCatgory(String category, int index) {
        List<Product> listFound = new ArrayList<>();
        connection = connection;
        String sql = "SELECT p.id, p.title, p.description, p.image, p.original_price, p.sale_price,quantity,status FROM Products p JOIN Categories c ON p.category_id = c.id\n"
                + "WHERE c.name = N'" + category + "' \n"
                + "ORDER BY p.id DESC OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY;";

        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, (index - 1) * 6);
            rs = stm.executeQuery();

            while (rs.next()) {
                String id = String.valueOf(rs.getInt("id"));
                String title = rs.getString("title");
                String image = rs.getString("image");
                String description = rs.getString("description");
                String originalPrice = String.valueOf(rs.getInt("original_price"));
                String salePrice = String.valueOf(rs.getInt("sale_price"));
                String quantity = String.valueOf(rs.getInt("quantity"));
                String status = String.valueOf(rs.getInt("status"));
                Product product = new Product(id, title, image, description, originalPrice, salePrice, quantity, status);
                listFound.add(product);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return listFound;
    }

    public List<Product> getPopularProducts(int index) {
        List<Product> listFound = new ArrayList<>();
        //- connect with DB
        connection = connection;
        //- chuẩn bị câu lệnh SQL
        String sql = "SELECT p.id, p.title, p.image, p.description, p.original_price, p.sale_price, p.quantity, p.status, " +
             "COALESCE(SUM(od.quantity), 0) AS total_sold " +
             "FROM Products p " +
             "LEFT JOIN OrderDetails od ON p.id = od.product_id " +
             "GROUP BY p.id, p.title, p.image, p.description, p.original_price, p.sale_price, p.quantity, p.status " +
             "ORDER BY total_sold DESC " +
             "OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY;";


        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, (index - 1) * 6);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getInt("id"));
                String title = rs.getString("title");
                String image = rs.getString("image");
                String description = rs.getString("description");
                String originalPrice = String.valueOf(rs.getInt("original_price"));
                String salePrice = String.valueOf(rs.getInt("sale_price"));
                String quantity = String.valueOf(rs.getInt("quantity"));
                String status = String.valueOf(rs.getInt("status"));
                Product product = new Product(id, title, image, description, originalPrice, salePrice, quantity, status);
                listFound.add(product);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return listFound;
    }

    public List<Product> filterProductPublicByPrice(String sort, int index) {
        List<Product> listFound = new ArrayList<>();
        connection = connection;
        String sql = "SELECT id, title, image, description, original_price, sale_price,quantity,status FROM Products";

        if (sort.equalsIgnoreCase("asc")) {
            sql += " ORDER BY sale_price ASC";
        } else if (sort.equalsIgnoreCase("desc")) {
            sql += " ORDER BY sale_price DESC";
        }

        sql += " OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY;";

        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, (index - 1) * 6);
            rs = stm.executeQuery();

            while (rs.next()) {
                String id = String.valueOf(rs.getInt("id"));
                String title = rs.getString("title");
                String image = rs.getString("image");
                String description = rs.getString("description");
                String originalPrice = String.valueOf(rs.getInt("original_price"));
                String salePrice = String.valueOf(rs.getInt("sale_price"));
                String quantity = String.valueOf(rs.getInt("quantity"));
                String status = String.valueOf(rs.getInt("status"));
                Product product = new Product(id, title, image, description, originalPrice, salePrice, quantity, status);
                listFound.add(product);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return listFound;
    }

    public List<Product> filterProductPublicByUpdateDate(String filter, int index) {
        List<Product> listFound = new ArrayList<>();
        connection = connection;
        String sql = "SELECT id, title, image, description, original_price, sale_price,quantity,status FROM Products";

        if (filter.equalsIgnoreCase("asc")) {
            sql += " ORDER BY update_date ASC";
        } else if (filter.equalsIgnoreCase("desc")) {
            sql += " ORDER BY update_date DESC";
        }

        sql += " OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY;";

        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, (index - 1) * 6);
            rs = stm.executeQuery();

            while (rs.next()) {
                String id = String.valueOf(rs.getInt("id"));
                String title = rs.getString("title");
                String image = rs.getString("image");
                String description = rs.getString("description");
                String originalPrice = String.valueOf(rs.getInt("original_price"));
                String salePrice = String.valueOf(rs.getInt("sale_price"));
                String quantity = String.valueOf(rs.getInt("quantity"));
                String status = String.valueOf(rs.getInt("status"));
                Product product = new Product(id, title, image, description, originalPrice, salePrice, quantity, status);
                listFound.add(product);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return listFound;
    }

    public Product getProductPublicDetail(int indexId) {
        Product product = null;
        connection = connection;
        //- chuẩn bị câu lệnh SQL
        String sql = "SELECT p.id, p.title, p.image, p.author, p.quantity, p.update_date, p.description, p.original_price, p.sale_price, c.name AS category\n"
                + "FROM Products p JOIN Categories c ON p.category_id = c.id WHERE p.id = ?;";

        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, indexId);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getInt("id"));
                String title = rs.getString("title");
                String image = rs.getString("image");
                String author = rs.getString("author");
                String quantity = String.valueOf(rs.getInt("quantity"));
                String update_date = String.valueOf(rs.getDate("update_date"));
                String description = rs.getString("description");
                String originalPrice = String.valueOf(rs.getInt("original_price"));
                String salePrice = String.valueOf(rs.getInt("sale_price"));
                String category = rs.getString("category");
                product = new Product(id, title, image, author, quantity, update_date, description, category, originalPrice, salePrice);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return product;
    }

    public List<Feedback> getFeedbackByIdProduct(int indexId, int index) {
        List<Feedback> listFound = new ArrayList<>();
        connection = connection;
        String sql = "SELECT c.[name] AS customer, f.[date] AS date, f.rated_star, f.comment\n"
                + "FROM Feedbacks f INNER JOIN Customers c ON f.customer_id = c.id\n"
                + "WHERE f.product_id = ? ORDER BY f.[date] DESC OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY;";

        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, indexId);
            stm.setInt(2, (index - 1) * 5);
            rs = stm.executeQuery();
            while (rs.next()) {
                String customer = rs.getString("customer");
                String comment = rs.getString("comment");
                String ratedStar = String.valueOf(rs.getInt("rated_star"));
                String date = String.valueOf(rs.getDate("date"));
                Feedback feedback = new Feedback(customer, date, ratedStar, comment);
                listFound.add(feedback);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return listFound;
    }

    public int countFeedbackOfAProduct(int indexId) {
        connection = connection;
        String sql = "SELECT COUNT(*) AS feedback_count FROM Feedbacks\n"
                + "WHERE product_id = ? AND isDelete = 1;";

        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, indexId);
            rs = stm.executeQuery();

            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return 0;
    }

    public List<Product> getTop6ProductNew() {
        List<Product> listFound = new ArrayList<>();
        //- connect with DB
        connection = connection;
        //- chuẩn bị câu lệnh SQL
        String sql = "SELECT TOP 6 id,title,image,description,original_price,sale_price,quantity,status\n"
                + "FROM Products ORDER BY update_date DESC;";

        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getInt("id"));
                String title = rs.getString("title");
                String image = rs.getString("image");
                String description = rs.getString("description");
                String originalPrice = String.valueOf(rs.getInt("original_price"));
                String salePrice = String.valueOf(rs.getInt("sale_price"));
                String quantity = String.valueOf(rs.getInt("quantity"));
                String status = String.valueOf(rs.getInt("status"));
                Product product = new Product(id, title, image, description, originalPrice, salePrice, quantity, status);
                listFound.add(product);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return listFound;
    }

    public static void main(String[] args) {
        ProductDAOByPublic dao = new ProductDAOByPublic();
        List<Product> listFound = dao.getPopularProducts(1);
        for (Product product : listFound) {
            System.out.println(product);
        }
    }
}
