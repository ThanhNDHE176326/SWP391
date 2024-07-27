<%-- 
    Document   : FeedbackDetail
    Created on : 4 June 2024, 1:44:57 pm
    Author     : dat ngo huy
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Marketing - Feedback Detail</title>
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
                    <li class="breadcrumb-item active">Feedback Detail</li>
                </ol>

                <!-- Feedback Detail -->
                <div class="card mb-3">
                    <div class="card-header">
                        <i class="fas fa-table"></i>
                        Feedback Detail
                        <form action="${pageContext.request.contextPath}/searchfeedback?index=1" method="post" class="form-inline float-right">
                            <input type="text" name="txtSearch" class="form-control mr-2" size="15" required>
                            <button type="submit" class="btn btn-primary">Search</button>
                        </form>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Customer</th>
                                        <th>Product</th>
                                        <th>Date</th>
                                        <th>Rated Star</th>
                                        <th>Comment</th>
                                        <th>Change Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="feedback" items="${feedbackdetail}">
                                        <tr>
                                            <td>${feedback.id}</td>
                                            <td>${feedback.customer}</td>
                                            <td>${feedback.product}</td>
                                            <td>${feedback.date}</td>
                                            <td>${feedback.ratedStar}</td>
                                            <td>${feedback.comment}</td>
                                            <td>
                                                <form id="feedbackForm-${feedback.id}" method="get" action="${pageContext.request.contextPath}/updatefeedback">
                                                    <input type="hidden" name="id" value="${feedback.id}">
                                                    <select name="newStatus" class="form-control" onchange="document.getElementById('feedbackForm-${feedback.id}').submit()">
                                                        <option value="1" ${feedback.status == '1' ? 'selected' : ''}>Show</option>
                                                        <option value="0" ${feedback.status == '0' ? 'selected' : ''}>Hide</option>
                                                    </select>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
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
</body>

</html>
