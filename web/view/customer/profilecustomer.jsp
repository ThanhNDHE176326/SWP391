<%-- 
    Document   : profile
    Created on : 21 May 2024, 9:51:32 pm
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
        <title>Profile | E-Shopper</title>
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

        <div class="account-info-container">
            <h2>THÔNG TIN TÀI KHOẢN</h2>
            <form id="profileForm" class="account-info-form" action="${pageContext.request.contextPath}/updateuser" method="POST">
               
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" placeholder="Username" value="${user.username}" readonly="readonly">
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" placeholder="Email" value="${user.email}" readonly="readonly">
                </div>
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" placeholder="Name" value="${user.name}">
                </div>
                <div class="form-group">
                    <label for="address">Address:</label>
                    <input type="text" id="address" name="address" placeholder="Address" value="${user.address}">
                </div>
                <div class="form-group">
                    <label for="phone">Phone:</label>
                    <input type="text" id="phone" name="phone" placeholder="Phone" value="${user.phone}">
                </div>
                <div class="form-group">
                    <label for="gender">Gender:</label>
                    <select id="gender" name="gender" required>
                        <option value="" disabled selected>Gender</option>
                        <option value="1" ${user.gender == 1 ? "selected" : ""}>Male</option>
                        <option value="0" ${user.gender == 0 ? "selected" : ""}>Female</option>
                    </select>
                </div>
                <!-- Thêm phần hiển thị thông báo lỗi -->
                <p style="color: red; font-style: italic;">${message}</p>
                <span id="phone-error" style="color: red; font-style: italic;"></span><br>
                <div class="row">
                    <button type="submit" class="btn btn-default btn-block" style="background-color: #FE980F; color: #fff;">Edit Profile</button>
                    <a href="${pageContext.request.contextPath}/view/customer/homepage.jsp" class="btn btn-default btn-block">Back to Home</a>
                </div>
            </form>
        </div>


        <jsp:include page="footer.jsp"/>

        <script src="<c:url value='/js/jquery.js'/>"></script>
        <script src="<c:url value='/js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/js/jquery.scrollUp.min.js'/>"></script>
        <script src="<c:url value='/js/price-range.js'/>"></script>
        <script src="<c:url value='/js/jquery.prettyPhoto.js'/>"></script>
        <script src="<c:url value='/js/main.js'/>"></script>
 
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
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
        margin: 0;
        padding: 0;
    }

    .account-info-container {
        width: 100%;
        max-width: 600px;
        margin: 50px auto;
        padding: 20px;
        background-color: #fff;
        border: 1px solid #e5e5e5;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    .account-info-container h2 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }

    .account-info-form {
        display: flex;
        flex-direction: column;
    }

    .form-group {
        display: flex;
        flex-direction: column;
        margin-bottom: 15px;
    }

    .form-group label {
        margin-bottom: 5px;
        color: #333;
    }

    .form-group input[type="text"],
    .form-group input[type="email"],
    .form-group select {
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    .form-group input[type="text"]:read-only,
    .form-group input[type="email"]:read-only {
        background-color: #e9e9e9;
    }

    .change-link {
        color: #007bff;
        text-decoration: none;
        margin-top: 5px;
    }

    .change-link:hover {
        text-decoration: underline;
    }

    .save-button {
        padding: 10px 20px;
        background-color: #dc3545;
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        align-self: center;
    }

    .save-button:hover {
        background-color: #c82333;
    }

    .row {
        display: flex;
        justify-content: space-between;
    }

    .btn {
        padding: 10px 20px;
        background-color: #007bff;
        color: #fff;
        text-align: center;
        text-decoration: none;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        flex: 1;
        margin: 5px;
    }

    .btn-block {
        display: block;
        width: 100%;
    }

    .btn-default {
        background-color: #6c757d;
    }

    .btn-default:hover {
        background-color: #5a6268;
    }
</style>