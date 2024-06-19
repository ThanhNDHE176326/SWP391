<%-- 
    Document   : searchuser
    Created on : 18 June 2024, 11:17:53 am
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
    <title>User List</title>

    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom fonts for this template-->
    <link href="<c:url value='/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">
    <!-- Page level plugin CSS-->
    <link href="<c:url value='/vendor/datatables/dataTables.bootstrap4.css'/>" rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="<c:url value='/css/sb-admin.css'/>" rel="stylesheet">
</head>
<body id="page-top">
    <jsp:include page="headeradmin.jsp"/>

    <div id="wrapper">
        <!-- Sidebar -->
        <jsp:include page="navbaradmin.jsp"/>

        <div id="content-wrapper">
            <div class="container-fluid">
                <!-- Breadcrumbs-->
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="homedashboardadmin.jsp">Dashboard</a>
                    </li>
                    <li class="breadcrumb-item active">User List</li>
                </ol>

                <!-- User List -->
                <div class="card mb-3">
                    <div class="card-header d-flex justify-content-between align-items-center">
                            <div>
                                <i class="fas fa-table"></i>
                               Search User
                            </div>
                            <div>
                                <a href="${pageContext.request.contextPath}/adduser" class="btn btn-primary">Add New User</a>
                            </div>
                        </div>
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/searchuser?index=1" method="post" class="form-inline mb-3">
                            <input type="text" name="txtSearch" class="form-control mr-2" size="15" required>
                            <button type="submit" name="button" class="btn btn-primary">Search</button>
                        </form>

                        <form id="statusSearch" action="${pageContext.request.contextPath}/FilterUserByStatus" class="form-inline mb-3">
                            <label for="statusSearch" class="mr-2">Filter by Status:</label>
                            <select name="statusSearch" class="form-control" onchange="document.getElementById('statusSearch').submit();">
                                <option value="all" ${statusSearch eq "all"? "selected":""}>All Status</option>
                                <option value="1" ${statusSearch eq "1"? "selected":""}>Active</option>
                                <option value="0" ${statusSearch eq "0"? "selected":""}>Inactive</option>
                                
                            </select>
                        </form>

                        <form id="roleSearch" action="${pageContext.request.contextPath}/FilterUserByRole" class="form-inline mb-3">
                            <label for="roleSearch" class="mr-2">Filter by Role:</label>
                            <select name="roleSearch" class="form-control" onchange="document.getElementById('roleSearch').submit();">
                                <option value="1" ${roleSearch eq "1"? "selected":""}>Admin</option>
                                <option value="2" ${roleSearch eq "2"? "selected":""}>Manager</option>
                                <option value="3" ${roleSearch eq "3"? "selected":""}>Staff</option>
                            </select>
                        </form>

                        <form id="genderSearch" action="${pageContext.request.contextPath}/FilterUserByGender" class="form-inline mb-3">
                            <label for="genderSearch" class="mr-2">Filter by Gender:</label>
                            <select name="genderSearch" class="form-control" onchange="document.getElementById('genderSearch').submit();">
                                <option value="all" ${genderSearch eq "all"? "selected":""}>All</option>
                                <option value="true" ${genderSearch eq "true"? "selected":""}>Male</option>
                                <option value="false" ${genderSearch eq "false"? "selected":""}>Female</option>
                            </select>
                        </form>

                        <div class="table-responsive">
                            <table id="userTable" class="table table-bordered" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Full Name</th>
                                        <th>Email</th>
                                        <th>Gender</th>
                                        <th>Mobile</th>
                                        <th>Role</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody id="tableBody">
                                    <c:forEach var="user" items="${listuser}">
                                        <tr>
                                            <td>${user.id}</td>
                                            <td>${user.fullname}</td>
                                            <td>${user.email}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${user.gender == 1}">
                                                        Male
                                                    </c:when>
                                                    <c:otherwise>
                                                        Female
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>${user.phone}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${user.role == 1}">
                                                        Admin
                                                    </c:when>
                                                    <c:when test="${user.role == 2}">
                                                        Sale
                                                    </c:when>
                                                    <c:when test="${user.role == 3}">
                                                        Sale Manager
                                                    </c:when>
                                                    <c:when test="${user.role == 4}">
                                                        Marketer
                                                    </c:when>
                                                    <c:otherwise>
                                                        Unknown
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${user.status == 1}">
                                                        Active
                                                    </c:when>
                                                    <c:otherwise>
                                                        Inactive
                                                    </c:otherwise>
                                                </c:choose>
                                                </td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/listuser?mode=10&id=${user.id}" class="btn btn-info btn-sm">View Detail</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <!-- Pagination controls -->
                        <div class="text-center">
                            <ul id="pagination" class="pagination">
                                <!-- Pagination items will be added here by JavaScript -->
                            </ul>
                        </div>
                    </div>
                </div>

                <script>
                document.addEventListener("DOMContentLoaded", function() {
                    const rowsPerPage = 5;
                    const rows = Array.from(document.querySelectorAll("#tableBody tr"));
                    const paginationControls = document.getElementById("pagination");
                    const totalPages = Math.ceil(rows.length / rowsPerPage);

                    function displayRows(page) {
                        const start = (page - 1) * rowsPerPage;
                        const end = start + rowsPerPage;
                        rows.forEach((row, index) => {
                            row.style.display = (index >= start && index < end) ? '' : 'none';
                        });
                    }

                    function setupPagination() {
                        paginationControls.innerHTML = '';
                        for (let i = 1; i <= totalPages; i++) {
                            const li = document.createElement('li');
                            li.classList.add('page-item');
                            const a = document.createElement('a');
                            a.classList.add('page-link');
                            a.href = '#';
                            a.textContent = i;
                            a.addEventListener('click', (event) => {
                                event.preventDefault();
                                displayRows(i);
                                document.querySelectorAll('#pagination .page-item').forEach(item => item.classList.remove('active'));
                                li.classList.add('active');
                            });
                            li.appendChild(a);
                            paginationControls.appendChild(li);
                        }
                        // Set the first page as active
                        if (paginationControls.firstChild) {
                            paginationControls.firstChild.classList.add('active');
                        }
                    }

                    displayRows(1);
                    setupPagination();
                });
                </script>

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
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
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
