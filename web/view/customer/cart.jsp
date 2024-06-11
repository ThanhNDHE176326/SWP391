<%-- 
    Document   : cart
    Created on : 19 May 2024, 4:11:00 pm
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
        <title>Cart | E-Shopper</title>
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

        <section id="cart_items">
            <div class="container">
                <div class="breadcrumbs">
                    <ol class="breadcrumb">
                        <li><a href="#">Home</a></li>
                        <li class="active">Shopping Cart</li>
                    </ol>
                </div>
                <div class="table-responsive cart_info">
                    <table class="table table-condensed">
                        <thead>
                            <tr class="cart_menu">
                                <td class="image">Item</td>
                                <td class="description">Title</td>
                                <td class="price">Price</td>
                                <td class="quantity">Quantity</td>
                                <td class="total">Total</td>
                                <td class="total">Delete</td>
                            </tr>
                        </thead>
                        <style>.table-responsive.cart_info {
                                margin-bottom: 20px; /* Khoảng cách dưới cùng của bảng */
                            }

                            .table.table-condensed {
                                width: 100%; /* Chiều rộng của bảng là 100% */
                                /* Gộp viền của các ô */
                            }

                            .cart_menu td {
                                font-weight: bold; /* Đặt đậm cho các ô tiêu đề */
                            }

                            .cart_menu td, .cart_product, .cart_description, .cart_price, .cart_quantity, .cart_total, .cart_delete {
                                text-align: center; /* Canh giữa nội dung của các ô */
                                vertical-align: middle; /* Canh giữa theo chiều dọc của các ô */
                                padding: 10px; /* Khoảng cách nội dung với viền trong mỗi ô */
                            }

                            .cart_menu td.image {
                                width: 15%; /* Chiều rộng của ô Item */
                            }

                            .cart_menu td.description {
                                width: 25%; /* Chiều rộng của ô Description */
                            }
                            
                            .cart_menu td.price {
                                width: 15%; /* Chiều rộng của ô Price */
                            }

                            .cart_menu td.quantity {
                                width: 15%; /* Chiều rộng của ô Quantity */
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
                            <c:forEach var="listProduct" items="${listProduct}">
                                <tr>
                                    <td class="cart_product">
                                        <a href=""><img src="<c:url value='/images/${listProduct.image}'/>" alt=""></a>
                                    </td>
                                    <td class="cart_description">
                                        <h4><a href="">${listProduct.title}</a></h4>
                                        <p>${listProduct.id}</p>
                                    </td>
                                    <td class="cart_price">
                                        <p>${listProduct.salePrice}</p>
                                    </td>
                                    <td class="cart_quantity">
                                        <div class="cart_quantity_button">
                                            <a class="cart_quantity_up" href="javascript:void(0)"> + </a>
                                            <input class="cart_quantity_input" type="text" name="quantity" value="1" autocomplete="off" size="2">
                                            <a class="cart_quantity_down" href="javascript:void(0)"> - </a>
                                        </div>
                                    </td>
                                    <td class="cart_total">
                                        <p class="cart_total_price">${listProduct.salePrice}</p>
                                    </td>
                                    <td class="cart_delete">
                                        <a class="cart_quantity_delete" href="javascript:void(0)"><i class="fa fa-times"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>

                        <script>
                            document.addEventListener('DOMContentLoaded', function () {
                                const quantityInputs = document.querySelectorAll('.cart_quantity_input');
                                const salePrices = document.querySelectorAll('.cart_price p');
                                const totalPrices = document.querySelectorAll('.cart_total_price');

                                function updateTotalPrice(index) {
                                    const quantity = parseInt(quantityInputs[index].value);
                                    const salePrice = parseFloat(salePrices[index].textContent);
                                    const totalPrice = quantity * salePrice;
                                    totalPrices[index].textContent = Math.floor(totalPrice); // Làm tròn xuống số nguyên gần nhất
                                }


                                function updateCartTotal() {
                                    let cartTotal = 0;
                                    totalPrices.forEach(function (price) {
                                        cartTotal += parseFloat(price.textContent);
                                    });
                                    // Update cart total in your UI here
                                }

                                function deleteProduct(index) {
                                    // Implement product deletion logic here
                                }

                                quantityInputs.forEach(function (input, index) {
                                    input.addEventListener('change', function () {
                                        updateTotalPrice(index);
                                        updateCartTotal();
                                    });
                                });

                                const incrementButtons = document.querySelectorAll('.cart_quantity_up');
                                const decrementButtons = document.querySelectorAll('.cart_quantity_down');

                                incrementButtons.forEach(function (button, index) {
                                    button.addEventListener('click', function () {
                                        quantityInputs[index].value = parseInt(quantityInputs[index].value) + 1;
                                        updateTotalPrice(index);
                                        updateCartTotal();
                                    });
                                });

                                decrementButtons.forEach(function (button, index) {
                                    button.addEventListener('click', function () {
                                        const currentValue = parseInt(quantityInputs[index].value);
                                        if (currentValue > 1) {
                                            quantityInputs[index].value = currentValue - 1;
                                            updateTotalPrice(index);
                                            updateCartTotal();
                                        }
                                    });
                                });

                                const deleteButtons = document.querySelectorAll('.cart_quantity_delete');
                                deleteButtons.forEach(function (button, index) {
                                    button.addEventListener('click', function () {
                                        deleteProduct(index);
                                    });
                                });
                            });
                        </script>


                        </tbody>
                    </table>
                </div>
            </div>
        </section> <!--/#cart_items-->

        <section id="do_action">
            <div class="container">
                <div class="heading">
                    <h3>What would you like to do next?</h3>
                    <p>Choose if you have a discount code or reward points you want to use or would like to estimate your delivery cost.</p>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="chose_area">
                            <ul class="user_option">
                                <li>
                                    <input type="checkbox">
                                    <label>Use Coupon Code</label>
                                </li>
                                <li>
                                    <input type="checkbox">
                                    <label>Use Gift Voucher</label>
                                </li>
                                <li>
                                    <input type="checkbox">
                                    <label>Estimate Shipping & Taxes</label>
                                </li>
                            </ul>
                            <ul class="user_info">
                                <li class="single_field">
                                    <label>Country:</label>
                                    <select>
                                        <option>United States</option>
                                        <option>Bangladesh</option>
                                        <option>UK</option>
                                        <option>India</option>
                                        <option>Pakistan</option>
                                        <option>Ucrane</option>
                                        <option>Canada</option>
                                        <option>Dubai</option>
                                    </select>

                                </li>
                                <li class="single_field">
                                    <label>Region / State:</label>
                                    <select>
                                        <option>Select</option>
                                        <option>Dhaka</option>
                                        <option>London</option>
                                        <option>Dillih</option>
                                        <option>Lahore</option>
                                        <option>Alaska</option>
                                        <option>Canada</option>
                                        <option>Dubai</option>
                                    </select>

                                </li>
                                <li class="single_field zip-field">
                                    <label>Zip Code:</label>
                                    <input type="text">
                                </li>
                            </ul>
                            <a class="btn btn-default update" href="">Get Quotes</a>
                            <a class="btn btn-default check_out" href="">Continue</a>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="total_area">
                            <ul>
                                <li>Cart Sub Total <span>$59</span></li>
                                <li>Eco Tax <span>$2</span></li>
                                <li>Shipping Cost <span>Free</span></li>
                                <li>Total <span>$61</span></li>
                            </ul>
                            <a class="btn btn-default update" href="">Update</a>
                            <a class="btn btn-default check_out" href="">Check Out</a>
                        </div>
                    </div>
                </div>
            </div>
        </section><!--/#do_action-->

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


        <jsp:include page="footer.jsp"/>

        <script src="<c:url value='/js/jquery.js'/>"></script>
        <script src="<c:url value='/js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/js/jquery.scrollUp.min.js'/>"></script>
        <script src="<c:url value='/js/price-range.js'/>"></script>
        <script src="<c:url value='/js/jquery.prettyPhoto.js'/>"></script>
        <script src="<c:url value='/js/main.js'/>"></script>

    </body>
</html>