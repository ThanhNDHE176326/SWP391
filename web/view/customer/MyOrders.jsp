<%-- 
    Document   : product-details
    Created on : 19 May 2024, 4:14:56 pm
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Product Details | E-Shopper</title>
        <!-- Local Stylesheets -->
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

        <style>
            .breadcrumbs .breadcrumb {
                margin-bottom: 30px !important;
            }
            .breadcrumbs .breadcrumb li a {
                padding: 8px 8px !important;
                font-size: 1.2em;
            }
            .table-responsive.cart_info {
                margin-bottom: 20px; /* Bottom margin for the table */
                overflow-x: hidden; /* Hide horizontal scrollbar */
            }

            .table.table-condensed {
                width: 100%; /* Full width table */
            }

            .cart_menu td {
                font-weight: bold; /* Bold font for header cells */
                text-align: center; /* Center text alignment */
                vertical-align: middle; /* Vertical middle alignment */
                padding: 10px; /* Padding for table cells */
                word-wrap: break-word; /* Break words if they are too long */
            }

            .cart_menu td.select {
                width: 3%; /* Width for Select cell */
            }

            .cart_menu td.description {
                width: 20%; /* Width for Description cell */
            }

            .cart_menu td.price,
            .cart_menu td.delete {
                width: 15%; /* Width for each of these cells */
            }

            .cart_menu td.cart_delete a {
                color: #333; /* Color for Delete link */
            }

            .cart_menu td.cart_delete a:hover {
                color: red; /* Hover color for Delete link */
            }

            .cart_product img {
                width: 130px; /* Product image width */
                height: auto; /* Maintain aspect ratio */
            }

            .cart_quantity_button {
                display: flex; /* Use flexbox for quantity controls */
                align-items: center; /* Center align the items */
            }

            .cart_quantity_button a,
            .cart_quantity_button input {
                margin: 0 5px; /* Margin between controls */
            }

            .cart_quantity_input {
                text-align: center; /* Center the quantity input text */
            }
            .cart_select, .cart_description, .cart_price, .cart_stock, .cart_quantity, .cart_total, .cart_delete {
                text-align: center; /* Center text alignment */
                vertical-align: middle; /* Vertical middle alignment */
            }
            .cart_price, .cart_stock, .cart_quantity, .cart_total {
                font-size: 16px; /* Set your desired font size here */
                padding: 10px; /* Consistent padding for all cells */
                box-sizing: border-box; /* Ensure padding is included in width calculation */
            }
            .cart_description h4 a {
                font-size: 15px !important;
            }
            .button-container {
                display: flex;
                text-align: right;
                padding-bottom: 20px; /* Optional: Add padding to the container */
            }

            .styled-button {
                background-color: #FE980F;
                border: none;
                color: white;
                padding: 5px 5px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                cursor: pointer;
                border-radius: 12px;
                transition: background-color 0.3s ease, transform 0.3s ease;
            }
            .styled-button:hover {
                background-color: #FE980F;
                transform: scale(1.05);
            }
            .cart_delete a {
                display: inline-block;
                padding: 5px 10px;
                margin: 0 5px;
                text-decoration: none;
                border-radius: 3px;
                font-size: 11px !important;
                cursor: pointer;
            }

            .view-button {
                background-color: #007bff;
                color: white;
            }

            .cancel-button {
                background-color: #dc3545;
                color: white;
            }
            .filter-form {
                display: flex;
                align-items: center;
                margin-bottom: 20px;
                margin-left: 100px;
                margin-right: 100px;
            }
            .filter-form .form-group {
                margin-right: 10px;
                margin-bottom: 0;
            }
            .filter-form button {
                height: 100%; /* Ensure button height matches input height */
            }
            .btn.btn-primary{
                margin-top: 0px !important;
            }
            .out-of-stock {
                color: red;
                font-weight: bold;
                font-size: 20px;
            }
            </style>
        </head><!--/head-->

        <body>
            <jsp:include page="header.jsp"/>

            <section>
                <div class="container">
                    <div class="row">
                        <div class="col-sm-3">
                            <div class="left-sidebar">
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
                            </div>

                        </div>

                        <div class="col-sm-9 padding-right">
                            <div id="cart_items">
                                <div class="breadcrumbs">
                                    <ol class="breadcrumb">
                                        <li><a href="${pageContext.request.contextPath}/ProductListPublic">Back to product list</a></li>
                                        <li class="active">My Orders</li>
                                    </ol>
                                </div>
                                <form action="${pageContext.request.contextPath}/listOrderCustomer?index=1" method="POST" class="filter-form">
                                    <div class="form-group">
                                        <input type="date" id="startDate" name="startDate" class="form-control" placeholder="mm/dd/yyyy">
                                    </div>
                                    <div class="form-group">
                                        <input type="date" id="endDate" name="endDate" class="form-control" placeholder="mm/dd/yyyy">
                                    </div>
                                    <button type="submit" class="btn btn-primary">Filter</button>
                                </form>
                                <div class="table-responsive cart_info" style="max-width: 1400px;
                                    margin-bottom: 20px;">
                                    <table class="table table-condensed">
                                        <thead>
                                            <tr class="cart_menu">
                                                <td class="select">ID</td>
                                                <td class="description">Order Date</td>
                                                <td class="description">Delivery Address</td>
                                                <td class="price">Total Cost</td>
                                                <td class="description">Status</td>
                                                <td class="delete">Action</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="orderList" items="${orderList}">
                                                <tr style="background-color: #f9f9f9;">
                                                    <td class="cart_select" style="padding: 10px;
                                                        text-align: center;">
                                                        <p style="color: #007bff;
                                                        text-decoration: none;">${orderList.id}</p>
                                                    </td>
                                                    <td class="cart_description" style="padding: 10px;">
                                                        <p style="margin: 0;
                                                        font-size: 14px;">${orderList.orderDate}</p>
                                                    </td>
                                                    <td class="cart_description" style="padding: 10px;">
                                                        <p style="margin: 0;
                                                        font-size: 14px;">${orderList.address}</p>
                                                    </td>
                                                    <td class="cart_price" style="padding: 10px;
                                                        text-align: center;">
                                                        <fmt:formatNumber value="${orderList.totalCost}" type="number" maxFractionDigits="0" />
                                                    </td>
                                                    <td class="cart_description" style="padding: 10px;">
                                                        <p style="margin: 0;
                                                        font-size: 14px;">${orderList.status_name}</p>
                                                    </td>
                                                    <td class="cart_delete" style="padding: 10px;
                                                        text-align: center;">
                                                        <a href="${pageContext.request.contextPath}/orderInformationCustomer?orderId=${orderList.id}" class="view-button">Xem</a>
                                                        <c:choose>
                                                            <c:when test="${orderList.status_name == 'Chờ xửa lý'}">
                                                                <a href="${pageContext.request.contextPath}/listOrderCustomer?orderId=${orderList.id}" class="cancel-button">Hủy</a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <!-- Do nothing or add any alternative content if needed -->
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <ul class="pagination">
                                    <c:if test="${tag > 1}">
                                        <li><a href="?index=${tag - 1}">Previous</a></li>
                                        </c:if>
                                        <c:forEach begin="1" end="${endP}" var="i">
                                        <li class="${tag == i ? 'active' : ''}">
                                            <a class="pagination-link" href="?index=${i}">${i}</a>
                                        </li>
                                    </c:forEach>
                                    <c:if test="${tag < endP}">
                                        <li><a href="?index=${tag + 1}">Next</a></li>
                                        </c:if>
                                </ul>

                                <div class="recommended_items"><!--recommended_items-->
                                    <h2 class="title text-center">recommended items</h2>
                                    <div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
                                        <div class="carousel-inner">
                                            <div class="item active">	
                                                <c:forEach var="listNewProduct" items="${listNewProduct}" varStatus="loop">
                                                    <c:if test="${loop.index == 0}">
                                                        <div class="col-sm-4">
                                                            <div class="product-image-wrapper">
                                                                <div class="single-products  product-item" data-id="${listNewProduct.id}">
                                                                    <div class="productinfo text-center">
                                                                        <img src="images/${listNewProduct.image}" alt="" />
                                                                        <h2>${listNewProduct.title}</h2>
                                                                        <p>${listNewProduct.description}</p>
                                                                        <p style="display: none;">${listNewProduct.id}</p>
                                                                        <p style="display: none;">${listNewProduct.quantity}</p>
                                                                        <div class="button-container">
                                                                            <c:if test="${listNewProduct.quantity > 0}">
                                                                                <a href="addToCart?productID=${listNewProduct.id}&location=myorders" class="btn btn-default add-to-cart">
                                                                                    <i class="fa fa-shopping-cart"></i>Add to cart
                                                                                </a>
                                                                            </c:if>
                                                                            <c:if test="${listNewProduct.quantity == 0}">
                                                                                <span class="out-of-stock">Đã hết hàng</span>
                                                                            </c:if>
                                                                        </div>
                                                                    </div>
                                                                    <div class="product-overlay">
                                                                        <div class="overlay-content">
                                                                            <h2>${listNewProduct.title}</h2>
                                                                            <p>${listNewProduct.description}</p>
                                                                            <div class="button-container">
                                                                                <c:if test="${listNewProduct.quantity > 0}">
                                                                                    <a href="addToCart?productID=${listNewProduct.id}&location=myorders" class="btn btn-default add-to-cart">
                                                                                        <i class="fa fa-shopping-cart"></i>Add to cart
                                                                                    </a>
                                                                                </c:if>
                                                                                <c:if test="${listNewProduct.quantity == 0}">
                                                                                    <span class="out-of-stock">Đã hết hàng</span>
                                                                                </c:if>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="choose">
                                                                    <ul class="nav nav-pills nav-justified">
                                                                        <li><a><i></i><span class="original-price">${listNewProduct.originalPrice} VNĐ</span></a></li>
                                                                        <li><a><i></i><span class="sale-price">${listNewProduct.salePrice} VNĐ</span></a></li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>

                                                <c:forEach var="listNewProduct" items="${listNewProduct}" varStatus="loop">
                                                    <c:if test="${loop.index == 1}">
                                                        <div class="col-sm-4">
                                                            <div class="product-image-wrapper">
                                                                <div class="single-products  product-item" data-id="${listNewProduct.id}">
                                                                    <div class="productinfo text-center">
                                                                        <img src="images/${listNewProduct.image}" alt="" />
                                                                        <h2>${listNewProduct.title}</h2>
                                                                        <p>${listNewProduct.description}</p>
                                                                        <p style="display: none;">${listNewProduct.id}</p>
                                                                        <p style="display: none;">${listNewProduct.quantity}</p>
                                                                        <div class="button-container">
                                                                            <c:if test="${listNewProduct.quantity > 0}">
                                                                                <a href="addToCart?productID=${listNewProduct.id}&location=myorders" class="btn btn-default add-to-cart">
                                                                                    <i class="fa fa-shopping-cart"></i>Add to cart
                                                                                </a>
                                                                            </c:if>
                                                                            <c:if test="${listNewProduct.quantity == 0}">
                                                                                <span class="out-of-stock">Đã hết hàng</span>
                                                                            </c:if>
                                                                        </div>
                                                                    </div>
                                                                    <div class="product-overlay">
                                                                        <div class="overlay-content">
                                                                            <h2>${listNewProduct.title}</h2>
                                                                            <p>${listNewProduct.description}</p>
                                                                            <div class="button-container">
                                                                                <c:if test="${listNewProduct.quantity > 0}">
                                                                                    <a href="addToCart?productID=${listNewProduct.id}&location=myorders" class="btn btn-default add-to-cart">
                                                                                        <i class="fa fa-shopping-cart"></i>Add to cart
                                                                                    </a>
                                                                                </c:if>
                                                                                <c:if test="${listNewProduct.quantity == 0}">
                                                                                    <span class="out-of-stock">Đã hết hàng</span>
                                                                                </c:if>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="choose">
                                                                    <ul class="nav nav-pills nav-justified">
                                                                        <li><a><i></i><span class="original-price">${listNewProduct.originalPrice} VNĐ</span></a></li>
                                                                        <li><a><i></i><span class="sale-price">${listNewProduct.salePrice} VNĐ</span></a></li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>

                                                <c:forEach var="listNewProduct" items="${listNewProduct}" varStatus="loop">
                                                    <c:if test="${loop.index == 2}">
                                                        <div class="col-sm-4">
                                                            <div class="product-image-wrapper">
                                                                <div class="single-products  product-item" data-id="${listNewProduct.id}">
                                                                    <div class="productinfo text-center">
                                                                        <img src="images/${listNewProduct.image}" alt="" />
                                                                        <h2>${listNewProduct.title}</h2>
                                                                        <p>${listNewProduct.description}</p>
                                                                        <p style="display: none;">${listNewProduct.id}</p>
                                                                        <p style="display: none;">${listNewProduct.quantity}</p>
                                                                        <div class="button-container">
                                                                            <c:if test="${listNewProduct.quantity > 0}">
                                                                                <a href="addToCart?productID=${listNewProduct.id}&location=myorders" class="btn btn-default add-to-cart">
                                                                                    <i class="fa fa-shopping-cart"></i>Add to cart
                                                                                </a>
                                                                            </c:if>
                                                                            <c:if test="${listNewProduct.quantity == 0}">
                                                                                <span class="out-of-stock">Đã hết hàng</span>
                                                                            </c:if>
                                                                        </div>
                                                                    </div>
                                                                    <div class="product-overlay">
                                                                        <div class="overlay-content">
                                                                            <h2>${listNewProduct.title}</h2>
                                                                            <p>${listNewProduct.description}</p>
                                                                            <div class="button-container">
                                                                                <c:if test="${listNewProduct.quantity > 0}">
                                                                                    <a href="addToCart?productID=${listNewProduct.id}&location=myorders" class="btn btn-default add-to-cart">
                                                                                        <i class="fa fa-shopping-cart"></i>Add to cart
                                                                                    </a>
                                                                                </c:if>
                                                                                <c:if test="${listNewProduct.quantity == 0}">
                                                                                    <span class="out-of-stock">Đã hết hàng</span>
                                                                                </c:if>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="choose">
                                                                    <ul class="nav nav-pills nav-justified">
                                                                        <li><a><i></i><span class="original-price">${listNewProduct.originalPrice} VNĐ</span></a></li>
                                                                        <li><a><i></i><span class="sale-price">${listNewProduct.salePrice} VNĐ</span></a></li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>

                                            </div>
                                            <div class="item">	
                                                <c:forEach var="listNewProduct" items="${listNewProduct}" varStatus="loop">
                                                    <c:if test="${loop.index == 3}">
                                                        <div class="col-sm-4">
                                                            <div class="product-image-wrapper">
                                                                <div class="single-products  product-item" data-id="${listNewProduct.id}">
                                                                    <div class="productinfo text-center">
                                                                        <img src="images/${listNewProduct.image}" alt="" />
                                                                        <h2>${listNewProduct.title}</h2>
                                                                        <p>${listNewProduct.description}</p>
                                                                        <p style="display: none;">${listNewProduct.id}</p>
                                                                        <p style="display: none;">${listNewProduct.quantity}</p>
                                                                        <div class="button-container">
                                                                            <c:if test="${listNewProduct.quantity > 0}">
                                                                                <a href="addToCart?productID=${listNewProduct.id}&location=myorders" class="btn btn-default add-to-cart">
                                                                                    <i class="fa fa-shopping-cart"></i>Add to cart
                                                                                </a>
                                                                            </c:if>
                                                                            <c:if test="${listNewProduct.quantity == 0}">
                                                                                <span class="out-of-stock">Đã hết hàng</span>
                                                                            </c:if>
                                                                        </div>
                                                                    </div>
                                                                    <div class="product-overlay">
                                                                        <div class="overlay-content">
                                                                            <h2>${listNewProduct.title}</h2>
                                                                            <p>${listNewProduct.description}</p>
                                                                            <div class="button-container">
                                                                                <c:if test="${listNewProduct.quantity > 0}">
                                                                                    <a href="addToCart?productID=${listNewProduct.id}&location=myorders" class="btn btn-default add-to-cart">
                                                                                        <i class="fa fa-shopping-cart"></i>Add to cart
                                                                                    </a>
                                                                                </c:if>
                                                                                <c:if test="${listNewProduct.quantity == 0}">
                                                                                    <span class="out-of-stock">Đã hết hàng</span>
                                                                                </c:if>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="choose">
                                                                    <ul class="nav nav-pills nav-justified">
                                                                        <li><a><i></i><span class="original-price">${listNewProduct.originalPrice} VNĐ</span></a></li>
                                                                        <li><a><i></i><span class="sale-price">${listNewProduct.salePrice} VNĐ</span></a></li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>

                                                <c:forEach var="listNewProduct" items="${listNewProduct}" varStatus="loop">
                                                    <c:if test="${loop.index == 4}">
                                                        <div class="col-sm-4">
                                                            <div class="product-image-wrapper">
                                                                <div class="single-products  product-item" data-id="${listNewProduct.id}">
                                                                    <div class="productinfo text-center">
                                                                        <img src="images/${listNewProduct.image}" alt="" />
                                                                        <h2>${listNewProduct.title}</h2>
                                                                        <p>${listNewProduct.description}</p>
                                                                        <p style="display: none;">${listNewProduct.id}</p>
                                                                        <p style="display: none;">${listNewProduct.quantity}</p>
                                                                        <div class="button-container">
                                                                            <c:if test="${listNewProduct.quantity > 0}">
                                                                                <a href="addToCart?productID=${listNewProduct.id}&location=myorders" class="btn btn-default add-to-cart">
                                                                                    <i class="fa fa-shopping-cart"></i>Add to cart
                                                                                </a>
                                                                            </c:if>
                                                                            <c:if test="${listNewProduct.quantity == 0}">
                                                                                <span class="out-of-stock">Đã hết hàng</span>
                                                                            </c:if>
                                                                        </div>
                                                                    </div>
                                                                    <div class="product-overlay">
                                                                        <div class="overlay-content">
                                                                            <h2>${listNewProduct.title}</h2>
                                                                            <p>${listNewProduct.description}</p>
                                                                            <div class="button-container">
                                                                                <c:if test="${listNewProduct.quantity > 0}">
                                                                                    <a href="addToCart?productID=${listNewProduct.id}&location=myorders" class="btn btn-default add-to-cart">
                                                                                        <i class="fa fa-shopping-cart"></i>Add to cart
                                                                                    </a>
                                                                                </c:if>
                                                                                <c:if test="${listNewProduct.quantity == 0}">
                                                                                    <span class="out-of-stock">Đã hết hàng</span>
                                                                                </c:if>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="choose">
                                                                    <ul class="nav nav-pills nav-justified">
                                                                        <li><a><i></i><span class="original-price">${listNewProduct.originalPrice} VNĐ</span></a></li>
                                                                        <li><a><i></i><span class="sale-price">${listNewProduct.salePrice} VNĐ</span></a></li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>

                                                <c:forEach var="listNewProduct" items="${listNewProduct}" varStatus="loop">
                                                    <c:if test="${loop.index == 5}">
                                                        <div class="col-sm-4">
                                                            <div class="product-image-wrapper">
                                                                <div class="single-products  product-item" data-id="${listNewProduct.id}">
                                                                    <div class="productinfo text-center">
                                                                        <img src="images/${listNewProduct.image}" alt="" />
                                                                        <h2>${listNewProduct.title}</h2>
                                                                        <p>${listNewProduct.description}</p>
                                                                        <p style="display: none;">${listNewProduct.id}</p>
                                                                        <p style="display: none;">${listNewProduct.quantity}</p>
                                                                        <div class="button-container">
                                                                            <c:if test="${listNewProduct.quantity > 0}">
                                                                                <a href="addToCart?productID=${listNewProduct.id}&location=myorders" class="btn btn-default add-to-cart">
                                                                                    <i class="fa fa-shopping-cart"></i>Add to cart
                                                                                </a>
                                                                            </c:if>
                                                                            <c:if test="${listNewProduct.quantity == 0}">
                                                                                <span class="out-of-stock">Đã hết hàng</span>
                                                                            </c:if>
                                                                        </div>
                                                                    </div>
                                                                    <div class="product-overlay">
                                                                        <div class="overlay-content">
                                                                            <h2>${listNewProduct.title}</h2>
                                                                            <p>${listNewProduct.description}</p>
                                                                            <div class="button-container">
                                                                                <c:if test="${listNewProduct.quantity > 0}">
                                                                                    <a href="addToCart?productID=${listNewProduct.id}&location=myorders" class="btn btn-default add-to-cart">
                                                                                        <i class="fa fa-shopping-cart"></i>Add to cart
                                                                                    </a>
                                                                                </c:if>
                                                                                <c:if test="${listNewProduct.quantity == 0}">
                                                                                    <span class="out-of-stock">Đã hết hàng</span>
                                                                                </c:if>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="choose">
                                                                    <ul class="nav nav-pills nav-justified">
                                                                        <li><a><i></i><span class="original-price">${listNewProduct.originalPrice} VNĐ</span></a></li>
                                                                        <li><a><i></i><span class="sale-price">${listNewProduct.salePrice} VNĐ</span></a></li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
                                            <i class="fa fa-angle-left"></i>
                                        </a>
                                        <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
                                            <i class="fa fa-angle-right"></i>
                                        </a>			
                                    </div>
                                </div><!--/recommended_items-->

                            </div>
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
            <script src="<c:url value='/js/price-range.js'/>"></script>
            <script src="<c:url value='/js/jquery.scrollUp.min.js'/>"></script>
            <script src="<c:url value='/js/bootstrap.min.js'/>"></script>
            <script src="<c:url value='/js/jquery.prettyPhoto.js'/>"></script>
            <script src="<c:url value='/js/main.js'/>"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <!-- Bootstrap JavaScript -->
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        </body>
    </html>
