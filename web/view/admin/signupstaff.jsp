<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign Up</title>
    </head>
    <body>
        <jsp:include page="headeradmin.jsp"/>
        <jsp:include page="navbaradmin.jsp"/>
        <section id="form" class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">

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
                            <form id="signupForm" action="${pageContext.request.contextPath}/signupstaff" method="POST" class="signin-form">
                                <div class="form-group mb-3">
                                    <label class="label" for="fullname">Full Name</label>
                                    <input name="fullname" type="text" class="form-control" placeholder="Full Name" required>
                                </div>
                                <div class="form-group mb-3">
                                    <label class="label" for="username">Username</label>
                                    <input name="username" type="text" class="form-control" placeholder="Username" required>
                                    <span id="username-error" style="color:red;"></span>
                                </div>
                                <div class="form-group d-md-flex">
                                    <div class="mr-md-2 mb-3 flex-grow-1">
                                        <label class="label" for="password">Password</label>
                                        <input name="password" type="password" class="form-control" placeholder="Password" required>
                                        <span id="password-error" style="color:red;"></span>
                                    </div>
                                    <div class="ml-md-2 mb-3 flex-grow-1">
                                        <label class="label" for="re-password">Re-Password</label>
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
                                            <option value="5">Delive</option>
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

                var usernameRegex = /^[a-zA-Z0-9_]{4,20}$/;
                var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$/;
                var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                var phoneRegex = /^\+?\d{10,}$/;

                var usernameError = document.getElementById("username-error");
                var passwordError = document.getElementById("password-error");
                var emailError = document.getElementById("email-error");
                var phoneError = document.getElementById("phone-error");
                var repasswordError = document.getElementById("repassword-error");

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
                    passwordError.innerText = "Password must be at least 6 characters long and contain at least one lowercase letter, one uppercase letter, and one number.";
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
            margin-top: -1000px !important;
            margin-left: 300px !important;
        }

    </style>
</html>
