/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Staff;
import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author HP
 */
public class StaffDAO extends DBContext {

    public Staff loginStaff(String user) {
        String sql = "SELECT * FROM Staffs WHERE\n"
                + "username= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String name = rs.getString("fullname");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String role = rs.getString("role_id");
                String isDelete = rs.getString("isDelete");

                return new Staff(username, username, password, role, isDelete);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Staff checkStaffAccountExits(String user) {
        String sql = "SELECT * FROM Staffs WHERE username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getString("fullname");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                String gender = rs.getString("gender");
                String role = rs.getString("role_id");
                String isDelete = rs.getString("isDelete");
                return new Staff(id, username, username, password, gender, phone, address, role, isDelete);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void updateIsDeleteStaff(String username, int isDelete) {
        String sql = "UPDATE Staffs SET isDelete = ? WHERE username = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, isDelete);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void singUpStaff(String fullname, String username, String password, String email, String phone, String address, String gender, String role) {
        String sql = "INSERT INTO [dbo].[Staffs]\n"
                + "           ([email]\n"
                + "           ,[fullname]\n"
                + "           ,[username]\n"
                + "           ,[password]\n"
                + "           ,[gender]\n"
                + "           ,[phone]\n"
                + "           ,[address]\n"
                + "           ,[role_id]\n"
                + "           ,[isDelete])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?,1)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, fullname);
            st.setString(3, username);
            st.setString(4, password);
            st.setInt(5, Integer.parseInt(gender));
            st.setString(6, phone);
            st.setString(7, address);
            st.setInt(8, Integer.parseInt(role));
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
