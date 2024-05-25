<%-- 
    Document   : changepassword
    Created on : 23 May 2024, 4:14:34 pm
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
        <title>Change Password | E-Shopper</title>
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
                        <div class="signup-form"><!--change password form-->
                            <h2>Change Your Password</h2>
                            <form id="changePasswordForm" action="changepassword" method="POST">
                                <div>
                                    <input type="password" name="oldpassword" placeholder="Old Password" required />
                                </div>
                                <div>
                                    <input type="password" name="newpassword" id="newpassword" placeholder="New Password" required />
                                </div>
                                <div>
                                    <input type="password" name="confirmpassword" placeholder="Confirm New Password" required />
                                </div>
                                <p style="color: red; font-style: italic;">${error}</p>
                                <span id="newpassword-error" style="color: red; font-style: italic;"></span>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <button type="submit">Change Password</button>
                                    </div>
                                    <div class="col-sm-6">
                                        <a href="logincustomer.jsp" class="btn btn-default">Back to Home</a>
                                    </div>
                                </div>
                            </form>

                        </div><!--/change password form-->
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
            document.getElementById("changePasswordForm").addEventListener("submit", function (event) {
                var newPassword = document.getElementById("newpassword").value;
                var newPasswordError = document.getElementById("newpassword-error");
                var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$/;
                newPasswordError.innerText = "";

                var isValid = true;

                // Kiểm tra mật khẩu mới theo mẫu regex
                if (!passwordRegex.test(newPassword)) {
                    newPasswordError.innerText = "New password must be at least 6 characters long and contain at least one lowercase letter, one uppercase letter, and one number.";
                    isValid = false;
                }

                if (!isValid) {
                    event.preventDefault(); // Prevent form submission
                }
            });
        };
    </script>
</html>
