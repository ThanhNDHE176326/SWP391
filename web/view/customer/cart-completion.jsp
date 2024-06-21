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
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f0f0;
            }

            .form-container {
                max-width: 900px;
                margin: 20px auto;
                padding: 20px;
                background-color: #ffffff;
                border: 1px solid #ddd;
                border-radius: 10px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .form-group {
                margin-bottom: 15px;
            }

            .form-group label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
            }

            .form-group input[type="text"],
            .form-group input[type="email"],
            .form-group select,
            .form-group textarea {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
                font-size: 14px;
            }

            .form-row {
                display: flex;
                gap: 20px;
            }

            .form-row .form-group {
                flex: 1;
            }

            .button-container {
                text-align: center;
                margin-top: 20px;
            }

            .styled-button {
                display: inline-block;
                padding: 5px 5px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 5px;
                text-decoration: none;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .styled-button:hover {
                background-color: #0056b3;
            }

            .styled-button:focus {
                outline: none;
            }

            .styled-button:disabled {
                background-color: #ccc;
                cursor: not-allowed;
            }

            .error-message {
                color: red;
                font-style: italic;
                margin-top: 5px;
            }
            .order-info {
                font-family: Arial, sans-serif;
            }

            .order-info h2 {
                font-size: 20px;
                color: #ff6600; /* Màu nổi bật */
                margin-bottom: 10px;
                display: flex;
                align-items: center;
            }

            .order-info h2::before {
                content: '\1F4CD'; /* Biểu tượng pin */
                margin-right: 5px;
            }

            .order-details {
                display: flex;
                align-items: center;
                font-size: 17px;
                flex-wrap: wrap;
            }

            .order-details > * {
                margin-right: 10px;
                display: flex;
                align-items: center;
            }

            .order-details .name,
            .order-details .phone {
                font-weight: bold;
            }

            .order-details .name,
            .order-details .phone,
            .order-details .address,
            .order-details .gender {
                margin: 0 20px 0 0;
                padding: 0;
            }

            .order-details .default-tag {
                display: inline-block;
                padding: 2px 6px;
                border: 1px solid #ff6600;
                color: #ff6600;
                font-size: 12px;
            }

            .order-details .change-button {
                color: #1a73e8;
                text-decoration: none;
                font-size: 14px;
            }

            .order-details .change-button:hover {
                text-decoration: underline;
            }
            .styled-button {
                background-color: #007bff;
                color: white;
                border: none;
                padding: 10px 20px;
                cursor: pointer;
            }
            .styled-button:hover {
                background-color: #0056b3;
            }
            .modal-content {
                padding: 200px;
            }
            .modal-content h4 {
                margin-bottom: 20px;
            }
            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }
            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
            .styled-button {
                background-color: #007bff;
                color: white;
                border: none;
                padding: 3px 6px;
                cursor: pointer;
            }
            .styled-button:hover {
                background-color: #0056b3;
            }
            .modal-content {
                padding: 20px;
            }
            .modal-content h4 {
                margin-bottom: 20px;
            }
            .back-button {
                background-color: #6c757d;
                color: white;
                border: none;
                padding: 3px 6px;
                cursor: pointer;
                float: right;
            }
            .back-button:hover {
                background-color: #5a6268;
            }
            .button-container {
                display: flex;
                justify-content: space-between;
            }
            .new-address {
                font-family: Arial, sans-serif;
            }

            .new-address h2 {
                font-size: 20px;
                color: #ff6600; /* Màu nổi bật */
                margin-bottom: 10px;
                display: flex;
                align-items: center;
            }

            .new-address h2::before {
                content: '\1F4CD'; /* Biểu tượng pin */
                margin-right: 5px;
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

            .cart_menu td.price,
            .cart_menu td.quantity,
            .cart_menu td.total,
            .cart_menu td.delete {
                width: 10%; /* Width for each of these cells */
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
                font-size: 16px; /* Set your desired font size here */
                padding: 10px; /* Consistent padding for all cells */
                box-sizing: border-box; /* Ensure padding is included in width calculation */
            }

            .cart_description h4 a {
                font-size: 15px !important;
            }
            /* Payment Methods Section Styles */
            #payment_methods {
                margin-top: 0px;
                border: 1px solid #ccc;
                border-radius: 8px;
                padding: 20px;
                background-color: #f9f9f9;
            }

            #payment_methods h2 {
                font-size: 24px;
                margin-bottom: 50px;
            }

            .payment-options {
                display: flex;
                flex-direction: column;
                margin-bottom: 25px !important;
            }

            .payment-option {
                display: flex;
                align-items: center;
                margin-bottom: 5px;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
                background-color: #f9f9f9;
            }

            .payment-option input[type="radio"] {
                margin-right: 10px;
            }

            .payment-option label {
                display: flex;
                align-items: center;
                cursor: pointer;
            }

            .payment-option img {
                margin-right: 10px;
                margin-right: 100px;
                margin-left: 50px;
                width: 200px;
            }

            .button-container {
                text-align: center;
                margin-top: 20px;
            }
            .name-pay {
                background-color: lightblue; /* Màu nền */
                padding: 10px; /* Khoảng cách giữa nội dung và viền của div */
                border: 1px solid #ccc; /* Viền */
                width: 400px; /* Độ rộng của div */
                font-family: Arial, sans-serif; /* Font chữ */
                text-align: center; /* Căn giữa nội dung */
                font-size: 17px;
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

        </style>
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

                <div class="confirmation-page">
                    <div class="main-title">BẠN ĐÃ ĐẶT HÀNG THÀNH CÔNG</div>
                    <div class="message">
                        Cảm ơn bạn đã lựa chọn sản phẩm của chúng tôi<br>
                        Sản phẩm sẽ được chuyển đến bạn trong thời gian sớm nhất<br>
                        Chúc bạn có trải nghiệm sản phẩm tuyệt vời
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
                                        <a href=""><img src="<c:url value='/images/${product.image}'/>" alt=""></a>
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
                                        <div class="cart_quantity_button">
                                            <input class="cart_quantity_input" type="text" name="quantity" value="${product.quantity}" readonly>
                                        </div>
                                    </td>
                                    <td class="cart_total">
                                        <fmt:formatNumber value="${product.salePrice * product.quantity}" type="number" maxFractionDigits="0" />
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="4" class="text-right">Total Price:</td>
                                <td class="cart_total_price">
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
                    <h3>Order information</h3>
                </div>
                <div class="col-sm-6">
                    <div class="total_area">
                        <ul>
                            <li>Receiver: <span>${orderInfo.recipient_name}</span></li>
                            <li>Receiver gender:<span>${orderInfo.recipient_gender}</span></li>
                            <li>Phone: <span>${orderInfo.phone}</span></li>
                            <li>Address: <span>${orderInfo.address}</span></li>
                            <li>Order-date: <span>${orderInfo.orderDate}</span></li>
                            <li>Payment methods: <span>${orderInfo.payment_name}</span></li>
                        </ul>

                    </div>
                </div>
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
