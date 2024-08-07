 <%-- 
    Document   : homepage
    Created on : 19 May 2024, 4:12:24 pm
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Home | BookHaven</title>
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

        <link rel="stylesheet" href="path/to/your/css/file.css">
        <style>
            body {
                background-color: white;
                margin-top: 100px;
            }
            .carousel-container {
                width: 100%;
                height: 500px;
                position: relative;
                margin: 0 auto;
            }
            .navigation-buttons .previous {
                position: absolute;
                z-index: 10;
                font-size: 25px;
                top: 40%;
                left: 10px;
                font-weight: 700;
            }
            .navigation-buttons .next {
                right: 10px;
                position: absolute;
                font-size: 25px;
                z-index: 10;
                top: 40%;
            }
            .navigation-buttons .nav-btn {
                background: rgba(255, 255, 255, 0.55);
                cursor: pointer;
                border-radius: 50%;
                width: 30px;
                height: 30px;
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 5px;
                box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.4);
            }
            .navigation .nav-btn:hover {
                background: white;
            }
            .slider-carousel {
                display: flex;
                justify-content: center;
                margin-top: 20px;
                transition: all 2s ease;
            }
            .slider-carousel img {
                width: 100%;
                height: 500px;
                transition: all 2s ease;
                border: 8px solid white;
            }
            .images {
                position: absolute;
                display: none;
            }
            .main {
                display: block;
            }
            .image-text {
                position: relative;
                bottom: 0;
                width: 100%;
                display: flex;
                font-size: 20px;
                justify-content: center;
                align-items: center;
                color: rgb(255, 255, 255);
                background: rgba(0, 0, 0, 0.3);
                height: 35px;
            }
            .single-blog-post {
                display: flex;
                align-items: center;
            }
            .single-blog-post img {
                width: 100%;
                height: auto;
            }
            .single-blog-post .post-meta ul {
                display: flex;
                list-style: none;
                padding: 0;
            }
            .single-blog-post .post-meta ul li {
                margin-right: 15px;
            }
            .out-of-stock {
                color: red;
                font-weight: bold;
                font-size: 20px;
            }
            .alert {
            display: flex;
            justify-content: center; /* Căn giữa theo chiều ngang */
            align-items: center;    /* Căn giữa theo chiều dọc */
            text-align: center;     /* Căn giữa nội dung văn bản */
            margin: 20px auto;      /* Khoảng cách trên dưới và tự động căn giữa theo chiều ngang */
            padding: 10px;          /* Khoảng cách bên trong */
            width: 50%;             /* Độ rộng */
            background-color: #f8d7da; /* Màu nền (có thể thay đổi tùy ý) */
            color: #721c24;         /* Màu chữ (có thể thay đổi tùy ý) */
            border: 1px solid #f5c6cb; /* Đường viền (có thể thay đổi tùy ý) */
            border-radius: 5px;     /* Bo góc */
        }
        </style>


    </head><!--/head-->

    <body>
        <jsp:include page="header.jsp"/>
        <jsp:useBean id="t" class="DAO.HomePageDAO" scope="request" />
        <c:if test="${not empty message}">
        <div class="alert alert-warning">
            ${message}
        </div>
    </c:if>
        <!-- Slider Section -->
        <section id="slider">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="carousel-container">
                            <div class="navigation-buttons">
                                <div class="previous nav-btn"><</div>
                                <div class="next nav-btn">></div>
                            </div>
                            <div class="slider-carousel">
                                <div class="images main">
                                    <a href="${pageContext.request.contextPath}/ProductDetailPublic?productId=${t.image1ByShowStatus.product_id}">
                                        <img src="${pageContext.request.contextPath}/images/${t.image1ByShowStatus.image}" alt="" />
                                        <div class="image-text">${t.image1ByShowStatus.title}</div>
                                    </a>
                                </div>
                                <div class="images">
                                    <a href="${pageContext.request.contextPath}/ProductDetailPublic?productId=${t.image2ByShowStatus.product_id}">
                                        <img src="${pageContext.request.contextPath}/images/${t.image2ByShowStatus.image}" alt="" />
                                        <div class="image-text">${t.image2ByShowStatus.title}</div>
                                    </a>
                                </div>
                                <div class="images">
                                    <a href="${pageContext.request.contextPath}/ProductDetailPublic?productId=${t.image3ByShowStatus.product_id}">
                                        <img src="${pageContext.request.contextPath}/images/${t.image3ByShowStatus.image}" alt="" />
                                        <div class="image-text">${t.image3ByShowStatus.title}</div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section><!--/slider-->

        <section id="blog"><!--/#blog-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="blog-post-area">
                            <h2 class="title text-center">Latest From Our Blog</h2>
                            <div class="single-blog-post row">
                                <div class="col-sm-4">
                                    
                                        <img src="${pageContext.request.contextPath}/images/${t.top1Blog.image}" alt="" class="img-responsive">
                                    
                                </div>
                                <div class="col-sm-8">
                                    <h3><a >${t.top1Blog.title}</a></h3>
                                    <div class="post-meta">
                                        <ul>
                                            <li><i class="fa fa-calendar"></i> ${t.top1Blog.updateDate}</li>
                                            <li><i class="fa fa-thumbs-up"></i> 20</li>
                                            <li><i class="fa fa-comments"></i> 03</li>
                                        </ul>
                                    </div>
                                    <p>${t.top1Blog.description}</p>
                                    <a href="${pageContext.request.contextPath}/blogdetail?id=${t.top1Blog.id}" class="btn btn-primary">Read More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section><!--/#blog-->
        <section>
            <div class="container">
                <div class="row">

                    <div class="col-sm-12 padding-right">
                        <div class="features_items">
                            <h2 class="title text-center">Features Items</h2>
                            <div class="row">
                                <c:forEach var="product" items="${t.popularProducts}">
                                    <div class="col-sm-4">
                                        <div class="product-image-wrapper">
                                            <div class="single-products  product-item" data-id="${product.id}">
                                                <div class="productinfo text-center">
                                                    <img src="${pageContext.request.contextPath}/images/${product.image}" alt="${product.title}" />
                                                    <h2>${product.title}</h2>
                                                    <p>${product.description}</p>
                                                    <p style="display: none;">${product.id}</p>
                                                    <p style="display: none;">${product.quantity}</p>
                                                    <p style="display: none;">${product.hold}</p>
                                                    <div class="button-container">
                                                        <c:if test="${product.quantity - product.hold > 0}">
                                                            <a href="${pageContext.request.contextPath}/addToCart?productID=${product.id}&location=home" class="btn btn-default add-to-cart">
                                                                <i class="fa fa-shopping-cart"></i>Add to cart
                                                            </a>
                                                        </c:if>
                                                        <c:if test="${product.quantity - product.hold == 0}">
                                                            <span class="out-of-stock">Out of stock</span>
                                                        </c:if>
                                                    </div>
                                                </div>
                                                <div class="product-overlay">
                                                    <div class="overlay-content">
                                                        <h2>${product.title}</h2>
                                                        <p>${product.description}</p>
                                                        <div class="button-container">
                                                            <c:if test="${product.quantity - product.hold > 0}">
                                                                <a href="${pageContext.request.contextPath}/addToCart?productID=${product.id}&location=home" class="btn btn-default add-to-cart">
                                                                    <i class="fa fa-shopping-cart"></i>Add to cart
                                                                </a>
                                                            </c:if>
                                                            <c:if test="${product.quantity - product.hold == 0}">
                                                                <span class="out-of-stock">Out of stock</span>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="choose">
                                                <ul class="nav nav-pills nav-justified">
                                                    <li><a><i></i><span class="original-price">${product.salePrice + 50000} VNĐ</span></a></li>
                                                    <li><a><i></i><span class="sale-price">${product.salePrice} VNĐ</span></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <script>
                        const previous = document.querySelector('.previous');
                        const next = document.querySelector('.next');
                        const images = document.querySelector('.slider-carousel').children;
                        const totalImages = images.length;
                        let currentIndex = 0;

                        // Event Listeners to previous and next buttons
                        previous.addEventListener('click', () => {
                            previousImage();
                        });

                        next.addEventListener('click', () => {
                            nextImage();
                        });

                        setInterval(() => {
                            nextImage();
                        }, 4000);

                        // Function to go to next Image
                        function nextImage() {
                            images[currentIndex].classList.remove('main');
                            if (currentIndex == totalImages - 1) {
                                currentIndex = 0;
                            } else {
                                currentIndex++;
                            }
                            images[currentIndex].classList.add('main');
                        }

                        // Function to go to previous Image
                        function previousImage() {
                            images[currentIndex].classList.remove('main');
                            if (currentIndex == 0) {
                                currentIndex = totalImages - 1;
                            } else {
                                currentIndex--;
                            }
                            images[currentIndex].classList.add('main');
                        }
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

                </div><!--/recommended_items-->

            </div>
        </div>
    </div>
</section>

<jsp:include page="footer.jsp"/>

<script src="<c:url value='/js/jquery.js'/>"></script>
<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/js/jquery.scrollUp.min.js'/>"></script>
<script src="<c:url value='/js/price-range.js'/>"></script>
<script src="<c:url value='/js/jquery.prettyPhoto.js'/>"></script>
<script src="<c:url value='/js/main.js'/>"></script>

</body>
</html>