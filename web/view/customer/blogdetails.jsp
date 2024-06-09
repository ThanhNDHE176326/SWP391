<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Blog List | E-Shopper</title>
        <link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
        <link href="<c:url value='/css/font-awesome.min.css'/>" rel="stylesheet">
        <link href="<c:url value='/css/prettyPhoto.css'/>" rel="stylesheet">
        <link href="<c:url value='/css/price-range.css'/>" rel="stylesheet">
        <link href="<c:url value='/css/animate.css'/>" rel="stylesheet">
        <link href="<c:url value='/css/main.css'/>" rel="stylesheet">
        <link href="<c:url value='/css/responsive.css'/>" rel="stylesheet">

        <!--[if lt IE 9]>
        <script src="<c:url value='/js/html5shiv.js'/>"></script>
        <script src="<c:url value='/js/respond.min.js'/>"></script>
        <![endif]-->

        <link rel="shortcut icon" href="<c:url value='/images/ico/favicon.ico'/>">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="<c:url value='/images/ico/apple-touch-icon-144-precomposed.png'/>">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="<c:url value='/images/ico/apple-touch-icon-114-precomposed.png'/>">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="<c:url value='/images/ico/apple-touch-icon-72-precomposed.png'/>">
        <link rel="apple-touch-icon-precomposed" href="<c:url value='/images/ico/apple-touch-icon-57-precomposed.png'/>">


    </head>

    <body>
        <jsp:include page="header.jsp"/>

        <div class="container">
            <div class="row">
                <div class="col-sm-9">
                    <!-- Search bar -->
                    <div class="search-bar">
                        <form action="bloglist" method="get">
                            <input type="text" name="query" placeholder="Tìm kiếm bài viết..." value="${param.query}">
                            <button type="submit">Tìm kiếm</button>
                        </form>
                    </div>

                    <!-- Blog content -->
                    <article>
                        <p class="update-date">Ngày cập nhật: ${blog.updateDate}</p>
                        <p class="category">Danh mục: ${blog.categoryBlog}</p>
                        <img src="${blog.image}" alt="${blog.title}" class="blog-image" />
                        <div class="blog-description">${blog.description}</div>
                        <div class="blog-content">${blog.content}</div>
                    </article>

                    <!-- Pagination -->
                    <div class="pagination-wrapper">
                        <div class="pagination">
                            <c:forEach begin="1" end="${noOfPages}" var="i">
                                <a href="bloglist?page=${i}" class="${i == currentPage ? 'active' : ''}">${i}</a>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <aside class="col-sm-3">
                    <!-- Categories list -->
                    <div class="categories">
                        <h2>Danh mục</h2>
                        <ul>
                            <li><a href="bloglist">Tất cả</a></li>
                                <c:forEach var="category" items="${categories}">
                                <li><a href="bloglist?category=${category.id}" class="${param.category == category.id ? 'active' : ''}">${category.name}</a></li>
                                </c:forEach>
                        </ul>
                    </div>
                </aside>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
        <script src="<c:url value='/js/jquery.js'/>"></script>
        <script src="<c:url value='/js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/js/jquery.scrollUp.min.js'/>"></script>
        <script src="<c:url value='/js/price-range.js'/>"></script>
        <script src="<c:url value='/js/jquery.prettyPhoto.js'/>"></script>
        <script src="<c:url value='/js/main.js'/>"></script>
    </body>
</html>
<style>
    .pagination-wrapper {
        text-align: center; /* Căn giữa dòng */
        margin-top: 20px; /* Khoảng cách từ phần phân trang đến nội dung trên */
    }

    .pagination {
        display: inline-block; /* Hiển thị phân trang trên cùng một dòng */
    }

    .pagination a {
        padding: 5px 10px; /* Khoảng cách giữa các liên kết */
        margin: 0 2px; /* Khoảng cách giữa các liên kết */
        border: 1px solid #ddd; /* Đường viền cho liên kết */
        color: #000; /* Màu chữ */
        text-decoration: none; /* Loại bỏ gạch chân */
    }

    .pagination a.active {
        background-color: #007bff; /* Màu nền cho trang đang được chọn */
        color: #fff; /* Màu chữ cho trang đang được chọn */
        border: 1px solid #007bff; /* Đường viền cho trang đang được chọn */
    }
</style>