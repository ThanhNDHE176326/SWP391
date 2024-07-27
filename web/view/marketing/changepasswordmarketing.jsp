<%-- 
    Document   : changepassword
    Created on : Jun 8, 2024, 6:08:29 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Marketing - Change Password</title>
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <!-- Custom fonts for this template-->
        <link href="<c:url value='/vendor/fontawesome-free/css/all.min.css' />" rel="stylesheet" type="text/css">

        <!-- Custom styles for this template-->
        <link href="<c:url value='/css/sb-admin.css' />" rel="stylesheet">

        <!-- Custom CSS for form border -->
    <body>
        <jsp:include page="headermarketing.jsp" />
        <div id="wrapper">
            <!-- Sidebar -->
            <jsp:include page="navbarmarketing.jsp" />

            <div id="content-wrapper">
                <div class="container-fluid">
                    <!-- Breadcrumbs-->
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/view/marketing/homedashboardmarketing.jsp">Marketing</a>
                        </li>
                        <li class="breadcrumb-item active">Change Password</li>
                    </ol>
                    <section id="form" class="ftco-section">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-md-12 col-lg-8">
                                    <div class="wrap p-4 p-md-5 form-border">
                                        <h2 class="heading-section">Change Password</h2>
                                        <form id="changePasswordForm" action="${pageContext.request.contextPath}/changepasswordstaff" method="POST" class="signin-form">
                                            <div class="form-group mb-3">
                                                <label class="label" for="currentPassword">Current Password:</label>
                                                <input type="password" id="currentPassword" name="currentPassword" class="form-control" placeholder="Current Password" required>
                                            </div>
                                            <div class="form-group mb-3">
                                                <label class="label" for="newPassword">New Password:</label>
                                                <input type="password" id="newPassword" name="newPassword" class="form-control" placeholder="New Password" required>
                                                <span id="newpassword-error" class="text-danger"></span>
                                            </div>
                                            <div class="form-group mb-3">
                                                <label class="label" for="confirmPassword">Confirm Password:</label>
                                                <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" placeholder="Confirm Password" required>
                                                <span id="confirmpassword-error" class="text-danger"></span>
                                            </div>
                                            <!-- Error Message -->
                                            <p style="color: #000000; font-weight: bold;">${message}</p>
                                            <div class="form-group">
                                                <button type="submit" class="form-control btn btn-primary rounded submit px-3">Change Password</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                <!-- /.container-fluid -->

                <!-- Sticky Footer -->
                <footer class="sticky-footer">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>BookHaven</span>
                        </div>
                    </div>
                </footer>
            </div>
            <!-- /.content-wrapper -->
        </div>
        <script src="<c:url value='js/jquery.min.js'/>"></script>
        <script src="<c:url value='js/popper.js'/>"></script>
        <script src="<c:url value='js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='js/main.js'/>"></script>
    </body>

    <script>
        window.onload = function () {
            document.getElementById("changePasswordForm").addEventListener("submit", function (event) {
                var newPassword = document.getElementById("newPassword").value;
                var confirmPassword = document.getElementById("confirmPassword").value;
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

    <style>
        .form-border {
            border: 2px solid #000;
            border-radius: 10px;
            padding: 20px;
        }

        .signin-form .form-control {
            border-radius: 20px;
        }

        .signin-form .btn {
            border-radius: 20px;
        }

        .signin-form .label {
            font-weight: bold;
            color: #000;
        }

        .heading-section {
            font-size: 2.5rem;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
            color: #007bff;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
        }

        .text-danger {
            font-size: 0.875rem;
        }
    </style>
</html>
