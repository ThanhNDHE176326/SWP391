/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Product;
import dal.DBContext;
import java.sql.*;
import java.time.LocalDate;
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

//    public static void main(String[] args) {
//        ProductDAO dao = new ProductDAO();
//        int count = dao.getTotalProductBySearch("Sách");
//        System.out.println("count = " + count);
//        System.out.println(dao.getTotalProductByCategoryID(1));
//        List<Product> list = dao.getProductPagingByCategoryID(4, 2);
////        System.out.println("list size = " + list.size());
//    }
    //dem so luong product trong db
    public int getTotalProduct() {
        String sql = "SELECT COUNT(*) FROM Products";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("getTotalProduct: " + e.getMessage());
        }
        return 0;
    }

    public List<Product> pagingProduct(int index) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p.id, p.title, p.image, p.author,p.quantity,p.update_date,p.description,c.name AS category, p.original_price,p.sale_price,p.status \n"
                + "FROM Products p JOIN Categories c ON p.category_id = c.id\n"
                + "ORDER BY id\n"
                + "OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, ((index - 1) * 10));
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
//                int quantityInt = Integer.parseInt(quantity);
                String status = String.valueOf(rs.getInt("status"));
                Product product = new Product(id, title, image, author, quantity,
                        updateDate, description, category, originalPrice,
                        salePrice, status);
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println("pagingProduct: " + e.getMessage());
        }
        return list;
    }

    public List<Product> getProducts() {
        List<Product> listProduct = new ArrayList<>();
        int count = 0;
        try {
            String sql = "SELECT p.id, p.title, p.image, p.author,p.quantity,p.update_date,p.description,c.name AS category, p.original_price,p.sale_price,p.status \n"
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
                String status = String.valueOf(rs.getInt("status"));
                Product product = new Product(id, title, image, author, quantity,
                        updateDate, description, category, originalPrice,
                        salePrice, status);
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
        String sql = "SELECT p.id, p.title, p.image, p.author,p.quantity,p.update_date,p.description,c.name AS category, p.original_price,p.sale_price,p.status \n"
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
                int quantityInt = Integer.parseInt(quantity);
                String status = String.valueOf(rs.getInt("status"));

                Product product = new Product(id, title, image, author, quantity,
                        updateDate, description, category, originalPrice,
                        salePrice, status);
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
        String sql = "SELECT p.id, p.title, p.image, p.author,p.quantity,p.update_date,p.description,c.name AS category, p.original_price,p.sale_price,p.status \n"
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
                String status = String.valueOf(rs.getInt("status"));

                Product product = new Product(id, title, image, author, quantity,
                        updateDate, description, category, originalPrice,
                        salePrice, status);
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
        String sql = "SELECT p.id, p.title, p.image, p.author,p.quantity,p.update_date,p.description,c.name AS category, p.original_price,p.sale_price,p.status \n"
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
                String status = String.valueOf(rs.getInt("status"));

                Product product = new Product(id, title, image, author, quantity,
                        updateDate, description, category, originalPrice,
                        salePrice, status);
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
        String sql = "SELECT p.id, p.title, p.image, p.author,p.quantity,p.update_date,p.description,c.name AS category, p.original_price,p.sale_price,p.status \n"
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
                String status = String.valueOf(rs.getInt("status"));

                Product product = new Product(id, title, image, author, quantity,
                        updateDate, description, category, originalPrice,
                        salePrice, status);
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
        String sql = "SELECT p.id, p.title, p.image, p.author,p.quantity,p.update_date,p.description,c.name AS category, p.original_price,p.sale_price,p.status \n"
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
                String status = String.valueOf(rs.getInt("status"));

                Product product = new Product(id, title, image, author, quantity,
                        updateDate, description, category, originalPrice,
                        salePrice, status);
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

    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
        System.out.println(dao.getProductsByPaging(1));
    }

    public List<Product> getProductsByPaging(int index) {
        List<Product> listProduct = new ArrayList<>();
        String sql = "SELECT p.id, p.title, p.image, p.author,p.quantity,p.update_date,p.description,c.name AS category, p.original_price,p.sale_price,p.status \n"
                + "FROM Products p JOIN Categories c ON p.category_id = c.id\n"
                + "WHERE p.isDelete = 1\n"
                + "ORDER BY p.id\n"
                + "OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, ((index - 1) * 10));
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
                String status = String.valueOf(rs.getInt("status"));
                Product product = new Product(id, title, image, author, quantity,
                        updateDate, description, category, originalPrice,
                        salePrice, status);
                listProduct.add(product);
            }
        } catch (SQLException e) {
            System.out.println("getProductsByPaging: " + e.getMessage());
        }
        System.out.println("List size of getProductsByPaging: " + listProduct.size());
        return listProduct;
    }

    public List<Product> getProductPagingByCategoryID(int categorySearchID, int index) {
        List<Product> listProduct = new ArrayList<>();
        String sql = "SELECT p.id, p.title, p.image, p.author,p.quantity,p.update_date,p.description,c.name AS category, p.original_price,p.sale_price,p.status \n"
                + "FROM Products p JOIN Categories c ON p.category_id = c.id \n"
                + "WHERE c.id = ? AND p.isDelete = 1\n"
                + "ORDER BY p.id\n"
                + "OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, categorySearchID);
            stm.setInt(2, ((index - 1) * 10));
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
                String status = String.valueOf(rs.getInt("status"));

                Product product = new Product(id, title, image, author, quantity,
                        updateDate, description, category, originalPrice,
                        salePrice, status);
                listProduct.add(product);
            }
        } catch (SQLException e) {
            System.out.println("getProductPagingByCategoryID: " + e.getMessage());
        }
        return listProduct;
    }

    public int getTotalProductByCategoryID(int categorySearchID) {
        String sql = "SELECT COUNT(*) \n"
                + "FROM(\n"
                + "SELECT p.id, p.title, p.image, p.author,p.quantity,p.update_date,p.description,c.name AS category, p.original_price,p.sale_price,p.status \n"
                + "FROM Products p JOIN Categories c ON p.category_id = c.id \n"
                + "WHERE c.id = ? AND p.isDelete = 1\n"
                + ") AS RESULT";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, categorySearchID);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("getTotalProductByCategoryID: " + e.getMessage());
        }
        return 0;
    }

    public int getTotalProductByShowStatus() {
        String sql = "SELECT COUNT(*)\n"
                + "FROM(\n"
                + "SELECT p.id, p.title, p.image, p.author,p.quantity,p.update_date,p.description,c.name AS category, p.original_price,p.sale_price,p.status \n"
                + "FROM Products p JOIN Categories c ON p.category_id = c.id \n"
                + "WHERE p.status = 1 AND p.isDelete = 1) AS SHOW_STATUS";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("getTotalProductByShowStatus: " + e.getMessage());
        }
        return 0;
    }

    public int getTotalProductByHideStatus() {
        String sql = "SELECT COUNT(*)\n"
                + "FROM(\n"
                + "SELECT p.id, p.title, p.image, p.author,p.quantity,p.update_date,p.description,c.name AS category, p.original_price,p.sale_price,,p.status \n"
                + "FROM Products p JOIN Categories c ON p.category_id = c.id \n"
                + "WHERE p.status = 0 AND p.isDelete = 1) AS SHOW_STATUS";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("getTotalProductByHideStatus: " + e.getMessage());
        }
        return 0;
    }

    public List<Product> getProductPagingByShowStatus(int index) {
        List<Product> listProduct = new ArrayList<>();
        String sql = "SELECT p.id, p.title, p.image, p.author,p.quantity,p.update_date,p.description,c.name AS category, p.original_price,p.sale_price,p.status \n"
                + "FROM Products p JOIN Categories c ON p.category_id = c.id \n"
                + "WHERE p.status = 1 AND p.isDelete = 1\n"
                + "ORDER BY p.id\n"
                + "OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, ((index - 1) * 10));
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
                String status = String.valueOf(rs.getInt("status"));

                Product product = new Product(id, title, image, author, quantity,
                        updateDate, description, category, originalPrice,
                        salePrice, status);
                listProduct.add(product);
            }
        } catch (SQLException e) {
            System.out.println("getProductPagingByShowStatus: " + e.getMessage());
        }
        return listProduct;
    }

    public List<Product> getProductPagingByHideStatus(int index) {
        List<Product> listProduct = new ArrayList<>();
        String sql = "SELECT p.id, p.title, p.image, p.author,p.quantity,p.update_date,p.description,c.name AS category, p.original_price,p.sale_price,p.status \n"
                + "FROM Products p JOIN Categories c ON p.category_id = c.id \n"
                + "WHERE p.status = 0 AND p.isDelete = 1\n"
                + "ORDER BY p.id\n"
                + "OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, ((index - 1) * 10));
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
                String status = String.valueOf(rs.getInt("status"));

                Product product = new Product(id, title, image, author, quantity,
                        updateDate, description, category, originalPrice,
                        salePrice, status);
                listProduct.add(product);
            }
        } catch (SQLException e) {
            System.out.println("getProductPagingByHideStatus: " + e.getMessage());
        }
        return listProduct;
    }

    public int getTotalProductBySearch(String search) {
        String sql = "SELECT COUNT(*) \n"
                + "FROM(\n"
                + "SELECT p.id, p.title, p.image, p.author,p.quantity,p.update_date,p.description,c.name AS category, p.original_price,p.sale_price,p.status \n"
                + "FROM Products p JOIN Categories c ON p.category_id = c.id \n"
                + "WHERE  (p.title LIKE ? OR p.description LIKE ?) AND p.isDelete = 1) AS SEARCH_RESULT";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + search + "%");
            stm.setString(2, "%" + search + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("getTotalProductBySearch: " + e.getMessage());
        }
        return 0;
    }

    public List<Product> getProductPagingBySearch(String search, int index) {
        List<Product> listProduct = new ArrayList<>();
        String sql = "SELECT p.id, p.title, p.image, p.author,p.quantity,p.update_date,p.description,c.name AS category, p.original_price,p.sale_price,p.status \n"
                + "FROM Products p JOIN Categories c ON p.category_id = c.id \n"
                + "WHERE  (p.title LIKE ? OR p.description LIKE ?) AND p.isDelete = 1\n"
                + "ORDER BY p.id\n"
                + "OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + search + "%");
            stm.setString(2, "%" + search + "%");
            stm.setInt(3, ((index - 1) * 10));
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
                String status = String.valueOf(rs.getInt("status"));

                Product product = new Product(id, title, image, author, quantity,
                        updateDate, description, category, originalPrice,
                        salePrice, status);
                listProduct.add(product);
            }
        } catch (SQLException e) {
            System.out.println("getProductPagingBySearch: " + e.getMessage());
        }
        return listProduct;
    }

    public Product getProductDetailByID(int productID) {
        String sql = "SELECT p.id, p.title, p.image, p.author,p.quantity,p.update_date,p.description,c.name AS category, p.original_price,p.sale_price,p.status \n"
                + "FROM Products p JOIN Categories c ON p.category_id = c.id \n"
                + "WHERE p.id = ? AND p.isDelete = 1";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, productID);
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
                String status = String.valueOf(rs.getInt("status"));

                Product product = new Product(id, title, image, author, quantity,
                        updateDate, description, category, originalPrice,
                        salePrice, status);
                return product;
            }
        } catch (SQLException e) {
            System.out.println("getProductDetailByID: " + e.getMessage());
        }
        return null;
    }

    public int getTotalQuantity() {
        int totalQuantity = 0;
        String sql = "SELECT * FROM Products";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int quantity = rs.getInt("quantity");
                totalQuantity += quantity;
            }
        } catch (SQLException e) {
            System.out.println("getTotalQuantity; " + e.getMessage());
        }
        return totalQuantity;
    }

//    public static void main(String[] args) {
//        ProductDAO dao = new ProductDAO();
//        System.out.println(dao.getTotalQuantity());
//    }
    public Product getMostOrderedProductBetweenDates(String startDate, String endDate) {
        String sql = "SELECT \n"
                + "    P.id, P.title,p.author,P.image,P.description,\n"
                + "    COUNT(DISTINCT O.customer_id) AS numberOfCustomer,\n"
                + "    COUNT(OD.order_id) AS numberOfOrder\n"
                + "FROM \n"
                + "    Products P\n"
                + "JOIN \n"
                + "    OrderDetails OD ON P.id = OD.product_id\n"
                + "JOIN \n"
                + "    Orders O ON OD.order_id = O.id\n"
                + "JOIN \n"
                + "    Customers C ON O.customer_id = C.id\n"
                + "WHERE\n"
                + "    OD.isDelete = 1 AND\n"
                + "    O.isDelete = 1 \n"
                + "	AND\n"
                + "    O.order_date BETWEEN ? AND ?\n"
                + "GROUP BY \n"
                + "    P.id, P.title, P.image, P.author, P.quantity, P.update_date, \n"
                + "    P.description, P.category_id, P.original_price, P.sale_price, \n"
                + "    P.status\n"
                + "ORDER BY \n"
                + "    COUNT(DISTINCT O.customer_id) DESC;";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, startDate);
            stm.setString(2, endDate);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getInt("id"));
                String title = rs.getString("title");
                String author = rs.getString("author");
                String image = rs.getString("image");
                String description = rs.getString("description");
                String customer = String.valueOf(rs.getInt("numberOfCustomer"));
                String order = String.valueOf(rs.getInt("numberOfOrder"));
                Product product = new Product(id, title, author, image, description, customer, order);
                return product;
            }
        } catch (SQLException e) {
            System.out.println("getMostOrderedProductBetweenDates: " + e.getMessage());
        }
        return null;
    }

    public int getQuantityByProductID(int productID) {
        String sql = "SELECT quantity FROM Products WHERE id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, productID);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("getQuantityByProductID: " + e.getMessage());
        }
        return 0;
    }
    
    public int getHoldByProductID(int productID) {
        String sql = "SELECT hold FROM Products WHERE id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, productID);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("getHoldByProductID: " + e.getMessage());
        }
        return 0;
    }

    public void updateQuantityAfterCart(int productID, int quantityChanged) {
        String sql = "UPDATE [dbo].[Products]\n"
                + "   SET [quantity] = ?    \n"
                + " WHERE id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, quantityChanged);
            stm.setInt(2, productID);
            stm.execute();
        } catch (SQLException e) {
            System.out.println("updateQuantityAfterCart: " + e.getMessage());
        }
    }
    
    public void updateHoldProductAfterCart(int productID, int holdChanged) {
        String sql = "UPDATE [dbo].[Products]\n"
                + "   SET [hold] = ?    \n"
                + " WHERE id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, holdChanged);
            stm.setInt(2, productID);
            stm.execute();
        } catch (SQLException e) {
            System.out.println("updateHoldProductAfterCart: " + e.getMessage());
        }
    }

    public void updateTitleOfProductById(int idInt, String title) {
        String sql = "UPDATE Products SET title = ?, update_date = ? WHERE id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, title);
            stm.setString(2, String.valueOf(LocalDate.now()));
            stm.setInt(3, idInt);
            stm.execute();
        } catch (SQLException e) {
            System.out.println("updateTitleOfProductById: " + e.getMessage());
        }
    }

    public void updateAuthorOfProductById(int idInt, String author) {
        String sql = "UPDATE Products SET author = ?, update_date = ? WHERE id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, author);
            stm.setString(2, String.valueOf(LocalDate.now()));
            stm.setInt(3, idInt);
            stm.execute();
        } catch (SQLException e) {
            System.out.println("updateAuthorOfProductById: " + e.getMessage());
        }
    }

    public void updateQuantityOfProductById(int idInt, int quantityInt) {
        String sql = "UPDATE Products SET quantity = ?, update_date = ? WHERE id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, quantityInt);
            stm.setString(2, String.valueOf(LocalDate.now()));
            stm.setInt(3, idInt);
            stm.execute();
        } catch (SQLException e) {
            System.out.println("updateQuantityOfProductById: " + e.getMessage());
        }
    }

    public void updateDescriptionOfProductById(int idInt, String description) {
        String sql = "UPDATE Products SET description = ?, update_date = ? WHERE id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, description);
            stm.setString(2, String.valueOf(LocalDate.now()));
            stm.setInt(3, idInt);
            stm.execute();
        } catch (SQLException e) {
            System.out.println("updateDescriptionOfProductById: " + e.getMessage());
        }
    }

    public void updateCategoryOfProductById(int idInt, int categoryIdInt) {
        String sql = "UPDATE Products SET category_id = ?, update_date = ? WHERE id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, categoryIdInt);
            stm.setString(2, String.valueOf(LocalDate.now()));
            stm.setInt(3, idInt);
            stm.execute();
        } catch (SQLException e) {
            System.out.println("updateCategoryOfProductById: " + e.getMessage());
        }
    }

    public void updateOriginalPriceOfProductById(int idInt, double originalPriceDou) {
        String sql = "UPDATE Products SET original_price = ?, update_date = ? WHERE id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setDouble(1, originalPriceDou);
            stm.setString(2, String.valueOf(LocalDate.now()));
            stm.setInt(3, idInt);
            stm.execute();
        } catch (SQLException e) {
            System.out.println("updateOriginalPriceOfProductById: " + e.getMessage());
        }
    }

    public void updateSalePriceOfProductById(int idInt, double salePriceDou) {
        String sql = "UPDATE Products SET sale_price = ?,  update_date = ? WHERE id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setDouble(1, salePriceDou);
            stm.setString(2, String.valueOf(LocalDate.now()));
            stm.setInt(3, idInt);
            stm.execute();
        } catch (SQLException e) {
            System.out.println("updateSalePriceOfProductById: " + e.getMessage());
        }
    }

    public void updateImageOfProductById(int idInt, String fileName) {
        String sql = "UPDATE Products SET image = ?, update_date = ?  WHERE id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, fileName);
            stm.setString(2, String.valueOf(LocalDate.now()));
            stm.setInt(3, idInt);
            stm.execute();
        } catch (SQLException e) {
            System.out.println("updateImageOfProductById: " + e.getMessage());
        }
    }

    public void createNewProduct(Product product) {
        String sql = "INSERT INTO Products\n"
                + "           ([title]\n"
                + "           ,[image]\n"
                + "           ,[author]\n"
                + "           ,[quantity]\n"
                + "           ,[update_date]\n"
                + "           ,[description]\n"
                + "           ,[category_id]\n"
                + "           ,[original_price]\n"
                + "           ,[sale_price]\n"
                + "           ,[status]\n"
                + "           ,[isDelete]\n"
                + "           ,[slider_id])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?,?,1,1,NULL)";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, product.getTitle());
            stm.setString(2, product.getImage());
            stm.setString(3, product.getAuthor());
            stm.setInt(4, Integer.parseInt(product.getQuantity()));
            stm.setString(5, product.getUpdateDate());
            stm.setString(6, product.getDescription());
            stm.setInt(7, Integer.parseInt(product.getCategory()));
            stm.setDouble(8, Double.parseDouble(product.getOriginalPrice()));
            stm.setDouble(9, Double.parseDouble(product.getSalePrice()));
            stm.execute();
        } catch (SQLException e) {
            System.out.println("createNewProduct: " + e.getMessage());
        }
    }
    
    public int getHoldByProductID(int productID) {
        String sql = "SELECT hold FROM Products WHERE id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, productID);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("getHoldByProductID: " + e.getMessage());
        }
        return 0;
    }
    
    public void updateProductQuantityAndHold(int productId, int newQuantity, int newHold) {
        String sql = "UPDATE Products SET quantity = ?, hold = ? WHERE id = ?";
        
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, newQuantity);
            stmt.setInt(2, newHold);
            stmt.setInt(3, productId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void updateProductHold(int productId, int newHold) {
        String sql = "UPDATE Products SET  hold = ? WHERE id = ?";
        
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            
            stmt.setInt(1, newHold);
            stmt.setInt(2, productId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
