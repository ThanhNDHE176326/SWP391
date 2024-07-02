<%-- 
    Document   : List Feedback
    Created on : 30 May 2024, 5:55:44 pm
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
        <title>Feedback List</title>
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
                        </div>
                        <div class="card-body">
                            <form action="${pageContext.request.contextPath}/searchfeedback?index=1" method="post" class="form-inline mb-3">
                                <input type="text" name="txtSearch" class="form-control mr-2" size="15" required>
                                <button type="submit" name="button" class="btn btn-primary">Search</button>
                            </form>

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
                                <table class="table table-bordered"  width="100%" cellspacing="0">
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
                                        <c:forEach var="feedback" items="${allfeedback}">
                                            <tr>
                                                <td>${feedback.id}</td>
                                                <td>${feedback.customer}</td>
                                                <td>${feedback.product}</td>
                                                <td>${feedback.ratedStar}</td>
                                                <td><c:choose>
                                                        <c:when test="${feedback.status == 1}">
                                                            Show
                                                        </c:when>
                                                        <c:otherwise>
                                                            Hide
                                                        </c:otherwise>
                                                    </c:choose></td>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/listfeedback?mode=4&id=${feedback.getId()}" class="btn btn-info btn-sm">View Detail</a>
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

