<%-- 
    Document   : userdetail
    Created on : 18 June 2024, 1:06:39 pm
    Author     : dat ngo huy
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>User List</title>
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
                        <div class="card-header">
                            <i class="fas fa-table"></i>
                            User List
                            <form action="${pageContext.request.contextPath}/searchuser?index=1" method="post" class="form-inline float-right">
                                <input type="text" name="txtSearch" class="form-control mr-2" size="15" required>
                                <button type="submit" class="btn btn-primary">Search</button>
                            </form>
                        </div>
                        <div class="card-body">     
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
                                    <option value="2" ${roleSearch eq "2"? "selected":""}>Sale</option>
                                    <option value="3" ${roleSearch eq "3"? "selected":""}>Sale Manager</option>
                                    <option value="4" ${roleSearch eq "4"? "selected":""}>Marketer</option>
                                </select>  
                            </form>

                            <form id="genderSearch" action="${pageContext.request.contextPath}/FilterUserByGender" class="form-inline mb-3">
                                <label for="genderSearch" class="mr-2">Filter by Gender:</label>
                                <select name="genderSearch" class="form-control" onchange="document.getElementById('genderSearch').submit();">

                                    <option value="1" ${genderSearch eq "1"? "selected":""}>Male</option>
                                    <option value="0" ${genderSearch eq "0"? "selected":""}>Female</option>
                                </select>  
                            </form>

                            <div class="table-responsive">
                                <table class="table table-bordered" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>

                                            <th>ID</th>
                                            <th>Full Name</th>
                                            <th>UserName</th>
                                            <th>Password</th>
                                            <th>Email</th>
                                            <th>Gender</th>                          
                                            <th>Mobile</th>
                                            <th>Address</th>
                                            <th>Role</th>
                                            <th>Status</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="user" items="${userdetail}">
                                            <tr>

                                                <td>${user.id}</td>
                                                <td>${user.fullname}</td>
                                                <td>${user.username}</td>
                                                <td>${user.password}</td>         
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
                                                <td>${user.address}</td>
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
                                                    <a href="${pageContext.request.contextPath}/edituser?id=${user.id}" class="btn btn-warning btn-sm">Edit</a>

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

