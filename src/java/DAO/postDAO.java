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

    // Build the query
    StringBuilder queryBuilder = new StringBuilder();
    queryBuilder.append("SELECT b.id, b.title, b.image, b.update_date, b.description, b.content, b.status, ")
                .append("s.fullname AS staff_name, c.name AS category_name ")
                .append("FROM Blogs b ")
                .append("JOIN Staffs s ON b.staff_id = s.id ")
                .append("JOIN CategoryBlogs c ON b.category_blog_id = c.id ")
                .append("WHERE b.title LIKE ? ")
                .append("AND (c.name LIKE ? OR ? = '') ") // Handle filtering by category
                .append("AND (b.status = ? OR ? = '') ") // Handle filtering by status
                .append("AND b.isDelete = 1 ") // Assuming you want to exclude deleted posts
                .append("ORDER BY ").append(sortField != null ? sortField : "b.id")
                .append(" OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");

    String query = queryBuilder.toString();

    try (PreparedStatement ps = connection.prepareStatement(query)) {
        ps.setString(1, searchTitle != null ? "%" + searchTitle + "%" : "%");
        ps.setString(2, filterCategory != null && !filterCategory.isEmpty() ? "%" + filterCategory + "%" : "%");
        ps.setString(3, filterCategory != null && !filterCategory.isEmpty() ? "%" + filterCategory + "%" : "");
        ps.setString(4, filterStatus != null && !filterStatus.isEmpty() ? filterStatus : "");
        ps.setString(5, filterStatus != null && !filterStatus.isEmpty() ? filterStatus : "");
        ps.setInt(6, start);
        ps.setInt(7, recordsPerPage);

        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Blog blog = new Blog();
                    blog.setId(rs.getString("id"));
                blog.setTitle(rs.getString("title"));
                blog.setImage(rs.getString("image"));
                    blog.setUpdateDate(rs.getString("update_date"));
                blog.setDescription(rs.getString("description"));
                blog.setContent(rs.getString("content"));
                    blog.setStatus(rs.getString("status"));
                blog.setStaffName(rs.getString("staff_name"));
                blog.setCategoryBlogName(rs.getString("category_name"));
                posts.add(blog);
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
        String query = "SELECT b.id, b.title, b.image, b.update_date, b.description, b.content, b.status, "
                + "s.fullname AS staff_name, c.name AS category_name "
                + "FROM Blogs b "
                + "JOIN Staffs s ON b.staff_id = s.id "
                + "JOIN CategoryBlogs c ON b.category_blog_id = c.id "
                + "WHERE b.isDelete = 1 "
                + // Optional: Filter out deleted blogs
                "ORDER BY b.id DESC "
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, offset);
            ps.setInt(2, pageSize);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Blog blog = new Blog();
                    blog.setId(rs.getString("id"));
                    blog.setTitle(rs.getString("title"));
                    blog.setImage(rs.getString("image"));
                    blog.setUpdateDate(rs.getString("update_date"));
                    blog.setDescription(rs.getString("description"));
                    blog.setContent(rs.getString("content"));
                    blog.setStatus(rs.getString("status"));
                    blog.setStaffName(rs.getString("staff_name"));
                    blog.setCategoryBlogName(rs.getString("category_name"));
                    posts.add(blog);
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
