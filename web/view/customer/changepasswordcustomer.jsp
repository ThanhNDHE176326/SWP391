<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Change Password | E-Shopper</title>
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

            .form-group input[type="password"],
            .form-group input[type="email"],
            .form-group input[type="text"],
            .form-group select {
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                width: 100%;
                box-sizing: border-box;
            }

            .form-group input[type="password"]:read-only,
            .form-group input[type="email"]:read-only,
            .form-group input[type="text"]:read-only {
                background-color: #e9e9e9;
            }

            .form-group.error {
                margin-bottom: 5px;
            }

            .form-group.error input {
                border-color: #dc3545;
            }

            .error-message {
                color: #dc3545;
                font-style: italic;
                margin-top: 5px;
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
    </head>

    <body>
        <jsp:include page="header.jsp"/>

        <div class="account-info-container">
            <h2>Change Your Password</h2>
            <form id="changePasswordForm" action="${pageContext.request.contextPath}/changepassword" method="POST">
                <div class="form-group">
                    <label for="oldpassword">Old Password:</label>
                    <input type="password" name="oldpassword" id="oldpassword" placeholder="Old Password" required>
                </div>
                <div class="form-group">
                    <label for="newpassword">New Password:</label>
                    <input type="password" name="newpassword" id="newpassword" placeholder="New Password" required>
                    <span id="newpassword-error" class="error-message"></span>
                </div>
                <div class="form-group">
                    <label for="confirmpassword">Confirm New Password:</label>
                    <input type="password" name="confirmpassword" id="confirmpassword" placeholder="Confirm New Password" required>
                    <span id="confirmpassword-error" class="error-message"></span>
                </div>
                <p class="error-message">${error}</p>
                <div class="row">
                    <button type="submit" class="btn btn-default btn-block" style="background-color: #FE980F; color: #fff;">Change Password</button>
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

        <script>
            window.onload = function () {
                var newPasswordInput = document.getElementById("newpassword");
                var confirmPasswordInput = document.getElementById("confirmpassword");
                var newPasswordError = document.getElementById("newpassword-error");
                var confirmPasswordError = document.getElementById("confirmpassword-error");
                var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d!@#$%^&*]{6,}$/;

                // Kiểm tra định dạng mật khẩu mới ngay khi người dùng nhập liệu
                newPasswordInput.addEventListener("input", function () {
                    newPasswordError.innerText = "";
                    if (!passwordRegex.test(newPasswordInput.value)) {
                        newPasswordError.innerText = "New password must be at least 6 characters long and contain at least one lowercase letter, one uppercase letter, and one number.";
                    }
                });

                // Kiểm tra khớp mật khẩu xác nhận ngay khi người dùng nhập liệu
                confirmPasswordInput.addEventListener("input", function () {
                    confirmPasswordError.innerText = "";
                    if (newPasswordInput.value !== confirmPasswordInput.value) {
                        confirmPasswordError.innerText = "Passwords do not match.";
                    }
                });

                // Kiểm tra trước khi gửi biểu mẫu
                document.getElementById("changePasswordForm").addEventListener("submit", function (event) {
                    var newPassword = newPasswordInput.value;
                    var confirmPassword = confirmPasswordInput.value;
                    var isValid = true;

                    newPasswordError.innerText = "";
                    confirmPasswordError.innerText = "";

                    // Kiểm tra định dạng mật khẩu mới
                    if (!passwordRegex.test(newPassword)) {
                        newPasswordError.innerText = "New password must be at least 6 characters long and contain at least one lowercase letter, one uppercase letter, and one number.";
                        isValid = false;
                    }

                    // Kiểm tra khớp mật khẩu
                    if (newPassword !== confirmPassword) {
                        confirmPasswordError.innerText = "Passwords do not match.";
                        isValid = false;
                    }

                    if (!isValid) {
                        event.preventDefault(); // Ngăn chặn gửi biểu mẫu nếu có lỗi
                    }
                });
            };
        </script>
    </body>
</html>
