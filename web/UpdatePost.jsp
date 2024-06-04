<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Post</title>
</head>
<body>
    <h1>Update Post</h1>
    <form method="post" action="EditPostController">
        <input type="hidden" name="id" value="${post.id}">
        <label>Title:</label>
        <input type="text" name="title" value="${post.title}" required><br>
        <label>Category:</label>
        <input type="text" name="categoryBlogId" value="${post.categoryBlogId}" required><br>
        <label>Image URL:</label>
        <input type="text" name="image" value="${post.image}"><br>
        <label>Description:</label>
        <textarea name="description" required>${post.description}</textarea><br>
        <label>Content:</label>
        <textarea name="content" required>${post.content}</textarea><br>
        <label>Featured:</label>
        <input type="checkbox" name="featured" value="1" ${post.featured == '1' ? 'checked' : ''}><br>
        <button type="submit">Update</button>
    </form>
</body>
</html>

