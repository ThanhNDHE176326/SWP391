<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin - Sign Up</title>
        <link rel="stylesheet" href="<c:url value='css/bootstrap.min.css'/>">
        <link rel="stylesheet" href="<c:url value='css/style.css'/>">
    </head>
    <body>
        <jsp:include page="headeradmin.jsp"/>
        <div id="wrapper">
            <!-- Sidebar -->
            <jsp:include page="navbaradmin.jsp"/>

            <div id="content-wrapper">
                <div class="container-fluid">
                    <!-- Breadcrumbs-->
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="homedashboardadmin.jsp">Admin</a>
                        </li>
                        <li class="breadcrumb-item active">User List</li>
                    </ol>
                    <section id="form" class="ftco-section">
                        <div class="container">

                            <div class="row justify-content-center">
                                <div class="col-md-12 col-lg-8">
                                    <div class="wrap p-4 p-md-5 form-border">
                                        <h2 class="heading-section">Sign Up</h2>
                                        <form id="signupForm" action="${pageContext.request.contextPath}/signupstaff" method="POST" class="signin-form">
                                            <div class="form-group mb-3">
                                                <label class="label" for="fullname">Full Name</label>
                                                <input name="fullname" type="text" class="form-control" placeholder="Full Name" required>
                                                <span id="fullname-error" class="text-danger"></span>
                                            </div>
                                            <div class="form-group d-md-flex">
                                                <div class="mr-md-2 mb-3 flex-grow-1">
                                                    <label class="label" for="username">Username</label>
                                                    <input name="username" type="text" class="form-control" placeholder="Username" required>
                                                    <span id="username-error" class="text-danger"></span>
                                                </div>
                                                <div class="ml-md-2 mb-3 flex-grow-1">
                                                    <label class="label" for="email">Email</label>
                                                    <input name="email" type="email" class="form-control" placeholder="Email" required>
                                                    <span id="email-error" class="text-danger"></span>
                                                </div>
                                            </div>
                                            <div class="form-group d-md-flex">
                                                <div class="mr-md-2 mb-3 flex-grow-1">
                                                    <label class="label" for="password">Password</label>
                                                    <input name="password" type="password" class="form-control" placeholder="Password" required>
                                                    <span id="password-error" class="text-danger"></span>
                                                </div>
                                                <div class="ml-md-2 mb-3 flex-grow-1">
                                                    <label class="label" for="re-password">Re-Password</label>
                                                    <input name="repassword" type="password" class="form-control" placeholder="Re-Password" required>
                                                    <span id="repassword-error" class="text-danger"></span>
                                                </div>
                                            </div>
                                            <div class="form-group d-md-flex">
                                                <div class="mr-md-2 mb-3 flex-grow-1">
                                                    <label class="label" for="phone">Phone</label>
                                                    <input name="phone" type="text" class="form-control" placeholder="Phone" required>
                                                    <span id="phone-error" class="text-danger"></span>
                                                </div>
                                                <div class="ml-md-2 mb-3 flex-grow-1">
                                                    <label class="label" for="address">Address</label>
                                                    <input name="address" type="text" class="form-control" placeholder="Address" required>
                                                    <span id="address-error" class="text-danger"></span>
                                                </div>
                                            </div>
                                            <div class="form-group d-md-flex">
                                                <div class="mr-md-2 mb-3 flex-grow-1">
                                                    <label class="label" for="gender">Gender</label>
                                                    <select name="gender" class="form-control" required>
                                                        <option value="1">Male</option>
                                                        <option value="0">Female</option>
                                                    </select>
                                                </div>
                                                <div class="ml-md-2 mb-3 flex-grow-1">
                                                    <label class="label" for="role">Role</label>
                                                    <select name="role" class="form-control" required>
                                                        <option value="1">Admin</option>
                                                        <option value="2">Sale</option>
                                                        <option value="3">Sale Admin</option>
                                                        <option value="4">Marketing</option>
                                                        <option value="5">Store Staff</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <p style="color: #000000; font-weight: bold;">${mess}</p>
                                            <div class="form-group">
                                                <button type="submit" class="form-control btn btn-primary rounded submit px-3">Sign Up</button>
                                            </div>
                                            <div class="form-group d-md-flex"></div>
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
                            <span>Book Haven</span>
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
            document.getElementById("signupForm").addEventListener("submit", function (event) {
                var username = document.getElementsByName("username")[0].value;
                var password = document.getElementsByName("password")[0].value;
                var repassword = document.getElementsByName("repassword")[0].value;
                var email = document.getElementsByName("email")[0].value;
                var phone = document.getElementsByName("phone")[0].value;
                var fullname = document.getElementsByName("fullname")[0].value;
                var address = document.getElementsByName("address")[0].value;

                var usernameRegex = /^[a-zA-Z0-9_]{4,20}$/;
                var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$/;
                var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                var phoneRegex = /^\+?\d{10,}$/;
                var fullnameRegex = /^.{2,}$/; // Full Name must be at least 2 characters
                var addressRegex = /^.{5,}$/; // Address must be at least 5 characters

                var usernameError = document.getElementById("username-error");
                var passwordError = document.getElementById("password-error");
                var emailError = document.getElementById("email-error");
                var phoneError = document.getElementById("phone-error");
                var repasswordError = document.getElementById("repassword-error");
                var fullnameError = document.getElementById("fullname-error");
                var addressError = document.getElementById("address-error");

                // Xóa thông báo lỗi trước đó
                usernameError.innerText = "";
                passwordError.innerText = "";
                emailError.innerText = "";
                phoneError.innerText = "";
                repasswordError.innerText = "";
                fullnameError.innerText = "";
                addressError.innerText = "";

                var isValid = true;

                // Kiểm tra username
                if (!usernameRegex.test(username)) {
                    usernameError.innerText = "Username must be between 4 and 20 characters long and contain no special characters.";
                    isValid = false;
                }

                // Kiểm tra password
                if (!passwordRegex.test(password)) {
                    passwordError.innerText = "Password must be at least 6 characters long and contain at least one lowercase letter, one uppercase letter, and one number.";
                    isValid = false;
                }

                // Kiểm tra password match
                if (password !== repassword) {
                    repasswordError.innerText = "Passwords do not match.";
                    isValid = false;
                }

                // Kiểm tra email
                if (!emailRegex.test(email)) {
                    emailError.innerText = "Please enter a valid email address.";
                    isValid = false;
                }

                // Kiểm tra phone
                if (!phoneRegex.test(phone)) {
                    phoneError.innerText = "Please enter a valid phone number.";
                    isValid = false;
                }

                // Kiểm tra fullname
                if (!fullnameRegex.test(fullname)) {
                    fullnameError.innerText = "Full Name must be at least 2 characters long.";
                    isValid = false;
                }

                // Kiểm tra address
                if (!addressRegex.test(address)) {
                    addressError.innerText = "Address must be at least 5 characters long.";
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
            color: #007bff; /* Primary color */
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
        }

        .text-danger {
            font-size: 0.875rem;
        }
    </style>
</html>
