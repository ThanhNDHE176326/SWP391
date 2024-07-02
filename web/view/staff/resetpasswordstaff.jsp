<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Reset Password</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
    </head>
    <body>
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section">Reset Password</h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-12 col-lg-10">
                        <div class="wrap d-md-flex">
                            <div class="img" style="background-image: url('<c:url value='/images/loginstaff.jpg'/>');">
                            </div>
                            <div class="login-wrap p-4 p-md-5">
                                <div class="account-info-container">
                                    <h2>Reset Password</h2>
                                    <form id="resetPasswordForm" action="${pageContext.request.contextPath}/resetpasswordstaff" method="POST">
                                        <div class="form-group mb-3">
                                            <label for="newPassword">New Password:</label>
                                            <input type="password" name="newPassword" id="newpassword" class="form-control" placeholder="New Password" required>
                                            <p id="newpassword-error" class="error-message"></p>
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="confirmPassword">Confirm Password:</label>
                                            <input type="password" name="confirmPassword" id="confirmpassword" class="form-control" placeholder="Confirm Password" required>
                                            <p id="confirmpassword-error" class="error-message"></p>
                                        </div>
                                        <p id="error" class="error-message" style="color: #FF0000; font-weight: bold;">${error}</p>
                                        <button type="submit" class="btn btn-default form-control btn btn-primary rounded submit px-3" style="background-color: #FE980F;">Submit</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="js/jquery.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
