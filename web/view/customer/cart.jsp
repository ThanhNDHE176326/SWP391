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
        <title>Product Details | BookHaven</title>
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
        <!-- Link to Font Awesome CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

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

            .cart_menu td.image {
                width: 25%; /* Width for Item cell */
            }

            .cart_menu td.description {
                width: 15%; /* Width for Description cell */
            }

            .cart_menu td.price,
            .cart_menu td.quantity,
            .cart_menu td.total,
            .cart_menu td.delete {
                width: 10%; /* Width for each of these cells */
            }

            .cart_menu td.stock{
                width: 5%;
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
            .out-of-stock {
                color: red;
                font-weight: bold;
                font-size: 20px;
            }
            .disabled {
                color: grey;
                pointer-events: none;
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
                            <jsp:include page="leftsidebar.jsp"/>  
                        </div>
                    </div>
                    <div class="col-sm-9 padding-right">
                        <div id="cart_items">
                            <div class="breadcrumbs">
                                <ol class="breadcrumb">
                                    <li><a href="${pageContext.request.contextPath}/ProductListPublic">Choose More Product</a></li>
                                    <li class="active">Cart Detail</li>
                                </ol>
                            </div>
                            <form id="cartForm" action="${pageContext.request.contextPath}/pushToCartContact" method="POST" onsubmit="return validateSelection()">
                                <div class="table-responsive cart_info" style="max-width: 1400px; margin: auto;">
                                    <table class="table table-condensed">
                                        <thead>
                                            <tr class="cart_menu">
                                                <td class="select">Select</td>
                                                <td class="image">Item</td>
                                                <td class="description">Title</td>
                                                <td class="price">Price</td>
                                                <td class="stock">Available</td>
                                                <td class="quantity">Quantity</td>
                                                <td class="total">Total</td>
                                                <td class="delete">Delete</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="product" items="${listProduct}">
                                                <tr>
                                                    <td class="cart_select">
                                                        <input type="checkbox" name="selectedProducts" value="${product.id}" data-price="${product.salePrice}" data-quantity="${product.quantity}" data-stock="${product.stock - product.hold}" class="product-checkbox">
                                                    </td>
                                                    <td class="cart_product">
                                                        <a><img src="<c:url value='/images/${product.image}'/>" alt=""></a>
                                                    </td>
                                                    <td class="cart_description">
                                                        <h4><a>${product.title}</a></h4>
                                                        <p>ID: ${product.id}</p>
                                                    </td>
                                                    <td class="cart_price">
                                                        <fmt:formatNumber value="${product.salePrice}" type="number" maxFractionDigits="0" />
                                                    </td>
                                                    <td class="cart_stock">
                                                        <fmt:formatNumber value="${product.stock - product.hold}" type="number" maxFractionDigits="0" />
                                                    </td>
                                                    <td class="cart_quantity">
                                                        <div class="cart_quantity_button">
                                                            <a class="cart_quantity_down" href="updateQuantityCartProduct?productID=${product.id}&mode=tru"> - </a>
                                                            <input class="cart_quantity_input" type="text" name="quantity" readonly="" value="${product.quantity}" autocomplete="off" size="2" data-stock="${product.stock}">
                                                            <a class="cart_quantity_up" href="updateQuantityCartProduct?productID=${product.id}&mode=cong"> + </a>
                                                        </div>
                                                    </td>
                                                    <td class="cart_total">
                                                        <fmt:formatNumber value="${product.salePrice * product.quantity}" type="number" maxFractionDigits="0" />
                                                    </td>
                                                    <td class="cart_delete">
                                                        <a class="cart_quantity_delete" href="deleteCart?productID=${product.id}"><i class="fa fa-times"></i></a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <div id="total-amount" style="text-align: right; margin: 15px; font-size: 1.3em; font-weight: bold;">
                                    Total Cost: $0
                                </div>
                                <div class="button-container">
                                    <input type="submit" value="Create Order" class="styled-button">
                                </div>
                            </form>
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
                                                                    <p style="display: none;">${listNewProduct.hold}</p>
                                                                    <div class="button-container">
                                                                        <c:if test="${listNewProduct.quantity - listNewProduct.hold > 0}">
                                                                            <a href="addToCart?productID=${listNewProduct.id}&location=cart" class="btn btn-default add-to-cart">
                                                                                <i class="fa fa-shopping-cart"></i>Add to cart
                                                                            </a>
                                                                        </c:if>
                                                                        <c:if test="${listNewProduct.quantity - listNewProduct.hold == 0}">
                                                                            <span class="out-of-stock">Out of stock</span>
                                                                        </c:if>
                                                                    </div>
                                                                </div>
                                                                <div class="product-overlay">
                                                                    <div class="overlay-content">
                                                                        <h2>${listNewProduct.title}</h2>
                                                                        <p>${listNewProduct.description}</p>
                                                                        <div class="button-container">
                                                                            <c:if test="${listNewProduct.quantity - listNewProduct.hold > 0}">
                                                                                <a href="addToCart?productID=${listNewProduct.id}&location=cart" class="btn btn-default add-to-cart">
                                                                                    <i class="fa fa-shopping-cart"></i>Add to cart
                                                                                </a>
                                                                            </c:if>
                                                                            <c:if test="${listNewProduct.quantity - listNewProduct.hold == 0}">
                                                                                <span class="out-of-stock">Out of stock</span>
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
                                                                    <p style="display: none;">${listNewProduct.hold}</p>
                                                                    <div class="button-container">
                                                                        <c:if test="${listNewProduct.quantity - listNewProduct.hold > 0}">
                                                                            <a href="addToCart?productID=${listNewProduct.id}&location=cart" class="btn btn-default add-to-cart">
                                                                                <i class="fa fa-shopping-cart"></i>Add to cart
                                                                            </a>
                                                                        </c:if>
                                                                        <c:if test="${listNewProduct.quantity - listNewProduct.hold == 0}">
                                                                            <span class="out-of-stock">Out of stock</span>
                                                                        </c:if>
                                                                    </div>
                                                                </div>
                                                                <div class="product-overlay">
                                                                    <div class="overlay-content">
                                                                        <h2>${listNewProduct.title}</h2>
                                                                        <p>${listNewProduct.description}</p>
                                                                        <div class="button-container">
                                                                            <c:if test="${listNewProduct.quantity - listNewProduct.hold > 0}">
                                                                                <a href="addToCart?productID=${listNewProduct.id}&location=cart" class="btn btn-default add-to-cart">
                                                                                    <i class="fa fa-shopping-cart"></i>Add to cart
                                                                                </a>
                                                                            </c:if>
                                                                            <c:if test="${listNewProduct.quantity - listNewProduct.hold == 0}">
                                                                                <span class="out-of-stock">Out of stock</span>
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
                                                                    <p style="display: none;">${listNewProduct.hold}</p>
                                                                    <div class="button-container">
                                                                        <c:if test="${listNewProduct.quantity - listNewProduct.hold > 0}">
                                                                            <a href="addToCart?productID=${listNewProduct.id}&location=cart" class="btn btn-default add-to-cart">
                                                                                <i class="fa fa-shopping-cart"></i>Add to cart
                                                                            </a>
                                                                        </c:if>
                                                                        <c:if test="${listNewProduct.quantity - listNewProduct.hold == 0}">
                                                                            <span class="out-of-stock">Out of stock</span>
                                                                        </c:if>
                                                                    </div>
                                                                </div>
                                                                <div class="product-overlay">
                                                                    <div class="overlay-content">
                                                                        <h2>${listNewProduct.title}</h2>
                                                                        <p>${listNewProduct.description}</p>
                                                                        <div class="button-container">
                                                                            <c:if test="${listNewProduct.quantity - listNewProduct.hold > 0}">
                                                                                <a href="addToCart?productID=${listNewProduct.id}&location=cart" class="btn btn-default add-to-cart">
                                                                                    <i class="fa fa-shopping-cart"></i>Add to cart
                                                                                </a>
                                                                            </c:if>
                                                                            <c:if test="${listNewProduct.quantity - listNewProduct.hold == 0}">
                                                                                <span class="out-of-stock">Out of stock</span>
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
                                                                    <p style="display: none;">${listNewProduct.hold}</p>
                                                                    <div class="button-container">
                                                                        <c:if test="${listNewProduct.quantity - listNewProduct.hold > 0}">
                                                                            <a href="addToCart?productID=${listNewProduct.id}&location=cart" class="btn btn-default add-to-cart">
                                                                                <i class="fa fa-shopping-cart"></i>Add to cart
                                                                            </a>
                                                                        </c:if>
                                                                        <c:if test="${listNewProduct.quantity - listNewProduct.hold == 0}">
                                                                            <span class="out-of-stock">Out of stock</span>
                                                                        </c:if>
                                                                    </div>
                                                                </div>
                                                                <div class="product-overlay">
                                                                    <div class="overlay-content">
                                                                        <h2>${listNewProduct.title}</h2>
                                                                        <p>${listNewProduct.description}</p>
                                                                        <div class="button-container">
                                                                            <c:if test="${listNewProduct.quantity - listNewProduct.hold > 0}">
                                                                                <a href="addToCart?productID=${listNewProduct.id}&location=cart" class="btn btn-default add-to-cart">
                                                                                    <i class="fa fa-shopping-cart"></i>Add to cart
                                                                                </a>
                                                                            </c:if>
                                                                            <c:if test="${listNewProduct.quantity - listNewProduct.hold == 0}">
                                                                                <span class="out-of-stock">Out of stock</span>
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
                                                                    <p style="display: none;">${listNewProduct.hold}</p>
                                                                    <div class="button-container">
                                                                        <c:if test="${listNewProduct.quantity - listNewProduct.hold > 0}">
                                                                            <a href="addToCart?productID=${listNewProduct.id}&location=cart" class="btn btn-default add-to-cart">
                                                                                <i class="fa fa-shopping-cart"></i>Add to cart
                                                                            </a>
                                                                        </c:if>
                                                                        <c:if test="${listNewProduct.quantity - listNewProduct.hold == 0}">
                                                                            <span class="out-of-stock">Out of stock</span>
                                                                        </c:if>
                                                                    </div>
                                                                </div>
                                                                <div class="product-overlay">
                                                                    <div class="overlay-content">
                                                                        <h2>${listNewProduct.title}</h2>
                                                                        <p>${listNewProduct.description}</p>
                                                                        <div class="button-container">
                                                                            <c:if test="${listNewProduct.quantity - listNewProduct.hold > 0}">
                                                                                <a href="addToCart?productID=${listNewProduct.id}&location=cart" class="btn btn-default add-to-cart">
                                                                                    <i class="fa fa-shopping-cart"></i>Add to cart
                                                                                </a>
                                                                            </c:if>
                                                                            <c:if test="${listNewProduct.quantity - listNewProduct.hold == 0}">
                                                                                <span class="out-of-stock">Out of stock</span>
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
                                                                    <p style="display: none;">${listNewProduct.hold}</p>
                                                                    <div class="button-container">
                                                                        <c:if test="${listNewProduct.quantity - listNewProduct.hold > 0}">
                                                                            <a href="addToCart?productID=${listNewProduct.id}&location=cart" class="btn btn-default add-to-cart">
                                                                                <i class="fa fa-shopping-cart"></i>Add to cart
                                                                            </a>
                                                                        </c:if>
                                                                        <c:if test="${listNewProduct.quantity - listNewProduct.hold == 0}">
                                                                            <span class="out-of-stock">Out of stock</span>
                                                                        </c:if>
                                                                    </div>
                                                                </div>
                                                                <div class="product-overlay">
                                                                    <div class="overlay-content">
                                                                        <h2>${listNewProduct.title}</h2>
                                                                        <p>${listNewProduct.description}</p>
                                                                        <div class="button-container">
                                                                            <c:if test="${listNewProduct.quantity - listNewProduct.hold > 0}">
                                                                                <a href="addToCart?productID=${listNewProduct.id}&location=cart" class="btn btn-default add-to-cart">
                                                                                    <i class="fa fa-shopping-cart"></i>Add to cart
                                                                                </a>
                                                                            </c:if>
                                                                            <c:if test="${listNewProduct.quantity - listNewProduct.hold == 0}">
                                                                                <span class="out-of-stock">Out of stock</span>
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

            document.addEventListener('DOMContentLoaded', function () {
                const checkboxes = document.querySelectorAll('.product-checkbox');
                const totalAmountElement = document.getElementById('total-amount');

                function calculateTotal() {
                    let total = 0;
                    checkboxes.forEach(checkbox => {
                        if (checkbox.checked) {
                            const price = parseFloat(checkbox.getAttribute('data-price'));
                            const quantity = parseInt(checkbox.getAttribute('data-quantity'));
                            total += price * quantity;
                        }
                    });
                    totalAmountElement.textContent = 'Total Cost: ' + total.toLocaleString('en-US') + ' VNĐ';
                }

                function updateQuantityButtons() {
                    const quantityInputs = document.querySelectorAll('.cart_quantity_input');
                    quantityInputs.forEach(input => {
                        const quantity = parseInt(input.value);
                        const stock = parseInt(input.getAttribute('data-stock'));
                        const plusButton = input.nextElementSibling;
                        const minusButton = input.previousElementSibling;

                        if (quantity >= stock) {
                            plusButton.classList.add('disabled');
                            plusButton.style.pointerEvents = 'none';
                        } else {
                            plusButton.classList.remove('disabled');
                            plusButton.style.pointerEvents = 'auto';
                        }

                        if (quantity <= 0) {
                            minusButton.classList.add('disabled');
                            minusButton.style.pointerEvents = 'none';
                        } else {
                            minusButton.classList.remove('disabled');
                            minusButton.style.pointerEvents = 'auto';
                        }
                    });
                }

                checkboxes.forEach(checkbox => {
                    checkbox.addEventListener('change', function () {
                        const stock = parseInt(checkbox.getAttribute('data-stock'));
                        const isChecked = checkbox.checked;
                        if (isChecked) {
                            const quantityInput = checkbox.parentElement.parentElement.querySelector('.cart_quantity_input');
                            const quantity = parseInt(quantityInput.value);
                            if (quantity > stock) {
                                checkbox.checked = false;
                                alert('The quantity selected exceeds available stock.');
                            }
                        }
                        calculateTotal();
                    });
                });

                const quantityInputs = document.querySelectorAll('.cart_quantity_input');
                quantityInputs.forEach(input => {
                    input.addEventListener('input', updateQuantityButtons);
                });

                calculateTotal(); // Initial calculation in case some checkboxes are pre-selected
                updateQuantityButtons(); // Initial check for quantity vs. stock
            });

            function validateSelection() {
                const checkboxes = document.querySelectorAll('.product-checkbox');
                for (const checkbox of checkboxes) {
                    if (checkbox.checked) {
                        const quantity = parseInt(checkbox.getAttribute('data-quantity'));
                        if (quantity > 0) {
                            return true;
                        } else {
                            alert('Please select the quantity of products to buy');
                            return false;
                        }
                    }
                }
                alert('Please select at least one product before creating an order.');
                return false;
            }
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
