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
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/price-range.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->       
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <!-- Font Awesome for icons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head><!--/head-->

    <body>
        <header id="header"><!--header-->
            <div class="header_top"><!--header_top-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="contactinfo">
                                <ul class="nav nav-pills">
                                    <li><a href=""><i class="fa fa-phone"></i> +2 95 01 88 821</a></li>
                                    <li><a href=""><i class="fa fa-envelope"></i> info@domain.com</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="social-icons pull-right">
                                <ul class="nav navbar-nav">
                                    <li><a href=""><i class="fa fa-facebook"></i></a></li>
                                    <li><a href=""><i class="fa fa-twitter"></i></a></li>
                                    <li><a href=""><i class="fa fa-linkedin"></i></a></li>
                                    <li><a href=""><i class="fa fa-dribbble"></i></a></li>
                                    <li><a href=""><i class="fa fa-google-plus"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--/header_top-->

            <div class="header-middle"><!--header-middle-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="logo pull-left">
                                <a href="index.html"><img src="images/home/logo.png" alt="" /></a>
                            </div>
                            <div class="btn-group pull-right">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
                                        USA
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a href="">Canada</a></li>
                                        <li><a href="">UK</a></li>
                                    </ul>
                                </div>

                                <div class="btn-group">
                                    <button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
                                        DOLLAR
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a href="">Canadian Dollar</a></li>
                                        <li><a href="">Pound</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <div class="shop-menu pull-right">
                                <ul class="nav navbar-nav">
                                    <li><a href=""><i class="fa fa-user"></i> Account</a></li>
                                    <li><a href=""><i class="fa fa-star"></i> Wishlist</a></li>
                                    <li><a href="checkout.html"><i class="fa fa-crosshairs"></i> Checkout</a></li>
                                    <li><a href="cart.html"><i class="fa fa-shopping-cart"></i> Cart</a></li>
                                    <li><a href="login.html"><i class="fa fa-lock"></i> Login</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--/header-middle-->

            <div class="header-bottom"><!--header-bottom-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-9">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div>
                            <div class="mainmenu pull-left">
                                <ul class="nav navbar-nav collapse navbar-collapse">
                                    <li><a href="index.html">Home</a></li>
                                    <li class="dropdown"><a href="#">Shop<i class="fa fa-angle-down"></i></a>
                                        <ul role="menu" class="sub-menu">
                                            <li><a href="shop.html">Products</a></li>
                                            <li><a href="product-details.html" class="active">Product Details</a></li> 
                                            <li><a href="checkout.html">Checkout</a></li> 
                                            <li><a href="cart.html">Cart</a></li> 
                                            <li><a href="login.html">Login</a></li> 
                                        </ul>
                                    </li> 
                                    <li class="dropdown"><a href="#">Blog<i class="fa fa-angle-down"></i></a>
                                        <ul role="menu" class="sub-menu">
                                            <li><a href="blog.html">Blog List</a></li>
                                            <li><a href="blog-single.html">Blog Single</a></li>
                                        </ul>
                                    </li> 
                                    <li><a href="404.html">404</a></li>
                                    <li><a href="contact-us.html">Contact</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="search_box pull-right">
                                <input type="text" placeholder="Search"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--/header-bottom-->
        </header><!--/header-->

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
                        <div class="product-details"><!--product-details-->
                            <div class="col-sm-5">
                                <div class="view-product">
                                    <img src="images/${product.image}" alt="" />
                                </div>
                                <div id="similar-product" class="carousel slide" data-ride="carousel">
                                    <!-- Wrapper for slides -->
                                    <div class="carousel-inner">
                                        <div class="item active">
                                            <c:forEach var="listProduct" items="${listProduct}" varStatus="loop">
                                                <c:if test="${loop.index == 0}">
                                                    <a href=""><img src="images/${listProduct.image}" alt=""></a>
                                                    </c:if>
                                                </c:forEach>
                                        </div>
                                        <div class="item">
                                            <c:forEach var="listProduct" items="${listProduct}" varStatus="loop">
                                                <c:if test="${loop.index == 1}">
                                                    <a href=""><img src="images/${listProduct.image}" alt=""></a>
                                                    </c:if>
                                                </c:forEach>
                                        </div>
                                        <div class="item">
                                            <c:forEach var="listProduct" items="${listProduct}" varStatus="loop">
                                                <c:if test="${loop.index == 2}">
                                                    <a href=""><img src="images/${listProduct.image}" alt=""></a>
                                                    </c:if>
                                                </c:forEach>
                                        </div>
                                    </div>

                                    <!-- Controls -->
                                    <a class="left item-control" href="#similar-product" data-slide="prev">
                                        <i class="fa fa-angle-left"></i>
                                    </a>
                                    <a class="right item-control" href="#similar-product" data-slide="next">
                                        <i class="fa fa-angle-right"></i>
                                    </a>
                                </div>

                            </div>
                            <div class="col-sm-7">
                                <div class="product-information"><!--/product-information-->
                                    <img src="images/product-details/new.jpg" class="newarrival" alt="" />
                                    <p><b>ID Book:</b> ${product.id}</p>
                                    <h2>${product.title}</h2>
                                    <p><b>Author:</b> ${product.author}</p>
                                    <p><b>Category:</b> ${product.category}</p>
                                    <span>
                                        <span>${product.salePrice} VNĐ</span>
                                        <label>Quantity:</label>
                                        <input type="text" value="${product.quantity}" />
                                        <button type="button" class="btn btn-fefault cart">
                                            <i class="fa fa-shopping-cart"></i>
                                            Add to cart
                                        </button>
                                    </span>
                                    <a href="#" class="btn btn-default buy-now">
                                        <i class="fa fa-bolt"></i>
                                        Buy
                                    </a>
                                    <p><b>Description:</b> ${product.description}</p>
                                    <p><b>Publication date:</b> ${product.updateDate}</p>
                                    <p><b>Original Price:</b> ${product.originalPrice} VNĐ</p>
                                    <a href=""><img src="images/product-details/share.png" class="share img-responsive"  alt="" /></a>
                                </div><!--/product-information-->
                            </div>
                        </div><!--/product-details-->

                        <div class="category-tab shop-details-tab"><!--category-tab-->
                            <div class="col-sm-12">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#reviews" data-toggle="tab">Reviews (${count})</a></li>
                                </ul>
                            </div>
                            <div class="tab-content">                                    
                                <div class="tab-pane fade active in" id="reviews" >
                                    <c:if test="${empty feedback}">
                                        <div class="col-sm-12">
                                            <p>There are no FeedBack for this product.</p>
                                        </div>
                                    </c:if>
                                    <c:forEach var="feedback" items="${feedback}">
                                        <div class="col-sm-12">
                                            <ul>
                                                <li><a href=""><i class="fa fa-user"></i>${feedback.customer}</a></li>
                                                <li>
                                                    <a >
                                                        <i class="fa fa-clock-o"></i>
                                                        <c:forEach begin="1" end="${feedback.ratedStar}" var="star">
                                                            <i class="fa fa-star"></i>
                                                        </c:forEach>
                                                        <c:forEach begin="${feedback.ratedStar + 1}" end="5" var="star">
                                                            <i class="fa fa-star-o"></i>
                                                        </c:forEach>
                                                    </a>
                                                </li>
                                                <li><a href=""><i class="fa fa-calendar-o"></i>${feedback.date}</a></li>
                                            </ul>
                                            <p>${feedback.comment}</p>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>

                        </div><!--/category-tab-->
                        <ul class="pagination">
                            <c:if test="${tag > 1}">
                                <li><a href="?index=${tag - 1}">Previous</a></li>
                                </c:if>
                                <c:forEach begin="1" end="${endP}" var="i">
                                <li class="${tag == i ? 'active' : ''}"><a class="pagination-link" href="?index=${i}">${i}</a></li>
                                </c:forEach>
                                <c:if test="${tag < endP}">
                                <li><a href="?index=${tag + 1}">Next</a></li>
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
                                        <c:forEach var="listProduct" items="${listProduct}" varStatus="loop">
                                            <c:if test="${loop.index == 0}">
                                                <div class="col-sm-4">
                                                    <div class="product-image-wrapper">
                                                        <div class="single-products  product-item" data-id="${listProduct.id}">
                                                            <div class="productinfo text-center">
                                                                <img src="images/${listProduct.image}" alt="" />
                                                                <h2>${listProduct.title}</h2>
                                                                <p>${listProduct.description}</p>
                                                                <p style="display: none;">${listProduct.id}</p>
                                                                <div class="button-container">
                                                                    <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                    <a href="#" class="btn btn-default buy-now"><i class="fa fa-bolt"></i>Buy</a>
                                                                </div>
                                                            </div>
                                                            <div class="product-overlay">
                                                                <div class="overlay-content">
                                                                    <h2>${listProduct.title}</h2>
                                                                    <p>${listProduct.description}</p>
                                                                    <div class="button-container">
                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                        <a href="#" class="btn btn-default buy-now"><i class="fa fa-bolt"></i>Buy</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="choose">
                                                            <ul class="nav nav-pills nav-justified">
                                                                <li><a><i></i><span class="original-price">${listProduct.originalPrice} VNĐ</span></a></li>
                                                                <li><a><i></i><span class="sale-price">${listProduct.salePrice} VNĐ</span></a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:forEach>

                                        <c:forEach var="listProduct" items="${listProduct}" varStatus="loop">
                                            <c:if test="${loop.index == 1}">
                                                <div class="col-sm-4">
                                                    <div class="product-image-wrapper">
                                                        <div class="single-products  product-item" data-id="${listProduct.id}">
                                                            <div class="productinfo text-center">
                                                                <img src="images/${listProduct.image}" alt="" />
                                                                <h2>${listProduct.title}</h2>
                                                                <p>${listProduct.description}</p>
                                                                <p style="display: none;">${listProduct.id}</p>
                                                                <div class="button-container">
                                                                    <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                    <a href="#" class="btn btn-default buy-now"><i class="fa fa-bolt"></i>Buy</a>
                                                                </div>
                                                            </div>
                                                            <div class="product-overlay">
                                                                <div class="overlay-content">
                                                                    <h2>${listProduct.title}</h2>
                                                                    <p>${listProduct.description}</p>
                                                                    <div class="button-container">
                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                        <a href="#" class="btn btn-default buy-now"><i class="fa fa-bolt"></i>Buy</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="choose">
                                                            <ul class="nav nav-pills nav-justified">
                                                                <li><a><i></i><span class="original-price">${listProduct.originalPrice} VNĐ</span></a></li>
                                                                <li><a><i></i><span class="sale-price">${listProduct.salePrice} VNĐ</span></a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:forEach>

                                        <c:forEach var="listProduct" items="${listProduct}" varStatus="loop">
                                            <c:if test="${loop.index == 2}">
                                                <div class="col-sm-4">
                                                    <div class="product-image-wrapper">
                                                        <div class="single-products  product-item" data-id="${listProduct.id}">
                                                            <div class="productinfo text-center">
                                                                <img src="images/${listProduct.image}" alt="" />
                                                                <h2>${listProduct.title}</h2>
                                                                <p>${listProduct.description}</p>
                                                                <p style="display: none;">${listProduct.id}</p>
                                                                <div class="button-container">
                                                                    <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                    <a href="#" class="btn btn-default buy-now"><i class="fa fa-bolt"></i>Buy</a>
                                                                </div>
                                                            </div>
                                                            <div class="product-overlay">
                                                                <div class="overlay-content">
                                                                    <h2>${listProduct.title}</h2>
                                                                    <p>${listProduct.description}</p>
                                                                    <div class="button-container">
                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                        <a href="#" class="btn btn-default buy-now"><i class="fa fa-bolt"></i>Buy</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="choose">
                                                            <ul class="nav nav-pills nav-justified">
                                                                <li><a><i></i><span class="original-price">${listProduct.originalPrice} VNĐ</span></a></li>
                                                                <li><a><i></i><span class="sale-price">${listProduct.salePrice} VNĐ</span></a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:forEach>

                                    </div>
                                    <div class="item">	
                                        <c:forEach var="listProduct" items="${listProduct}" varStatus="loop">
                                            <c:if test="${loop.index == 3}">
                                                <div class="col-sm-4">
                                                    <div class="product-image-wrapper">
                                                        <div class="single-products  product-item" data-id="${listProduct.id}">
                                                            <div class="productinfo text-center">
                                                                <img src="images/${listProduct.image}" alt="" />
                                                                <h2>${listProduct.title}</h2>
                                                                <p>${listProduct.description}</p>
                                                                <p style="display: none;">${listProduct.id}</p>
                                                                <div class="button-container">
                                                                    <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                    <a href="#" class="btn btn-default buy-now"><i class="fa fa-bolt"></i>Buy</a>
                                                                </div>
                                                            </div>
                                                            <div class="product-overlay">
                                                                <div class="overlay-content">
                                                                    <h2>${listProduct.title}</h2>
                                                                    <p>${listProduct.description}</p>
                                                                    <div class="button-container">
                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                        <a href="#" class="btn btn-default buy-now"><i class="fa fa-bolt"></i>Buy</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="choose">
                                                            <ul class="nav nav-pills nav-justified">
                                                                <li><a><i></i><span class="original-price">${listProduct.originalPrice} VNĐ</span></a></li>
                                                                <li><a><i></i><span class="sale-price">${listProduct.salePrice} VNĐ</span></a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:forEach>

                                        <c:forEach var="listProduct" items="${listProduct}" varStatus="loop">
                                            <c:if test="${loop.index == 4}">
                                                <div class="col-sm-4">
                                                    <div class="product-image-wrapper">
                                                        <div class="single-products  product-item" data-id="${listProduct.id}">
                                                            <div class="productinfo text-center">
                                                                <img src="images/${listProduct.image}" alt="" />
                                                                <h2>${listProduct.title}</h2>
                                                                <p>${listProduct.description}</p>
                                                                <p style="display: none;">${listProduct.id}</p>
                                                                <div class="button-container">
                                                                    <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                    <a href="#" class="btn btn-default buy-now"><i class="fa fa-bolt"></i>Buy</a>
                                                                </div>
                                                            </div>
                                                            <div class="product-overlay">
                                                                <div class="overlay-content">
                                                                    <h2>${listProduct.title}</h2>
                                                                    <p>${listProduct.description}</p>
                                                                    <div class="button-container">
                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                        <a href="#" class="btn btn-default buy-now"><i class="fa fa-bolt"></i>Buy</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="choose">
                                                            <ul class="nav nav-pills nav-justified">
                                                                <li><a><i></i><span class="original-price">${listProduct.originalPrice} VNĐ</span></a></li>
                                                                <li><a><i></i><span class="sale-price">${listProduct.salePrice} VNĐ</span></a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:forEach>

                                        <c:forEach var="listProduct" items="${listProduct}" varStatus="loop">
                                            <c:if test="${loop.index == 5}">
                                                <div class="col-sm-4">
                                                    <div class="product-image-wrapper">
                                                        <div class="single-products  product-item" data-id="${listProduct.id}">
                                                            <div class="productinfo text-center">
                                                                <img src="images/${listProduct.image}" alt="" />
                                                                <h2>${listProduct.title}</h2>
                                                                <p>${listProduct.description}</p>
                                                                <p style="display: none;">${listProduct.id}</p>
                                                                <div class="button-container">
                                                                    <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                    <a href="#" class="btn btn-default buy-now"><i class="fa fa-bolt"></i>Buy</a>
                                                                </div>
                                                            </div>
                                                            <div class="product-overlay">
                                                                <div class="overlay-content">
                                                                    <h2>${listProduct.title}</h2>
                                                                    <p>${listProduct.description}</p>
                                                                    <div class="button-container">
                                                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                                        <a href="#" class="btn btn-default buy-now"><i class="fa fa-bolt"></i>Buy</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="choose">
                                                            <ul class="nav nav-pills nav-justified">
                                                                <li><a><i></i><span class="original-price">${listProduct.originalPrice} VNĐ</span></a></li>
                                                                <li><a><i></i><span class="sale-price">${listProduct.salePrice} VNĐ</span></a></li>
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
        </section>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var productItems = document.querySelectorAll('.product-item');
                productItems.forEach(function (item) {
                    item.addEventListener('click', function () {
                        var productId = this.getAttribute('data-id');
                        window.location.href = 'ProductDetailPublic?index=1&productId=' + productId;
                    });
                });
            });
        </script>
        <footer id="footer"><!--Footer-->
            <div class="footer-top">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-2">
                            <div class="companyinfo">
                                <h2><span>e</span>-shopper</h2>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,sed do eiusmod tempor</p>
                            </div>
                        </div>
                        <div class="col-sm-7">
                            <div class="col-sm-3">
                                <div class="video-gallery text-center">
                                    <a href="#">
                                        <div class="iframe-img">
                                            <img src="images/home/iframe1.png" alt="" />
                                        </div>
                                        <div class="overlay-icon">
                                            <i class="fa fa-play-circle-o"></i>
                                        </div>
                                    </a>
                                    <p>Circle of Hands</p>
                                    <h2>24 DEC 2014</h2>
                                </div>
                            </div>

                            <div class="col-sm-3">
                                <div class="video-gallery text-center">
                                    <a href="#">
                                        <div class="iframe-img">
                                            <img src="images/home/iframe2.png" alt="" />
                                        </div>
                                        <div class="overlay-icon">
                                            <i class="fa fa-play-circle-o"></i>
                                        </div>
                                    </a>
                                    <p>Circle of Hands</p>
                                    <h2>24 DEC 2014</h2>
                                </div>
                            </div>

                            <div class="col-sm-3">
                                <div class="video-gallery text-center">
                                    <a href="#">
                                        <div class="iframe-img">
                                            <img src="images/home/iframe3.png" alt="" />
                                        </div>
                                        <div class="overlay-icon">
                                            <i class="fa fa-play-circle-o"></i>
                                        </div>
                                    </a>
                                    <p>Circle of Hands</p>
                                    <h2>24 DEC 2014</h2>
                                </div>
                            </div>

                            <div class="col-sm-3">
                                <div class="video-gallery text-center">
                                    <a href="#">
                                        <div class="iframe-img">
                                            <img src="images/home/iframe4.png" alt="" />
                                        </div>
                                        <div class="overlay-icon">
                                            <i class="fa fa-play-circle-o"></i>
                                        </div>
                                    </a>
                                    <p>Circle of Hands</p>
                                    <h2>24 DEC 2014</h2>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="address">
                                <img src="images/home/map.png" alt="" />
                                <p>505 S Atlantic Ave Virginia Beach, VA(Virginia)</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="footer-widget">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-2">
                            <div class="single-widget">
                                <h2>Service</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="">Online Help</a></li>
                                    <li><a href="">Contact Us</a></li>
                                    <li><a href="">Order Status</a></li>
                                    <li><a href="">Change Location</a></li>
                                    <li><a href="">FAQ’s</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="single-widget">
                                <h2>Quock Shop</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="">T-Shirt</a></li>
                                    <li><a href="">Mens</a></li>
                                    <li><a href="">Womens</a></li>
                                    <li><a href="">Gift Cards</a></li>
                                    <li><a href="">Shoes</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="single-widget">
                                <h2>Policies</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="">Terms of Use</a></li>
                                    <li><a href="">Privecy Policy</a></li>
                                    <li><a href="">Refund Policy</a></li>
                                    <li><a href="">Billing System</a></li>
                                    <li><a href="">Ticket System</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="single-widget">
                                <h2>About Shopper</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="">Company Information</a></li>
                                    <li><a href="">Careers</a></li>
                                    <li><a href="">Store Location</a></li>
                                    <li><a href="">Affillate Program</a></li>
                                    <li><a href="">Copyright</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-3 col-sm-offset-1">
                            <div class="single-widget">
                                <h2>About Shopper</h2>
                                <form action="#" class="searchform">
                                    <input type="text" placeholder="Your email address" />
                                    <button type="submit" class="btn btn-default"><i class="fa fa-arrow-circle-o-right"></i></button>
                                    <p>Get the most recent updates from <br />our site and be updated your self...</p>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="footer-bottom">
                <div class="container">
                    <div class="row">
                        <p class="pull-left">Copyright © 2013 E-SHOPPER Inc. All rights reserved.</p>
                        <p class="pull-right">Designed by <span><a target="_blank" href="http://www.themeum.com">Themeum</a></span></p>
                    </div>
                </div>
            </div>

        </footer><!--/Footer-->



        <script src="js/jquery.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- Bootstrap JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </body>
</html>
