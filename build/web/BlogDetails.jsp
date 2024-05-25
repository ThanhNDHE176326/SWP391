<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>${blog.title}</title>
        <link rel="stylesheet" type="text/css" href="css/blogdetails.css">
    </head>
    <body>
        <header>
            <h1>${blog.title}</h1>

        </header>
        <div class="container">
            <div class="main-content">
                <!-- Search bar -->
                <div class="search-bar">
                    <form action="bloglist" method="get">
                        <input type="text" name="query" placeholder="Tìm kiếm bài viết..." value="${param.query}">
                        <button type="submit">Tìm kiếm</button>
                    </form>
                </div>
                <!-- Blog content -->
                <article>
                    <p class="meta">Ngày cập nhật: ${blog.updateDate}</p>
                    <p class="meta">Danh mục: ${blog.categoryBlog}</p>
                    <img src="${blog.image}" alt="${blog.title}" class="blog-image" />
                    <div class="blog-description">${blog.description}</div>
                    <div class="blog-content">${blog.content}</div>
                </article>
            </div>
            <aside class="sidebar">
                <!-- Categories list -->
                <div class="category-list">
                    <h2>Danh mục</h2>
                    <ul>
                        <li><a href="bloglist">Tất cả</a></li>
                            <c:forEach var="category" items="${categories}">
                            <li><a href="bloglist?category=${category.id}">${category.name}</a></li>
                            </c:forEach>
                    </ul>
                </div>
                <!-- Pagination -->
                <div class="pagination">
                    <c:forEach begin="1" end="${noOfPages}" var="i">
                        <a href="bloglist?page=${i}" class="${i == currentPage ? 'active' : ''}">${i}</a>
                    </c:forEach>
                </div>
            </aside>
        </div>
    </body>
</html>
