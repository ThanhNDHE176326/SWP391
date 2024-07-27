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

        <title>Marketing-Customer List</title>
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
                        <li class="breadcrumb-item active">CUSTOMERS LIST</li>
                    </ol>

                    <!-- DataTables Example -->
                    <div class="card mb-3">
                        <div class="card-header" >
                            <i class="fas fa-table"></i>
                            CUSTOMERS LIST
                            <a href="${pageContext.request.contextPath}/view/marketing/addcustomer.jsp" class="btn btn-success" style="float: right; margin-right: 10px;">Add New Customer</a>
                        </div>

                        <body>
                            <div class="form-container">
                                <form action="${pageContext.request.contextPath}/StatusCustomer?index=1" method="get">
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

                                <form action="${pageContext.request.contextPath}/SearchControl?index=1" method="POST">
                                    <label>Searching:</label>
                                    <input class="" type="text" name="txtSearch" size="15" value="${txtSearch}" >
                                    <input class="" type="submit" name="btnGo" value="Go">
                                </form>
                            </div>

                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" width="100%" cellspacing="0">
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
                                                        <form action="${pageContext.request.contextPath}/EditCustomer" method="POST">
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
    </body>

</html>



