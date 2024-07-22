<%-- 
    Document   : header
    Created on : 8 Jun 2024, 6:31:59 pm
    Author     : HP
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Sale - Dashboard</title>

        <!-- Bootstrap CSS -->
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

        <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

            <a class="navbar-brand mr-1" href="${pageContext.request.contextPath}/view/sale/homedashboardsale.jsp">Sale</a>

            <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
                <i class="fas fa-bars"></i>
            </button>

            <!-- Move logo to right -->
            <div class="ml-auto">
                <div class="logo pull-left">
                    <a href="${pageContext.request.contextPath}/view/customer/homepage.jsp">
                        <img src="<c:url value='/images/home/logo.png'/>" alt="" width="140" height="35" />
                    </a>
                </div>
            </div>

        </nav>


        <!-- /#wrapper -->

        <!-- Scroll to Top Button-->
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

        <!-- Bootstrap core JavaScript-->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
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
        <script src="<c:url value='/js/colReorder-dataTables-min.js' />"></script>
        <script src="<c:url value='/js/colReorder-bootstrap4-min.js' />"></script>


    </body>
</html>
