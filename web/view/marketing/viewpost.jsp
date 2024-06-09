<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>View Post</title>
</head>
<body>
    <h1>View Post</h1>

    <table border="1">
        <tr>
            <th>ID</th>
            <td>${post.id}</td>
        </tr>
        <tr>
            <th>Thumbnail</th>
            <td><img src="${post.image}" alt="image" width="100" height="100"/></td>
        </tr>
        <tr>
            <th>Title</th>
            <td>${post.title}</td>
        </tr>
        <tr>
            <th>Category</th>
            <td>${post.category}</td>
        </tr>
        <tr>
            <th>Status</th>
            <td>${post.status ? 'Show' : 'Hide'}</td>
        </tr>
        <tr>
            <th>Description</th>
            <td>${post.description}</td>
        </tr>
        <tr>
            <th>Content</th>
            <td>${post.content}</td>
        </tr>
    </table>

    <!-- Form for editing post -->
    <h2>Edit Post</h2>
    <form action="CreatePost" method="post">
        <input type="hidden" name="postId" value="${post.id}">
        Image URL: <input type="text" name="image" value="${post.image}"><br>
        Title: <input type="text" name="title" value="${post.title}"><br>
        Description: <input type="text" name="description" value="${post.description}"><br>
        Content: <textarea name="content">${post.content}</textarea><br>
        Status: <select name="status">
                    <option value="1" ${post.status ? 'selected' : ''}>Show</option>
                    <option value="0" ${post.status ? '' : 'selected'}>Hide</option>
                </select><br>
        <input type="submit" value="Save">
    </form>

    <a href="postList">Back to Post List</a>
</body>
</html>
