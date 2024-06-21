/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Customer;
import Models.DeliveryAddresses;
import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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

    PreparedStatement stm;
    ResultSet resultSET;

    //đăng kí
    public Customer LoginCustomer(String user) {
        String sql = "SELECT * FROM Customers WHERE\n"
                + "username= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String name = rs.getString("name");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String isDelete = rs.getString("isDelete");
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
                String id = rs.getString("id");
                String name = rs.getString("name");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                String gender = rs.getString("gender");
                String isDelete = rs.getString("isDelete");
                return new Customer(id, name, username, password, email, phone, address, gender, isDelete);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    //hàm cho người dùng đăng kí
    public void singUpCustomer(String name, String username, String password, String email, String phone, String address, String gender) {
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
            st.setInt(7, Integer.parseInt(gender));;
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Customer getInformationCustomer(String username) {
        String sql = "SELECT * FROM Customers WHERE username=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Customer(rs.getString("id"),
                        rs.getString("name"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getString("gender"),
                        rs.getString("isDelete"));
            }
        } catch (SQLException e) {
            System.out.println("getInformationCustomer: " + e.getMessage());
        }
        return null;

    }

    public void updateInformationCustomer(String username, String email, String name, String address, String phone, String gender) {
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

    public void resetPassword(String username, String email) {
        String sql = "UPDATE Customers SET password = ? WHERE username = ? AND email=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int getTotalCustomer() {
        String sql = "SELECT COUNT(*) FROM Customers";
        try {
            stm = connection.prepareStatement(sql);
            resultSET = stm.executeQuery();
            while (resultSET.next()) {
                return resultSET.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("getTotalCustomer: " + e.getMessage());
        }
        return 0;
    }

    public List<DeliveryAddresses> getAllAddress(String customer_id) {
        List<DeliveryAddresses> list = new ArrayList<>();
        String sql = "Select * From DeliveryAddresses where customer_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, customer_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getInt("id"));
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                String name = rs.getString("recipient_name");
                String gender = rs.getString("recipient_gender");
                DeliveryAddresses deliveryAddress = new DeliveryAddresses(id, customer_id, address, phone, name, gender);
                list.add(deliveryAddress);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void addDeliveryAddress(String customer_id, String address, String phone, String recipient_name, String recipient_gender) {
        String sql = "INSERT INTO DeliveryAddresses (customer_id, address, phone, recipient_name, recipient_gender) "
                + "VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, customer_id);
            ps.setString(2, address);
            ps.setString(3, phone);
            ps.setString(4, recipient_name);
            ps.setString(5, recipient_gender);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteDeliveryAddress(int id) {
        String sql = "DELETE FROM DeliveryAddresses WHERE id = ?";
        
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        CustomerDAO dao = new CustomerDAO();
        System.out.println(dao.getAllAddress(String.valueOf(21)));
    }

    public String getAddressByCustomerId(int customerID) {
        String sql = "SELECT * FROM Customers WHERE id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, customerID);
            resultSET = stm.executeQuery();
            if(resultSET.next()){
                return resultSET.getString("address");
            }
        } catch (SQLException e) {
            System.out.println("getAddressByCustomerId: " + e.getMessage());
        }
        return null;
    }

    public String getPhoneByCustomerId(int customerID) {
        String sql = "SELECT * FROM Customers WHERE id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, customerID);
            resultSET = stm.executeQuery();
            if(resultSET.next()){
                return resultSET.getString("phone");
            }
        } catch (SQLException e) {
            System.out.println("getPhoneByCustomerId: " + e.getMessage());
        }
        return null;
    }

}
