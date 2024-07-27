<%-- 
    Document   : SearchSlider
    Created on : 24 May 2024, 11:34:31 pm
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
        <title>Marketing - Search Slider</title>
        <style>
            .fixed-size-img {
                width: 300px;  /* Set your desired width */
                height: 200px; /* Set your desired height */
                object-fit: cover; /* Ensure the image covers the entire area */
            }
        </style>
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

                            <div class="row">
                                <c:forEach items="${list}" var="q">
                                    <div class="col-lg-4 col-md-6 mb-4">
                                        <div class="card h-100">
                                            <img class="card-img-top fixed-size-img" src="${pageContext.request.contextPath}/images/${q.getImage()}" alt="${q.getTitle()}">
                                            <div class="card-body">
                                                <h4 class="card-title">${q.getTitle()}</h4>
                                                <p class="card-text"><strong>Notes:</strong> ${q.getNote()}</p>
                                                <p class="card-text"><strong>Start Date:</strong> ${q.getStartDate()}</p>
                                                <p class="card-text"><strong>End Date:</strong> ${q.getEndDate()}</p>
                                            </div>
                                            <div class="card-footer">
                                                <a href="${pageContext.request.contextPath}/edit?mode=1&id=${q.id}" class="btn btn-warning btn-sm">Edit</a>
                                                <a href="${pageContext.request.contextPath}/detail?mode=2&id=${q.getId()}" class="btn btn-info btn-sm">View Detail</a>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>

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
