<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Post</title>
</head>
<body>
    <h1>Add New Post</h1>
    <form action="CreatePost" method="post">
        <label for="staff">Staff ID:</label>
        <input type="text" name="staff" id="staff" required/><br/>
        <label for="title">Title:</label>
        <input type="text" name="title" id="title" required/><br/>
        <label for="categoryBlogId">Category:</label>
        <input type="text" name="categoryBlogId" id="categoryBlogId" required/><br/>
        <label for="image">Image:</label>
        <input type="text" name="image" id="image" required/><br/>
        <label for="updateDate">Update Date:</label>
        <input type="date" name="updateDate" id="updateDate" required/><br/>
        <label for="description">Description:</label>
        <textarea name="description" id="description" required></textarea><br/>
        <label for="content">Content:</label>
        <textarea name="content" id="content" required></textarea><br/>
        <label for="status">Status:</label>
        <input type="text" name="status" id="status" required/><br/>
        <button type="submit">Add Post</button>
    </form>
</body>
</html>
