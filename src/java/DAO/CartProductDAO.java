/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Product;
import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class CartProductDAO extends DBContext {

    PreparedStatement stm; // thực hiện câu lệnh SQL
    ResultSet rs;//lưu trữ dữ liệu được lưu về từ  select

    public void addToCart(int cartID, int productID) {
        String sql = "INSERT INTO [dbo].[CartProducts]\n"
                + "           ([cart_id]\n"
                + "           ,[product_id]\n"
                + "           ,[quantity]\n"
                + "           ,[isDelete])\n"
                + "     VALUES\n"
                + "           (?,?,1,1)";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, cartID);
            stm.setInt(2, productID);
            stm.execute();
        } catch (SQLException e) {
            System.out.println("addToCartFirst: " + e.getMessage());
        }
    }

    public int getProductIDFromByCartID(int cartID, int productID) {
        String sql = "SELECT * FROM CartProducts WHERE cart_id = ? AND product_id = ? AND isDelete = 1";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, cartID);
            stm.setInt(2, productID);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("product_id");
            }
        } catch (SQLException e) {
            System.out.println("getProductIDFromByCartID: " + e.getMessage());
        }
        return 0;
    }

    public int getQuantityByCartIdAndProductID(int cartID, int productID) {
        String sql = "SELECT * FROM CartProducts WHERE cart_id = ? AND product_id = ? AND isDelete = 1";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, cartID);
            stm.setInt(2, productID);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("quantity");
            }
        } catch (SQLException e) {
            System.out.println("getProductIDFromByCartID: " + e.getMessage());
        }
        return 0;
    }

    public void updateQuantityByCartID(int cartID, int productIDFromCart, int quantityFromCart) {
        String sql = "UPDATE [dbo].[CartProducts]\n"
                + "   SET [quantity] = ?\n"
                + " WHERE cart_id = ? AND product_id =?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, quantityFromCart);
            stm.setInt(2, cartID);
            stm.setInt(3, productIDFromCart);
            stm.execute();
        } catch (SQLException e) {
            System.out.println("updateQuantityByCartID: " + e.getMessage());
        }
    }

    public List<Product> getProductsFromCartByCartID(int cartID) {
        List<Product> listProduct = new ArrayList<>();
        String sql = "SELECT p.id, p.title, p.image, p.hold, p.sale_price, p.quantity, cp.quantity AS cart_quantity FROM Products p \n"
                + "JOIN CartProducts cp ON p.id = cp.product_id\n"
                + "WHERE p.isDelete = 1 AND p.status = 1 and p.quantity > 0 AND cp.cart_id = ? AND cp.isDelete = 1";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, cartID);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getInt("id"));
                String title = rs.getString("title");
                String image = rs.getString("image");
                int hold = rs.getInt("hold");
                int stock = rs.getInt("quantity");
                String salePrice = String.valueOf(rs.getDouble("sale_price"));
                String cartQuantity = String.valueOf(rs.getInt("cart_quantity"));
                Product productFromCart = new Product(id, title, image, hold, stock, salePrice, cartQuantity);
                listProduct.add(productFromCart);
            }
        } catch (SQLException e) {
            System.out.println("getProductsFromCartByCartID: " + e.getMessage());
        }
        System.out.println("getProductsFromCartByCartID - listSize = " + listProduct.size());
        return listProduct;
    }

    public void deleteProductInCart(int cartID, int productID) {
        String sql = "DELETE FROM [dbo].[CartProducts]\n"
                + "WHERE cart_id = ? AND product_id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, cartID);
            stm.setInt(2, productID);
            stm.execute();
        } catch (SQLException e) {
            System.out.println("deleteProductInCart: " + e.getMessage());
        }
    }

    public Product getProductInCartIDPush(int cartID, int productID) {
        Product productByCart = null; // Initialize productByCart outside try block
        String sql = "SELECT p.id, p.title, p.image, p.quantity, p.sale_price, cp.quantity AS cart_quantity\n"
                + "FROM Products p\n"
                + "JOIN CartProducts cp ON p.id = cp.product_id\n"
                + "WHERE p.isDelete = 1 AND p.status = 1 AND cp.cart_id = ? AND p.id = ? AND cp.isDelete = 1";

        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, cartID);
            stm.setInt(2, productID);
            rs = stm.executeQuery();

            if (rs.next()) {
                String id = String.valueOf(rs.getInt("id"));
                String title = rs.getString("title");
                String image = rs.getString("image");
                int stock = rs.getInt("quantity");
                String salePrice = String.valueOf(rs.getDouble("sale_price"));
                String cartQuantity = String.valueOf(rs.getInt("cart_quantity"));

                // Create a new Product object with retrieved data
                productByCart = new Product(id, title, image, stock, salePrice, cartQuantity);
            }

        } catch (SQLException e) {
            System.out.println("Error in getAllProductIDFromByCartID: " + e.getMessage());
            // Handle the exception (e.g., logging, returning null, etc.)
            productByCart = null; // or handle the error according to your application's logic
        }

        return productByCart;
    }

    public int getCartIdByCustomerID(int customerID) {
        int cartID = -1; // Initialize with a default value indicating no cart found
        String sql = "SELECT id FROM Carts WHERE customer_id = ?";
        ResultSet resultSET = null;

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, customerID);
            resultSET = preparedStatement.executeQuery();

            if (resultSET.next()) {
                cartID = resultSET.getInt("id");
            }
        } catch (SQLException e) {
            System.out.println("getCartIdByCustomerID: " + e.getMessage());
        }
        return cartID;
    }

    public static void main(String[] args) {
        CartProductDAO dao = new CartProductDAO();
        List<Product> listProduct = dao.getProductsFromCartByCartID(21);
        for (Product product : listProduct) {
            System.out.println(product);
        }
    }
}
