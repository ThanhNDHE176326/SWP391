/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Category;
import dal.DBContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class CategoryDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;

    public List<Category> getCategorys() {
        List<Category> listCategory = new ArrayList<>();

        try {
            String sql = "SELECT * FROM Categories";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getInt("id"));
                String name = rs.getString("name");
                Category category = new Category(id, name);
                listCategory.add(category);
            }
        } catch (SQLException e) {
            System.out.println("getCategorys: " + e.getMessage());
        }
        return listCategory;
    }

//    
}
