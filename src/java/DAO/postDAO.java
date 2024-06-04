package DAO;

import Models.Blog;
import dal.DBContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class postDAO extends DBContext {
    private int noOfRecords;

    public List<Blog> getFilteredAndSortedPosts(String searchTitle, String filterCategory, String filterStatus, String sortField, int page, int recordsPerPage) {
        List<Blog> postList = new ArrayList<>();
        int start = (page - 1) * recordsPerPage;
        String query = "SELECT SQL_CALC_FOUND_ROWS * FROM Blogs WHERE 1=1";
        
        if (searchTitle != null && !searchTitle.isEmpty()) {
            query += " AND title LIKE '%" + searchTitle + "%'";
        }
        if (filterCategory != null && !filterCategory.isEmpty()) {
            query += " AND categoryBlogId = '" + filterCategory + "'";
        }
        if (filterStatus != null && !filterStatus.isEmpty()) {
            query += " AND isDelete = '" + filterStatus + "'";
        }
        if (sortField != null && !sortField.isEmpty()) {
            query += " ORDER BY " + sortField;
        } else {
            query += " ORDER BY id";
        }
        query += " LIMIT " + start + ", " + recordsPerPage;

        try {
            PreparedStatement stm = connection.prepareStatement(query);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Blog blog = new Blog(
                        rs.getString("id"),
                        rs.getString("staffId"),
                        rs.getString("title"),
                        rs.getString("categoryBlogId"),
                        rs.getString("image"),
                        rs.getString("description"),
                        rs.getString("content"),
                        rs.getString("isDelete"),
                        rs.getString("Status")
                );
                postList.add(blog);
            }

            rs = stm.executeQuery("SELECT FOUND_ROWS()");
            if (rs.next()) {
                this.noOfRecords = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return postList;
    }

    public int getNoOfRecords() {
        return noOfRecords;
    }

    public void updatePostStatus(int id, boolean hide) {
        try {
            String query = "UPDATE Blogs SET isDelete = ? WHERE id = ?";
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, hide ? 1 : 0);
            stm.setInt(2, id);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error updating post status: " + e.getMessage());
            e.printStackTrace();
        }
    }
    public void addPost(Blog post) {
        String query = "INSERT INTO Blogs (staffId, title, categoryBlogId, image, publishDate, description, content, isDelete, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setString(1, post.getStaff());
            stm.setString(2, post.getTitle());
            stm.setString(3, post.getCategoryBlog());
            stm.setString(4, post.getImage());
//            stm.setTimestamp(5, post.getPublishDate());
            stm.setString(6, post.getDescription());
            stm.setString(7, post.getContent());
            stm.setString(8, post.getIsDelete());
//            stm.setString(9, post.getFeatured());
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error creating post: " + e.getMessage());
            e.printStackTrace();
        }
    }

    // Lấy bài viết theo ID
    public Blog getPostById(int id) {
        Blog post = null;
        String query = "SELECT * FROM Blogs WHERE id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                post = new Blog(
                        rs.getString("id"),
                        rs.getString("staffId"),
                        rs.getString("title"),
                        rs.getString("categoryBlogId"),
                        rs.getString("image"),
//                        rs.getTimestamp("publishDate"),
                        rs.getString("description"),
                        rs.getString("content"),
                        rs.getString("isDelete"),
                        rs.getString("status")
                );
            }
        } catch (SQLException e) {
            System.out.println("Error retrieving post: " + e.getMessage());
            e.printStackTrace();
        }

        return post;
    }

    // Cập nhật bài viết
    public void updatePost(Blog post) {
        String query = "UPDATE Blogs SET title = ?, categoryBlogId = ?, image = ?, description = ?, content = ?, featured = ? WHERE id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setString(1, post.getTitle());
            stm.setString(2, post.getCategoryBlog());
            stm.setString(3, post.getImage());
            stm.setString(4, post.getDescription());
            stm.setString(5, post.getContent());
            stm.setString(6, post.getStatus());
            stm.setString(7, post.getId());
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error updating post: " + e.getMessage());
            e.printStackTrace();
        }
    }
}

