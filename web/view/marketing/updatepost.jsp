<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Post</title>
</head>
<body>
    <h1>Update Post</h1>
    <form action="updatepost" method="post">
        <input type="hidden" name="id" value="${post.id}"/>
        <label for="title">Title:</label>
        <input type="text" name="title" id="title" value="${post.title}" required/><br/>
        <label for="category_blog_id">Category:</label>
        <input type="text" name="category_blog_id" id="category_blog_id" value="${post.categoryBlog}" required/><br/>
        <label for="image">Image:</label>
        <input type="text" name="image" id="image" value="${post.image}" required/><br/>
        <label for="description">Description:</label>
        <textarea name="description" id="description" required>${post.description}</textarea><br/>
        <label for="content">Content:</label>
        <textarea name="content" id="content" required>${post.content}</textarea><br/>
        <label for="status">Status:</label>
        <input type="text" name="status" id="status" value="${post.status}" required/><br/>
        <button type="submit">Update</button>
    </form>
</body>
</html>
