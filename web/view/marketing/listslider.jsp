<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Marketing - Slider List</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        .fixed-size-img {
            width: 150px; /* Set your desired width */
            height: 100px; /* Set your desired height */
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
                    <li class="breadcrumb-item active">Slider List</li>
                </ol>

                <!-- Slider List -->
                <div class="card mb-3">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <div>
                            <i class="fas fa-images"></i>
                            Slider List
                        </div>
                        <a href="view/marketing/create-new-slider.jsp" class="btn btn-success btn-sm">Add New Slider</a>
                    </div>
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/search?index=1" method="post" class="form-inline mb-3">
                            <input type="text" name="txtSearch" class="form-control mr-2" size="15" required>
                            <button type="submit" name="button" class="btn btn-primary">Search</button>
                        </form>

                        <form id="statusSearch" action="${pageContext.request.contextPath}/filter" class="form-inline mb-3">
                            <label for="statusSearch" class="mr-2">Filter by Status:</label>
                            <select name="statusSearch" class="form-control" onchange="document.getElementById('statusSearch').submit();">
                                <option value="all" ${statusSearch eq "all"? "selected":""}>All Status</option>
                                <option value="show" ${statusSearch eq "show"? "selected":""}>Show</option>
                                <option value="hide" ${statusSearch eq "hide"? "selected":""}>Hide</option>
                            </select>  
                        </form>

                        <div class="table-responsive">
                            <table id="sliderTable" class="table table-bordered" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>Title</th>
                                        <th>Image</th>
                                        <th>Notes</th>
                                        <th>Start Date</th>
                                        <th>End Date</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody id="tableBody">
                                    <c:forEach items="${listslider}" var="q">
                                        <tr>
                                            <td>${q.getTitle()}</td>
                                            <td><img class="fixed-size-img" src="${pageContext.request.contextPath}/images/${q.getImage()}" alt="${q.getTitle()}"></td>
                                            <td>${q.getNote()}</td>
                                            <td>${q.getStartDate()}</td>
                                            <td>${q.getEndDate()}</td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/edit?mode=1&id=${q.id}" class="btn btn-warning btn-sm">Edit</a>
                                                <a href="${pageContext.request.contextPath}/detail?mode=2&id=${q.getId()}" class="btn btn-info btn-sm">View Detail</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <div id="pagination" class="mt-3"></div>
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

    <!-- jQuery, Popper.js, Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const table = document.getElementById('sliderTable');
            const tableBody = document.getElementById('tableBody');
            const pagination = document.getElementById('pagination');
            const rowsPerPage = 5;
            let currentPage = 1;

            function displayTable(page) {
                const rows = tableBody.getElementsByTagName('tr');
                const totalRows = rows.length;
                const totalPages = Math.ceil(totalRows / rowsPerPage);

                for (let i = 0; i < totalRows; i++) {
                    rows[i].style.display = 'none';
                }

                const start = (page - 1) * rowsPerPage;
                const end = Math.min(start + rowsPerPage, totalRows);

                for (let i = start; i < end; i++) {
                    rows[i].style.display = '';
                }

                displayPagination(totalPages);
            }

            function displayPagination(totalPages) {
                pagination.innerHTML = '';
                for (let i = 1; i <= totalPages; i++) {
                    const pageLink = document.createElement('a');
                    pageLink.href = '#';
                    pageLink.innerText = i;
                    pageLink.className = 'page-link';
                    pageLink.addEventListener('click', function(e) {
                        e.preventDefault();
                        currentPage = i;
                        displayTable(currentPage);
                    });
                    pagination.appendChild(pageLink);
                }
            }

            displayTable(currentPage);
        });
    </script>

</body>

</html>
