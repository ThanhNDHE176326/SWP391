<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Post List</title>
</head>
<body>
    <h1>Post List</h1>
    <form method="get" action="PostListController">
        <input type="text" name="searchTitle" placeholder="Search by title">
        <select name="filterCategory">
            <option value="">All Categories</option>
            <!-- Add category options here -->
        </select>
        <select name="filterStatus">
            <option value="">All Statuses</option>
            <option value="0">Visible</option>
            <option value="1">Hidden</option>
        </select>
        <button type="submit">Filter</button>
    </form>
    <a href="CreatePostController">Add New Post</a>
    <table border="1">
        <tr>
            <th><a href="?sortField=title">Title</a></th>
            <th><a href="?sortField=categoryBlogId">Category</a></th>
            <th><a href="?sortField=featured">Featured</a></th>
            <th><a href="?sortField=isDelete">Status</a></th>
            <th>Actions</th>
        </tr>
        <c:forEach var="post" items="${postList}">
            <tr>
                <td>${post.title}</td>
                <td>${post.categoryBlogId}</td>
                <td>${post.featured == '1' ? 'Yes' : 'No'}</td>
                <td>${post.isDelete == '1' ? 'Hidden' : 'Visible'}</td>
                <td>
                    <a href="EditPostController?id=${post.id}">Edit</a>
                    <a href="UpdatePostStatusController?id=${post.id}&action=${post.isDelete == '1' ? 'show' : 'hide'}">
                        ${post.isDelete == '1' ? 'Show' : 'Hide'}
                    </a>
                    <a href="ViewPostController?id=${post.id}">View</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <c:forEach var="i" begin="1" end="${noOfPages}">
        <a href="PostListController?page=${i}">${i}</a>
    </c:forEach>
</body>
</html>

