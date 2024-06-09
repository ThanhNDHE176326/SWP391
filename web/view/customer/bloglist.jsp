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
        <section id="blog"><!--/#blog-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-8">
                        <div class="blog-post-area">
                            <h2 class="title text-center">Latest From Our Blog</h2>
                            <c:forEach var="blog" items="${blogs}">
                                <div class="single-blog-post">
                                    <h3><a href="blogdetail?id=${blog.id}">${blog.title}</a></h3>
                                    <div class="post-meta">
                                        <ul>
                                            <li><i class="fa fa-calendar"></i> ${blog.updateDate}</li>
                                            <li><i class="fa fa-thumbs-up"></i> 20</li>
                                            <li><i class="fa fa-comments"></i> 03</li>
                                        </ul>
                                    </div>
                                    <a href="">
                                        <img src="${blog.image}" alt="">
                                    </a>
                                    <p>${blog.description}</p>
                                    <a  href="blogdetail?id=${blog.id}" class="btn btn-primary">Read More</a>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <aside class="col-sm-4">
                        <div class="sidebar">
                            <h2>Categories</h2>
                            <div class="panel-group category-products" id="accordian"><!--category-productsr-->
                                <c:forEach var="category" items="${categories}">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title"><a href="bloglist?category=${category.id}&query=${param.query}">${category.name}</a></h4>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div><!--/category-products-->
                        </div>
                    </aside>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="pagination-wrapper">
                                <div class="pagination">
                                    <c:forEach begin="1" end="${noOfPages}" var="i">
                                        <a href="bloglist?page=${i}<c:if test='${not empty param.query}'>&query=${param.query}</c:if><c:if test='${not empty param.category}'>&category=${param.category}</c:if>" class="${i == currentPage ? 'active' : ''}">${i}</a>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section><!--/#blog-->
        <jsp:include page="header.jsp"/>
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
