<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Post List</title>
    <link rel="stylesheet" type="text/css" href="css/bloglist.css">
</head>
<body>
    <header>
        <h1>Post List</h1>
    </header>
    <div class="container">
        <div class="main-content">
            <!-- Search bar -->
            <div class="search-bar">
                <form action="postlist" method="get">
                    <input type="text" name="searchTitle" placeholder="Search by title" value="${param.searchTitle}">
                    <input type="text" name="filterCategory" placeholder="Filter by category" value="${param.filterCategory}">
                    <select name="filterStatus">
                        <option value="">Filter by status</option>
                        <option value="true" ${param.filterStatus == 'true' ? 'selected' : ''}>Show</option>
                        <option value="false" ${param.filterStatus == 'false' ? 'selected' : ''}>Hide</option>
                    </select>
                    <button type="submit">Search</button>
                </form>
            </div>
                    
                    <a href="CreatePost">Create New Post</a>

            <!-- Post list -->
            <table border="1">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Image</th>
                        <th>Title</th>
                        <th>Category</th>
                        <th>Staff</th>
                        <th>Status</th>
                        <th>Description</th>
                        <th>Content</th>
                        <th>Update Date</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="post" items="${posts}">
                        <tr>
                            <td>${post.id}</td>
                            <td><img src="${post.image}" alt="${post.title}" width="50"></td>
                            <td>${post.title}</td>
                            <td>${post.categoryBlog}</td>
                            <td>${post.staff}</td>
                            <td>${post.status == '0' ? 'Show' : 'Hide'}</td>
                            <td>${post.description}</td>
                            <td>${post.content}</td>
                            <td>${post.updateDate}</td>
                            <td>
                                <a href="viewPost?id=${post.id}">View</a>
                                <a href="updatepost?id=${post.id}">Edit</a>
                                <a href="deletePost?id=${post.id}">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <!-- Pagination -->
            <div class="pagination">
                <c:forEach begin="1" end="${noOfPages}" var="pageNum">
                    <a href="postlist?page=${pageNum}" ${currentPage == pageNum ? 'class="active"' : ''}>${pageNum}</a>
                </c:forEach>
            </div>
        </div>

        <!-- Sidebar -->
        <aside>
            <h2>Categories</h2>
            <ul>
                <c:forEach var="category" items="${categories}">
                    <li>${category.name}</li>
                </c:forEach>
            </ul>
        </aside>
    </div>
</body>
</html>
