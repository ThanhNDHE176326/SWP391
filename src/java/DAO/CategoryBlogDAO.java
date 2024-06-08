/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.CategoryBlog;
import Models.Category;
import dal.DBContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryBlogDAO extends DBContext {
    PreparedStatement stm; 
    ResultSet rs;

    public List<CategoryBlog> getAllCategories() {
        List<CategoryBlog> categories = new ArrayList<>();
        try {
            String query = "SELECT * FROM CategoryBlogs";
            stm = connection.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getString("name");
                categories.add(new CategoryBlog(id, name));
            }
        } catch (SQLException e) {
            System.out.println("Error fetching categories: " + e.getMessage());
            e.printStackTrace();
        }
        return categories;
    }

    public int getTotalCategoryPost() {
        String sql = "SELECT COUNT(*) FROM Blogs";
        try {
            stm=connection.prepareStatement(sql);
            rs=stm.executeQuery();
            while (rs.next()) {                
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("getTotalCategoryPost: " + e.getMessage());
        }
        return 0;
    }
}

