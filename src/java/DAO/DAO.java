/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Slider;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.util.ArrayList;
import dal.DBContext;
import java.sql.SQLException;

/**
 *
 * @author dat ngo huy
 */
public class DAO extends DBContext {

    PreparedStatement stm; // dung de thuc hien cau lenh sql
    ResultSet rs; // dung de luu tru du lieu duoc lay ve tu select

    public ArrayList<Slider> getSlider() {
        ArrayList<Slider> listslider = new ArrayList<Slider>();
        try {
            String strSQL = "select * from Sliders";
            stm = connection.prepareStatement(strSQL);

            rs = stm.executeQuery();

            while (rs.next()) {
                String id = String.valueOf(rs.getInt(1));
                String title = rs.getString(2);
                String image = rs.getString(3);
                String note = rs.getString(4);
                String staff = rs.getString(5);
                String startDate = rs.getString(6);
                String endDate = rs.getString(7);
                String isDelete = rs.getString(8);
                String status = rs.getString(9);
                listslider.add(new Slider(id, title, image, note, staff, startDate, endDate, isDelete, status));
            }

        } catch (Exception e) {
            System.out.println("getSlider:" + e.getMessage());
        }
        return listslider;

    }

    public Slider getSliderByID(String id) {
        try {
            String strSQL = "select * from Sliders where id = ?";
            stm = connection.prepareStatement(strSQL);
            stm.setInt(1, Integer.parseInt(id));

            rs = stm.executeQuery();
            if (rs.next()) {

                String title = rs.getString(2);
                String image = rs.getString(3);
                String note = rs.getString(4);
                String staff = rs.getString(5);
                String startDate = rs.getString(6);
                String endDate = rs.getString(7);
                String isDelete = rs.getString(8);
                String status = rs.getString(9);
                return new Slider(id, title, image, note, staff, startDate, endDate, isDelete, status);
            }
        } catch (Exception e) {
            System.out.println("getSliderByID:" + e.getMessage());
        }

        return null;

    }

    public void update(String title, String image, String note, String staff, String startDate, String endDate, String status, String id) {
        try {
            String strSQL = "UPDATE [dbo].[Sliders]\n"
                    + "   SET [title] = ?\n"
                    + "      ,[image] = ?\n"
                    + "      ,[note] = ?\n"
                    + "      ,[staff_id] = ?\n"
                    + "      ,[start_date] = ?\n"
                    + "      ,[end_date] = ?\n"
                    + "      ,[status] = ?\n"
                    + " WHERE id = ?";
            stm = connection.prepareStatement(strSQL);

            stm.setString(1, title);
            stm.setString(2, image);
            stm.setString(3, note);
            stm.setInt(4, Integer.parseInt(staff));
            stm.setString(5, startDate);
            stm.setString(6, endDate);
            stm.setInt(7, Integer.parseInt(status));

            stm.setInt(8, Integer.parseInt(id));

            stm.executeUpdate();

        } catch (SQLException e) {
            System.out.println("update: " + e.getMessage());
        }
    }

    public int count(String txtSearch) {
        try {
            String strSQL = "select count(*) from Sliders where title like ?";
            stm = connection.prepareStatement(strSQL);

            stm.setString(1, "%" + txtSearch + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {

        }
        return 0;
    }

    public ArrayList<Slider> Search(String txtSearch, int index, int pageSize) {
        ArrayList<Slider> list = new ArrayList<Slider>();
        try {
            String strSQL = "with x as(select ROW_NUMBER() over ( order by id asc) as r,\n"
                    + "* from Sliders where title like ?) \n"
                    + "select * from x where r between ?*3 - 2 and ?*3";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, "%" + txtSearch + "%");
            stm.setInt(2, index);
            stm.setInt(3, index);
            rs = stm.executeQuery();

            while (rs.next()) {
                String id = String.valueOf(rs.getInt(2));
                String title = rs.getString(3);
                String image = rs.getString(4);
                String note = rs.getString(5);
                String staff = rs.getString(6);
                String startDate = rs.getString(7);
                String endDate = rs.getString(8);
                String isDelete = rs.getString(9);
                String status = rs.getString(10);
                list.add(new Slider(id, title, image, note, staff, startDate, endDate, isDelete, status));

            }

        } catch (Exception e) {
            System.out.println("Search:" + e.getMessage());
        }
        return list;

    }

    public ArrayList<Slider> getAllSlider() {
        ArrayList<Slider> listSliderByStatus = new ArrayList<Slider>();
        try {
            String strSQL = "select * from Sliders";
            stm = connection.prepareStatement(strSQL);

            rs = stm.executeQuery();

            while (rs.next()) {
                String id = String.valueOf(rs.getInt(1));
                String title = rs.getString(2);
                String image = rs.getString(3);
                String note = rs.getString(4);
                String staff = rs.getString(5);
                String startDate = rs.getString(6);
                String endDate = rs.getString(7);
                String isDelete = rs.getString(8);
                String status = rs.getString(9);
                listSliderByStatus.add(new Slider(id, title, image, note, staff, startDate, endDate, isDelete, status));
            }

        } catch (Exception e) {
            System.out.println("getAllSlider:" + e.getMessage());
        }
        return listSliderByStatus;

    }

    public ArrayList<Slider> getSliderByShowStatus() {
        ArrayList<Slider> listSliderByStatus = new ArrayList<Slider>();
        try {
            String strSQL = "select * from Sliders where status = 1";
            stm = connection.prepareStatement(strSQL);

            rs = stm.executeQuery();

            while (rs.next()) {
                String id = String.valueOf(rs.getInt(1));
                String title = rs.getString(2);
                String image = rs.getString(3);
                String note = rs.getString(4);
                String staff = rs.getString(5);
                String startDate = rs.getString(6);
                String endDate = rs.getString(7);
                String isDelete = rs.getString(8);
                String status = rs.getString(9);
                listSliderByStatus.add(new Slider(id, title, image, note, staff, startDate, endDate, isDelete, status));
            }

        } catch (Exception e) {
            System.out.println("getSliderByShowStatus:" + e.getMessage());
        }
        return listSliderByStatus;
    }

    public ArrayList<Slider> getSliderByHideStatus() {
        ArrayList<Slider> listSliderByStatus = new ArrayList<Slider>();
        try {
            String strSQL = "select * from Sliders where status = 0";
            stm = connection.prepareStatement(strSQL);

            rs = stm.executeQuery();

            while (rs.next()) {
                String id = String.valueOf(rs.getInt(1));
                String title = rs.getString(2);
                String image = rs.getString(3);
                String note = rs.getString(4);
                String staff = rs.getString(5);
                String startDate = rs.getString(6);
                String endDate = rs.getString(7);
                String isDelete = rs.getString(8);
                String status = rs.getString(9);
                listSliderByStatus.add(new Slider(id, title, image, note, staff, startDate, endDate, isDelete, status));
            }

        } catch (Exception e) {
            System.out.println("getSliderByHideStatus:" + e.getMessage());
        }
        return listSliderByStatus;
    }

    public void updateImageSlider(String id, String fileName) {
        String sql = "UPDATE [dbo].[Sliders]\n"
                + "   SET [image] = ?\n"
                + " WHERE id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, fileName);
            stm.setInt(2, Integer.parseInt(id));
            stm.execute();
        } catch (SQLException e) {
            System.out.println("updateImageSlider: " + e.getMessage());
        }
    }

    public void insertNewSlider(Slider slider) {
        String sql = "INSERT INTO [dbo].[Sliders]\n"
                + "           ([title]\n"
                + "           ,[image]\n"
                + "           ,[note]\n"
                + "           ,[staff_id]\n"
                + "           ,[start_date]\n"
                + "           ,[end_date]\n"
                + "           ,[status]\n"
                + "           ,[isDelete])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?)";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, slider.getTitle());
            stm.setString(2, slider.getImage());
            stm.setString(3, slider.getNote());
            stm.setInt(4, Integer.parseInt(slider.getStaff()));
            stm.setString(5, slider.getStartDate());
            stm.setString(6, slider.getEndDate());
            stm.setInt(7, Integer.parseInt(slider.getStatus()));
            stm.setInt(8, Integer.parseInt(slider.getIsDelete()));
            stm.execute();
        } catch (SQLException e) {
            System.out.println("insertNewSlider: " + e.getMessage());
        }
    }

    public void updateTitleOfSlider(String id, String title) {
        String sql = "UPDATE [dbo].[Sliders]\n"
                + "   SET [title] = ?      \n"
                + " WHERE id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, title);
            stm.setInt(2, Integer.parseInt(id));
            stm.execute();
        } catch (SQLException e) {
            System.out.println("updateTitleOfSlider: " + e.getMessage());
        }
    }

    public void updateNoteOfSlider(String id, String note) {
        String sql = "UPDATE [dbo].[Sliders]\n"
                + "   SET [note] = ?      \n"
                + " WHERE id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, note);
            stm.setInt(2, Integer.parseInt(id));
            stm.execute();
        } catch (SQLException e) {
            System.out.println("updateNoteOfSlider: " + e.getMessage());
        }
    }

    public void updateStartDateOfSlider(String id, String startDate) {
        String sql = "UPDATE [dbo].[Sliders]\n"
                + "   SET [start_date] = ?      \n"
                + " WHERE id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, startDate);
            stm.setInt(2, Integer.parseInt(id));
            stm.execute();
        } catch (SQLException e) {
            System.out.println("updateStartDateOfSlider: " + e.getMessage());
        }
    }

    public void updateEndDateOfSlider(String id, String endDate) {
        String sql = "UPDATE [dbo].[Sliders]\n"
                + "   SET [end_date] = ?      \n"
                + " WHERE id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, endDate);
            stm.setInt(2, Integer.parseInt(id));
            stm.execute();
        } catch (SQLException e) {
            System.out.println("updateEndDateOfSlider: " + e.getMessage());
        }
    }

    public void updateStatusOfSlider(String id, String status) {
        String sql = "UPDATE [dbo].[Sliders]\n"
                + "   SET [status] = ?      \n"
                + " WHERE id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, Integer.parseInt(status));
            stm.setInt(2, Integer.parseInt(id));
            stm.execute();
        } catch (SQLException e) {
            System.out.println("updateStatusOfSlider: " + e.getMessage());
        }
    }
}
