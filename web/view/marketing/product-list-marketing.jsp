<%-- 
    Document   : product-list-marketing
    Created on : Jun 3, 2024, 10:22:40 PM
    Author     : admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <style>
            .pagination-button {
                display: inline-block;
                padding: 10px 15px;
                margin: 5px;
                text-decoration: none;
                color: #333;
                border: 1px solid #ddd;
                border-radius: 5px;
                transition: background-color 0.3s ease, border-color 0.3s ease;
            }

            .pagination-button:hover {
                background-color: #f0f0f0;
                border-color: #ccc;
            }

        </style>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
            />
        <meta name="description" content="" />
        <meta name="author" content="" />

        <title>SB Admin - Products List</title>

        <!-- Custom fonts for this template-->
        <link
            href="vendor/fontawesome-free/css/all.min.css"
            rel="stylesheet"
            type="text/css"
            />

        <!-- Page level plugin CSS-->
        <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet" />

        <!-- Custom styles for this template-->
        <link href="css/sb-admin.css" rel="stylesheet" />
    </head>

    <body id="page-top">
        <nav class="navbar navbar-expand navbar-dark bg-dark static-top">
            <a class="navbar-brand mr-1" href="index.html">Start Bootstrap</a>

            <button
                class="btn btn-link btn-sm text-white order-1 order-sm-0"
                id="sidebarToggle"
                href="#"
                >
                <i class="fas fa-bars"></i>
            </button>

            <!-- Navbar Search -->
            <form
                class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0"
                >
                <div class="input-group">
                    <input
                        type="text"
                        class="form-control"
                        placeholder="Search for..."
                        aria-label="Search"
                        aria-describedby="basic-addon2"
                        />
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
                    <a
                        class="nav-link dropdown-toggle"
                        href="#"
                        id="alertsDropdown"
                        role="button"
                        data-toggle="dropdown"
                        aria-haspopup="true"
                        aria-expanded="false"
                        >
                        <i class="fas fa-bell fa-fw"></i>
                        <span class="badge badge-danger">9+</span>
                    </a>
                    <div
                        class="dropdown-menu dropdown-menu-right"
                        aria-labelledby="alertsDropdown"
                        >
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </li>
                <li class="nav-item dropdown no-arrow mx-1">
                    <a
                        class="nav-link dropdown-toggle"
                        href="#"
                        id="messagesDropdown"
                        role="button"
                        data-toggle="dropdown"
                        aria-haspopup="true"
                        aria-expanded="false"
                        >
                        <i class="fas fa-envelope fa-fw"></i>
                        <span class="badge badge-danger">7</span>
                    </a>
                    <div
                        class="dropdown-menu dropdown-menu-right"
                        aria-labelledby="messagesDropdown"
                        >
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </li>
                <li class="nav-item dropdown no-arrow">
                    <a
                        class="nav-link dropdown-toggle"
                        href="#"
                        id="userDropdown"
                        role="button"
                        data-toggle="dropdown"
                        aria-haspopup="true"
                        aria-expanded="false"
                        >
                        <i class="fas fa-user-circle fa-fw"></i>
                    </a>
                    <div
                        class="dropdown-menu dropdown-menu-right"
                        aria-labelledby="userDropdown"
                        >
                        <a class="dropdown-item" href="#">Settings</a>
                        <a class="dropdown-item" href="#">Activity Log</a>
                        <div class="dropdown-divider"></div>
                        <a
                            class="dropdown-item"
                            href="#"
                            data-toggle="modal"
                            data-target="#logoutModal"
                            >Logout</a
                        >
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
                    <a
                        class="nav-link dropdown-toggle"
                        href="#"
                        id="pagesDropdown"
                        role="button"
                        data-toggle="dropdown"
                        aria-haspopup="true"
                        aria-expanded="false"
                        >
                        <i class="fas fa-fw fa-folder"></i>
                        <span>Pages</span>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="pagesDropdown">
                        <h6 class="dropdown-header">Login Screens:</h6>
                        <a class="dropdown-item" href="login.html">Login</a>
                        <a class="dropdown-item" href="register.html">Register</a>
                        <a class="dropdown-item" href="forgot-password.html"
                           >Forgot Password</a
                        >
                        <div class="dropdown-divider"></div>
                        <h6 class="dropdown-header">Other Pages:</h6>
                        <a class="dropdown-item" href="404.html">404 Page</a>
                        <a class="dropdown-item" href="blank.html">Blank Page</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="charts.html">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>Charts</span></a
                    >
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="tables.html">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Products List</span></a
                    >
                </li>
            </ul>

            <div id="content-wrapper">
                <div class="container-fluid">
                    <!-- Breadcrumbs-->
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="#">Dashboard</a>
                        </li>
                        <li class="breadcrumb-item active">Products List</li>
                    </ol>

                    <!-- DataTables Example -->
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fas fa-table"></i>
                            Data Products List
                        </div>
                        <div>
                            Search Products:
                            <form class="form-inline" action="productMarketingSearchByTitle">
                                <input type="text" name="search" placeholder="search" value="${search}"> 
                                <input type="submit" value="SEARCH"> 
                            </form>
                        </div>
                            <div>
                                <form id="categorySearch" action="productMarketingFilterByCategory">
                                    Filter by Category:
                                    <select name="categorySearch" onchange="document.getElementById('categorySearch').submit();">
                                        <option value="0" ${categorySearch eq "0" ? "selected" : ""}>ALL Category</option>
                                        <c:forEach items="${listCategory}" var="category">
                                            <option value="${category.id}" ${category.id == categorySearch ? "selected" : ""}>${category.name}</option>
                                        </c:forEach>
                                    </select>
                                </form>
                            </div>
                            <div>
                                <form id="statusSearch" action="productMarketingFilterByStatus">
                                    Filter by Status:
                                    <select name="statusSearch" onchange="document.getElementById('statusSearch').submit();">
                                        <option value="all" ${statusSearch eq "all"? "selected":""}>All Status</option>
                                        <option value="show" ${statusSearch eq "show"? "selected":""}>Show</option>
                                        <option value="hide"${statusSearch eq "hide"? "selected":""}>Hide</option>
                                    </select>  
                                </form>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table
                                        class="table table-bordered"
                                        id="dataTable"
                                        width="100%"
                                        cellspacing="0"
                                        >
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th><a href="sortList?listType=${listTypeFromServlet}&field=title&mode=${mode}">Title</a></th>
                                                <th>Author</th>
                                                <th>Image</th>
                                                <th><a href="sortList?listType=${listTypeFromServlet}&field=category&mode=${mode}&categoryID=${categoryID}">Category</a></th>
                                                <th><a href="sortList?listType=${listTypeFromServlet}&field=original_price&mode=${mode}">Original Price</a></th>
                                                <th><a href="sortList?listType=${listTypeFromServlet}&field=sale_price&mode=${mode}">Sale Price</a></th>
                                                <th>Stock</th>
                                                <!--<th>Brief Info</th>-->
                                                <th><a href="sortList?listType=${listTypeFromServlet}&field=status&mode=${mode}&statusMode=${statusModeFromServlet}">Status</a></th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>ID</th>
                                                <th><a href="sortList?listType=${listTypeFromServlet}&field=title&mode=${mode}">Title</a></th>
                                                <th>Author</th>
                                                <th>Image</th>
                                                <th><a href="sortList?listType=${listTypeFromServlet}&field=category&mode=${mode}&categoryID=${categoryID}">Category</a></th>
                                                <th><a href="sortList?listType=${listTypeFromServlet}&field=original_price&mode=${mode}">Original Price</a></th>
                                                <th><a href="sortList?listType=${listTypeFromServlet}&field=sale_price&mode=${mode}">Sale Price</a></th>
                                                <th>Stock</th>
                                                <!--<th>Brief Info</th>-->
                                                <th><a href="sortList?listType=${listTypeFromServlet}&field=status&mode=${mode}&statusMode=${statusModeFromServlet}">Status</a></th>
                                                <th>Action</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>

                                            <c:forEach items="${listProduct}" var="product">
                                                <tr>
                                                    <td><input type="text" name="productID" readonly="" value="${product.id}"></td>
                                                    <td>${product.title}</td>
                                                    <td>${product.author}</td>
                                                    <td><img src="${product.image}" width="125px" height="125px"/></td>
                                                    <td>${product.category}</td>
                                                    <td>${product.originalPrice}</td>
                                                    <td>${product.salePrice}</td>

                                                    <c:if test="${product.quantity > 0}">
                                                        <td style="color: green">In Stock</td>
                                                    </c:if>
                                                    <c:if test="${product.quantity == 0}">
                                                        <td style="color: red">Out stock</td>
                                                    </c:if>

                                                    <!--<td>${product.description}</td>-->

                                                    <c:if test="${product.status == 1}">
                                                        <td style="color: blue">Show</td>
                                                    </c:if>
                                                    <c:if test="${product.status == 0}">
                                                        <td style="color: red">Hide</td>
                                                    </c:if>
                                                    <td>
                                                        <div>
                                                            <button type="button">
                                                                <a href="changeStatus?productID=${product.id}&status=${product.status}">
                                                                    <c:if test="${product.status == 1}">
                                                                        <span style="color: blue">Change Status</span>
                                                                    </c:if>
                                                                    <c:if test="${product.status == 0}">
                                                                        <span style="color: red">Change Status</span>
                                                                    </c:if>
                                                                </a>
                                                            </button>
                                                        </div>
                                                        <div>
                                                            <a href="viewProductDetailMarketing?id=${product.id}">View Details</a>
                                                        </div>  
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <c:forEach begin="1" end="${endPage}" var="i">
                                        <a href="${urlServlet}?index=${i}" class="pagination-button">${i}&nbsp;</a>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="card-footer small text-muted">
                                Updated yesterday at 11:59 PM
                            </div>
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
            <div
                class="modal fade"
                id="logoutModal"
                tabindex="-1"
                role="dialog"
                aria-labelledby="exampleModalLabel"
                aria-hidden="true"
                >
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                            <button
                                class="close"
                                type="button"
                                data-dismiss="modal"
                                aria-label="Close"
                                >
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Select "Logout" below if you are ready to end your current session.
                        </div>
                        <div class="modal-footer">
                            <button
                                class="btn btn-secondary"
                                type="button"
                                data-dismiss="modal"
                                >
                                Cancel
                            </button>
                            <a class="btn btn-primary" href="login.html">Logout</a>
                        </div>
                    </div>
                </div>
            </div>

            <!--         Bootstrap core JavaScript
                    <script src="vendor/jquery/jquery.min.js"></script>
                    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>-->

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
