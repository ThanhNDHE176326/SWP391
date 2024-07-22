<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Forget Password | BookHaven</title>
        <link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
        <link href="<c:url value='/css/font-awesome.min.css'/>" rel="stylesheet">
        <link href="<c:url value='/css/prettyPhoto.css'/>" rel="stylesheet">
        <link href="<c:url value='/css/price-range.css'/>" rel="stylesheet">
        <link href="<c:url value='/css/animate.css'/>" rel="stylesheet">
        <link href="<c:url value='/css/main.css'/>" rel="stylesheet">
        <link href="<c:url value='/css/responsive.css'/>" rel="stylesheet">

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

            .form-group {
                margin-bottom: 20px;
            }

            .form-group label {
                margin-bottom: 5px;
                color: #333;
            }

            .form-group input[type="email"],
            .form-group input[type="text"] {
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                width: 100%;
                box-sizing: border-box;
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
                display: block;
                width: 100%;
                margin-top: 10px;
            }

            .btn-default {
                background-color: #6c757d;
            }

            .btn-default:hover {
                background-color: #5a6268;
            }

            .error-message {
                color: #dc3545;
                font-style: italic;
                margin-top: 5px;
            }
        </style>
    </head>

    <body>
        <jsp:include page="header.jsp"/>

        <div class="account-info-container">
            <h2>Forget Password</h2>
            <form id="forgetPasswordForm" action="${pageContext.request.contextPath}/forgetpassword" method="POST">
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" name="username" id="username" placeholder="Username" required>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" name="email" id="email" placeholder="Email" required>
                </div>
                <p class="error-message">${error}</p>
                <button type="submit" class="btn btn-default" style="background-color: #FE980F;">Submit</button>
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
</html>
