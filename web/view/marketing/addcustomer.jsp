<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>SB Admin - Tables</title>

        <!-- Custom fonts for this template-->
        <link href="<c:url value='/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">

        <!-- Page level plugin CSS-->
        <link href="<c:url value='/vendor/datatables/dataTables.bootstrap4.css'/>" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="<c:url value='/css/sb-admin.css'/>" rel="stylesheet">

    </head>

    <body id="page-top">

        <jsp:include page="headermarketing.jsp"/>

        <div id="wrapper">

            <!-- Sidebar -->
            <jsp:include page="navbarmarketing.jsp"/>

            <div class="container-fluid centered-wrapper">
                <div class="col-md-11">
                    <!-- Breadcrumbs-->
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="homedashboard.jsp">Dashboard</a>
                        </li>
                        <li class="breadcrumb-item active">Add New Customer</li>
                    </ol>

                    <!-- Customer Registration Form -->
                    <h2 class="text-center">Add New Customer</h2>
                    <form action="${pageContext.request.contextPath}/AddCustomer" method="post">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="name">Name</label>
                                    <input type="text" class="form-control" id="name" name="Name" value="${not empty name ? name : ''}" required>
                                </div>
                                <div class="form-group">
                                    <label for="username">Username</label>
                                    <input type="text" class="form-control" id="username" name="Username" value="${not empty username ? username : ''}" required>
                                </div>
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="email" class="form-control" id="email" name="Email" value="${not empty email ? email : ''}" required>
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" class="form-control" id="password" name="Password" value="${not empty password ? password : ''}" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="phone">Phone</label>
                                    <input type="tel" class="form-control" id="phone" name="Phone" value="${not empty phone ? phone : ''}" required>
                                </div>
                                <div class="form-group">
                                    <label for="address">Address</label>
                                    <input type="text" class="form-control" id="address" name="Address" value="${not empty address ? address : ''}" required>
                                </div>
                                <div class="form-group">
                                    <label>Gender</label><br>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="Gender" id="maleGender" value="male" ${gender == 'male' ? 'checked' : ''} required>
                                        <label class="form-check-label" for="maleGender">Male</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="Gender" id="femaleGender" value="female" ${gender == 'female' ? 'checked' : ''} required>
                                        <label class="form-check-label" for="femaleGender">Female</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>Active status</label><br>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="isDelete" id="active" value="1" checked >
                                        <label class="form-check-label" for="active">Active</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="isDelete" id="nonactive" value="0" disabled>
                                        <label class="form-check-label" for="nonactive">Nonactive</label>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Add Customer</button>
                        </div>
                        <div class="mt-3">
                            <c:if test="${not empty errorMessages}">
                                <div class="alert alert-danger" role="alert">
                                    <ul>
                                        <c:forEach items="${errorMessages}" var="error">
                                            <li>${error}</li>
                                            </c:forEach>
                                    </ul>
                                </div>
                            </c:if>

                            <!-- Hiển thị thông báo thành công -->
                            <c:if test="${not empty message}">
                                <div class="alert alert-success" role="alert">
                                    ${message}
                                </div>
                            </c:if>
                            <p>${message}</p>
                        </div>
                    </form>
                </div>
            </div>
    </body>
</form>

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

</div>
<!-- /#wrapper -->

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


<!-- Bootstrap core JavaScript-->
<script src="<c:url value='/vendor/jquery/jquery.min.js'/>"></script>
<script src="<c:url value='/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

<!-- Core plugin JavaScript-->
<script src="<c:url value='/vendor/jquery-easing/jquery.easing.min.js'/>"></script>

<!-- Page level plugin JavaScript-->
<script src="<c:url value='/vendor/datatables/jquery.dataTables.js'/>"></script>
<script src="<c:url value='/vendor/datatables/dataTables.bootstrap4.js'/>"></script>

<!-- Custom scripts for all pages-->
<script src="<c:url value='/js/sb-admin.min.js'/>"></script>

<!-- Demo scripts for this page-->
<script src="<c:url value='/js/demo/datatables-demo.js'/>"></script>


</body>

</html>
