<%-- 
    Document   : leftsidebar
    Created on : 17 Jun 2024, 2:50:16 pm
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Left Sidebar</title>
        <link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
        <link href="<c:url value='/css/font-awesome.min.css'/>" rel="stylesheet">
        <link href="<c:url value='/css/prettyPhoto.css'/>" rel="stylesheet">
        <link href="<c:url value='/css/price-range.css'/>" rel="stylesheet">
        <link href="<c:url value='/css/animate.css'/>" rel="stylesheet">
        <link href="<c:url value='/css/main.css'/>" rel="stylesheet">
        <link href="<c:url value='/css/responsive.css'/>" rel="stylesheet">

        <!-- Conditional scripts for IE9 -->
        <!--[if lt IE 9]>
        <script src="<c:url value='/js/html5shiv.js'/>"></script>
        <script src="<c:url value='/js/respond.min.js'/>"></script>
        <![endif]-->

        <!-- Favicon and Apple Icons -->
        <link rel="shortcut icon" href="<c:url value='/images/ico/favicon.ico'/>">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="<c:url value='/images/ico/apple-touch-icon-144-precomposed.png'/>">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="<c:url value='/images/ico/apple-touch-icon-114-precomposed.png'/>">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="<c:url value='/images/ico/apple-touch-icon-72-precomposed.png'/>">
        <link rel="apple-touch-icon-precomposed" href="<c:url value='/images/ico/apple-touch-icon-57-precomposed.png'/>">

        <!-- CDN for Bootstrap (ensure you need this) -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

        <!-- CDN for Font Awesome (ensure you need this) -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <h2>Search Product</h2>
        <div class="well">
            <form action="SearchProductPulbic?index=1" method="POST" class="form-inline">
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
                        <a href="ProductListPublic?index=1">
                            All Category
                        </a>
                    </h4>
                </div>
            </div>
            <c:forEach var="category" items="${categories}">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a href="ProductPublicByCategory?category=${category.name}&index=1" 
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
                    <li><a href="ProductListPublicByUpdateDate?index=1&filter=desc">Top New Product</a></li>
                    <li><a href="ProductListPublicByUpdateDate?index=1&filter=asc">Top Oldest Products</a></li>
                    <li><a href="SeachPopularProductPublic?index=1" method="GET">Popular products</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Price<span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="ProductPublicByPrice?index=1&sort=desc">Prices decrease</a></li>
                            <li><a href="ProductPublicByPrice?index=1&sort=asc">Prices increase</a></li>
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
                if (currentUrl.includes('SeachPopularProductPublic')) {
                    const popularLink = Array.from(links).find(link => link.textContent.includes('Popular products'));
                    if (popularLink) {
                        setActiveLink(popularLink);
                    }
                }
            });
        </script>
    </body>
</html>
