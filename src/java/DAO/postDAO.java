package DAO;

import Models.Blog;
import dal.DBContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class postDAO extends DBContext {

    private int noOfRecords;

    public List<Blog> getFilteredAndSortedPosts(String searchTitle, String filterCategory, String filterStatus, String sortField, int page, int recordsPerPage) {
        List<Blog> posts = new ArrayList<>();
        int start = (page - 1) * recordsPerPage;

        String query = "SELECT * FROM Blogs WHERE title LIKE ? AND category_blog_id LIKE ? AND isDelete LIKE ? ORDER BY "
                + (sortField != null ? sortField : "id") + " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, searchTitle != null ? "%" + searchTitle + "%" : "%");
            ps.setString(2, filterCategory != null && !filterCategory.isEmpty() ? filterCategory : "%");
            ps.setString(3, filterStatus != null && !filterStatus.isEmpty() ? filterStatus : "%");
            ps.setInt(4, start);
            ps.setInt(5, recordsPerPage);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    posts.add(mapResultSetToBlog(rs));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return posts;
    }

    public List<Blog> getAllPosts(int pageNumber, int pageSize) {
        List<Blog> posts = new ArrayList<>();
        int offset = (pageNumber - 1) * pageSize;
        try {
            String query = "SELECT * FROM Blogs ORDER BY update_date DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
            try (PreparedStatement ps = connection.prepareStatement(query)) {
                ps.setInt(1, offset);
                ps.setInt(2, pageSize);
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        posts.add(mapResultSetToBlog(rs));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return posts;
    }

    public int getTotalPosts() {
        String query = "SELECT COUNT(*) FROM Blogs WHERE isDelete = 0";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int getNoOfRecords() {
        String query = "SELECT COUNT(*) AS total FROM Blogs WHERE isDelete = 0";
        try (PreparedStatement ps = connection.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                noOfRecords = rs.getInt("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return noOfRecords;
    }

    private Blog mapResultSetToBlog(ResultSet rs) throws SQLException {
        Blog blog = new Blog();
        blog.setId(rs.getString("id"));
        blog.setStaff(rs.getString("staff_id"));
        blog.setTitle(rs.getString("title"));
        blog.setCategoryBlog(rs.getString("category_blog_id"));
        blog.setImage(rs.getString("image"));
        blog.setUpdateDate(rs.getString("update_date"));
        blog.setDescription(rs.getString("description"));
        blog.setContent(rs.getString("content"));
        blog.setStatus(rs.getString("status"));
        blog.setIsDelete(rs.getString("isDelete"));
        return blog;
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
        String query = "INSERT INTO Blogs (image, title, category_blog_id,update_date, description, content ,staff_id, status, isDelete) VALUES (?, ?, ?, ?, ?, ?, ?, ?, 1)";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, post.getImage());
            ps.setString(2, post.getTitle());
            ps.setInt(3, Integer.parseInt(post.getCategoryBlog()));
            ps.setString(4, post.getUpdateDate());
            ps.setString(5, post.getDescription());
            ps.setString(6, post.getContent());
            ps.setInt(7, Integer.parseInt(post.getStaff()));
            ps.setInt(8, Integer.parseInt(post.getStatus()));
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Lấy bài viết theo ID
    public Blog getPostById(int id) {
        Blog post = null;
        String query = "SELECT * FROM Blogs WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    post = new Blog();
                    post.setId(rs.getString("id"));
                    post.setImage(rs.getString("image"));
                    post.setTitle(rs.getString("title"));
                    post.setCategoryBlog(rs.getString("category_blog_id"));
                    post.setStaff(rs.getString("staff_id"));
                    post.setDescription(rs.getString("description"));
                    post.setContent(rs.getString("content"));
                    post.setStatus(rs.getString("status"));
                    post.setIsDelete(rs.getString("isDelete"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return post;
    }

    // Cập nhật bài viết
    public void updatePost(Blog post) {
        String query = "UPDATE Blogs SET title = ?, category_blog_id = ?, image = ?, description = ?, content = ?, status = ? WHERE id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setString(1, post.getTitle());
            stm.setInt(2, Integer.parseInt(post.getCategoryBlog()));
            stm.setString(3, post.getImage());
            stm.setString(4, post.getDescription());
            stm.setString(5, post.getContent());
            stm.setInt(6, Integer.parseInt(post.getStatus()));  // Use setBoolean for bit fields
            stm.setInt(7, Integer.parseInt(post.getId()));
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error updating post: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public boolean deletePost(int id) {
        boolean rowDeleted = false;
        String query = "UPDATE Blogs SET isDelete = 1 WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, id);
            rowDeleted = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDeleted;
    }

    public static void main(String[] args) {
        postDAO dao = new postDAO();
        Blog blog = dao.getPostById(3);
        System.out.println(blog);

    }
}
