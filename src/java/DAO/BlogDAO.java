package DAO;

import Models.Blog;
import dal.DBContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BlogDAO extends DBContext {

    PreparedStatement stm; // thực hiện câu lệnh SQL
    ResultSet rs;//lưu trữ dữ liệu được lưu về từ  select

    public ArrayList<Blog> getAllBlogs(int pageNumber, int pageSize) {
        ArrayList<Blog> blogs = new ArrayList<>();
        int offset = (pageNumber - 1) * pageSize;
        try {
            String query = "SELECT * FROM Blogs ORDER BY update_date DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
            stm = connection.prepareStatement(query);
            stm.setInt(1, offset);
            stm.setInt(2, pageSize);
            rs = stm.executeQuery();
            while (rs.next()) {
                blogs.add(mapResultSetToBlog(rs));
            }
        } catch (SQLException e) {
            System.out.println("Error fetching blogs: " + e.getMessage());
            e.printStackTrace();
        }
        return blogs;
    }

    public int getTotalNumberOfBlogs() {
        int total = 0;
        try {
            String query = "SELECT COUNT(*) AS total FROM Blogs";
            stm = connection.prepareStatement(query);
            rs = stm.executeQuery();
            if (rs.next()) {
                total = rs.getInt("total");
            }
        } catch (SQLException e) {
            System.out.println("Error getting total number of blogs: " + e.getMessage());
            e.printStackTrace();
        }
        return total;
    }

    public List<Blog> searchBlogs(String keyword, int pageNumber, int pageSize) {
        List<Blog> blogs = new ArrayList<>();
        int offset = (pageNumber - 1) * pageSize;
        try {
            String query = "SELECT * FROM Blogs WHERE title LIKE ? ORDER BY update_date DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
            stm = connection.prepareStatement(query);
            stm.setString(1, "%" + keyword + "%");
            stm.setInt(2, offset);
            stm.setInt(3, pageSize);
            rs = stm.executeQuery();
            while (rs.next()) {
                blogs.add(mapResultSetToBlog(rs));
            }
        } catch (SQLException e) {
            System.out.println("Error searching blogs: " + e.getMessage());
            e.printStackTrace();
        }
        return blogs;
    }

    public int getTotalNumberOfBlogs(String keyword) {
        int total = 0;
        try {
            String query = "SELECT COUNT(*) AS total FROM Blogs WHERE title LIKE ?";
            stm = connection.prepareStatement(query);
            stm.setString(1, "%" + keyword + "%");
            rs = stm.executeQuery();
            if (rs.next()) {
                total = rs.getInt("total");
            }
        } catch (SQLException e) {
            System.out.println("Error getting total number of blogs with keyword: " + e.getMessage());
            e.printStackTrace();
        }
        return total;
    }

    public List<Blog> getBlogsByCategory(int categoryId, int pageNumber, int pageSize) {
        List<Blog> blogs = new ArrayList<>();
        int offset = (pageNumber - 1) * pageSize;
        try {
            String query = "SELECT * FROM Blogs WHERE category_blog_id = ? ORDER BY update_date DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
            stm = connection.prepareStatement(query);
            stm.setInt(1, categoryId);
            stm.setInt(2, offset);
            stm.setInt(3, pageSize);
            rs = stm.executeQuery();
            while (rs.next()) {
                blogs.add(mapResultSetToBlog(rs));
            }
        } catch (SQLException e) {
            System.out.println("Error fetching blogs by category: " + e.getMessage());
            e.printStackTrace();
        }
        return blogs;
    }

    public int getTotalNumberOfBlogsByCategory(int categoryId) {
        int total = 0;
        try {
            String query = "SELECT COUNT(*) AS total FROM Blogs WHERE category_blog_id = ?";
            stm = connection.prepareStatement(query);
            stm.setInt(1, categoryId);
            rs = stm.executeQuery();
            if (rs.next()) {
                total = rs.getInt("total");
            }
        } catch (SQLException e) {
            System.out.println("Error getting total number of blogs by category: " + e.getMessage());
            e.printStackTrace();
        }
        return total;
    }

    public List<Blog> getRecentBlogs() {
        List<Blog> blogs = new ArrayList<>();
        try {
            String query = "SELECT TOP 5 * FROM Blogs ORDER BY update_date DESC";
            stm = connection.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                blogs.add(mapResultSetToBlog(rs));
            }
        } catch (SQLException e) {
            System.out.println("Error fetching recent blogs: " + e.getMessage());
            e.printStackTrace();
        }
        return blogs;
    }

    private Blog mapResultSetToBlog(ResultSet rs) throws SQLException {
        String id = rs.getString("id");
        String staffId = rs.getString("staff_id");
        String title = rs.getString("title");
        String categoryBlogId = rs.getString("category_blog_id");
        String image = rs.getString("image");
        String updateDate = rs.getString("update_date");
        String description = rs.getString("description");
        String content = rs.getString("content");
        String isDelete = rs.getString("isDelete");
        return new Blog(id, staffId, title, categoryBlogId, image, updateDate, description, content, isDelete);
    }

    public Blog getBlogById(int id) {
        Blog blog = null;
        try {
            String query = "SELECT b.id, b.staff_id, b.title, cb.name as category_name, b.image, b.update_date, b.description, b.content, b.isDelete "
                    + "FROM Blogs b "
                    + "JOIN CategoryBlogs cb ON b.category_blog_id = cb.id "
                    + "WHERE b.id = ?";
            stm = connection.prepareStatement(query);
            stm.setInt(1, id);
            rs = stm.executeQuery();

            if (rs.next()) {
                blog = new Blog();
                blog.setId(rs.getString("id"));
                blog.setStaff(rs.getString("staff_id"));
                blog.setTitle(rs.getString("title"));
                blog.setCategoryBlog(rs.getString("category_name")); // Use category_name instead of category_blog_id
                blog.setImage(rs.getString("image"));
                blog.setUpdateDate(rs.getString("update_date"));
                blog.setDescription(rs.getString("description"));
                blog.setContent(rs.getString("content"));
                blog.setIsDelete(rs.getString("isDelete"));
            }
        } catch (SQLException e) {
            System.out.println("Error fetching blog by id: " + e.getMessage());
            e.printStackTrace();
        }
        return blog;
    }

}
