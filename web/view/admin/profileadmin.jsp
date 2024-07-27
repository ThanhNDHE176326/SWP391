<%-- 
    Document   : dashboard
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
        <title>Admin - Profile</title>
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <!-- Custom fonts for this template-->
        <link href="<c:url value='/vendor/fontawesome-free/css/all.min.css' />" rel="stylesheet" type="text/css">

        <!-- Page level plugin CSS-->
        <link href="<c:url value='/vendor/datatables/dataTables.bootstrap4.css' />" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="<c:url value='/css/sb-admin.css' />" rel="stylesheet">

        <link rel="stylesheet" href="<c:url value='/css/colReorder-bootstrap4.css' />">

        <!-- Custom CSS for form border -->
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

    </head>

    <body id="page-top">
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
                        <li class="breadcrumb-item active">Profile</li>
                    </ol>
                    <div class="modal-body">
                        <section id="form" class="ftco-section">
                            <div class="container">
                                <div class="row justify-content-center">
                                    <div class="col-md-12 col-lg-8">
                                        <div class="wrap p-4 p-md-5 form-border">
                                            <h2 class="heading-section">Profile Information</h2>
                                            <form id="profileForm" action="${pageContext.request.contextPath}/updatestaff" method="POST" class="signin-form">
                                                <div class="form-group mb-3">
                                                    <label class="label" for="staffname">Username</label>
                                                    <input type="text" id="staffname" name="username" placeholder="Username" value="${staffs.username}" readonly="readonly" class="form-control">
                                                </div>
                                                <div class="form-group mb-3">
                                                    <label class="label" for="email">Email</label>
                                                    <input type="email" id="email" name="email" placeholder="Email" value="${staffs.email}" readonly="readonly" class="form-control">
                                                </div>
                                                <div class="form-group d-md-flex">
                                                    <div class="mr-md-2 mb-3 flex-grow-1">
                                                        <label class="label" for="name">Name</label>
                                                        <input type="text" id="name" name="name" placeholder="Name" value="${staffs.fullname}" class="form-control">
                                                    </div>
                                                    <div class="ml-md-2 mb-3 flex-grow-1">
                                                        <label class="label" for="gender">Gender</label>
                                                        <select id="gender" name="gender" required class="form-control">
                                                            <option value="" disabled selected>Gender</option>
                                                            <option value="1" ${staffs.gender == 1 ? "selected" : ""}>Male</option>
                                                            <option value="0" ${staffs.gender == 0 ? "selected" : ""}>Female</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group mb-3">
                                                    <label class="label" for="address">Address</label>
                                                    <input type="text" id="address" name="address" placeholder="Address" value="${staffs.address}" class="form-control">
                                                </div>
                                                <div class="form-group mb-3">
                                                    <label class="label" for="phone">Phone</label>
                                                    <input type="text" id="phone" name="phone" placeholder="Phone" value="${staffs.phone}" class="form-control">
                                                    <span id="phone-error" class="text-danger"></span>
                                                </div>
                                                <!-- Error Message -->
                                                <p id="message" style="color: red; font-style: italic;">${message}</p>
                                                <div class="form-group">
                                                    <button type="submit" class="form-control btn btn-primary rounded submit px-3">Save Changes</button>
                                                </div>
                                                <div class="form-group d-md-flex"></div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
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
        <!-- /#wrapper -->
        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <script src="<c:url value='js/jquery.min.js'/>"></script>
        <script src="<c:url value='js/popper.js'/>"></script>
        <script src="<c:url value='js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='js/main.js'/>"></script>

    </body>
    <script>
        window.onload = function () {
            setTimeout(function () {
                var messageElement = document.getElementById("message");
                if (messageElement) {
                    messageElement.style.display = 'none';
                }
            }, 2000);
        };
    </script>

</html>
