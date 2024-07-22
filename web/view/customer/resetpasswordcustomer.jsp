<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Reset Password | BookHaven</title>
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

            .form-group input[type="password"] {
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
            <h2>Reset Password</h2>
            <form id="resetPasswordForm" action="${pageContext.request.contextPath}/resetpassword" method="POST">
                <div class="form-group">
                    <label for="newPassword">New Password:</label>
                    <input type="password" name="newPassword" id="newpassword" placeholder="New Password" required>
                    <p id="newpassword-error" class="error-message"></p>
                </div>
                <div class="form-group">
                    <label for="confirmPassword">Confirm Password:</label>
                    <input type="password" name="confirmPassword" id="confirmpassword" placeholder="Confirm Password" required>
                    <p id="confirmpassword-error" class="error-message"></p>
                </div>
                <p id="error" class="error-message">${error}</p>
                <button type="submit" class="btn btn-default" style="background-color: #FE980F;">Submit</button>
            </form>
        </div>

        <jsp:include page="footer.jsp"/>

        <script>
            window.onload = function () {
                document.getElementById("resetPasswordForm").addEventListener("submit", function (event) {
                    var newPassword = document.getElementById("newpassword").value;
                    var confirmPassword = document.getElementById("confirmpassword").value;
                    var newPasswordError = document.getElementById("newpassword-error");
                    var passwordMatchError = document.getElementById("confirmpassword-error");
                    var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$/;
                    newPasswordError.innerText = "";
                    passwordMatchError.innerText = "";

                    var isValid = true;

                    // Validate new password format
                    if (!passwordRegex.test(newPassword)) {
                        newPasswordError.innerText = "New password must be at least 6 characters long and contain at least one lowercase letter, one uppercase letter, and one number.";
                        isValid = false;
                    }

                    // Validate password match
                    if (newPassword !== confirmPassword) {
                        passwordMatchError.innerText = "Passwords do not match.";
                        isValid = false;
                    }

                    if (!isValid) {
                        event.preventDefault(); // Prevent form submission
                    }
                });
            };
        </script>
        <jsp:include page="footer.jsp"/>
        <script src="<c:url value='/js/jquery.js'/>"></script>
        <script src="<c:url value='/js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/js/jquery.scrollUp.min.js'/>"></script>
        <script src="<c:url value='/js/price-range.js'/>"></script>
        <script src="<c:url value='/js/jquery.prettyPhoto.js'/>"></script>
        <script src="<c:url value='/js/main.js'/>"></script>

    </body>
</html>
