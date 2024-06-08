/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author admin
 */
public class FeedbackMKTDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;
//    public static void main(String[] args) {
//        FeedbackDAO dao = new FeedbackDAO();
//        System.out.println(dao.getTotalFeedback());
//    }

    public int getTotalFeedback() {
        String sql = "SELECT COUNT(*) FROM Feedbacks";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("getTotalFeedback: " + e.getMessage());
        }
        return 0;
    }
}
