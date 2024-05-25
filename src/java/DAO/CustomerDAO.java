/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Customer;
import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author HP
 */
public class CustomerDAO extends DBContext {

    //đăng kí
    public Customer Login(String user) {
        String sql = "SELECT * FROM Customers WHERE\n"
                + "username= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String name = rs.getString(2);
                String username = rs.getString(3);
                String password = rs.getString(4);
                String isDelete = rs.getString(9);
                return new Customer(name, username, password, isDelete);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Customer checkCustomerAccountExits(String user) {
        String sql = "SELECT * FROM Customers WHERE username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String id = rs.getString(1);
                String name = rs.getString(2);
                String username = rs.getString(3);
                String password = rs.getString(4);
                String email = rs.getString(5);
                String phone = rs.getString(6);
                String address = rs.getString(7);
                String gender = rs.getString(8);
                String isDelete = rs.getString(9);
                return new Customer(id, name, username, password, email, phone, address, gender, isDelete);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    //hàm cho người dùng đăng kí
    public void singUp(String name, String username, String password, String email, String phone, String address, String gender) {
        String sql = "INSERT INTO [dbo].[Customers]\n"
                + "           ([name]\n"
                + "           ,[username]\n"
                + "           ,[password]\n"
                + "           ,[email]\n"
                + "           ,[phone]\n"
                + "           ,[address]\n"
                + "           ,[gender]\n"
                + "           ,[isDelete])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,1)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, username);
            st.setString(3, password);
            st.setString(4, email);
            st.setString(5, phone);
            st.setString(6, address);
            st.setString(7, gender);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    

    public Customer getInformationCustomer(String name) {
        String sql = "SELECT * FROM Customers WHERE username=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Customer(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));

            }
        } catch (SQLException e) {
            System.out.println("getInformationCustomer: " + e.getMessage());
        }
        return null;

    }

    public void updatePersonalInformation(String username, String email, String name, String address, String phone, String gender) {
        String sql = "UPDATE [dbo].[Customers]\n"
                + "SET [name] = ?,\n"
                + "    [email] = ?,\n"
                + "    [phone] = ?,\n"
                + "    [address] = ?,\n"
                + "    [gender] = ?\n"
                + "WHERE [username] = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, address);
            ps.setInt(5, Integer.parseInt(gender));
            ps.setString(6, username);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public void changePassword(String password, String username) {
        String sql = "UPDATE Customers SET password = ? WHERE username = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, password);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateIsDelete(String username, int isDelete) {
        String sql = "UPDATE Customers SET isDelete = ? WHERE username = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, isDelete);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

}
