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
        <title>Admin - User List</title>

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
                        document.addEventListener("DOMContentLoaded", function () {
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
                                <span>Book Haven</span>
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

    </body>
</html>
