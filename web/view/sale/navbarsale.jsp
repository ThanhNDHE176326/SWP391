<%-- 
    Document   : navbar
    Created on : 8 Jun 2024, 6:47:19 pm
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Sale - Dashboard</title>

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <!-- Custom fonts for this template-->
        <link href="<c:url value='/vendor/fontawesome-free/css/all.min.css' />" rel="stylesheet" type="text/css">

        <!-- Page level plugin CSS-->
        <link href="<c:url value='/vendor/datatables/dataTables.bootstrap4.css' />" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="<c:url value='/css/sb-admin.css' />" rel="stylesheet">

        <link rel="stylesheet" href="<c:url value='/css/colReorder-bootstrap4.css' />">
    </head>
    <body>
        <!-- Sidebar -->
        <ul class="sidebar navbar-nav">
            <li class="nav-item dropdown active">
                <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-fw fa-user-circle"></i>
                    <span>Account</span>
                </a>
                <div class="dropdown-menu" aria-labelledby="pagesDropdown">
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/informationstaff">Personal Information</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/view/sale/changepasswordsale.jsp">Password</a>
                </div>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="${pageContext.request.contextPath}/saleorderlist">
                    <i class="fas fa-fw fa-list"></i>
                    <span>Order List</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="${pageContext.request.contextPath}/logoutstaff">
                    <i class="fas fa-sign-out-alt"></i>
                    <span>Logout</span>
                </a>
            </li>
        </ul>

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Bootstrap core JavaScript-->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="<c:url value='/vendor/jquery/jquery.min.js' />"></script>
        <script src="<c:url value='/vendor/bootstrap/js/bootstrap.bundle.min.js' />"></script>

        <!-- Core plugin JavaScript-->
        <script src="<c:url value='/vendor/jquery-easing/jquery.easing.min.js' />"></script>

        <!-- Page level plugin JavaScript-->
        <script src="<c:url value='/vendor/chart.js/Chart.min.js' />"></script>
        <script src="<c:url value='/vendor/datatables/jquery.dataTables.js' />"></script>
        <script src="<c:url value='/vendor/datatables/dataTables.bootstrap4.js' />"></script>

        <!-- Custom scripts for all pages-->
        <script src="<c:url value='/js/sb-admin.min.js' />"></script>
        <script src="<c:url value='/js/colReorder-bootstrap4-min.js' />"></script>
        <script src="<c:url value='/js/colReorder-dataTables-min.js' />"></script>

        <!-- Demo scripts for this page-->
        <script src="<c:url value='/js/demo/datatables-demo.js' />"></script>
        <script src="<c:url value='/js/demo/chart-area-demo.js' />"></script>

        <!-- Initialize Bootstrap's dropdown -->
        <script>
            $(document).ready(function () {
                $('.dropdown-toggle').dropdown();
            });
        </script>
    </body>
</html>
