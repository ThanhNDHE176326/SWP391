
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Signup | E-Shopper</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/price-range.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->       
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
                
    </head><!--/head-->

    <body>
        <jsp:include page="header.jsp"/>
        <section id="form"><!--form-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-4 col-sm-offset-4">
                        <div class="signup-form"><!--sign up form-->
                            <h2>New User Signup!</h2>
                            <form id="signupForm" action="signupcustomer" method="POST">
                                <p style="font-weight: bold; color: #000000; font-size: 24px;" id="message"></p>
                                <input name="name" type="text" placeholder="Name" required/><br>
                                <input name="username1" type="text" placeholder="Username" required/><span id="username-error" style="color: red;"></span><br>
                                <input name="password1" type="password" placeholder="Password" required/><span id="password-error" style="color: red;"></span><br>
                                <input name="repassword" type="password" placeholder="Re-Password" required/><span id="repassword-error" style="color: red;"></span><br> <!-- Thêm id "repassword-error" vào đây -->
                                <input name="email" type="email" placeholder="Email" required/><span id="email-error" style="color: red;"></span><br>
                                <input name="address" type="text" placeholder="Address" required/><br>
                                <input name="phone" type="text" placeholder="Phone" required/><span id="phone-error" style="color: red;"></span><br>
                                <select name="gender" required>
                                    <option value="" disabled selected>Gender</option>
                                    <option value="true">Male</option>
                                    <option value="false">Female</option>
                                </select><br>
                                <div style="margin-bottom: 15px;"></div>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <button type="submit">Signup</button>
                                    </div>
                                    <div class="col-sm-6">
                                        <a href="logincustomer.jsp" class="btn btn-default">Back to Login</a>
                                    </div>
                                </div>
                            </form>

                        </div><!--/sign up form-->
                    </div>
                </div>
            </div>
        </section><!--/form-->




        <jsp:include page="footer.jsp"/>

        <script src="js/jquery.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>

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




</html>
