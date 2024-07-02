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
        <title>Cart Contact | E-Shopper</title>
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
                width: 170px !important; /* Chiều rộng của ảnh */
                height: 100px !important; /* Giữ nguyên tỷ lệ khung hình */
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
                font-size: 17px; /* Set your desired font size here */
                padding: 10px; /* Consistent padding for all cells */
                box-sizing: border-box; /* Ensure padding is included in width calculation */
            }

            .cart_description h4 a {
                font-size: 17px !important;
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
                font-size: 16px;
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

            .button-containerner {
                text-align: center;
                margin-top: 20px;
                margin-bottom: 20px;
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
            /* Tùy chỉnh nút tích màu xanh nếu cần */
            .btn-success {
                background-color: #28a745; /* Màu xanh mặc định của Bootstrap */
                border-color: #28a745;
            }

            .btn-success:hover {
                background-color: #218838; /* Màu xanh khi hover */
                border-color: #1e7e34;
            }

        </style>
    </head><!--/head-->

    <body>
        <jsp:include page="header.jsp"/>
        <section>
            <form action="${pageContext.request.contextPath}/cartCompletion" method="POST">
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
                                        <li><a href="${pageContext.request.contextPath}/viewCartDetail">Back</a></li>
                                        <li class="active">Cart Contact</li>
                                    </ol>
                                </div>
                                <div class="order-info">
                                    <h2>Delivery Address</h2>
                                    <div class="order-details">
                                        <p class="name">${userCreateOrder.name}</p>
                                        <input type="hidden" name="name" value="${userCreateOrder.name}">
                                        <p class="phone">(+84) ${userCreateOrder.phone}</p>
                                        <input type="hidden" name="phone" value="${userCreateOrder.phone}">
                                        <p class="address">${userCreateOrder.address}</p>
                                        <input type="hidden" name="address" value="${userCreateOrder.address}">
                                        <p class="gender">${userCreateOrder.gender == 1 ? 'Male' : 'Female'}</p>
                                        <input type="hidden" name="gender" value="${userCreateOrder.gender == 1 ? 'Male' : 'Female'}">
                                        <span class="default-tag">Default</span>
                                        <button type="button" class="styled-button" onclick="showAddressModal()">Change</button>
                                    </div>
                                </div>
                                <!-- Thêm phần tử new-address để hiển thị thông tin địa chỉ mới -->
                                <div class="new-address">
                                    <h2>Địa Chỉ Nhận Hàng</h2>
                                    <div class="order-details">
                                        <p class="name" id="newNameDisplay"></p>
                                        <input type="hidden" class="name" name="newName" id="newName">
                                        <p class="phone" id="newPhoneDisplay"></p>
                                        <input type="hidden" class="phone" name="newPhone" id="newPhone">
                                        <p class="address" id="newAddressDisplay"></p>
                                        <input type="hidden" class="address" name="newAddress" id="newAddress">
                                        <p class="gender" id="newGenderDisplay"></p>
                                        <input type="hidden" class="gender" name="newGender" id="newGender">
                                        <button type="button" class="styled-button" onclick="showAddressModal()">Change</button>
                                    </div>
                                </div>
                                <!-- The Modal -->
                                <div id="addressModal" class="modal" tabindex="-1" role="dialog">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <button type="button" class="back-button" onclick="redirectToCartContact()">Cancel</button>
                                            <h4>Thay Đổi Địa Chỉ Nhận Hàng</h4>
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>Select</th>
                                                        <th>Address</th>
                                                        <th>Phone</th>
                                                        <th>Receiver</th>
                                                        <th>Gender</th>
                                                        <th>Delete</th>
                                                        <th>Default settings</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="shippingaddress" items="${shippingaddress}">
                                                        <tr>
                                                            <td style="text-align: center; vertical-align: middle;">
                                                                <input type="radio" name="selectedAddress" value="${shippingaddress.id}" 
                                                                       data-address="${shippingaddress.address}"
                                                                       data-phone="${shippingaddress.phone}"
                                                                       data-name="${shippingaddress.recipient_name}"
                                                                       data-gender="${shippingaddress.recipient_gender == 1 ? 'Male' : 'Female'}">
                                                            </td>
                                                            <td>${shippingaddress.address}</td>
                                                            <td>${shippingaddress.phone}</td>
                                                            <td>${shippingaddress.recipient_name}</td>
                                                            <td>${shippingaddress.recipient_gender == 1 ? 'Male' : 'Female'}</td>
                                                            <td>
                                                                <a class="btn btn-danger btn-sm" href="${pageContext.request.contextPath}/deleteDeliveryAddress?id=${shippingaddress.id}">
                                                                    <i class="fa fa-times"></i>
                                                                </a>
                                                            </td>
                                                            <td>
                                                                <a class="btn btn-success btn-sm" href="${pageContext.request.contextPath}/updateAddressDefault?id=${shippingaddress.id}&name=${shippingaddress.recipient_name}&gender=${shippingaddress.recipient_gender}
                                                                   &phone=${shippingaddress.phone}&address=${shippingaddress.address}&nameDF=${userCreateOrder.name}&phoneDF=${userCreateOrder.phone}&genderDF=${userCreateOrder.gender}&addressDF=${userCreateOrder.address}">
                                                                    <i class="fa fa-check"></i>
                                                                </a>
                                                            </td>

                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                            <div class="button-container">
                                                <button type="button" class="styled-button" onclick="confirmChange()">Confirm</button>
                                                <button type="button" class="styled-button" onclick="showNewAddressModal()">Add New Address</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- The Add New Address Modal -->
                                <div id="newAddressModal" class="modal" tabindex="-1" role="dialog">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <button type="button" class="back-button" onclick="closeNewAddressModal()">Back</button>
                                            <h4>Add New Address</h4>
                                            <div id="address-options">
                                                <form id="profileForm" class="account-info-form" action="${pageContext.request.contextPath}/addDeliveryAddress" method="POST">
                                                    <div class="form-container">
                                                        <div class="form-row">
                                                            <div class="form-group">
                                                                <label for="name">Name:</label>
                                                                <input type="text" id="name" name="name" placeholder="Enter your name" value="">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="gender">Gender:</label>
                                                                <select id="gender" name="gender" required>
                                                                    <option value="1">Male</option>
                                                                    <option value="0">Female</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="phone">Phone:</label>
                                                            <input type="text" id="phone" name="phone" placeholder="Enter your phone number" value="">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="address">Address:</label>
                                                            <input type="text" id="address" name="address" placeholder="Enter your address" value="">
                                                        </div>
                                                        <div class="button-container">
                                                            <button type="submit" class="styled-button">Submit</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
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
                                            <c:forEach var="product" items="${selectedProducts}">
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
                                                <td colspan="4"></td>
                                                <td class="cart_total_price">
                                                    <p class="total_price_label">Total Price:</p>
                                                    <c:set var="totalPrice" value="0" />
                                                    <c:forEach var="product" items="${selectedProducts}">
                                                        <c:set var="totalPrice" value="${totalPrice + (product.salePrice * product.quantity)}" />
                                                    </c:forEach>
                                                    <fmt:formatNumber value="${totalPrice}" type="number" maxFractionDigits="0" />
                                                    <input type="hidden" name="totalCost" value="${totalPrice}">
                                                    <input type="hidden" id="totalCost" value="${totalPrice}">
                                                </td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                                <p class="error-message">${mess}</p>
                                <span id="phone-error" class="error-message"></span><br>

                                <!-- Payment Methods Section -->
                                <div id="payment_methods">
                                    <h2>Payments Method</h2>
                                    <div class="payment-options">
                                        <div class="payment-option">
                                            <input type="radio" id="payment_gateway" name="paymentMethod" value="3">
                                            <label for="payment_gateway"> 
                                                <!--<img src="<c:url value='/images/VnPay.jpg'/>" alt="VNPay">-->
                                                <div class="name-pay">
                                                    Thẻ ATM / Internet Banking<br>
                                                    Thẻ tín dụng (Credit card) <br> 
                                                    Thẻ ghi nợ (Debit card)<br>
                                                    VNPay QR
                                                </div>
                                            </label>
                                        </div>
                                        <div class="payment-option">
                                            <input type="radio" name="paymentMethod" value="2">
                                            <div class="name-pay">
                                                QR Code<br>
                                                Pay by QR Code transfer
                                            </div>
                                        </div>
                                        <div class="payment-option">
                                            <input type="radio" id="cod" name="paymentMethod" value="1">
                                            <label for="cod">
                                                <!--<img src="<c:url value='/images/COD.jpg'/>" alt="COD">-->
                                                <div class="name-pay">
                                                    COD<br>
                                                    Payment on delivery
                                                </div>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <!-- End of Payment Methods Section -->
                                <div class="button-containerner">
                                    <button type="submit" class="styled-button" onclick="validatePaymentMethod(event)" >Checkout</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </section>

        <script>
            function validatePaymentMethod(event) {
                // Retrieve the total cost and payment methods
                var totalCost = parseInt(document.getElementById("totalCost").value, 10);
                var paymentMethods = document.getElementsByName("paymentMethod");
                var selectedMethod = null;

                // Log the total cost for debugging
                console.log("Total Cost:", totalCost);

                // Check which payment method is selected
                for (var i = 0; i < paymentMethods.length; i++) {
                    if (paymentMethods[i].checked) {
                        selectedMethod = paymentMethods[i].value;
                        break;
                    }
                }

                // Log the selected payment method for debugging
                console.log("Selected Payment Method:", selectedMethod);

                // Validate the payment method based on the total cost
                if (totalCost > 1000000 && selectedMethod != 3 && selectedMethod != 2) {
                    alert("For orders over 1,000,000, please use VN Pay or QR Code.");
                    event.preventDefault(); // Prevent form submission
                    return false;
                }

                return true;
            }

            document.addEventListener('DOMContentLoaded', function () {
                var checkoutButton = document.querySelector('.button-containerner button[type="submit"]');
                checkoutButton.addEventListener('click', validatePaymentMethod);
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
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
    <script>

            window.onload = function () {
                document.getElementById("profileForm").addEventListener("submit", function (event) {
                    var phone = document.getElementsByName("phone")[0].value;
                    var phoneRegex = /^\+?\d{10,}$/;

                    var phoneError = document.getElementById("phone-error");

                    // Clear previous error message
                    phoneError.innerText = "";

                    var isValid = true;

                    if (!phoneRegex.test(phone)) {
                        phoneError.innerText = "Please enter a valid phone number.";
                        isValid = false;
                    }

                    if (!isValid) {
                        event.preventDefault(); // Prevent form submission
                    }
                });
            };
            function showAddressOptions() {
                var addressOptions = document.getElementById('address-options');
                if (addressOptions.style.display === 'none' || addressOptions.style.display === '') {
                    addressOptions.style.display = 'block';
                } else {
                    addressOptions.style.display = 'none';
                }
            }

            function updateAddressFields(address) {
                document.getElementById('name').value = address.name;
                document.getElementById('gender').value = address.gender;
                document.getElementById('phone').value = address.phone;
                document.getElementById('address').value = address.address;
            }

            function handleCheckboxChange(event) {
                if (event.target.checked) {
                    const addressData = JSON.parse(event.target.getAttribute('data-address'));
                    updateAddressFields(addressData);
                }
            }
            // Ẩn new-address khi tải trang
            document.addEventListener("DOMContentLoaded", function () {
                document.querySelector('.new-address').style.display = 'none';
            });
            function showSelectedAddress(name, phone, address, gender) {
                document.getElementById('newNameDisplay').textContent = name;
                document.getElementById('newPhoneDisplay').textContent = "(+84) " + phone;
                document.getElementById('newAddressDisplay').textContent = address;
                document.getElementById('newGenderDisplay').textContent = (gender == 1 ? 'Male' : 'Female');

                document.getElementById('newName').value = name;
                document.getElementById('newPhone').value = phone;
                document.getElementById('newAddress').value = address;
                document.getElementById('newGender').value = gender;

                // Hiển thị phần tử new-address khi có dữ liệu
                document.querySelector('.new-address').style.display = 'block';
            }

            function showAddressModal() {
                document.getElementById("addressModal").style.display = "block";
            }

            function closeAddressModal() {
                document.getElementById("addressModal").style.display = "none";
            }

            function showNewAddressModal() {
                document.getElementById("newAddressModal").style.display = "block";
            }

            function closeNewAddressModal() {
                document.getElementById("newAddressModal").style.display = "none";
            }

            function redirectToCartContact() {
                // Chuyển hướng đến /pushToCartContact
                window.location.href = "${pageContext.request.contextPath}/pushToCartContact";
            }
            function confirmChange() {
                // Lấy giá trị từ form chọn địa chỉ
                var selectedAddressId = document.querySelector('input[name="selectedAddress"]:checked');

                if (!selectedAddressId) {
                    alert('Vui lòng chọn địa chỉ nhận hàng');
                    return;
                }

                // Lấy thông tin của địa chỉ được chọn
                var row = selectedAddressId.closest('tr');
                var name = row.querySelector('td:nth-child(4)').textContent;
                var phone = row.querySelector('td:nth-child(3)').textContent;
                var address = row.querySelector('td:nth-child(2)').textContent;
                var genderText = row.querySelector('td:nth-child(5)').textContent;
                var gender = (genderText === 'Male') ? 1 : 0;
                showSelectedAddress(name, phone, address, gender);

                // Hiển thị phần tử new-address
                document.querySelector('.new-address').style.display = 'block';

                // Ẩn phần tử order-info
                document.querySelector('.order-info').style.display = 'none';

                // Đóng modal thêm địa chỉ mới
                closeNewAddressModal();
                closeAddressModal();
            }

            // Close the modal when clicking outside of it
            window.onclick = function (event) {
                if (event.target == document.getElementById("addressModal")) {
                    closeAddressModal();
                }
                if (event.target == document.getElementById("newAddressModal")) {
                    closeNewAddressModal();
                }
            }
    </script>
</html>
