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
        <title>Cart Completion | BookHaven</title>
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
            .container{
                margin-bottom: 10px !important;
            }
            .table-responsive.cart_info {
                margin-bottom: 10px; /* Bottom margin for the table */
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

            .cart_menu td.image {
                width: 30%; /* Adjusted width for Item cell */
            }

            .cart_menu td.description {
                width: 20%; /* Adjusted width for Description cell */
            }

            .cart_menu td.price{
                width: 20%;
            }
            .cart_menu td.quantity{
                width: 10%;
            }
            .cart_menu td.total{
                width: 20%; /* Width for each of these cells */
            }

            .cart_menu td.cart_delete a {
                color: #333; /* Color for Delete link */
            }

            .cart_menu td.cart_delete a:hover {
                color: red; /* Hover color for Delete link */
            }

            .cart_product {
                display: flex !important;
                justify-content: center !important; /* Căn giữa theo chiều ngang */
                align-items: center !important; /* Căn giữa theo chiều dọc */
                width: 100% !important; /* Đảm bảo phần tử bao bọc chiếm toàn bộ chiều rộng */
                height: 100% !important; /* Đảm bảo phần tử bao bọc chiếm toàn bộ chiều cao */
            }

            .cart_product img {
                width: 200px !important; /* Chiều rộng của ảnh */
                height: 130px !important; /* Giữ nguyên tỷ lệ khung hình */
            }

            .cart_quantity_button {
                display: flex; /* Use flexbox for quantity controls */
                align-items: center; /* Center align the items */
                justify-content: center; /* Center align horizontally */
            }

            .cart_quantity_button input {
                margin: 0 5px; /* Margin between controls */
                text-align: center; /* Center the quantity input text */
                border: none; /* Remove border for read-only input */
                background: transparent; /* Remove background for read-only input */
            }

            .cart_description, .cart_price, .cart_quantity, .cart_total, .cart_delete,.cart_name, .cart_gender {
                text-align: center; /* Center text alignment */
                vertical-align: middle; /* Vertical middle alignment */
            }

            .cart_price, .cart_quantity, .cart_total {
                font-size: 20px; /* Set your desired font size here */
                padding: 10px; /* Consistent padding for all cells */
                box-sizing: border-box; /* Ensure padding is included in width calculation */
            }

            .cart_description h4 a {
                font-size: 20px !important;
            }

            .button-container {
                text-align: center;
                margin-top: 20px;
            }

            .confirmation-page {
                font-family: 'Times New Roman', Times, serif;
                text-align: center;
                margin-top: 20px;
            }
            .main-title {
                color: orange;
                font-size: 36px;
                font-weight: bold;
            }
            .message {
                margin: 20px 0;
                font-size: 18px;
            }
            .signature {
                margin-top: 30px;
                font-family: 'Brush Script MT', cursive;
                font-size: 24px;
            }
            .chose_area {
                border: 2px solid #4CAF50; /* Đường viền xanh lá cây, độ dày 2px */
                padding: 15px;
                background-color: #f2f2f2; /* Màu nền xám nhạt */
                border-radius: 5px; /* Độ cong viền */
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Đổ bóng nhẹ */
            }

            .chose_area p {
                margin: 10px 0;
                font-size: 16px;
                font-weight: bold;
                color: #333;
            }

            .chose_area p:nth-child(even) {
                font-weight: normal;
                color: #666;
            }
            /* Căn lề phải cho ô chứa tổng giá */
            .cart_total_price {
                text-align: right;
                padding-right: 150px; /* Thêm khoảng cách từ phải nếu cần */
            }

            /* Đảm bảo chữ "Total Price:" nằm cùng dòng với giá tổng và in đậm, màu đen */
            .cart_total_price .total_price_label {
                display: inline; /* Đảm bảo rằng chữ "Total Price:" nằm cùng dòng với giá tổng */
                margin-right: 10px; /* Thêm khoảng cách giữa chữ và giá */
                color: black; /* Màu đen */
                font-weight: bold; /* In đậm */
                font-size: 19px;
            }
            #do_action .total_area{
                margin-left: 200px;
                margin-right: 200px;
                margin-bottom: 20px !important;
            }
            .total_area ul li{
                font-size: 17px;
            }
            #order-heading {
                text-align: center; /* căn giữa nội dung của phần tử */
                margin-bottom: 20px; /* tăng khoảng cách dưới đoạn văn bản */
                font-family: 'Times New Roman', Times, serif;
                font-size: 25px;
                font-weight: bold;
            }
            .continue-shopping-btn {
                display: block; /* Để nút a hiển thị dưới dạng block và chiếm toàn bộ chiều rộng của container */
                width: fit-content; /* Chiều rộng của nút a phù hợp với nội dung bên trong */
                margin: 0 auto; /* Căn giữa theo chiều ngang */
                font-family: 'Times New Roman', Times, serif;
                text-align: center; /* Căn giữa nội dung trong nút a */
                font-size: 20px;
                padding: 10px 20px; /* Điều chỉnh khoảng cách bên trong nút a */
                background-color: #FE980F; /* Màu nền của nút a */
                color: #fff; /* Màu chữ của nút a */
                text-decoration: none; /* Bỏ gạch chân cho đường link */
                border-radius: 5px; /* Bo góc cho nút a */
            }

            .continue-shopping-btn:hover {
                background-color: #0056b3; /* Màu nền khi di chuột vào nút a */
            }

        </style>
    </head><!--/head-->

    <body>
        <jsp:include page="header.jsp"/>

        <section id="cart_items">
            <div class="container">
                <div class="breadcrumbs">
                    <ol class="breadcrumb">
                        <li><a href="${pageContext.request.contextPath}/view/customer/homepage.jsp">Home</a></li>
                        <li class="active">Shopping Cart</li>
                    </ol>
                </div>

                <div class="confirmation-page">
                    <div class="main-title">YOU HAVE SUCCESSFULLY ORDERED</div>
                    <div class="message">
                        Thank you for choosing our products<br>
                        The product will be delivered to you as soon as possible<br>
                        Wishing you a great product experience
                    </div>
                    <div class="signature">From Shop With Love &lt;3</div>
                </div>
                <div class="table-responsive cart_info" style="max-width: 1400px; margin-top: 50px;">
                    <table class="table table-condensed">
                        <thead>
                            <tr class="cart_menu">
                                <td class="image">Item</td>
                                <td class="description">Title</td>
                                <td class="price">Price</td>
                                <td class="quantity">Quantity</td>
                                <td class="total">Total</td>
                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach var="product" items="${listProduct}">
                                <tr>
                                    <td class="cart_product">
                                        <a href="${pageContext.request.contextPath}/ProductDetailPublic?index=1&productId=${product.id}"><img src="<c:url value='/images/${product.image}'/>" alt=""></a>
                                    </td>
                                    <td class="cart_description">
                                        <h4><a href="">${product.title}</a></h4>
                                        <p>ID: ${product.id}</p>
                                        <input type="hidden" name="productId" value="${product.id}">
                                    </td>
                                    <td class="cart_price">
                                        <fmt:formatNumber value="${product.salePrice}" type="number" maxFractionDigits="0" />
                                    </td>
                                    <td class="cart_quantity">
                                        <p> ${product.quantity}</p>
                                    </td>
                                    <td class="cart_total">
                                        <fmt:formatNumber value="${product.salePrice * product.quantity}" type="number" maxFractionDigits="0" />
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="4"></td> <!-- Dùng cột trống để đẩy phần tử sang bên phải -->
                                <td class="cart_total_price">
                                    <p class="total_price_label">Total Price:</p>
                                    <c:set var="totalPrice" value="0" />
                                    <c:forEach var="product" items="${listProduct}">
                                        <c:set var="totalPrice" value="${totalPrice + (product.salePrice * product.quantity)}" />
                                    </c:forEach>
                                    <fmt:formatNumber value="${totalPrice}" type="number" maxFractionDigits="0" />
                                    <input type="hidden" name="totalCost" value="${totalPrice}">
                                </td>
                            </tr>
                        </tfoot>


                    </table>
                </div>
            </div>
        </section> <!--/#cart_items-->

        <section id="do_action">
            <div class="container">
                <div class="heading">
                    <h3 id="order-heading">ORDER INFORMATION</h3>
                </div>
                <div class="col-sm-12">
                    <div class="total_area">
                        <ul>
                            <li>Receiver: <span>${orderInfo.recipient_name}</span></li>
                            <li>Receiver gender: <span>${orderInfo.recipient_gender ? 'Male' : 'Female'}</span></li>
                            <li>Phone: <span>${orderInfo.phone}</span></li>
                            <li>Address: <span>${orderInfo.address}</span></li>
                            <li>Order-date: <span>${orderInfo.orderDate}</span></li>
                            <li>Payment methods: <span>${orderInfo.payment_name}</span></li>
                        </ul>

                    </div>
                    <a href="${pageContext.request.contextPath}/ProductListPublic" class="continue-shopping-btn">Continue Shopping</a>
                </div>

            </div>
        </section>
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
