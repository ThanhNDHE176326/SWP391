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
            System.out.println("check:" + e.getMessage());
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
            System.out.println("err:" + e.getMessage());
        }

        return null;

    }

    public void update(Slider s) {
        try {
            String strSQL = "UPDATE [dbo].[Sliders]\n"
                    + "   SET [title] = ?\n"
                    + "      ,[image] = ?\n"
                    + "      ,[notes] = ?\n"
                    + "      ,[staff_id] = ?\n"
                    + "      ,[start_date] = ?\n"
                    + "      ,[end_date] = ?\n"
                    + "      ,[status] = ?\n"
                    + " WHERE id = ?";
            stm = connection.prepareStatement(strSQL);

            stm.setString(1, s.getTitle());
            stm.setString(2, s.getImage());
            stm.setString(3, s.getNote());
            stm.setString(4, s.getStaff());
            stm.setString(5, s.getStartDate());
            stm.setString(6, s.getEndDate());
            stm.setString(7, s.getStatus());
            stm.setInt(8, Integer.parseInt(s.getId()));

            stm.execute();

        } catch (Exception e) {
            System.out.println("update:" + e.getMessage());
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
            System.out.println("check:" + e.getMessage());
        }
        return list;

    }

    public ArrayList<Slider> getSliderByStatus() {
         ArrayList<Slider> show = new ArrayList<Slider>();
        try {
            String strSQL = "select * from Sliders where status = '1'";
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
                show.add(new Slider(id, title, image, note, staff, startDate, endDate, isDelete, status));
            }

        } catch (Exception e) {
            System.out.println("check:" + e.getMessage());
        }
        return show;

    }

    public ArrayList<Slider> getSliderByStatus0() {
         ArrayList<Slider> hide = new ArrayList<Slider>();
        try {
            String strSQL = "select * from Sliders where status = '0'";
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
                hide.add(new Slider(id, title, image, note, staff, startDate, endDate, isDelete, status));
            }

        } catch (Exception e) {
            System.out.println("check:" + e.getMessage());
        }
        return hide;
        
    }

    public ArrayList<Slider> getAllSlider() {
             ArrayList<Slider> all = new ArrayList<Slider>();
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
                all.add(new Slider(id, title, image, note, staff, startDate, endDate, isDelete, status));
            }

        } catch (Exception e) {
            System.out.println("check:" + e.getMessage());
        }
        return all;

    }
}