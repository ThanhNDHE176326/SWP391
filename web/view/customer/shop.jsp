<%-- 
    Document   : shop
    Created on : 19 May 2024, 4:15:18 pm
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Thư viện Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!-- Thư viện jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Thư viện Bootstrap JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Shop | </title>
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

    </head><!--/head-->

    <body>
        <jsp:include page="header.jsp"/>

        <section id="advertisement">
            <div class="container">
                <img src="images/shop/advertisement.jpg" alt="" />
            </div>
        </section>

        <section>
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="left-sidebar">
                            <h2>Search Product</h2>
                            <div class="well">
                                <form action="${pageContext.request.contextPath}/SearchProductPulbic?index=1" method="POST" class="form-inline">
                                    <div class="form-group">
                                        <label for="txtSearch" class="sr-only">Search</label>
                                        <input type="text" class="form-control" id="txtSearch" name="txtSearch" value="${txtSearch}" placeholder="Search...">
                                    </div>
                                    <button type="submit" class="btn btn-default"><i class="fas fa-search"></i></button>
                                </form>
                            </div>
                            <h2>Category</h2>
                            <div class="panel-group category-products" id="accordian">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a href="${pageContext.request.contextPath}/ProductListPublic?index=1">
                                                All Category
                                            </a>
                                        </h4>
                                    </div>
                                </div>
                                <c:forEach var="category" items="${categories}">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a href="${pageContext.request.contextPath}/ProductPublicByCategory?category=${category.name}&index=1" 
                                                   class="${category.name == param.category ? 'selected-category' : ''}">
                                                    <c:out value="${category.name}" />
                                                </a>
                                            </h4>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="brands_products">
                                <h2>SEARCH FILTER</h2>
                                <div class="brands-name">
                                    <ul class="nav nav-pills nav-stacked">
                                        <li><a href="${pageContext.request.contextPath}/ProductListPublicByUpdateDate?index=1&filter=desc">Top New Product</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ProductListPublicByUpdateDate?index=1&filter=asc">Top Oldest Products</a></li>
                                        <li><a href="${pageContext.request.contextPath}/SeachPopularProductPublic?index=1" method="GET">Popular products</a></li>
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Price<span class="caret"></span></a>
                                            <ul class="dropdown-menu" role="menu">
                                                <li><a href="${pageContext.request.contextPath}/ProductPublicByPrice?index=1&sort=desc">Prices decrease</a></li>
                                                <li><a href="${pageContext.request.contextPath}/ProductPublicByPrice?index=1&sort=asc">Prices increase</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <%-- js để xác định liên kết nào cần được đánh dấu là "active" dựa trên URL hiện tại  --%>
                            <script>
                                document.addEventListener("DOMContentLoaded", function () {
                                    const links = document.querySelectorAll('.brands-name .nav-stacked li a');
                                    const messageDiv = document.getElementById('message');
                                    let currentUrl = window.location.href;
                                    // Biến để xác định có đang ở trang phân trang hay không
                                    let isPagination = false;
                                    // Tạo một hàm để kiểm tra URL và đánh dấu liên kết phù hợp
                                    function checkURL() {
                                        let popularProductMarked = false;
                                        links.forEach(link => {
                                            const linkUrl = link.getAttribute('href');
                                            const linkUrlBase = linkUrl.split('?')[0];

                                            if (isPagination) {
                                                // Khi ở trang phân trang, chỉ so sánh phần URL trước dấu ?
                                                if (currentUrl.includes(linkUrlBase)) {
                                                    setActiveLink(link);
                                                }
                                            } else {
                                                // Khi không ở trang phân trang, so sánh toàn bộ URL
                                                if (currentUrl.includes('filter=desc') && linkUrl.includes('filter=desc')) {
                                                    setActiveLink(link);
                                                } else if (currentUrl.includes('filter=asc') && linkUrl.includes('filter=asc')) {
                                                    setActiveLink(link);
                                                } else if (link.textContent.includes('Popular products')) {
                                                    link.addEventListener('click', function (event) {
                                                        setActiveLink(link);
                                                        popularProductMarked = true;
                                                    });
                                                    if (!popularProductMarked && currentUrl.includes(linkUrl)) {
                                                        setActiveLink(link);
                                                        popularProductMarked = true;
                                                    }
                                                }
                                            }
                                        });
                                    }
                                    // Hàm để đánh dấu liên kết và hiển thị thông báo
                                    function setActiveLink(link) {
                                        links.forEach(l => l.classList.remove('active')); // Bỏ class 'active' khỏi tất cả liên kết
                                        link.classList.add('active');
                                        messageDiv.style.display = 'block';
                                        if (link.textContent.includes('Top New Product')) {
                                            messageDiv.textContent = `Top New Product`;
                                        } else if (link.textContent.includes('Popular products')) {
                                            messageDiv.textContent = `Popular Product`;
                                        } else if (link.textContent.includes('Top Oldest Products')) {
                                            messageDiv.textContent = `Top Oldest Products`;
                                        }
                                    }

                                    // Gọi hàm kiểm tra URL khi trang được tải
                                    checkURL();
                                    // Thêm sự kiện cho các liên kết phân trang
                                    document.querySelectorAll('a[href*="index="]').forEach(paginationLink => {
                                        paginationLink.addEventListener('click', function () {
                                            isPagination = true;
                                            // Cập nhật currentUrl để bỏ qua phần sau dấu ?
                                            currentUrl = paginationLink.href.split('?')[0];
                                            checkURL();
                                        });
                                    });

                                    // Đảm bảo "Popular products" được đánh dấu khi chuyển trang
                                    if (currentUrl.includes('${pageContext.request.contextPath}/SeachPopularProductPublic')) {
                                        const popularLink = Array.from(links).find(link => link.textContent.includes('${pageContext.request.contextPath}/Popular products'));
                                        if (popularLink) {
                                            setActiveLink(popularLink);
                                        }
                                    }
                                });
                            </script>
                        </div>
                    </div>

                    <div class="col-sm-9 padding-right">
                        <div class="features_items">
                            <h2 class="title text-center">Features Items</h2>
                            <%--Hiển thị thông báo--%>
                            <style>
                                .alert.alert-info {
                                    background-color: transparent;
                                    border: none;
                                    color: #FF0000; /* Màu chữ của thông báo */
                                    font-size: 17px;
                                    font-family: 'Roboto', sans-serif;
                                    text-align: center;
                                    text-transform: uppercase;
                                }
                                .product-item {
                                    cursor: pointer;
                                }
                                .out-of-stock {
                                    color: red;
                                    font-weight: bold;
                                    font-size: 20px;
                                }

                            </style>
                            <c:if test="${not empty param.category}">
                                <div class="alert alert-info">
                                    Search product for category "${param.category}"
                                </div>
                            </c:if>

                            <c:if test="${not empty param.txtSearch}">
                                <div class="alert alert-info">
                                    Search products related to keywords "${param.txtSearch}"
                                </div>
                            </c:if>

                            <c:choose>
                                <c:when test="${not empty param.sort and param.sort eq 'asc'}">
                                    <div class="alert alert-info">
                                        Products sorted in ascending price
                                    </div>
                                </c:when>
                                <c:when test="${not empty param.sort and param.sort eq 'desc'}">
                                    <div class="alert alert-info">
                                        Products sorted in descending price
                                    </div>
                                </c:when>
                            </c:choose>
                            <div id="message" class="alert alert-info" style="display:none;"></div>
                            <%--Hiển thị thông báo--%>
                            <c:forEach var="product" items="${product}">
                                <div class="col-sm-4">
                                    <div class="product-image-wrapper">
                                        <div class="single-products  product-item" data-id="${product.id}">
                                            <div class="productinfo text-center">
                                                <img src="images/${product.image}" alt="" />
                                                <h2>${product.title}</h2>
                                                <p>${product.description}</p>
                                                <p style="display: none;">${product.id}</p>
                                                <p style="display: none;">${product.quantity}</p>
                                                <div class="button-container">
                                                    <c:if test="${product.quantity > 0}">
                                                        <a href="addToCart?productID=${product.id}&location=list" class="btn btn-default add-to-cart">
                                                            <i class="fa fa-shopping-cart"></i>Add to cart
                                                        </a>
                                                    </c:if>
                                                    <c:if test="${product.quantity == 0}">
                                                        <span class="out-of-stock">Đã hết hàng</span>
                                                    </c:if>
                                                </div>
                                            </div>
                                            <div class="product-overlay">
                                                <div class="overlay-content">
                                                    <h2>${product.title}</h2>
                                                    <p>${product.description}</p>
                                                    <div class="button-container">
                                                        <c:if test="${product.quantity > 0}">
                                                            <a href="addToCart?productID=${product.id}&location=list" class="btn btn-default add-to-cart">
                                                                <i class="fa fa-shopping-cart"></i>Add to cart
                                                            </a>
                                                        </c:if>
                                                        <c:if test="${product.quantity == 0}">
                                                            <span class="out-of-stock">Đã hết hàng</span>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="choose">
                                            <ul class="nav nav-pills nav-justified">
                                                <li><a><i></i><span class="original-price">${product.originalPrice} VNĐ</span></a></li>
                                                <li><a><i></i><span class="sale-price">${product.salePrice} VNĐ</span></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <ul class="pagination">
                            <c:if test="${tag > 1}">
                                <li><a href="?index=${tag - 1}&category=${param.category}&txtSearch=${param.txtSearch}&sort=${param.sort}&filter=${param.filter}">Previous</a></li>
                                </c:if>
                                <c:forEach begin="1" end="${endP}" var="i">
                                <li class="${tag == i ? 'active' : ''}"><a class="pagination-link" href="?index=${i}&category=${param.category}&txtSearch=${param.txtSearch}&sort=${param.sort}&filter=${param.filter}">${i}</a></li>
                                </c:forEach>
                                <c:if test="${tag < endP}">
                                <li><a href="?index=${tag + 1}&category=${param.category}&txtSearch=${param.txtSearch}&sort=${param.sort}&filter=${param.filter}">Next</a></li>
                                </c:if>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var productItems = document.querySelectorAll('.product-item');
                productItems.forEach(function (item) {
                    item.addEventListener('click', function () {
                        var productId = this.getAttribute('data-id');
                        window.location.href = '${pageContext.request.contextPath}/ProductDetailPublic?index=1&productId=' + productId;
                    });
                });
            });
        </script>
        <jsp:include page="footer.jsp"/>



        <script src="<c:url value='/js/jquery.js'/>"></script>
        <script src="<c:url value='/js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/js/jquery.scrollUp.min.js'/>"></script>
        <script src="<c:url value='/js/price-range.js'/>"></script>
        <script src="<c:url value='/js/jquery.prettyPhoto.js'/>"></script>
        <script src="<c:url value='/js/main.js'/>"></script>

    </body>
</html>