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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HP
 */
public class StaffDAO extends DBContext {

    PreparedStatement stm; // thực hiện câu lệnh SQL
    ResultSet resultSET;//lưu trữ dữ liệu được lưu về từ  select

    public Staff loginStaff(String user) {
        String sql = "SELECT * FROM Staffs WHERE\n"
                + "username= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String fullname = rs.getString("fullname");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String role = rs.getString("role_id");
                String isDelete = rs.getString("isDelete");

                return new Staff(fullname, username, password, role, isDelete);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Staff> getSalesStaffWithOrderCount() {
        List<Staff> staffList = new ArrayList<>();
        String sql = "SELECT s.id, s.fullname, COUNT(o.id) AS orderCount "
                + "FROM Staffs s "
                + "LEFT JOIN Orders o ON s.id = o.staff_id "
                + "WHERE s.role_id = '2' "
                + "GROUP BY s.id, s.fullname";  // Đảm bảo rằng s.fullname được đưa vào GROUP BY
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Staff staff = new Staff();
                staff.setId(rs.getString("id"));
                staff.setFullname(rs.getString("fullname"));
                staff.setOrderCount(rs.getString("orderCount"));
                staffList.add(staff);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return staffList;
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

//    public List<Staff> getSalers() {
//        List<Staff> listSaler = new ArrayList<>();
//        String sql = "SELECT s.id, s.email, s.fullname, s.username, s.password, s.gender, s.phone, s.address, s.isDelete, r.name AS role_name\n"
//                + "FROM Staffs s JOIN Roles r ON s.role_id = r.id\n"
//                + "WHERE role_id = 2";
//        try {
//            stm = connection.prepareStatement(sql);
//            resultSET = stm.executeQuery();
//            while (resultSET.next()) {
//                String id = String.valueOf(resultSET.getInt("id"));
////                String email = resultSET.getString("email");
//                String fullName = resultSET.getString("fullname");
//                String userName = resultSET.getString("username");
//                String password = resultSET.getString("password");
//                String gender = String.valueOf(resultSET.getInt("gender"));
//                String phone = resultSET.getString("phone");
//                String address = resultSET.getString("address");
//                String role = resultSET.getString("role_name");
//                String isDelete = String.valueOf(resultSET.getInt("isDelete"));
//                Staff saler = new Staff(id, fullName, userName, password, gender, phone, address, role, isDelete);
//                listSaler.add(saler);
//            }
//        } catch (SQLException e) {
//            System.out.println("getSalers: " + e.getMessage());
//        }
//        return listSaler;
//    }
    public int getIdStaffHasFewestOrder() {
        String sql = "SELECT TOP 1 S.id AS staff_id\n"
                + "FROM Staffs S\n"
                + "LEFT JOIN Orders O ON S.id = O.staff_id\n"
                + "WHERE S.role_id = 2\n"
                + "GROUP BY S.id\n"
                + "ORDER BY COUNT(O.id) ASC;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("staff_id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public Staff getInformationStaff(String username) {
        String sql = "SELECT * FROM Staffs WHERE username=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Staff(rs.getString("id"),
                        rs.getString("fullname"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("gender"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getString("role_id"),
                        rs.getString("isDelete"));
            }
        } catch (SQLException e) {
            System.out.println("getInformationCustomer: " + e.getMessage());
        }
        return null;

    }

    public static void main(String[] args) {
        StaffDAO dao = new StaffDAO();
        int id = dao.getIdStaffHasFewestOrder();
        System.out.println(id);

    }

    public void updateInformationStaff(String username, String email, String name, String address, String phone, String gender) {
        String sql = "UPDATE [dbo].[Staffs]\n"
                + "SET [fullname] = ?,\n"
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
        String sql = "UPDATE Staffs SET password = ? WHERE username = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, password);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
