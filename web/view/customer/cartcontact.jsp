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

    </head><!--/head-->

    <body>
        <jsp:include page="header.jsp"/>

        <section>
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="left-sidebar">

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
                            </style>
                            </head>


                            <script>
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

                            </script>
                            <jsp:include page="leftsidebar.jsp"/>  

                        </div>
                    </div>


                    <div class="col-sm-9 padding-right">

                        <div id="cart_items">
                            <div class="breadcrumbs">
                                <ol class="breadcrumb">
                                    <li><a href="${pageContext.request.contextPath}/ProductListPublic">Back to Product List</a></li>
                                    <li class="active">Cart Contact</li>
                                </ol>
                            </div>
                            <div class="">
                                <button type="button" class="styled-button" onclick="showAddressOptions()">Add New Address</button>
                            </div>
                            <div id="address-options" style="display: none;">
                                <form id="profileForm" class="account-info-form" action="${pageContext.request.contextPath}/addDeliveryAddress"
                                      method="POST">
                                    <div class="form-container">
                                        <div class="form-row">
                                            <div class="form-group">
                                                <label for="name">Name:</label>
                                                <input type="text" id="name" name="name" placeholder="Enter your name" value="">
                                            </div>
                                            <div class="form-group">
                                                <label for="gender">Gender:</label>
                                                <select id="gender" name="gender" required>
                                                    <option value="1" >Male</option>
                                                    <option value="0" >Female</option>
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
                                </form>
                            </div>
                        </div>
                        <form id="cartForm" action="${pageContext.request.contextPath}/pushToCartCompletion" method="POST">
                            <div class="table-responsive cart_info" style="max-width: 1400px; margin: auto;">
                                <table class="table table-condensed">
                                    <thead>
                                        <tr class="cart_menu">
                                            <td class="select" style="width: 15%;">Select</td>
                                            <td class="address" style="width: 30%;">Delivery Address</td>
                                            <td class="phone" style="width: 20%;">Phone</td>
                                            <td class="name" style="width: 20%;">Name</td>
                                            <td class="gender" style="width: 20%;">Gender</td>
                                            <td class="delete" style="width: 15%;">Delete</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="cart_select" style="text-align: center; vertical-align: middle;">
                                                <input type="radio" name="selectedProducts" value="${user1.id}" class="product-checkbox" style="margin: 0; transform: scale(1.2); accent-color: #007bff;">
                                            </td>
                                            <td class="cart_description">
                                                <p>${user1.address}</p>
                                            </td>
                                            <td class="cart_quantity">
                                                <p>${user1.phone}</p>
                                            </td>
                                            <td class="cart_name">
                                                <p>${user1.name}</p>
                                            </td>
                                            <td class="cart_gender">
                                                <p>${user1.gender == 1 ? 'Male' : 'Female'}</p>
                                            </td>
                                            <td class="cart_delete">
                                                <a class="cart_quantity_delete" href="javascript:void(0);"><i class=""></i></a>
                                            </td>
                                        </tr>
                                        <c:forEach var="shippingaddress" items="${shippingaddress}">
                                            <tr>
                                                <td class="cart_select" style="text-align: center; vertical-align: middle;">
                                                    <input type="radio" name="selectedProducts" value="${shippingaddress.id}" data-price="${product.salePrice}" data-quantity="${product.quantity}" class="product-checkbox" style="margin: 0; transform: scale(1.2); accent-color: #007bff;">
                                                </td>
                                                <td class="cart_description">
                                                    <p>${shippingaddress.address}</p>
                                                </td>
                                                <td class="cart_quantity">
                                                    <p>${shippingaddress.phone}</p>
                                                </td>
                                                <td class="cart_name">
                                                    <p>${shippingaddress.recipient_name}</p>
                                                </td>
                                                <td class="cart_gender">
                                                    <p>${shippingaddress.recipient_gender == 1 ? 'Male' : 'Female'}</p>
                                                </td>
                                                <td class="cart_delete">
                                                    <a class="cart_quantity_delete" href="${pageContext.request.contextPath}/deleteDeliveryAddress?id=${shippingaddress.id}"><i class="fa fa-times"></i></a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>

                                </table>
                                <!-- Thêm input ẩn để lưu giá trị của radio button đã chọn -->
                                <input type="hidden" id="selectedAddressId" name="selectedAddressId" value="">
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
                                            <!--<td class="delete">Delete</td>-->
                                        </tr>
                                    </thead>
                                    <style>
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
                                    </style>
                                    <tbody>
                                        <c:forEach var="product" items="${selectedProducts}">
                                            <tr>
                                                <td class="cart_product">
                                                    <a href=""><img src="<c:url value='/images/${product.image}'/>" alt=""></a>
                                                </td>
                                                <td class="cart_description">
                                                    <h4><a href="">${product.title}</a></h4>
                                                    <p>ID: ${product.id}</p>
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
                                                <c:forEach var="product" items="${selectedProducts}">
                                                    <c:set var="totalPrice" value="${totalPrice + (product.salePrice * product.quantity)}" />
                                                </c:forEach>
                                                <fmt:formatNumber value="${totalPrice}" type="number" maxFractionDigits="0" />
                                            </td>
                                        </tr>
                                    </tfoot>
                                </table>

                            </div>

                            <p class="error-message">${mess}</p>
                            <span id="phone-error" class="error-message"></span><br>

                            </div>
                        </form>

                        <div class="button-container">
                            <button type="button" class="styled-button" onclick="submitForm()">Submit</button>
                        </div>

                        <script>
                            function submitForm() {
                                const selectedRadio = document.querySelector('input[name="selectedProducts"]:checked');
                                if (selectedRadio) {
                                    document.getElementById('selectedAddressId').value = selectedRadio.value;
                                    document.getElementById('cartForm').submit(); // Gửi form khi đã cập nhật giá trị
                                } else {
                                    alert('Please select a delivery address.'); // Thông báo nếu chưa chọn địa chỉ giao hàng
                                }
                            }
                        </script>





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
</script>
</html>
