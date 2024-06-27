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
        <style>
            .account-info-form {
                border: 1px solid #ddd;
                padding: 15px;
                border-radius: 8px;
                margin: 20px auto; /* Center the form horizontally */
                max-width: 400px; /* Limit the width of the form */
                background-color: #f9f9f9; /* Light background color */
                box-shadow: 0 0 10px rgba(0,0,0,0.1); /* Soft shadow for depth */
            }

            .account-info-form label {
                font-weight: bold;
                margin-bottom: 5px;
            }

            .account-info-form input[type="text"],
            .account-info-form input[type="email"],
            .account-info-form select,
            .account-info-form textarea {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 3px;
                box-sizing: border-box;
                font-size: 14px;
            }

            .account-info-form button {
                padding: 10px 20px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
            }

            .account-info-form button:hover {
                background-color: #0056b3;
            }
        </style>

    </head>

    <body id="page-top">

        <jsp:include page="headeradmin.jsp" />

        <div id="wrapper">

            <!-- Sidebar -->
            <jsp:include page="navbaradmin.jsp" />

            <div id="content-wrapper">

                <div class="container-fluid">
                    <div class="modal-body">
                        <!-- Change Password Form -->
                        <form id="changePasswordForm" class="account-info-form" action="${pageContext.request.contextPath}/changepassword" method="POST">
                            <div class="form-group">
                                <label for="currentPassword">Current Password:</label>
                                <input type="password" id="currentPassword" name="currentPassword" placeholder="Current Password" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="newPassword">New Password:</label>
                                <input type="password" id="newPassword" name="newPassword" placeholder="New Password" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="confirmPassword">Confirm Password:</label>
                                <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" class="form-control" required>
                            </div>
                            <!-- Error Message -->
                            <p class="error-message">${message}</p>
                            <div class="row">
                                <div class="col-md-12 text-center">
                                    <button type="submit" class="btn btn-primary">Change Password</button>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>

            </div>
            <!-- /.container-fluid -->

            <!-- Sticky Footer -->
            <footer class="sticky-footer">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright © Your Website 2019</span>
                    </div>
                </div>
            </footer>

        </div>
        <!-- /.content-wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="login.html">Logout</a>
                    </div>
                </div>
            </div>
        </div>

    </body>

</html>
