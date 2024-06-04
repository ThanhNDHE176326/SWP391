<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create New Post</title>
</head>
<body>
    <h1>Create New Post</h1>
    <form method="post" action="CreatePostController">
        <label>Title:</label>
        <input type="text" name="title" required><br>
        <label>Category:</label>
        <input type="text" name="categoryBlogId" required><br>
        <label>Image URL:</label>
        <input type="text" name="image"><br>
        <label>Description:</label>
        <textarea name="description" required></textarea><br>
        <label>Content:</label>
        <textarea name="content" required></textarea><br>
        <label>Featured:</label>
        <input type="checkbox" name="featured" value="1"><br>
        <button type="submit">Create</button>
    </form>
</body>
</html>
