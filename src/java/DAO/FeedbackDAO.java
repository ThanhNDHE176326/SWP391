    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Category;
import Models.Feedback;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.util.ArrayList;
import dal.DBContext;
import java.util.Date;

/**
 *
 * @author dat ngo huy
 */
public class FeedbackDAO extends DBContext {

    
    PreparedStatement stm; // dung de thuc hien cau lenh sql
    ResultSet rs;

    public ArrayList<Feedback> getAllFeedback() {
        ArrayList<Feedback> allfeedback = new ArrayList<Feedback>();
        try {
            String strSQL = "select * from Feedbacks f  join Customers c on f.customer_id = c.id\n"
                    + "join Products p on f.product_id=p.id";
            stm = connection.prepareStatement(strSQL);

            rs = stm.executeQuery();

            while (rs.next()) {
                String id = String.valueOf(rs.getInt("id"));
                String customer = rs.getString("name");
                String product = rs.getString("title");
                String date = rs.getString(4);
                String ratedStar = rs.getString(5);
                String comment = rs.getString(6);
                String status = rs.getString(7);
                String isDelete = rs.getString(8);
                allfeedback.add(new Feedback(id, customer, product, date, ratedStar, comment, isDelete, status));

            }

        } catch (Exception e) {
            System.out.println("getAllFeedback:" + e.getMessage());
        }
        return allfeedback;

    }

//    public ArrayList<Feedback> getFeedbackDetail() {
//
//        ArrayList<Feedback> feedbackdetail = new ArrayList<Feedback>();
//        try {
//            String strSQL = "select * from Feedbacks f  join Customers c on f.customer_id = c.id\n"
//                    + "join Products p on f.product_id=p.id";
//            stm = connection.prepareStatement(strSQL);
//
//            rs = stm.executeQuery();
//
//            while (rs.next()) {
//                String id = String.valueOf(rs.getInt("id"));
//                String customer = rs.getString("name");
//                String product = rs.getString("title");
//                String date = rs.getString(4);
//                String ratedStar = rs.getString(5);
//                String comment = rs.getString(6);
//                String status = rs.getString(7);
//                String isDelete = rs.getString(8);
//                feedbackdetail.add(new Feedback(id, customer, product, date, ratedStar, comment, isDelete, status));
//
//            }
//
//        } catch (Exception e) {
//            System.out.println("getAllFeedback:" + e.getMessage());
//        }
//        return feedbackdetail;
//    }
    public void update(String status) {
        try {
            String strSQL = "UPDATE [dbo].[Feedbacks]\n"
                    + "   SET \n"
                    + "      [status] = ?\n"
                    + "     \n"
                    + " WHERE id = ?";
            stm = connection.prepareStatement(strSQL);

            stm.setString(1, status);

            stm.execute();

        } catch (Exception e) {
            System.out.println("update:" + e.getMessage());
        }
    }

    public int count(String txtSearch) {
        try {
            String strSQL = "SELECT COUNT(*) FROM Feedbacks f\n"
                    + "FULL OUTER JOIN Products p ON f.product_id = p.id\n"
                    + "WHERE p.title LIKE ? OR f.comment LIKE ?";
            stm = connection.prepareStatement(strSQL);

            stm.setString(1, "%" + txtSearch + "%");
            stm.setString(2, "%" + txtSearch + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {

        }
        return 0;
    }

    public ArrayList<Feedback> Search(String txtSearch, int index, int pageSize) {
        ArrayList<Feedback> list = new ArrayList<Feedback>();
        try {
            String strSQL = "with x AS (select ROW_NUMBER() over ( order by f.id asc) as r, f.id , c.name, p.title, f.date, f.rated_star, f.comment, f.status FROM Feedbacks f\n"
                    + "FULL OUTER JOIN Products p ON f.product_id = p.id\n"
                    + "FULL OUTER JOIN Customers c on f.customer_id = c.id\n"
                    + "WHERE p.title LIKE ? or f.comment like ?)\n"
                    + "select * from x where r between ?*3 - 2 and ?*3";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, "%" + txtSearch + "%");
            stm.setString(2, "%" + txtSearch + "%");
            stm.setInt(3, index);
            stm.setInt(4, index);
            rs = stm.executeQuery();

            while (rs.next()) {
                String id = String.valueOf(rs.getInt("id"));
                String customer = rs.getString("name");
                String product = rs.getString("title");
                String date = rs.getString(5);
                String ratedStar = rs.getString(6);
                String comment = rs.getString(7);
                String status = rs.getString(8);
                list.add(new Feedback(id, customer, product, date, ratedStar, comment, status));
            }

        } catch (Exception e) {
            System.out.println("Search:" + e.getMessage());
        }
        return list;
    }

    public ArrayList<Feedback> getFeedbackDetailById(String id) {
        ArrayList<Feedback> feedbackdetail = new ArrayList<Feedback>();
        try {
            String strSQL = "select f.id, c.name, p.title, f.date,f.rated_star,f.comment, f.status from Feedbacks f  join Customers c on f.customer_id = c.id\n"
                    + "                    join Products p on f.product_id=p.id where f.id = ?";
            stm = connection.prepareStatement(strSQL);
            stm.setInt(1, Integer.parseInt(id));

            rs = stm.executeQuery();
            if (rs.next()) {

                String customer = rs.getString("name");
                String product = rs.getString("title");
                String date = rs.getString(4);
                String ratedStar = rs.getString(5);
                String comment = rs.getString(6);
                String status = rs.getString(7);
                feedbackdetail.add(new Feedback(id, customer, product, date, ratedStar, comment, status));
            }
        } catch (Exception e) {
            System.out.println("getFeedbackDetailById:" + e.getMessage());
        }
        return feedbackdetail;
    }

    public ArrayList<Feedback> getFeedBackByShowStatus() {
        ArrayList<Feedback> listFeedbackByStatus = new ArrayList<Feedback>();
        try {
            String strSQL = "select * from Feedbacks f  join Customers c on f.customer_id = c.id\n"
                    + "join Products p on f.product_id=p.id where f.status = '1'";
            stm = connection.prepareStatement(strSQL);

            rs = stm.executeQuery();

            while (rs.next()) {
                String id = String.valueOf(rs.getInt("id"));
                String customer = rs.getString("name");
                String product = rs.getString("title");
                String date = rs.getString(4);
                String ratedStar = rs.getString(5);
                String comment = rs.getString(6);
                String status = rs.getString(7);
                listFeedbackByStatus.add(new Feedback(id, customer, product, date, ratedStar, comment, status));

            }

        } catch (Exception e) {
            System.out.println("getFeedBackByShowStatus:" + e.getMessage());
        }
        return listFeedbackByStatus;

    }

    public ArrayList<Feedback> getFeedBackByHideStatus() {

        ArrayList<Feedback> listFeedbackByStatus = new ArrayList<Feedback>();
        try {
            String strSQL = "select * from Feedbacks f  join Customers c on f.customer_id = c.id\n"
                    + "join Products p on f.product_id=p.id where f.status = '0'";
            stm = connection.prepareStatement(strSQL);

            rs = stm.executeQuery();

            while (rs.next()) {
                String id = String.valueOf(rs.getInt("id"));
                String customer = rs.getString("name");
                String product = rs.getString("title");
                String date = rs.getString(4);
                String ratedStar = rs.getString(5);
                String comment = rs.getString(6);
                String status = rs.getString(7);
                listFeedbackByStatus.add(new Feedback(id, customer, product, date, ratedStar, comment, status));

            }

        } catch (Exception e) {
            System.out.println("getFeedBackByShowStatus:" + e.getMessage());
        }
        return listFeedbackByStatus;
    }

    public ArrayList<Feedback> getFeedBackBy1Star() {
        ArrayList<Feedback> listFeedbackByStar = new ArrayList<Feedback>();
        try {
            String strSQL = "select f.id,c.name,p.title,f.rated_star,f.comment from Feedbacks f  join Customers c on f.customer_id = c.id\n"
                    + "                  join Products p on f.product_id=p.id where f.rated_star = '1'";
            stm = connection.prepareStatement(strSQL);

            rs = stm.executeQuery();

            while (rs.next()) {
                String id = String.valueOf(rs.getInt("id"));
                String customer = rs.getString("name");
                String product = rs.getString("title");
                String ratedStar = rs.getString("rated_star");
                String comment = rs.getString("comment");
                listFeedbackByStar.add(new Feedback(id, customer, product, ratedStar, comment));

            }

        } catch (Exception e) {
            System.out.println("getFeedBackByShowStatus:" + e.getMessage());
        }
        return listFeedbackByStar;
    }

    public ArrayList<Feedback> getFeedBackBy2Star() {
        ArrayList<Feedback> listFeedbackByStar = new ArrayList<Feedback>();
        try {
            String strSQL = "select f.id,c.name,p.title,f.rated_star,f.comment from Feedbacks f  join Customers c on f.customer_id = c.id\n"
                    + "                  join Products p on f.product_id=p.id where f.rated_star = '2'";
            stm = connection.prepareStatement(strSQL);

            rs = stm.executeQuery();

            while (rs.next()) {
                String id = String.valueOf(rs.getInt("id"));
                String customer = rs.getString("name");
                String product = rs.getString("title");
                String ratedStar = rs.getString("rated_star");
                String comment = rs.getString("comment");
                listFeedbackByStar.add(new Feedback(id, customer, product, ratedStar, comment));

            }

        } catch (Exception e) {
            System.out.println("getFeedBackByShowStatus:" + e.getMessage());
        }
        return listFeedbackByStar;

    }

    public ArrayList<Feedback> getFeedBackBy3Star() {
        ArrayList<Feedback> listFeedbackByStar = new ArrayList<Feedback>();
        try {
            String strSQL = "select f.id,c.name,p.title,f.rated_star,f.comment from Feedbacks f  join Customers c on f.customer_id = c.id\n"
                    + "                  join Products p on f.product_id=p.id where f.rated_star = '3'";
            stm = connection.prepareStatement(strSQL);

            rs = stm.executeQuery();

            while (rs.next()) {
                String id = String.valueOf(rs.getInt("id"));
                String customer = rs.getString("name");
                String product = rs.getString("title");
                String ratedStar = rs.getString("rated_star");
                String comment = rs.getString("comment");
                listFeedbackByStar.add(new Feedback(id, customer, product, ratedStar, comment));

            }

        } catch (Exception e) {
            System.out.println("getFeedBackByShowStatus:" + e.getMessage());
        }
        return listFeedbackByStar;

    }

    public ArrayList<Feedback> getFeedBackBy4Star() {
        ArrayList<Feedback> listFeedbackByStar = new ArrayList<Feedback>();
        try {
            String strSQL = "select f.id,c.name,p.title,f.rated_star,f.comment from Feedbacks f  join Customers c on f.customer_id = c.id\n"
                    + "                  join Products p on f.product_id=p.id where f.rated_star = '4'";
            stm = connection.prepareStatement(strSQL);

            rs = stm.executeQuery();

            while (rs.next()) {
                String id = String.valueOf(rs.getInt("id"));
                String customer = rs.getString("name");
                String product = rs.getString("title");
                String ratedStar = rs.getString("rated_star");
                String comment = rs.getString("comment");
                listFeedbackByStar.add(new Feedback(id, customer, product, ratedStar, comment));

            }

        } catch (Exception e) {
            System.out.println("getFeedBackByShowStatus:" + e.getMessage());
        }
        return listFeedbackByStar;

    }

    public ArrayList<Feedback> getFeedBackBy5Star() {
        ArrayList<Feedback> listFeedbackByStar = new ArrayList<Feedback>();
        try {
            String strSQL = "select f.id,c.name,p.title,f.rated_star,f.comment from Feedbacks f  join Customers c on f.customer_id = c.id\n"
                    + "                  join Products p on f.product_id=p.id where f.rated_star = '5'";
            stm = connection.prepareStatement(strSQL);

            rs = stm.executeQuery();

            while (rs.next()) {
                String id = String.valueOf(rs.getInt("id"));
                String customer = rs.getString("name");
                String product = rs.getString("title");
                String ratedStar = rs.getString("rated_star");
                String comment = rs.getString("comment");
                listFeedbackByStar.add(new Feedback(id, customer, product, ratedStar, comment));

            }

        } catch (Exception e) {
            System.out.println("getFeedBackByShowStatus:" + e.getMessage());
        }
        return listFeedbackByStar;

    }

    public ArrayList<Category> getCategory() {
        ArrayList<Category> listcategories = new ArrayList<Category>();
        try {
            String strSQL = "select * from Categories";
            stm = connection.prepareStatement(strSQL);

            rs = stm.executeQuery();

            while (rs.next()) {
                String id = String.valueOf(rs.getInt("id"));
                String name = rs.getString("name");

                listcategories.add(new Category(id, name));

            }

        } catch (Exception e) {
            System.out.println("getAllFeedback:" + e.getMessage());
        }
        return listcategories;

    }

    public ArrayList<Feedback> getFeedBackByCategories1() {
        ArrayList<Feedback> listFeedbackByCategories = new ArrayList<Feedback>();
        try {
            String strSQL = "select f.id,c.name,p.title,f.rated_star,f.comment from Feedbacks f  join Customers c on f.customer_id = c.id\n"
                    + "                  join Products p on f.product_id=p.id\n"
                    + "				  where p.category_id = '1'";
            stm = connection.prepareStatement(strSQL);

            rs = stm.executeQuery();

            while (rs.next()) {
                String id = String.valueOf(rs.getInt("id"));
                String customer = rs.getString("name");
                String product = rs.getString("title");
                String ratedStar = rs.getString("rated_star");
                String comment = rs.getString("comment");
                listFeedbackByCategories.add(new Feedback(id, customer, product, ratedStar, comment));

            }

        } catch (Exception e) {
            System.out.println("getFeedBackByShowStatus:" + e.getMessage());
        }
        return listFeedbackByCategories;

    }

    public ArrayList<Feedback> getFeedBackByCategories2() {
          ArrayList<Feedback> listFeedbackByCategories = new ArrayList<Feedback>();
        try {
            String strSQL = "select f.id,c.name,p.title,f.rated_star,f.comment from Feedbacks f  join Customers c on f.customer_id = c.id\n"
                    + "                  join Products p on f.product_id=p.id\n"
                    + "				  where p.category_id = '2'";
            stm = connection.prepareStatement(strSQL);

            rs = stm.executeQuery();

            while (rs.next()) {
                String id = String.valueOf(rs.getInt("id"));
                String customer = rs.getString("name");
                String product = rs.getString("title");
                String ratedStar = rs.getString("rated_star");
                String comment = rs.getString("comment");
                listFeedbackByCategories.add(new Feedback(id, customer, product, ratedStar, comment));

            }

        } catch (Exception e) {
            System.out.println("getFeedBackByShowStatus:" + e.getMessage());
        }
        return listFeedbackByCategories;
    }

    public ArrayList<Feedback> getFeedBackByCategories3() {
          ArrayList<Feedback> listFeedbackByCategories = new ArrayList<Feedback>();
        try {
            String strSQL = "select f.id,c.name,p.title,f.rated_star,f.comment from Feedbacks f  join Customers c on f.customer_id = c.id\n"
                    + "                  join Products p on f.product_id=p.id\n"
                    + "				  where p.category_id = '3'";
            stm = connection.prepareStatement(strSQL);

            rs = stm.executeQuery();

            while (rs.next()) {
                String id = String.valueOf(rs.getInt("id"));
                String customer = rs.getString("name");
                String product = rs.getString("title");
                String ratedStar = rs.getString("rated_star");
                String comment = rs.getString("comment");
                listFeedbackByCategories.add(new Feedback(id, customer, product, ratedStar, comment));

            }

        } catch (Exception e) {
            System.out.println("getFeedBackByShowStatus:" + e.getMessage());
        }
        return listFeedbackByCategories;
    }

    public ArrayList<Feedback> getFeedBackByCategories4() {
          ArrayList<Feedback> listFeedbackByCategories = new ArrayList<Feedback>();
        try {
            String strSQL = "select f.id,c.name,p.title,f.rated_star,f.comment from Feedbacks f  join Customers c on f.customer_id = c.id\n"
                    + "                  join Products p on f.product_id=p.id\n"
                    + "				  where p.category_id = '4'";
            stm = connection.prepareStatement(strSQL);

            rs = stm.executeQuery();

            while (rs.next()) {
                String id = String.valueOf(rs.getInt("id"));
                String customer = rs.getString("name");
                String product = rs.getString("title");
                String ratedStar = rs.getString("rated_star");
                String comment = rs.getString("comment");
                listFeedbackByCategories.add(new Feedback(id, customer, product, ratedStar, comment));

            }

        } catch (Exception e) {
            System.out.println("getFeedBackByShowStatus:" + e.getMessage());
        }
        return listFeedbackByCategories;
    }

    public void update(String status, String id) {
         try {
        String strSQL = "UPDATE [dbo].[Feedbacks]\n"
                + "   SET \n"
                + "      [status] = ?\n"
                + " WHERE id = ?";
        stm = connection.prepareStatement(strSQL);

        stm.setString(1, status);
        stm.setString(2, id);

        stm.executeUpdate();

    } catch (Exception e) {
        System.out.println("Lỗi khi cập nhật: " + e.getMessage());
    }
}
    }

