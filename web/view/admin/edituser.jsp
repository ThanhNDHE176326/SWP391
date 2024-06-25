<%-- 
    Document   : edituser
    Created on : 18 June 2024, 8:19:15 pm
    Author     : dat ngo huy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Edit User</title>
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
                    <li class="breadcrumb-item active">Edit User</li>
                </ol>

                <!-- Edit Form -->
                <div class="card mb-3">
                    <div class="card-header d-flex justify-content-between align-items-center">
                            <div>
                                <i class="fas fa-table"></i>
                                Edit User
                            </div>
                            <div>
                                <a href="${pageContext.request.contextPath}/adduser" class="btn btn-primary">Add New User</a>
                            </div>
                        </div>
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/edituser" method="post">
                            <div class="form-group row">
                                <label for="id" class="col-sm-2 col-form-label">ID</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="id" value="${user.id}" readonly>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="email" class="col-sm-2 col-form-label">Email</label>
                                <div class="col-sm-10">
                                    <input type="email" class="form-control" name="email" value="${user.email}" required>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="fullname" class="col-sm-2 col-form-label">Full Name</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="fullname" value="${user.fullname}" required>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="username" class="col-sm-2 col-form-label">Username</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="username" value="${user.username}" required>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="password" class="col-sm-2 col-form-label">Password</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" name="password" value="${user.password}" required>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="gender" class="col-sm-2 col-form-label">Gender</label>
                                <div class="col-sm-10">
                                    <select name="gender" class="form-control">
                                        <option value="Male" ${user.gender == 'Male' ? "selected" : ""}>Male</option>
                                        <option value="Female" ${user.gender == 'Female' ? "selected" : ""}>Female</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="phone" class="col-sm-2 col-form-label">Phone</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="phone" value="${user.phone}" required>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="address" class="col-sm-2 col-form-label">Address</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="address" value="${user.address}" required>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="role" class="col-sm-2 col-form-label">Role</label>
                                <div class="col-sm-10">
                                    <select name="role" class="form-control">
                                        <option value="1" ${user.role == '1' ? "selected" : ""}>Admin</option>
                                        <option value="2" ${user.role == '2' ? "selected" : ""}>Sale</option>
                                        <option value="3" ${user.role == '3' ? "selected" : ""}>Sale Manager</option>
                                        <option value="4" ${user.role == '4' ? "selected" : ""}>Marketer</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="status" class="col-sm-2 col-form-label">Status</label>
                                <div class="col-sm-10">
                                    <select name="status" class="form-control">
                                        <option value="1" ${user.status == '1' ? "selected" : ""}>Active</option>
                                        <option value="0" ${user.status == '0' ? "selected" : ""}>Inactive</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-sm-10 offset-sm-2">
                                    <button type="submit" class="btn btn-primary">Edit</button>
                                </div>
                            </div>
                        </form>
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
