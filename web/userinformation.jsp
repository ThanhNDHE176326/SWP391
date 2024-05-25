<%-- 
    Document   : profile
    Created on : 21 May 2024, 9:51:32 pm
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Profile | E-Shopper</title>
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
                    <div class="col-sm-4 col-sm-offset-4"> <!-- Thay đổi col-sm-offset-4 để điều chỉnh vị trí -->
                        <div class="signup-form"><!--profile form-->
                            <h2>User Profile</h2>
                            <!-- Form thông tin người dùng -->
                            <form id="profileForm" action="updateuser" method="POST">
                                <!-- Các trường hiển thị thông tin -->
                                Username:<input name="username" type="text" placeholder="Username" value="${user.username}" readonly="readonly"/>
                                Email:<input name="email" type="email" placeholder="Email" value="${user.email}" readonly="readonly" />
                                Name:<input name="name" type="text" placeholder="Name" value="${user.name}" />
                                Address:<input name="address" type="text" placeholder="Address" value="${user.address}" />
                                Phone:<input name="phone" type="text" placeholder="Phone" value="${user.phone}"/>
                                <select name="gender" required>
                                    <option value="" disabled selected>Gender</option>
                                    <option value="1" ${user.gender == 1 ? "selected" : ""}>Male</option>
                                    <option value="0" ${user.gender == 0 ? "selected" : ""}>Female</option>
                                </select>
                                <!-- Thêm phần hiển thị thông báo lỗi -->
                                <p style="color: red; font-style: italic;">${message}</p>
                                <span id="phone-error" style="color: red; font-style: italic;"></span><br>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <button type="submit" class="btn btn-default btn-block">Edit Profile</button>
                                    </div>
                                    <div class="col-sm-6">
                                        <a href="homepage.jsp" class="btn btn-default btn-block">Back to Home</a>
                                    </div>
                                </div>
                            </form>

                        </div><!--/profile form-->
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
