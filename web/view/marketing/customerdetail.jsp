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

            <div id="content-wrapper">

                <div class="container-fluid">

                    <!-- Breadcrumbs-->
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="homedashboard.jsp">Dashboard</a>
                        </li>
                        <li class="breadcrumb-item active">Customer Detail</li>
                    </ol>

                    <div class="container mt-5">
                        <div class="row justify-content-center">
                            <div class="col-lg-12">
                                <div class="card shadow">
                                    <div class="card-header bg-primary text-white">
                                        <i class="fas fa-user"></i>
                                        Customer Detail
                                    </div>
                                    <div class="card-body">
                                        <form id="customerForm" action="${pageContext.request.contextPath}/UpdateCustomer" method="post">
                                            <!-- Trường ẩn để lưu ID của khách hàng -->
                                            <input type="hidden" name="id" value="${customer.id}">
                                            <div class="form-group row">
                                                <label for="inputName" class="col-sm-3 col-form-label">Name:</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="inputName" name="name" value="${customer.name}">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="inputUsername" class="col-sm-3 col-form-label">Username:</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="inputUsername" name="username" value="${customer.username}">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="inputEmail" class="col-sm-3 col-form-label">Email:</label>
                                                <div class="col-sm-9">
                                                    <input type="email" class="form-control" id="inputEmail" name="email" value="${customer.email}">
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label for="inputPhone" class="col-sm-3 col-form-label">Phone:</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="inputPhone" name="phone" value="${customer.phone}">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="inputAddress" class="col-sm-3 col-form-label">Address:</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="inputAddress" name="address" value="${customer.address}">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="inputGender" class="col-sm-3 col-form-label">Gender:</label>
                                                <div class="col-sm-9">
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="gender" id="genderMale" value="male" ${customer.gender ? 'checked' : ''}>
                                                        <label class="form-check-label" for="genderMale">Male</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="gender" id="genderFemale" value="female" ${!customer.gender ? 'checked' : ''}>
                                                        <label class="form-check-label" for="genderFemale">Female</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="inputAddress" class="col-sm-3 col-form-label">Status</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="Status" name="status" value="${customer.customerType}" readonly>
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <div class="col-sm-9 offset-sm-3">
                                                    <button type="submit" class="btn btn-primary">Update</button>
                                                    <button type="button" class="btn btn-secondary" onclick="cancelEdit()">Cancel</button>
                                                </div>
                                            </div>
                                            <body>

                                                <p>${message}</p>
                                            </body>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <h1>Customer Update History</h1>
                        <table border="1">
                            <tr>
                                <th>LogID</th>
                                <th>Email</th>
                                <th>Name</th>
                                <th>Gender</th>
                                <th>Phone</th>
                                <th>Address</th>
                                <th>Updater</th>
                                <th>Update date</th>
                            </tr>
                            <c:forEach var="history" items="${historyList}">
                                <tr>
                                    <td>${history.logId}</td>
                                    <td>${history.emailNew}</td>
                                    <td>${history.nameNew}</td>
                                    <td>${history.genderNew}</td>
                                    <td>${history.phoneNew}</td>
                                    <td>${history.addressNew}</td>
                                    <td>${history.updaterName}</td>
                                    <td>${history.updateDate}</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
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



