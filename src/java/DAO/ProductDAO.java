/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Product;
import dal.DBContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author admin
 */
public class ProductDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;

    public List<Product> getProducts() {
        List<Product> listProduct = new ArrayList<>();
        int count = 0;
        try {
            String sql = "SELECT p.id, p.title, p.image, p.author,p.quantity,p.update_date,p.description,c.name AS category, p.original_price,p.sale_price,p.staff_id,p.status \n"
                    + "FROM Products p JOIN Categories c ON p.category_id = c.id";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getInt("id"));
                String title = rs.getString("title");
                String image = rs.getString("image");
                String author = rs.getString("author");
                String quantity = String.valueOf(rs.getInt("quantity"));
                String updateDate = String.valueOf(rs.getDate("update_date"));
                String description = rs.getString("description");
                String category = rs.getString("category");
                String originalPrice = String.valueOf(rs.getDouble("original_price"));
                String salePrice = String.valueOf(rs.getDouble("sale_price"));
                String staff = String.valueOf(rs.getInt("staff_id"));
                int quantityInt = Integer.parseInt(quantity);
                String status = String.valueOf(rs.getInt("status"));
                Product product = new Product(id, title, image, author, quantity,
                        updateDate, description, category, originalPrice,
                        salePrice, staff, status);
                listProduct.add(product);
                count++;
            }
        } catch (SQLException e) {
            System.out.println("getProducts: " + e.getMessage());
        }
        System.out.println("Count of getProducts: " + count);
        System.out.println("List size of getProducts: " + listProduct.size());

        return listProduct;
    }

    public List<Product> getProductByCategoryID(int categoryID) {
        int count = 0;
        List<Product> listProduct = new ArrayList<>();
        String sql = "SELECT p.id, p.title, p.image, p.author,p.quantity,p.update_date,p.description,c.name AS category, p.original_price,p.sale_price,p.staff_id,p.status \n"
                + "FROM Products p JOIN Categories c ON p.category_id = c.id \n"
                + "WHERE c.id = ? ";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, categoryID);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getInt("id"));
                String title = rs.getString("title");
                String image = rs.getString("image");
                String author = rs.getString("author");
                String quantity = String.valueOf(rs.getInt("quantity"));
                String updateDate = String.valueOf(rs.getDate("update_date"));
                String description = rs.getString("description");
                String category = rs.getString("category");
                String originalPrice = String.valueOf(rs.getDouble("original_price"));
                String salePrice = String.valueOf(rs.getDouble("sale_price"));
                String staff = String.valueOf(rs.getInt("staff_id"));
                int quantityInt = Integer.parseInt(quantity);
                String status = String.valueOf(rs.getInt("status"));

                Product product = new Product(id, title, image, author, quantity,
                        updateDate, description, category, originalPrice,
                        salePrice, staff, status);
                listProduct.add(product);
                count++;
            }
        } catch (SQLException e) {
            System.out.println("getProductByCategoryID: " + e.getMessage());
        }
        System.out.println("Count of getProductByCategoryID: " + count);
        System.out.println("List size of getProductByCategoryID: " + listProduct.size());
        return listProduct;
    }

    public List<Product> getProductByShowStatus() {
        List<Product> listProduct = new ArrayList<>();
        int count = 0;
        String sql = "SELECT p.id, p.title, p.image, p.author,p.quantity,p.update_date,p.description,c.name AS category, p.original_price,p.sale_price,p.staff_id,p.status \n"
                + "FROM Products p JOIN Categories c ON p.category_id = c.id \n"
                + "WHERE  p.status = 1";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getInt("id"));
                String title = rs.getString("title");
                String image = rs.getString("image");
                String author = rs.getString("author");
                String quantity = String.valueOf(rs.getInt("quantity"));
                String updateDate = String.valueOf(rs.getDate("update_date"));
                String description = rs.getString("description");
                String category = rs.getString("category");
                String originalPrice = String.valueOf(rs.getDouble("original_price"));
                String salePrice = String.valueOf(rs.getDouble("sale_price"));
                String staff = String.valueOf(rs.getInt("staff_id"));
                String status = String.valueOf(rs.getInt("status"));

                Product product = new Product(id, title, image, author, quantity,
                        updateDate, description, category, originalPrice,
                        salePrice, staff, status);
                listProduct.add(product);
                count++;
            }
        } catch (SQLException e) {
            System.out.println("getProductByShowStatus: " + e.getMessage());
        }
        System.out.println("Count of getProductByShowStatus: " + count);
        System.out.println("List size of getProductByShowStatus: " + listProduct.size());
        return listProduct;
    }

    public List<Product> getProductByHideStatus() {
        List<Product> listProduct = new ArrayList<>();
        int count = 0;
        String sql = "SELECT p.id, p.title, p.image, p.author,p.quantity,p.update_date,p.description,c.name AS category, p.original_price,p.sale_price,p.staff_id,p.status \n"
                + "FROM Products p JOIN Categories c ON p.category_id = c.id \n"
                + "WHERE  p.status = 0";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getInt("id"));
                String title = rs.getString("title");
                String image = rs.getString("image");
                String author = rs.getString("author");
                String quantity = String.valueOf(rs.getInt("quantity"));
                String updateDate = String.valueOf(rs.getDate("update_date"));
                String description = rs.getString("description");
                String category = rs.getString("category");
                String originalPrice = String.valueOf(rs.getDouble("original_price"));
                String salePrice = String.valueOf(rs.getDouble("sale_price"));
                String staff = String.valueOf(rs.getInt("staff_id"));
                String status = String.valueOf(rs.getInt("status"));

                Product product = new Product(id, title, image, author, quantity,
                        updateDate, description, category, originalPrice,
                        salePrice, staff, status);
                listProduct.add(product);
                count++;
            }
        } catch (SQLException e) {
            System.out.println("getProductByHideStatus: " + e.getMessage());
        }
        System.out.println("Count of getProductByHideStatus: " + count);
        System.out.println("List size of getProductByHideStatus: " + listProduct.size());
        return listProduct;
    }

    public List<Product> getProductByTitle(String titleSearch) {
        int count = 0;
        List<Product> listProduct = new ArrayList<>();
        String sql = "SELECT p.id, p.title, p.image, p.author,p.quantity,p.update_date,p.description,c.name AS category, p.original_price,p.sale_price,p.staff_id,p.status \n"
                + "FROM Products p JOIN Categories c ON p.category_id = c.id \n"
                + "WHERE  p.title LIKE ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + titleSearch + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getInt("id"));
                String title = rs.getString("title");
                String image = rs.getString("image");
                String author = rs.getString("author");
                String quantity = String.valueOf(rs.getInt("quantity"));
                String updateDate = String.valueOf(rs.getDate("update_date"));
                String description = rs.getString("description");
                String category = rs.getString("category");
                String originalPrice = String.valueOf(rs.getDouble("original_price"));
                String salePrice = String.valueOf(rs.getDouble("sale_price"));
                String staff = String.valueOf(rs.getInt("staff_id"));
                int quantityInt = Integer.parseInt(quantity);
                String status = String.valueOf(rs.getInt("status"));

                Product product = new Product(id, title, image, author, quantity,
                        updateDate, description, category, originalPrice,
                        salePrice, staff, status);
                listProduct.add(product);
                count++;
            }
        } catch (SQLException e) {
            System.out.println("getProductByTitle: " + e.getMessage());
        }
        System.out.println("Count of getProductByTitle: " + count);
        System.out.println("List size of getProductByTitle: " + listProduct.size());
        return listProduct;
    }

    public List<Product> getProductByBriefInfo(String breifInfoSearch) {
        int count = 0;
        List<Product> listProduct = new ArrayList<>();
        String sql = "SELECT p.id, p.title, p.image, p.author,p.quantity,p.update_date,p.description,c.name AS category, p.original_price,p.sale_price,p.staff_id,p.status \n"
                + "FROM Products p JOIN Categories c ON p.category_id = c.id \n"
                + "WHERE  p.description LIKE ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + breifInfoSearch + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getInt("id"));
                String title = rs.getString("title");
                String image = rs.getString("image");
                String author = rs.getString("author");
                String quantity = String.valueOf(rs.getInt("quantity"));
                String updateDate = String.valueOf(rs.getDate("update_date"));
                String description = rs.getString("description");
                String category = rs.getString("category");
                String originalPrice = String.valueOf(rs.getDouble("original_price"));
                String salePrice = String.valueOf(rs.getDouble("sale_price"));
                String staff = String.valueOf(rs.getInt("staff_id"));
                int quantityInt = Integer.parseInt(quantity);
                String status = String.valueOf(rs.getInt("status"));

                Product product = new Product(id, title, image, author, quantity,
                        updateDate, description, category, originalPrice,
                        salePrice, staff, status);
                listProduct.add(product);
                count++;
            }
        } catch (SQLException e) {
            System.out.println("getProductByBriefInfo: " + e.getMessage());
        }
        System.out.println("Count of getProductByBriefInfo: " + count);
        System.out.println("List size of getProductByBriefInfo: " + listProduct.size());
        return listProduct;
    }

//    public List<Product> getProductOrderByFieldAsc(String field) {
//        int count = 0;
//        List<Product> listProduct = new ArrayList<>();
//        List<String> validFields = Arrays.asList("id", "title", "image", "author", "quantity", "update_date", "description", "original_price", "sale_price", "staff_id");
//
//        // Kiểm tra xem tên cột có hợp lệ không
//        if (!validFields.contains(field)) {
//            throw new IllegalArgumentException("Invalid field: " + field);
//        }
//        try {
//            String sql = "SELECT p.id, p.title, p.image, p.author,p.quantity,p.update_date,p.description,c.name AS category, p.original_price,p.sale_price,p.staff_id \n"
//                    + "FROM Products p JOIN Categories c ON p.category_id = c.id ORDER BY p." + field + " ASC";
//
//            stm = connection.prepareStatement(sql);
//            rs = stm.executeQuery();
//            while (rs.next()) {
//                String id = String.valueOf(rs.getInt("id"));
//                String title = rs.getString("title");
//                String image = rs.getString("image");
//                String author = rs.getString("author");
//                String quantity = String.valueOf(rs.getInt("quantity"));
//                String updateDate = String.valueOf(rs.getDate("update_date"));
//                String description = rs.getString("description");
//                String category = rs.getString("category");
//                String originalPrice = String.valueOf(rs.getDouble("original_price"));
//                String salePrice = String.valueOf(rs.getDouble("sale_price"));
//                String staff = String.valueOf(rs.getInt("staff_id"));
//                int quantityInt = Integer.parseInt(quantity);
//                String status = "";
//                if (quantityInt > 0) {
//                    status = "In stock";
//                } else {
//                    status = "Out of stock";
//                }
//                Product product = new Product(id, title, image, author, quantity,
//                        updateDate, description, category, originalPrice,
//                        salePrice, staff, status);
//                listProduct.add(product);
//                count++;
//            }
//        } catch (SQLException e) {
//            System.out.println("getProductOrderByFieldAsc: " + e.getMessage());
//        }
//
//        System.out.println("Count of getProductOrderByFieldAsc: " + count);
//        System.out.println("List size of getProductOrderByFieldAsc: " + listProduct.size());
//        return listProduct;
//    }
//
//    public List<Product> getProductOrderByFieldDesc(String field) {
//        int count = 0;
//        List<Product> listProduct = new ArrayList<>();
//        List<String> validFields = Arrays.asList("id", "title", "image", "author", "quantity", "update_date", "description", "original_price", "sale_price", "staff_id");
//
//        // Kiểm tra xem tên cột có hợp lệ không
//        if (!validFields.contains(field)) {
//            throw new IllegalArgumentException("Invalid field: " + field);
//        }
//        try {
//            String sql = "SELECT p.id, p.title, p.image, p.author,p.quantity,p.update_date,p.description,c.name AS category, p.original_price,p.sale_price,p.staff_id,p.status \n"
//                    + "FROM Products p JOIN Categories c ON p.category_id = c.id ORDER BY p." + field + " DESC";
//
//            stm = connection.prepareStatement(sql);
//            rs = stm.executeQuery();
//            while (rs.next()) {
//                String id = String.valueOf(rs.getInt("id"));
//                String title = rs.getString("title");
//                String image = rs.getString("image");
//                String author = rs.getString("author");
//                String quantity = String.valueOf(rs.getInt("quantity"));
//                String updateDate = String.valueOf(rs.getDate("update_date"));
//                String description = rs.getString("description");
//                String category = rs.getString("category");
//                String originalPrice = String.valueOf(rs.getDouble("original_price"));
//                String salePrice = String.valueOf(rs.getDouble("sale_price"));
//                String staff = String.valueOf(rs.getInt("staff_id"));
//                int quantityInt = Integer.parseInt(quantity);
//                String status = "";
//                if (quantityInt > 0) {
//                    status = "In stock";
//                } else {
//                    status = "Out of stock";
//                }
//                Product product = new Product(id, title, image, author, quantity,
//                        updateDate, description, category, originalPrice,
//                        salePrice, staff, status);
//                listProduct.add(product);
//                count++;
//            }
//        } catch (SQLException e) {
//            System.out.println("getProductOrderByFieldDesc: " + e.getMessage());
//        }
//
//        System.out.println("Count of getProductOrderByFieldDesc: " + count);
//        System.out.println("List size of getProductOrderByFieldDesc: " + listProduct.size());
//        return listProduct;
//    }

//    public List<Product> getProductByCategoryOrderByFieldAsc(String field, int categoryID) {
//        int count = 0;
//        List<Product> listProduct = new ArrayList<>();
//        List<String> validFields = Arrays.asList("id", "title", "image", "author", "quantity", "update_date", "description", "original_price", "sale_price", "staff_id");
//
//        // Kiểm tra xem tên cột có hợp lệ không
//        if (!validFields.contains(field)) {
//            throw new IllegalArgumentException("Invalid field: " + field);
//        }
//        String sql = "SELECT p.id, p.title, p.image, p.author,p.quantity,p.update_date,p.description,c.name AS category, p.original_price,p.sale_price,p.staff_id \n"
//                + "FROM Products p JOIN Categories c ON p.category_id = c.id \n"
//                + "WHERE c.id = ? ORDER BY " + field + " ASC";
//        try {
//            stm = connection.prepareStatement(sql);
//            stm.setInt(1, categoryID);
//            rs = stm.executeQuery();
//            while (rs.next()) {
//                String id = String.valueOf(rs.getInt("id"));
//                String title = rs.getString("title");
//                String image = rs.getString("image");
//                String author = rs.getString("author");
//                String quantity = String.valueOf(rs.getInt("quantity"));
//                String updateDate = String.valueOf(rs.getDate("update_date"));
//                String description = rs.getString("description");
//                String category = rs.getString("category");
//                String originalPrice = String.valueOf(rs.getDouble("original_price"));
//                String salePrice = String.valueOf(rs.getDouble("sale_price"));
//                String staff = String.valueOf(rs.getInt("staff_id"));
//                int quantityInt = Integer.parseInt(quantity);
//                String status = "";
//                if (quantityInt > 0) {
//                    status = "In stock";
//                } else {
//                    status = "Out of stock";
//                }
//                Product product = new Product(id, title, image, author, quantity,
//                        updateDate, description, category, originalPrice,
//                        salePrice, staff, status);
//                listProduct.add(product);
//                count++;
//            }
//        } catch (SQLException e) {
//            System.out.println("getProductByCategoryOrderByFieldAsc: " + e.getMessage());
//        }
//        System.out.println("Count of getProductByCategoryOrderByFieldAsc: " + count);
//        System.out.println("List size of getProductByCategoryOrderByFieldAsc: " + listProduct.size());
//        return listProduct;
//    }
//
//    public List<Product> getProductByCategoryOrderByFieldDesc(String field, int categoryID) {
//        int count = 0;
//        List<Product> listProduct = new ArrayList<>();
//        List<String> validFields = Arrays.asList("id", "title", "image", "author", "quantity", "update_date", "description", "original_price", "sale_price", "staff_id");
//
//        // Kiểm tra xem tên cột có hợp lệ không
//        if (!validFields.contains(field)) {
//            throw new IllegalArgumentException("Invalid field: " + field);
//        }
//        String sql = "SELECT p.id, p.title, p.image, p.author,p.quantity,p.update_date,p.description,c.name AS category, p.original_price,p.sale_price,p.staff_id \n"
//                + "FROM Products p JOIN Categories c ON p.category_id = c.id \n"
//                + "WHERE c.id = ? ORDER BY " + field + " DESC";
//        try {
//            stm = connection.prepareStatement(sql);
//            stm.setInt(1, categoryID);
//            rs = stm.executeQuery();
//            while (rs.next()) {
//                String id = String.valueOf(rs.getInt("id"));
//                String title = rs.getString("title");
//                String image = rs.getString("image");
//                String author = rs.getString("author");
//                String quantity = String.valueOf(rs.getInt("quantity"));
//                String updateDate = String.valueOf(rs.getDate("update_date"));
//                String description = rs.getString("description");
//                String category = rs.getString("category");
//                String originalPrice = String.valueOf(rs.getDouble("original_price"));
//                String salePrice = String.valueOf(rs.getDouble("sale_price"));
//                String staff = String.valueOf(rs.getInt("staff_id"));
//                int quantityInt = Integer.parseInt(quantity);
//                String status = "";
//                if (quantityInt > 0) {
//                    status = "In stock";
//                } else {
//                    status = "Out of stock";
//                }
//                Product product = new Product(id, title, image, author, quantity,
//                        updateDate, description, category, originalPrice,
//                        salePrice, staff, status);
//                listProduct.add(product);
//                count++;
//            }
//        } catch (SQLException e) {
//            System.out.println("getProductByCategoryOrderByFieldAsc: " + e.getMessage());
//        }
//        System.out.println("Count of getProductByCategoryOrderByFieldAsc: " + count);
//        System.out.println("List size of getProductByCategoryOrderByFieldAsc: " + listProduct.size());
//        return listProduct;
//    }

//    public List<Product> getProductByStatusOrderByFieldAsc(String field) {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }
//
//    public List<Product> getProductByStatusOrderByFieldDesc(String field) {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }
//
//    public List<Product> getProductByBriefInfoOrderByFieldAsc(String field) {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }
//
//    public List<Product> getProductByBriefInfoOrderByFieldDesc(String field) {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }
//
//    public List<Product> getProductByTitleOrderByFieldAsc(String field) {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }
//
//    public List<Product> getProductByTitleOrderByFieldDesc(String field) {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }

    public void updateHideStatusByID(String id) {
        String sql = "UPDATE [dbo].[Products]\n"
                + "   SET [status] = 0\n"
                + " WHERE id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, Integer.parseInt(id));
            stm.execute();
        } catch (SQLException e) {
            System.out.println("updateHideStatusByID: " + e.getMessage());
        }
    }

    public void updateShowStatusByID(String id) {
        String sql = "UPDATE [dbo].[Products] \n"
                + "   SET [status] = 1 \n"
                + " WHERE id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, Integer.parseInt(id));
            stm.execute();
        } catch (SQLException e) {
            System.out.println("updateShowStatusByID: " + e.getMessage());
        }
    }

}
