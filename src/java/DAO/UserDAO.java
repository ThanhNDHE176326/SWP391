/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Role;
import Models.Staff;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author dat ngo huy
 */
public class UserDAO extends dal.DBContext {

    PreparedStatement stm; // dung de thuc hien cau lenh sql
    ResultSet rs;

    public int count() {
        try {
            String strSQL = "SELECT COUNT(*) FROM Staffs ";
            stm = connection.prepareStatement(strSQL);

            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {

        }
        return 0;
    }

    public boolean isEmailExists(String email) {
        try {
            String strSQL = "SELECT COUNT(*) FROM Staffs WHERE email = ?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, email);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (Exception e) {
            System.out.println("isEmailExists: " + e.getMessage());
        }
        return false;
    }

    // Check if phone exists
    public boolean isPhoneExists(String phone) {
        try {
            String strSQL = "SELECT COUNT(*) FROM Staffs WHERE phone = ?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, phone);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (Exception e) {
            System.out.println("isPhoneExists: " + e.getMessage());
        }
        return false;
    }

    // Check if username exists
    public boolean isUsernameExists(String username) {
        try {
            String strSQL = "SELECT COUNT(*) FROM Staffs WHERE username = ?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, username);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (Exception e) {
            System.out.println("isUsernameExists: " + e.getMessage());
        }
        return false;
    }   
    
    public ArrayList<Staff> getAllStaff() {
        ArrayList<Staff> listuser = new ArrayList<Staff>();
        try {
            String strSQL = "select id, fullname, email, gender,phone, role_id , status  FROM Staffs";
            stm = connection.prepareStatement(strSQL);

            rs = stm.executeQuery();

            while (rs.next()) {

                String id = String.valueOf(rs.getInt("id"));

                String fullname = rs.getString("fullname");
                String email = rs.getString("email");
                String gender = rs.getString("gender");
                String phone = rs.getString("phone");
                String role = rs.getString("role_id");
                String status = rs.getString("status");
                listuser.add(new Staff(id, fullname, email, gender, phone, role, status));

            }

        } catch (Exception e) {
            System.out.println("getAllStaff:" + e.getMessage());
        }
        return listuser;
    }

    public ArrayList<Staff> getUserDetailById(String id) {
        ArrayList<Staff> userdetail = new ArrayList<Staff>();
        try {
            String strSQL = "select*from Staffs where id = ?";
            stm = connection.prepareStatement(strSQL);
            stm.setInt(1, Integer.parseInt(id));
            rs = stm.executeQuery();

            while (rs.next()) {

                String fullname = rs.getString("fullname");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String gender = rs.getString("gender");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                String role = rs.getString("role_id");
                String status = rs.getString("status");
                userdetail.add(new Staff(id, fullname, username, password, email, gender, phone, address, role, status));

            }

        } catch (Exception e) {
            System.out.println("getUserDetailById:" + e.getMessage());
        }
        return userdetail;
    }

    public int countsearch(String txtSearch) {
        try {
            String strSQL = "SELECT COUNT(*) FROM Staffs WHERE fullname LIKE ? or email like ? or phone like ?";
            stm = connection.prepareStatement(strSQL);

            stm.setString(1, "%" + txtSearch + "%");
            stm.setString(2, "%" + txtSearch + "%");
            stm.setString(3, "%" + txtSearch + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {

        }
        return 0;

    }

    public ArrayList<Staff> SearchStaff(String txtSearch) {
        ArrayList<Staff> listuser = new ArrayList<Staff>();
        try {
            String strSQL = "select id, fullname, email, gender,phone, role_id , status  FROM Staffs\n"
                    + "                   WHERE fullname LIKE ? or email like ? or phone like ?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, "%" + txtSearch + "%");
            stm.setString(2, "%" + txtSearch + "%");
            stm.setString(3, "%" + txtSearch + "%");

            rs = stm.executeQuery();

            while (rs.next()) {

                String id = String.valueOf(rs.getInt("id"));

                String fullname = rs.getString("fullname");
                String email = rs.getString("email");
                String gender = rs.getString("gender");
                String phone = rs.getString("phone");
                String role = rs.getString("role_id");
                String status = rs.getString("status");
                listuser.add(new Staff(id, fullname, email, gender, phone, role, status));

            }

        } catch (Exception e) {
            System.out.println("getAllStaff:" + e.getMessage());
        }
        return listuser;
    }

//    public static void main(String[] args) {
//        UserDAO dao = new UserDAO();
//        ArrayList<Staff> listuser = new ArrayList<Staff>();
//        listuser = dao.SearchStaff("h", 1, 7);
//        for (Staff staff : listuser) {
//            System.out.println(staff);
//        }
//    }
    public ArrayList<Staff> getUserByActiveStatus() {
        ArrayList<Staff> listUserByStatus = new ArrayList<Staff>();
        try {
            String strSQL = "select id, fullname, email, gender,phone, role_id , status from Staffs where status = '1' ";
            stm = connection.prepareStatement(strSQL);
            rs = stm.executeQuery();

            while (rs.next()) {

                String id = String.valueOf(rs.getInt("id"));

                String fullname = rs.getString("fullname");
                String email = rs.getString("email");
                String gender = rs.getString("gender");
                String phone = rs.getString("phone");
                String role = rs.getString("role_id");
                String status = rs.getString("status");
                listUserByStatus.add(new Staff(id, fullname, email, gender, phone, role, status));

            }

        } catch (Exception e) {
            System.out.println("getUserByActiveStatus:" + e.getMessage());
        }
        return listUserByStatus;
    }

    public ArrayList<Staff> getUserByInActiveStatus() {
        ArrayList<Staff> listUserByStatus = new ArrayList<Staff>();
        try {
            String strSQL = "select id, fullname, email, gender,phone, role_id , status from Staffs where status = '0'";
            stm = connection.prepareStatement(strSQL);
            rs = stm.executeQuery();

            while (rs.next()) {

                String id = String.valueOf(rs.getInt("id"));

                String fullname = rs.getString("fullname");
                String email = rs.getString("email");
                String gender = rs.getString("gender");
                String phone = rs.getString("phone");
                String role = rs.getString("role_id");
                String status = rs.getString("status");
                listUserByStatus.add(new Staff(id, fullname, email, gender, phone, role, status));

            }

        } catch (Exception e) {
            System.out.println("getUserByInActiveStatus:" + e.getMessage());
        }
        return listUserByStatus;
    }

    public ArrayList<Staff> getUserByLeaveStatus() {
        ArrayList<Staff> listUserByStatus = new ArrayList<Staff>();
        try {
            String strSQL = "select id, fullname, email, gender,phone, role_id , status from Staffs where status = 'on leave'";
            stm = connection.prepareStatement(strSQL);
            rs = stm.executeQuery();

            while (rs.next()) {

                String id = String.valueOf(rs.getInt("id"));

                String fullname = rs.getString("fullname");
                String email = rs.getString("email");
                String gender = rs.getString("gender");
                String phone = rs.getString("phone");
                String role = rs.getString("role_id");
                String status = rs.getString("status");
                listUserByStatus.add(new Staff(id, fullname, email, gender, phone, role, status));

            }

        } catch (Exception e) {
            System.out.println("getUserByLeaveStatus:" + e.getMessage());
        }
        return listUserByStatus;

    }

    public ArrayList<Staff> getAllUser() {
        ArrayList<Staff> listUserByStatus = new ArrayList<Staff>();
        try {
            String strSQL = "select id, fullname, email, gender,phone, role_id , status from Staffs";
            stm = connection.prepareStatement(strSQL);
            rs = stm.executeQuery();

            while (rs.next()) {

                String id = String.valueOf(rs.getInt("id"));

                String fullname = rs.getString("fullname");
                String email = rs.getString("email");
                String gender = rs.getString("gender");
                String phone = rs.getString("phone");
                String role = rs.getString("role_id");
                String status = rs.getString("status");
                listUserByStatus.add(new Staff(id, fullname, email, gender, phone, role, status));

            }

        } catch (Exception e) {
            System.out.println("getAllUser:" + e.getMessage());
        }
        return listUserByStatus;
    }

    public ArrayList<Staff> getAdminUser() {
        ArrayList<Staff> listUserByRole = new ArrayList<Staff>();
        try {
            String strSQL = "select id, fullname, email, gender,phone, role_id , status from Staffs where role_id = '1'";
            stm = connection.prepareStatement(strSQL);
            rs = stm.executeQuery();

            while (rs.next()) {

                String id = String.valueOf(rs.getInt("id"));

                String fullname = rs.getString("fullname");
                String email = rs.getString("email");
                String gender = rs.getString("gender");
                String phone = rs.getString("phone");
                String role = rs.getString("role_id");
                String status = rs.getString("status");
                listUserByRole.add(new Staff(id, fullname, email, gender, phone, role, status));

            }

        } catch (Exception e) {
            System.out.println("getAdminUser:" + e.getMessage());
        }
        return listUserByRole;
    }

    public ArrayList<Staff> getSaleUser() {
        ArrayList<Staff> listUserByRole = new ArrayList<Staff>();
        try {
            String strSQL = "select id, fullname, email, gender,phone, role_id , status from Staffs where role_id = '2'";
            stm = connection.prepareStatement(strSQL);
            rs = stm.executeQuery();

            while (rs.next()) {

                String id = String.valueOf(rs.getInt("id"));

                String fullname = rs.getString("fullname");
                String email = rs.getString("email");
                String gender = rs.getString("gender");
                String phone = rs.getString("phone");
                String role = rs.getString("role_id");
                String status = rs.getString("status");
                listUserByRole.add(new Staff(id, fullname, email, gender, phone, role, status));

            }

        } catch (Exception e) {
            System.out.println("getSaleUser:" + e.getMessage());
        }
        return listUserByRole;
    }

    public ArrayList<Staff> getSaleManagerUser() {
        ArrayList<Staff> listUserByRole = new ArrayList<Staff>();
        try {
            String strSQL = "select id, fullname, email, gender,phone, role_id , status from Staffs where role_id = '3'";
            stm = connection.prepareStatement(strSQL);
            rs = stm.executeQuery();

            while (rs.next()) {

                String id = String.valueOf(rs.getInt("id"));

                String fullname = rs.getString("fullname");
                String email = rs.getString("email");
                String gender = rs.getString("gender");
                String phone = rs.getString("phone");
                String role = rs.getString("role_id");
                String status = rs.getString("status");
                listUserByRole.add(new Staff(id, fullname, email, gender, phone, role, status));

            }

        } catch (Exception e) {
            System.out.println("getSaleManagerUser:" + e.getMessage());
        }
        return listUserByRole;
    }

    public ArrayList<Staff> getMarketerUser() {
        ArrayList<Staff> listUserByRole = new ArrayList<Staff>();
        try {
            String strSQL = "select id, fullname, email, gender,phone, role_id , status from Staffs where role_id = '4'";
            stm = connection.prepareStatement(strSQL);
            rs = stm.executeQuery();

            while (rs.next()) {

                String id = String.valueOf(rs.getInt("id"));

                String fullname = rs.getString("fullname");
                String email = rs.getString("email");
                String gender = rs.getString("gender");
                String phone = rs.getString("phone");
                String role = rs.getString("role_id");
                String status = rs.getString("status");
                listUserByRole.add(new Staff(id, fullname, email, gender, phone, role, status));

            }

        } catch (Exception e) {
            System.out.println("getMarketerUser:" + e.getMessage());
        }
        return listUserByRole;
    }

    public ArrayList<Role> getRole() {
        ArrayList<Role> listrole = new ArrayList<Role>();
        try {
            String strSQL = "select*from Roles";
            stm = connection.prepareStatement(strSQL);
            rs = stm.executeQuery();

            while (rs.next()) {

                String id = String.valueOf(rs.getInt("id"));
                String name = rs.getString("name");
                listrole.add(new Role(id, name));

            }

        } catch (Exception e) {
            System.out.println("getRole:" + e.getMessage());
        }
        return listrole;
    }

    public ArrayList<Staff> getMaleUser() {
        ArrayList<Staff> listUserByGender = new ArrayList<Staff>();
        try {
            String strSQL = "select id, fullname, email, gender,phone, role_id , status from Staffs where gender = '1'";
            stm = connection.prepareStatement(strSQL);
            rs = stm.executeQuery();

            while (rs.next()) {

                String id = String.valueOf(rs.getInt("id"));

                String fullname = rs.getString("fullname");
                String email = rs.getString("email");
                String gender = rs.getString("gender");
                String phone = rs.getString("phone");
                String role = rs.getString("role_id");
                String status = rs.getString("status");
                listUserByGender.add(new Staff(id, fullname, email, gender, phone, role, status));

            }

        } catch (Exception e) {
            System.out.println("getMaleUser:" + e.getMessage());
        }
        return listUserByGender;
    }

    public ArrayList<Staff> getFeMaleUser() {
        ArrayList<Staff> listUserByGender = new ArrayList<Staff>();
        try {
            String strSQL = "select id, fullname, email, gender,phone, role_id , status from Staffs where gender = '0'";
            stm = connection.prepareStatement(strSQL);
            rs = stm.executeQuery();

            while (rs.next()) {

                String id = String.valueOf(rs.getInt("id"));

                String fullname = rs.getString("fullname");
                String email = rs.getString("email");
                String gender = rs.getString("gender");
                String phone = rs.getString("phone");
                String role = rs.getString("role_id");
                String status = rs.getString("status");
                listUserByGender.add(new Staff(id, fullname, email, gender, phone, role, status));

            }

        } catch (Exception e) {
            System.out.println("getFeMaleUser:" + e.getMessage());
        }
        return listUserByGender;
    }

    public void updateUser( String role, String status, String id) {
        try {
            String strSQL = "UPDATE [dbo].[Staffs]\n"
                    + "   SET"
                    
                   
                    
            
                    
                    
                    + "      [role_id] = ?\n"
                    + "      ,[isDelete] = 1\n"
                    + "      ,[status] = ?\n"
                    + " WHERE id = ?";
            stm = connection.prepareStatement(strSQL);

            stm.setInt(1,Integer.parseInt(role) );
            stm.setInt(2, Integer.parseInt(status));
             stm.setInt(3, Integer.parseInt(id));
          
            stm.execute();
        } catch (Exception e) {
            System.out.println("getFeMaleUser:" + e.getMessage());
        }

    }

    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        dao.updateUser("3", "1", "42");
        System.out.println("okey");
    }

    public Staff getStaffById(String id) {

        try {
            String strSQL = "select*from Staffs where id = ?";
            stm = connection.prepareStatement(strSQL);
            stm.setInt(1, Integer.parseInt(id));
            rs = stm.executeQuery();

            while (rs.next()) {

                String fullname = rs.getString("fullname");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String gender = rs.getString("gender");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                String role = rs.getString("role_id");
                String status = rs.getString("status");
                return new Staff(id, fullname, username, password, email, gender, phone, address, role, status);

            }

        } catch (Exception e) {
            System.out.println("getUserDetailById:" + e.getMessage());
        }
        return null;
    }

    public void add(String email, String fullname, String username, String password, String gender, String phone, String address, String role, String status) {
        try {
            String strSQL = "INSERT INTO [dbo].[Staffs]\n"
                    + "           ([email]\n"
                    + "           ,[fullname]\n"
                    + "           ,[username]\n"
                    + "           ,[password]\n"
                    + "           ,[gender]\n"
                    + "           ,[phone]\n"
                    + "           ,[address]\n"
                    + "           ,[role_id]\n"
                    + "           ,[isDelete]\n"
                    + "           ,[status])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,1\n"
                    + "           ,?)";
            stm = connection.prepareStatement(strSQL);

            stm.setString(1, email);
            stm.setString(2, fullname);
            stm.setString(3, username);
            stm.setString(4, password);
            stm.setString(5, gender);
            stm.setString(6, phone);
            stm.setString(7, address);
            stm.setInt(8, Integer.parseInt(role));
            stm.setInt(9, Integer.parseInt(status));

            stm.executeQuery();
        } catch (Exception e) {
            System.out.println("add:" + e.getMessage());
        }

    }
    
}
    

//public void add(String email, String fullname, String username, String password, String gender, String phone, String address, String role) {
//    try {
//        // Kiểm tra username
//        if (isUsernameExists(username)) {
//            System.out.println("Username đã tồn tại trong hệ thống.");
//            return;
//        }
//        
//        // Kiểm tra email
//        if (isEmailExists(email)) {
//            System.out.println("Email đã tồn tại trong hệ thống.");
//            return;
//        }
//        
//        // Kiểm tra phone
//        if (isPhoneExists(phone)) {
//            System.out.println("Số điện thoại đã tồn tại trong hệ thống.");
//            return;
//        }
//        
//        // Nếu không có trùng lặp, thực hiện INSERT
//        String strSQL = "INSERT INTO [dbo].[Staffs] " +
//                        "([email], [fullname], [username], [password], [gender], [phone], [address], [role_id], [status], [isDelete]) " +
//                        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, 1, 1)";
//        stm = connection.prepareStatement(strSQL);
//        stm.setString(1, email);
//        stm.setString(2, fullname);
//        stm.setString(3, username);
//        stm.setString(4, password);
//        stm.setString(5, gender);
//        stm.setString(6, phone);
//        stm.setString(7, address);
//        stm.setString(8, role);
//
//        int affectedRows = stm.executeUpdate();
//
//        if (affectedRows > 0) {
//            System.out.println("Thêm thành công.");
//        } else {
//            System.out.println("Thêm không thành công.");
//        }
//   
//    } catch (Exception e) {
//        System.out.println("Lỗi khi thêm: " + e.getMessage());
//    } finally {
//        try {
//            if (stm != null) stm.close();
//            if (connection != null) connection.close();
//        } catch (Exception ex) {
//            System.out.println("Lỗi khi đóng tài nguyên: " + ex.getMessage());
//        }
//    }
//}
//
//// Phương thức kiểm tra username đã tồn tại
//private boolean isUsernameExists(String username) throws Exception {
//    String query = "SELECT COUNT(*) FROM [dbo].[Staffs] WHERE [username] = ?";
//    PreparedStatement stmt = connection.prepareStatement(query);
//    stmt.setString(1, username);
//    ResultSet rs = stmt.executeQuery();
//    if (rs.next()) {
//        int count = rs.getInt(1);
//        return count > 0;
//    }
//    return false;
//}
//
//// Phương thức kiểm tra email đã tồn tại
//private boolean isEmailExists(String email) throws Exception {
//    String query = "SELECT COUNT(*) FROM [dbo].[Staffs] WHERE [email] = ?";
//    PreparedStatement stmt = connection.prepareStatement(query);
//    stmt.setString(1, email);
//    ResultSet rs = stmt.executeQuery();
//    if (rs.next()) {
//        int count = rs.getInt(1);
//        return count > 0;
//    }
//    return false;
//}
//
//// Phương thức kiểm tra phone đã tồn tại
//private boolean isPhoneExists(String phone) throws Exception {
//    String query = "SELECT COUNT(*) FROM [dbo].[Staffs] WHERE [phone] = ?";
//    PreparedStatement stmt = connection.prepareStatement(query);
//    stmt.setString(1, phone);
//    ResultSet rs = stmt.executeQuery();
//    if (rs.next()) {
//        int count = rs.getInt(1);
//        return count > 0;
//    }
//    return false;
//}

