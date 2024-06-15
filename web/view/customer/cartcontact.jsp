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

    </head><!--/head-->

    <body>
        <jsp:include page="header.jsp"/>

        <section>
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="left-sidebar">
                            <style>
                                body {
                                    font-family: Arial, sans-serif;
                                    background-color: #f0f0f0;
                                }

                                .form-container {
                                    max-width: 800px;
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
                                    padding: 10px 20px;
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

                            <!-- Profile Form -->
                            <form id="profileForm" class="account-info-form" action="${pageContext.request.contextPath}/updateinfuserincart" method="POST" >
                                <div class="form-container">
                                    <h2>Recipient Information</h2>
                                    <div class="form-row">
                                        <div class="form-group">
                                            <label for="name">Name:</label>
                                            <input type="text" id="name" name="name" placeholder="Enter your name" value="${user1.name}">
                                        </div>
                                        <div class="form-group">
                                            <label for="gender">Gender:</label>
                                            <select id="gender" name="gender" required>
                                                <option value="" disabled selected>Select gender</option>
                                                <option value="1" ${user1.gender == 1 ? "selected" : ""}>Male</option>
                                                <option value="0" ${user1.gender == 0 ? "selected" : ""}>Female</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="email">Email:</label>
                                        <input type="email" id="email" name="email" placeholder="Enter your email" value="${user1.email}" readonly>
                                    </div>

                                    <div class="form-group">
                                        <label for="phone">Phone:</label>
                                        <input type="text" id="phone" name="phone" placeholder="Enter your phone number" value="${user1.phone}">
                                    </div>
                                    <div class="form-group">
                                        <label for="address">Address:</label>
                                        <input type="text" id="address" name="address" placeholder="Enter your address" value="${user1.address}">
                                    </div>

                                    <div class="form-group">
                                        <label for="notes">Notes:</label>
                                        <textarea id="notes" name="notes" placeholder="Enter any additional notes"></textarea>
                                    </div>
                                    <p class="error-message">${mess}</p>
                                    <span id="phone-error" class="error-message"></span><br>
                                    <div class="button-container">
                                        <button type="submit" class="styled-button">Edit</button>
                                    </div>
                                </div>
                            </form>
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
                                    <li><a href="${pageContext.request.contextPath}/ProductListPublic">Back to Product List</a></li>
                                    <li class="active">Cart Detail</li>
                                </ol>
                            </div>




                            <form action="${pageContext.request.contextPath}/pushToCartCompletion" method="POST">
                                <div class="table-responsive cart_info" style="max-width: 1400px; margin: auto;">
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

                                            .cart_description, .cart_price, .cart_quantity, .cart_total, .cart_delete {
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
<!--                                                    <td class="cart_delete">
                                                        <a class="cart_quantity_delete" href="${pageContext.request.contextPath}/deleteCart?productID=${product.id}"><i class="fa fa-times"></i></a>
                                                    </td>-->
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

                                <div class="button-container">
                                    <a href="${pageContext.request.contextPath}/viewCartDetail" class="styled-button">Change</a>
                                    <input type="submit" value="Submit" class="styled-button">
                                </div>
                            </form>

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
