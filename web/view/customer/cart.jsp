<%-- 
    Document   : product-details
    Created on : 19 May 2024, 4:14:56 pm
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                                    <li><a href="#">Product List</a></li>
                                    <li class="active">Cart Detail</li>
                                </ol>
                            </div>
                            <div class="table-responsive cart_info" style="max-width: 1400px; margin: auto;">
                                <table class="table table-condensed">
                                    <thead>
                                        <tr class="cart_menu">
                                            <td class="select">Select</td>
                                            <td class="image">Item</td>
                                            <td class="description">Title</td>
                                            <td class="price">Price</td>
                                            <td class="stock">Stock</td>
                                            <td class="quantity">Quantity</td>
                                            <td class="total">Total</td>
                                            <td class="cart_delete">Delete</td>
                                        </tr>
                                    </thead>
                                    <style>
                                        .table-responsive.cart_info {
                                            margin-bottom: 20px; /* Khoảng cách dưới cùng của bảng */
                                            overflow-x: hidden; /* Loại bỏ thanh trượt ngang */
                                        }

                                        .table.table-condensed {
                                            width: 100%; /* Chiều rộng của bảng là 100% */
                                        }

                                        .cart_menu td {
                                            font-weight: bold; /* Đặt đậm cho các ô tiêu đề */
                                            text-align: center; /* Canh giữa nội dung của các ô */
                                            vertical-align: middle; /* Canh giữa theo chiều dọc của các ô */
                                            padding: 10px; /* Khoảng cách nội dung với viền trong mỗi ô */
                                        }

                                        .cart_menu td.select {
                                            width: 5%; /* Chiều rộng của ô Select */
                                        }

                                        .cart_menu td.image {
                                            width: 12%; /* Chiều rộng của ô Item */
                                        }

                                        .cart_menu td.description {
                                            width: 28%; /* Chiều rộng của ô Description */
                                        }

                                        .cart_menu td.price {
                                            width: 10%; /* Chiều rộng của ô Price */
                                        }

                                        .cart_menu td.quantity {
                                            width: 10%; /* Chiều rộng của ô Quantity */
                                        }

                                        .cart_menu td.stock {
                                            width: 10%; /* Chiều rộng của ô Stock */
                                        }

                                        .cart_menu td.total {
                                            width: 15%; /* Chiều rộng của ô Total */
                                        }

                                        .cart_menu td.cart_delete {
                                            width: 10%; /* Chiều rộng của ô Xóa */
                                        }

                                        .cart_menu td.cart_delete a {
                                            color: #333; /* Màu chữ của nút Xóa */
                                        }

                                        .cart_menu td.cart_delete a:hover {
                                            color: red; /* Màu chữ khi rê chuột qua nút Xóa */
                                        }

                                        .cart_product img {
                                            width: 130px; /* Kích thước của hình ảnh sản phẩm */
                                            height: auto; /* Chiều cao tự động tính toán để giữ tỷ lệ khung hình */
                                        }
                                    </style>
                                    <tbody>
                                        <c:forEach var="product" items="${listProduct}">
                                            <tr>
                                                <td class="cart_select">
                                                    <input type="checkbox" name="selectedProducts" value="${product.id}">
                                                </td>
                                                <td class="cart_product">
                                                    <a href=""><img src="<c:url value='/images/${product.image}'/>" alt=""></a>
                                                </td>
                                                <td class="cart_description">
                                                    <h4><a href="">${product.title}</a></h4>
                                                    <p>${product.id}</p>
                                                </td>
                                                <td class="cart_price">
                                                    <p>${product.salePrice}</p>
                                                </td>
                                                <td >
                                                    <p style="color: black;">100</p>
                                                </td>
                                                <td class="cart_quantity">
                                                    <div class="cart_quantity_button">
                                                        <a class="cart_quantity_down" href="updateQuantityCartProduct?productID=${product.id}&mode=tru"> - </a>
                                                        <input class="cart_quantity_input" type="text" name="quantity" value="${product.quantity}" autocomplete="off" size="2">
                                                        <a class="cart_quantity_up" href="updateQuantityCartProduct?productID=${product.id}&mode=cong"> + </a>
                                                    </div>
                                                </td>
                                                <td class="cart_total">
                                                    <p class="cart_total_price">${product.salePrice * product.quantity}</p>
                                                </td>
                                                <td class="cart_delete">
                                                    <a class="cart_quantity_delete" href="deleteCart?productID=${product.id}"><i class="fa fa-times"></i></a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>






                            <ul class="pagination">
                                <c:if test="${tag > 1}">
                                    <li><a href="?index=${tag - 1}&productId=${param.productId}">Previous</a></li>
                                    </c:if>
                                    <c:forEach begin="1" end="${endP}" var="i">
                                    <li class="${tag == i ? 'active' : ''}">
                                        <a class="pagination-link" href="?index=${i}&productId=${param.productId}">${i}</a>
                                    </li>
                                </c:forEach>
                                <c:if test="${tag < endP}">
                                    <li><a href="?index=${tag + 1}&productId=${param.productId}">Next</a></li>
                                    </c:if>
                            </ul>

                            <style>
                                .pagination {
                                    display: flex;
                                    justify-content: center;
                                    padding: 0;
                                    list-style: none;
                                }

                                .pagination li {
                                    display: inline;
                                    margin: 0 5px;
                                }

                                .pagination a {
                                    text-decoration: none;
                                    padding: 10px 15px;
                                    color: #007bff;
                                    border: 1px solid #dee2e6;
                                    border-radius: 4px;
                                }

                                .pagination .active a {
                                    background-color: #FE980F; /* Màu nền của trang được chọn */
                                    color: #000; /* Màu chữ của trang được chọn */
                                    border-color: yellow; /* Màu viền của trang được chọn */
                                }
                            </style>
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
                                                                    <div class="button-container">
                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                        <!--<a href="#" class="btn btn-default buy-now"><i class="fa fa-bolt"></i>Buy</a>-->
                                                                    </div>
                                                                </div>
                                                                <div class="product-overlay">
                                                                    <div class="overlay-content">
                                                                        <h2>${listNewProduct.title}</h2>
                                                                        <p>${listNewProduct.description}</p>
                                                                        <div class="button-container">
                                                                            <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                            <!--<a href="#" class="btn btn-default buy-now"><i class="fa fa-bolt"></i>Buy</a>-->
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
                                                                    <div class="button-container">
                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                        <!--<a href="#" class="btn btn-default buy-now"><i class="fa fa-bolt"></i>Buy</a>-->
                                                                    </div>
                                                                </div>
                                                                <div class="product-overlay">
                                                                    <div class="overlay-content">
                                                                        <h2>${listNewProduct.title}</h2>
                                                                        <p>${listNewProduct.description}</p>
                                                                        <div class="button-container">
                                                                            <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                            <!--<a href="#" class="btn btn-default buy-now"><i class="fa fa-bolt"></i>Buy</a>-->
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
                                                                    <div class="button-container">
                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                        <!--<a href="#" class="btn btn-default buy-now"><i class="fa fa-bolt"></i>Buy</a>-->
                                                                    </div>
                                                                </div>
                                                                <div class="product-overlay">
                                                                    <div class="overlay-content">
                                                                        <h2>${listNewProduct.title}</h2>
                                                                        <p>${listNewProduct.description}</p>
                                                                        <div class="button-container">
                                                                            <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                            <!--<a href="#" class="btn btn-default buy-now"><i class="fa fa-bolt"></i>Buy</a>-->
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
                                                                    <div class="button-container">
                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                        <!--<a href="#" class="btn btn-default buy-now"><i class="fa fa-bolt"></i>Buy</a>-->
                                                                    </div>
                                                                </div>
                                                                <div class="product-overlay">
                                                                    <div class="overlay-content">
                                                                        <h2>${listNewProduct.title}</h2>
                                                                        <p>${listNewProduct.description}</p>
                                                                        <div class="button-container">
                                                                            <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                            <!--<a href="#" class="btn btn-default buy-now"><i class="fa fa-bolt"></i>Buy</a>-->
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
                                                                    <div class="button-container">
                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                        <!--<a href="#" class="btn btn-default buy-now"><i class="fa fa-bolt"></i>Buy</a>-->
                                                                    </div>
                                                                </div>
                                                                <div class="product-overlay">
                                                                    <div class="overlay-content">
                                                                        <h2>${listNewProduct.title}</h2>
                                                                        <p>${listNewProduct.description}</p>
                                                                        <div class="button-container">
                                                                            <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                            <!--<a href="#" class="btn btn-default buy-now"><i class="fa fa-bolt"></i>Buy</a>-->
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
                                                                    <div class="button-container">
                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                        <!--<a href="#" class="btn btn-default buy-now"><i class="fa fa-bolt"></i>Buy</a>-->
                                                                    </div>
                                                                </div>
                                                                <div class="product-overlay">
                                                                    <div class="overlay-content">
                                                                        <h2>${listNewProduct.title}</h2>
                                                                        <p>${listNewProduct.description}</p>
                                                                        <div class="button-container">
                                                                            <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                            <!--<a href="#" class="btn btn-default buy-now"><i class="fa fa-bolt"></i>Buy</a>-->
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
