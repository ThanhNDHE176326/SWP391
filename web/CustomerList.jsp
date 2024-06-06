<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>SB Admin - Tables</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

        <!-- Page level plugin CSS-->
        <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin.css" rel="stylesheet">

    </head>

    <body id="page-top">

        <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

            <a class="navbar-brand mr-1" href="index.html">MARKETING</a>

            <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
                <i class="fas fa-bars"></i>
            </button>

            <!-- Navbar Search -->
            <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                        <button class="btn btn-primary" type="button">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>
                </div>
            </form>

            <!-- Navbar -->
            <ul class="navbar-nav ml-auto ml-md-0">
                <li class="nav-item dropdown no-arrow mx-1">
                    <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-bell fa-fw"></i>
                        <span class="badge badge-danger">9+</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </li>
                <li class="nav-item dropdown no-arrow mx-1">
                    <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-envelope fa-fw"></i>
                        <span class="badge badge-danger">7</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="messagesDropdown">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </li>
                <li class="nav-item dropdown no-arrow">
                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-user-circle fa-fw"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                        <a class="dropdown-item" href="#">Settings</a>
                        <a class="dropdown-item" href="#">Activity Log</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Logout</a>
                    </div>
                </li>
            </ul>

        </nav>

        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="sidebar navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="index.html">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span>
                    </a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-fw fa-folder"></i>
                        <span>Pages</span>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="pagesDropdown">
                        <h6 class="dropdown-header">Login Screens:</h6>
                        <a class="dropdown-item" href="login.html">Login</a>
                        <a class="dropdown-item" href="register.html">Register</a>
                        <a class="dropdown-item" href="forgot-password.html">Forgot Password</a>
                        <div class="dropdown-divider"></div>
                        <h6 class="dropdown-header">Other Pages:</h6>
                        <a class="dropdown-item" href="404.html">404 Page</a>
                        <a class="dropdown-item" href="blank.html">Blank Page</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="charts.html">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>Charts</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="PaginationCustomer">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Customers List</span></a>
                </li>
            </ul>

            <div id="content-wrapper">

                <div class="container-fluid">

                    <!-- Breadcrumbs-->
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="#">Dashboard</a>
                        </li>
                        <li class="breadcrumb-item active">CUSTOMERS LIST</li>
                    </ol>

                    <!-- DataTables Example -->
                    <div class="card mb-3">
                        <div class="card-header" >
                            <i class="fas fa-table"></i>
                            CUSTOMERS LIST
                            <a href="AddCustomer.jsp" class="btn btn-success" style="float: right; margin-right: 10px;">Add New Customer</a>
                        </div>

                        <body>
                            <div class="form-container">
                                <form action="StatusCustomer?index=1" method="get">
                                    <label>Filter by Status:</label>
                                    <input type="radio" id="allFilter" name="statusFilter" value="" <% if (request.getParameter("statusFilter") == null || request.getParameter("statusFilter").isEmpty()) { %> checked <% } %>>
                                    <label for="allFilter">ALL</label>
                                    <input type="radio" id="Customer" name="statusFilter" value="Customer" <% if ("Customer".equals(request.getParameter("statusFilter"))) { %> checked <% } %>>
                                    <label for="Customer">Customer</label>
                                    <input type="radio" id="Potential" name="statusFilter" value="Potential" <% if ("Potential".equals(request.getParameter("statusFilter"))) { %> checked <% } %>>
                                    <label for="Potential">Potential</label>
                                    <input type="radio" id="Contact" name="statusFilter" value="Contact" <% if ("Contact".equals(request.getParameter("statusFilter"))) { %> checked <% } %>>
                                    <label for="Contact">Contact</label>
                                    <button type="submit">Chọn</button>
                                </form>

                                <form action="SearchControlCustomer?index=1" method="POST">
                                    <label>Searching:</label>
                                    <input class="" type="text" name="txtSearch" size="15" value="${txtSearch}" >
                                    <input class="" type="submit" name="btnGo" value="Go">
                                </form>
                            </div>

                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Name
                                                    <div>
                                                        <a href="?index=${tag}&statusFilter=${param.statusFilter}&txtSearch=${param.txtSearch}&sort=username&order=asc">
                                                            <i class="fas fa-sort-alpha-down"></i> <!-- Icon for ascending order -->
                                                        </a>
                                                        <a href="?index=${tag}&statusFilter=${param.statusFilter}&txtSearch=${param.txtSearch}&sort=username&order=desc">
                                                            <i class="fas fa-sort-alpha-up"></i> <!-- Icon for descending order -->
                                                        </a>
                                                    </div></th>
                                                <th>Username</th>
                                                <th>Email
                                                    <div>
                                                        <a href="?index=${tag}&statusFilter=${param.statusFilter}&txtSearch=${param.txtSearch}&sort=email&order=asc">
                                                            <i class="fas fa-sort-alpha-down"></i> <!-- Icon for ascending order -->
                                                        </a>
                                                        <a href="?index=${tag}&statusFilter=${param.statusFilter}&txtSearch=${param.txtSearch}&sort=email&order=desc">
                                                            <i class="fas fa-sort-alpha-up"></i> <!-- Icon for descending order -->
                                                        </a>
                                                    </div></th>
                                                <th>Phone
                                                    <div>
                                                        <a href="?index=${tag}&statusFilter=${param.statusFilter}&txtSearch=${param.txtSearch}&sort=phone&order=asc">
                                                            <i class="fas fa-sort-numeric-down"></i> <!-- Icon for ascending order -->
                                                        </a>
                                                        <a href="?index=${tag}&statusFilter=${param.statusFilter}&txtSearch=${param.txtSearch}&sort=phone&order=desc">
                                                            <i class="fas fa-sort-numeric-up"></i> <!-- Icon for descending order -->
                                                        </a>
                                                    </div></th>
                                                <th>Address</th>
                                                <th>Gender</th>
                                                <th>Status</th>
                                                <th>Edit</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="customer" items="${customer}">
                                                <tr>
                                                    <td>${customer.id}</td>
                                                    <td>${customer.name}</td>
                                                    <td>${customer.username}</td>
                                                    <td>${customer.email}</td>
                                                    <td>${customer.phone}</td>
                                                    <td>${customer.address}</td>
                                                    <td>${customer.gender ? 'Nam' : 'Nữ'}</td>
                                                    <td>${customer.customerType}</td>
                                                    <td>
                                                        <form action="EditCustomer" method="POST">
                                                            <input type="hidden" name="id" value="${customer.id}">
                                                            <button type="submit" class="btn btn-primary">Edit</button>
                                                        </form>
                                                    </td>                                        
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <div align="center"> <!-- Canh giữa dòng -->
                                        <c:if test="${tag > 1}">
                                            <a href="?index=${tag - 1}&statusFilter=${param.statusFilter}&txtSearch=${param.txtSearch}" style="padding: 8px 16px; margin: 4px; border: 1px solid #ddd; border-radius: 4px; display: inline-block;">Previous</a><!-- comment -->
                                        </c:if>
                                        <c:forEach begin="1" end="${endP}" var="i">
                                            <a class="${tag == i ? 'active' : ''}" href="?index=${i}&statusFilter=${param.statusFilter}&txtSearch=${param.txtSearch}" style="padding: 8px 16px; margin: 4px; border: 1px solid #ddd; border-radius: 4px; display: inline-block;">${i}</a><!-- comment -->
                                        </c:forEach>
                                        <c:if test="${tag < endP}">
                                            <a href="?index=${tag + 1}&statusFilter=${param.statusFilter}&txtSearch=${param.txtSearch}" style="padding: 8px 16px; margin: 4px; border: 1px solid #ddd; border-radius: 4px; display: inline-block;">Next</a><!-- comment -->
                                        </c:if>
                                    </div>
                                </div>
                            </div>

                            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                    </div>




                    <p class="small text-center text-muted my-5">
                        <em>More table examples coming soon...</em>
                    </p>

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




        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Page level plugin JavaScript-->
        <script src="vendor/datatables/jquery.dataTables.js"></script>
        <script src="vendor/datatables/dataTables.bootstrap4.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin.min.js"></script>

        <!-- Demo scripts for this page-->
        <script src="js/demo/datatables-demo.js"></script>

    </body>

</html>



