<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Blog List</title>
        <link rel="stylesheet" type="text/css" href="css/bloglist.css">
    </head>
    <body>
        <header>
            <h1>Blog List</h1>
        </header>
        <div class="container">
            <div class="main-content">
                <!-- Search bar -->
                <div class="search-bar">
                    <form action="bloglist" method="get">
                        <input type="text" name="query" placeholder="Search for blogs..." value="${param.query}">
                        <button type="submit">Search</button>
                    </form>
                </div>

                <!-- Blog list -->
                <c:forEach var="blog" items="${blogs}">
                    <div class="blog">
                        <!-- Display the blog image -->
                        <img src="${blog.image}" alt="${blog.title}" class="blog-image">
                        <div class="blog-content">
                            <h2><a href="blogdetail?id=${blog.id}">${blog.title}</a></h2>
                            <p>${blog.description}</p>
                            <p class="date">${blog.updateDate}</p>
                        </div>
                    </div>
                </c:forEach>

                <!-- Pagination -->
                <!-- Pagination -->
                <div class="pagination">
                    <c:forEach begin="1" end="${noOfPages}" var="i">
                        <a href="bloglist?page=${i}<c:if test='${not empty param.query}'>&query=${param.query}</c:if><c:if test='${not empty param.category}'>&category=${param.category}</c:if>" class="${i == currentPage ? 'active' : ''}">${i}</a>
                    </c:forEach>
                </div>

            </div>

            <!-- Sidebar -->
            <aside class="sidebar">
                <!-- Categories -->
                <div class="category-list">
                    <h2>Categories</h2>
                    <ul>
                        <li><a href="bloglist">All</a></li>
                            <c:forEach var="category" items="${categories}">
                            <li><a href="bloglist?category=${category.id}&query=${param.query}">${category.name}</a></li>
                            </c:forEach>
                    </ul>
                </div>
            </aside>
        </div>
    </body>
</html>
