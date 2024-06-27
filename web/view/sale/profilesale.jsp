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

        <title>Marketing - Dashboard</title>
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <!-- Custom fonts for this template-->
        <link href="<c:url value='/vendor/fontawesome-free/css/all.min.css' />" rel="stylesheet" type="text/css">

        <!-- Page level plugin CSS-->
        <link href="<c:url value='/vendor/datatables/dataTables.bootstrap4.css' />" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="<c:url value='/css/sb-admin.css' />" rel="stylesheet">

        <link rel="stylesheet" href="<c:url value='/css/colReorder-bootstrap4.css' />">
        <!-- Custom fonts for this template-->

        <!-- Custom CSS for form border -->
        <style>
            .account-info-form {
                border: 1px solid #ddd; /* Thiết lập border và màu sắc */
                padding: 20px; /* Thêm padding để tách biệt nội dung và border */
                border-radius: 5px; /* Bo góc border */
                margin: 50px; /* Thêm margin để tách biệt với các phần tử khác */
                margin-top: 20px;
            }
        </style>

    </head>

    <body id="page-top">

        <jsp:include page="headersale.jsp"/>

        <div id="wrapper">

            <!-- Sidebar -->
            <jsp:include page="navbarsale.jsp"/>

            <div id="content-wrapper">

                <div class="container-fluid">
                    <div class="modal-body">
                        <!-- Personal Information Form -->
                        <form id="profileForm" class="account-info-form" action="${pageContext.request.contextPath}/updatestaff" method="POST">
                            <div class="form-group">
                                <label for="staffname">Username:</label>
                                <input type="text" id="staffname" name="username" placeholder="Username" value="${staffs.username}" readonly="readonly" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="email">Email:</label>
                                <input type="email" id="email" name="email" placeholder="Email" value="${staffs.email}" readonly="readonly" class="form-control">
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-8">
                                    <label for="name">Name:</label>
                                    <input type="text" id="name" name="name" placeholder="Name" value="${staffs.fullname}" class="form-control">
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="gender">Gender:</label>
                                    <select id="gender" name="gender" required class="form-control">
                                        <option value="" disabled selected>Gender</option>
                                        <option value="1" ${staffs.gender == 1 ? "selected" : ""}>Male</option>
                                        <option value="0" ${staffs.gender == 0 ? "selected" : ""}>Female</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="address">Address:</label>
                                <input type="text" id="address" name="address" placeholder="Address" value="${staffs.address}" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="phone">Phone:</label>
                                <input type="text" id="phone" name="phone" placeholder="Phone" value="${staffs.phone}" class="form-control">
                                <span id="phone-error" class="error-message"></span>
                            </div>
                            <!-- Error Message -->
                            <p class="error-message">${message}</p>
                            <div class="row">
                                <div class="col-md-12 text-center">
                                    <button type="submit" class="btn btn-primary">Save Changes</button>
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

    </div>
    <!-- /#wrapper -->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
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
