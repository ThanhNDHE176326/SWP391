<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Forgot Password</title>
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
                        <h2 class="heading-section">Forgot Password</h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-12 col-lg-10">
                        <div class="wrap d-md-flex">
                            <div class="img" style="background-image: url('<c:url value='/images/loginstaff.jpg'/>');">
                            </div>
                            <div class="login-wrap p-4 p-md-5">
                                <div class="account-info-container">
                                    <h2>Forget Password</h2>
                                    <form id="forgetPasswordForm" action="${pageContext.request.contextPath}/forgotpasswordstaff" method="POST">
                                        <div class="form-group mb-3">
                                            <label for="username">Username:</label>
                                            <input type="text" name="username" id="username" class="form-control" placeholder="Username" required>
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="email">Email:</label>
                                            <input type="email" name="email" id="email" class="form-control" placeholder="Email" required>
                                        </div>
                                        <p class="error-message" style="color: #FF0000; font-weight: bold;">${error}</p>
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
