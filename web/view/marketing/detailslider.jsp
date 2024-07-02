<%-- 
    Document   : DetailSlider
    Created on : 25 May 2024, 4:16:27 am
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
        <title>Search Slider</title>
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
                        <li class="breadcrumb-item active">Search Slider</li>
                    </ol>

                    <!-- Search Form -->
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fas fa-search"></i>
                            Search Sliders
                        </div>
                        <div class="card-body">
                            <form action="${pageContext.request.contextPath}/search?index=1" method="post" class="form-inline mb-3">
                                <input type="text" name="txtSearch" class="form-control mr-2" placeholder="Search..." required>
                                <button type="submit" name="button" class="btn btn-primary">Search</button>
                            </form>

                            <!-- Slider Table -->
                            <div class="table-responsive">
                                <table class="table table-bordered" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Title</th>
                                            <th>Image</th>
                                            <th>Notes</th>
                                            <th>Staff</th>
                                            <th>Start Date</th>
                                            <th>End Date</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>${slider.getId()}</td>
                                            <td>${slider.getTitle()}</td>
                                            <td><img src="${pageContext.request.contextPath}/images/${slider.getImage()}" alt="${slider.getTitle()}" class="img-fluid" /></td>
                                            <td>${slider.getNote()}</td>
                                            <td>${slider.getStaff()}</td>
                                            <td>${slider.getStartDate()}</td>
                                            <td>${slider.getEndDate()}</td>
                                            <td><c:choose>
                                                        <c:when test="${slider.status == 1}">
                                                            Show
                                                        </c:when>
                                                        <c:otherwise>
                                                            Hide
                                                        </c:otherwise>
                                                    </c:choose></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <!-- Pagination -->
                            <div class="pagination">
                                <nav>
                                    <ul class="pagination justify-content-center">
                                        <c:forEach begin="1" end="${end}" var="i">
                                            <li class="page-item">
                                                <a class="page-link" id="${i}" href="${pageContext.request.contextPath}/search?index=${i}&txtSearch=${txtSearch}">${i}</a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </nav>
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

