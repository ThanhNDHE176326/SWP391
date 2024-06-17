<%-- 
    Document   : SearchFeedback
    Created on : 6 June 2024, 7:42:38 pm
    Author     : dat ngo huy
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin - Feedbacks</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
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
                    <li class="breadcrumb-item active">Feedback List</li>
                </ol>

                <!-- Feedback List -->
                <div class="card mb-3">
                    <div class="card-header">
                        <i class="fas fa-table"></i>
                        Feedback List
                        <form action="${pageContext.request.contextPath}/searchfeedback?index=1" method="post" class="form-inline float-right">
                            <input type="text" name="txtSearch" class="form-control mr-2" size="15" required>
                            <button type="submit" class="btn btn-primary">Search</button>
                        </form>
                    </div>
                    <div class="card-body">
                        <form id="statusSearch" action="${pageContext.request.contextPath}/FilterFeedbackByStatus" class="form-inline mb-3">
                            <label for="statusSearch" class="mr-2">Filter by Status:</label>
                            <select name="statusSearch" class="form-control" onchange="document.getElementById('statusSearch').submit();">
                                <option value="all" ${statusSearch eq "all"? "selected":""}>All Status</option>
                                <option value="show" ${statusSearch eq "show"? "selected":""}>Show</option>
                                <option value="hide"${statusSearch eq "hide"? "selected":""}>Hide</option>
                            </select>  
                        </form>

                        <form id="starSearch" action="${pageContext.request.contextPath}/FilterFeedbackByStar" class="form-inline mb-3">
                            <label for="starSearch" class="mr-2">Filter by Star:</label>
                            <select name="starSearch" class="form-control" onchange="document.getElementById('starSearch').submit();">
                                <option value="1" ${starSearch eq "1"? "selected":""}>1 star</option>
                                <option value="2" ${starSearch eq "2"? "selected":""}>2 star</option>
                                <option value="3"${starSearch eq "3"? "selected":""}>3 star</option>
                                <option value="4"${starSearch eq "4"? "selected":""}>4 star</option>
                                <option value="5"${starSearch eq "5"? "selected":""}>5 star</option>
                            </select>  
                        </form>

                        <form id="CategorySearch" action="${pageContext.request.contextPath}/FilterFeedbackByCategories" class="form-inline mb-3">
                            <label for="CategorySearch" class="mr-2">Filter by Category:</label>
                            <select name="CategorySearch" class="form-control" onchange="document.getElementById('CategorySearch').submit();">
                                <option value="1" ${CategorySearch eq "1"? "selected":""}>Triết học</option>
                                <option value="2" ${CategorySearch eq "2"? "selected":""}>Lịch sử</option>
                                <option value="3"${CategorySearch eq "3"? "selected":""}>Khoa học</option>
                                <option value="4"${CategorySearch eq "4"? "selected":""}>Văn học</option>
                            </select>  
                        </form>

                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th><a href="FeedbackServlet?sortField=fullName&sortOrder=asc">Full Name</a></th>
                                        <th><a href="FeedbackServlet?sortField=productName&sortOrder=asc">Product Name</a></th>
                                        <th><a href="FeedbackServlet?sortField=ratedStar&sortOrder=asc">Rated Star</a></th>
                                        <th><a href="FeedbackServlet?sortField=status&sortOrder=asc">Status</a></th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="feedback" items="${list}">
                                        <tr>
                                            <td>${feedback.id}</td>
                                            <td>${feedback.customer}</td>
                                            <td>${feedback.product}</td>
                                            <td>${feedback.ratedStar}</td>
                                            <td>${feedback.status}</td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/listfeedback?mode=4&id=${feedback.getId()}" class="btn btn-info btn-sm">View Detail</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                </div>

                <div class="text-center">
                    <c:forEach begin="1" end="${end}" var="i">
                        <a id="${i}" href="${pageContext.request.contextPath}/searchfeedback?index=${i}&txtSearch=${txtSearch}" class="btn btn-secondary">${i}</a>
                    </c:forEach>
                </div>
                <script>
                    document.getElementById('${index}').classList.add('btn-primary');
                </script>
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
