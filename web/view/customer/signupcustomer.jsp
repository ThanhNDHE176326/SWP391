
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Signup | E-Shopper</title>
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
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="<c:url value='/css/style.css'/>">

    </head><!--/head-->

    <body>
        <jsp:include page="header.jsp"/>
        <section id="form" class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section">Sign Up</h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-12 col-lg-8">
                        <div class="wrap p-4 p-md-5">
                            <div class="d-flex">
                                <div class="w-100">
                                    <h3 class="mb-4">Create an Account</h3>
                                </div>
                            </div>
                            <form id="signupForm" action="${pageContext.request.contextPath}/signupcustomer" method="POST" class="signin-form">
                                <p style="font-weight: bold; color: red; font-size: 24px;" id="message">${messen}</p>
                                <div class="form-group mb-3">
                                    <label class="label" for="name">Name</label>
                                    <input name="name" type="text" class="form-control" placeholder="Name" required>
                                </div>
                                <div class="form-group mb-3">
                                    <label class="label" for="username">Username</label>
                                    <input name="username1" type="text" class="form-control" placeholder="Username" required>
                                    <span id="username-error" style="color:red;"></span>
                                </div>
                                <div class="form-group d-md-flex">
                                    <div class="mr-md-2 mb-3 flex-grow-1">
                                        <label class="label" for="password">Password</label>
                                        <input name="password1" type="password" class="form-control" placeholder="Password" required>
                                        <span id="password-error" style="color:red;"></span>
                                    </div>
                                    <div class="ml-md-2 mb-3 flex-grow-1">
                                        <label class="label" for="repassword">Re-Password</label>
                                        <input name="repassword" type="password" class="form-control" placeholder="Re-Password" required>
                                        <span id="repassword-error" style="color:red;"></span>
                                    </div>
                                </div>
                                <div class="form-group mb-3">
                                    <label class="label" for="email">Email</label>
                                    <input name="email" type="email" class="form-control" placeholder="Email" required>
                                    <span id="email-error" style="color:red;"></span>
                                </div>
                                <div class="form-group d-md-flex">
                                    <div class="mr-md-2 mb-3 flex-grow-1">
                                        <label class="label" for="phone">Phone</label>
                                        <input name="phone" type="text" class="form-control" placeholder="Phone" required>
                                        <span id="phone-error" style="color:red;"></span>
                                    </div>
                                    <div class="ml-md-2 mb-3 flex-grow-1">
                                        <label class="label" for="address">Address</label>
                                        <input name="address" type="text" class="form-control" placeholder="Address" required>
                                    </div>
                                </div>
                                <div class="form-group mb-3">
                                    <label class="label" for="gender">Gender</label>
                                    <select name="gender" class="form-control" required>
                                        <option value="" disabled selected>Gender</option>
                                        <option value="1">Male</option>
                                        <option value="0">Female</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="form-control btn btn-primary rounded submit px-3" >Sign Up</button>
                                </div>
                            </form>
                            <p class="text-center">Already have an account? <a href="${pageContext.request.contextPath}/view/customer/logincustomer.jsp">Login</a></p>
                        </div>
                    </div>
                </div>
            </div>

        </section><!--/form-->

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
            document.getElementById("signupForm").addEventListener("submit", function (event) {
                var username = document.getElementsByName("username1")[0].value;
                var password = document.getElementsByName("password1")[0].value;
                var repassword = document.getElementsByName("repassword")[0].value;
                var email = document.getElementsByName("email")[0].value;
                var phone = document.getElementsByName("phone")[0].value;

                var usernameRegex = /^[a-zA-Z0-9_]{4,20}$/;
                var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$/;
                var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                var phoneRegex = /^\+?\d{10,}$/;

                var usernameError = document.getElementById("username-error");
                var passwordError = document.getElementById("password-error");
                var emailError = document.getElementById("email-error");
                var phoneError = document.getElementById("phone-error");
                var repasswordError = document.getElementById("repassword-error"); // Sửa đổi đây

                usernameError.innerText = "";
                passwordError.innerText = "";
                emailError.innerText = "";
                phoneError.innerText = "";
                repasswordError.innerText = "";

                var isValid = true;

                if (!usernameRegex.test(username)) {
                    usernameError.innerText = "Username must be between 4 and 20 characters long and contain no special characters.";
                    isValid = false;
                }

                if (!passwordRegex.test(password)) {
                    passwordError.innerText = "Password is at least 6 characters long and contains at least one lowercase letter, one uppercase letter, and number.";
                    isValid = false;
                }

                if (password !== repassword) {
                    repasswordError.innerText = "Passwords do not match.";
                    isValid = false;
                }

                if (!emailRegex.test(email)) {
                    emailError.innerText = "Please enter a valid email address.";
                    isValid = false;
                }

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

    <style>
        #form{
            margin-top: -150px !important;
            margin-bottom: -50px !important;
        }

    </style>


</html>
