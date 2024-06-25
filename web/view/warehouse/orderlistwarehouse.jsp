<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Saler - Dashboard</title>
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f8f9fc;
            }
            .container {
                max-width: 1200px;
                margin: 20px auto;
            }
            h1, h2 {
                color: #4e73df;
                text-align: center;
                margin-bottom: 20px;
            }
            form {
                display: flex;
                justify-content: center;
                margin-bottom: 20px;
            }
            form label {
                margin: 0 10px;
            }
            form input, form button {
                margin: 0 10px;
                padding: 5px 10px;
                font-size: 1rem;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }
            table, th, td {
                border: 1px solid #ddd;
            }
            th, td {
                padding: 10px;
                text-align: center;
            }
            th {
                background-color: #4e73df;
                color: white;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            tr:hover {
                background-color: #ddd;
            }
            .sticky-footer {
                background-color: #f8f9fc;
                padding: 10px 0;
            }
            .sticky-footer .container {
                text-align: center;
            }
            .scroll-to-top {
                position: fixed;
                bottom: 1rem;
                right: 1rem;
                width: 2.75rem;
                height: 2.75rem;
                text-align: center;
                color: white;
                background-color: #4e73df;
                border-radius: 50%;
                display: none;
            }
            .scroll-to-top:hover {
                color: white;
                background-color: #2e59d9;
            }
        </style>

    </head>

    <body id="page-top">
        <jsp:include page="headerwarehouse.jsp"/>
        <!-- Page Wrapper -->
        <div id="wrapper">
            <!-- Sidebar -->
            <jsp:include page="navbarwarehouse.jsp"/>
            <!-- Sidebar -->


            <div id="content-wrapper">
                <div class="container-fluid">
                    <h1>Orders List</h1>
                    <form action="${pageContext.request.contextPath}/saleorderlist" method="get" style="margin-bottom: 20px;">
                        <div class="form-row justify-content-center">
                            <div class="form-group col-md-3">
                                <label for="orderId">Order ID:</label>
                                <input type="text" class="form-control" id="orderId" name="orderId" value="${param.orderId}">
                            </div>
                            <div class="form-group col-md-3">
                                <label for="statusId">Status:</label>
                                <select class="form-control" id="statusId" name="statusId">
                                    <option value="">All</option>
                                    <c:forEach var="status" items="${orderStatusList}">
                                        <option value="${status.id}" ${param.statusId == status.id ? 'selected' : ''}>${status.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <!--                            <div class="form-group col-md-3">
                                                            <label for="fromDate">From Date:</label>
                                                            <input type="date" class="form-control" id="fromDate" name="fromDate" value="${param.fromDate}" required>
                                                        </div>
                                                        <div class="form-group col-md-3">
                                                            <label for="toDate">To Date:</label>
                                                            <input type="date" class="form-control" id="toDate" name="toDate" value="${param.toDate}" required>
                                                        </div>-->
                            <!--                            <div class="form-group col-md-3">
                                                            <label for="staffName">Staff Name:</label>
                                                            <input type="text" class="form-control" id="staffName" name="staffName" value="${param.staffName}">
                                                        </div>-->
                            <div class="form-group col-md-3">
                                <label for="customerName">Customer Name:</label>
                                <input type="text" class="form-control" id="customerName" name="customerName" value="${param.customer_name}">
                            </div>
                            <div class="form-group col-md-3" style="margin:24px">
                                <button type="submit" class="btn btn-primary">Filter</button>
                            </div>
                        </div>
                    </form>


                    <table>
                        <thead>
                            <tr>
                                <th >ID</th>
                                <th >Customer</th>
                                <th >Total Cost</th>
                                <th >Order Date</th>
                                <<th>Action</th>
                                <th >Update Status</th>
                                <th >Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="order" items="${orders}">
                                <tr>
                                    <td><a href="saleorderdetails?id=${order.id}">${order.id}</a></td>
                                    <td>${order.customer_name}</td>
                                    <td>${order.totalCost}</td>
                                    <td>${order.orderDate}</td>
                                    <td><a href="saleorderdetails?id=${order.id}" class="btn btn-info">View Details</a></td>
                                    <td>
                                        <form action="${pageContext.request.contextPath}/warehouseorderlist" method="post">
                                            <input type="hidden" name="orderId" value="${order.id}">
                                            <select name="statusId">
                                                <c:forEach var="status" items="${orderStatusList}">
                                                    <option value="${status.id}" ${order.status_id == status.id ? 'selected' : ''}>${status.name}</option>
                                                </c:forEach>
                                            </select>
                                            <button type="submit">Update</button>
                                        </form>
                                    </td>
                                    <td>${order.status_name}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <div>
                        <c:if test="${currentPage > 1}">
                            <a href="${pageContext.request.contextPath}/warehouseorderlist?page=${currentPage - 1}&statusId=${statusId}&orderId=${orderId}">Previous</a>
                        </c:if>
                        <c:forEach begin="1" end="${totalPages}" var="i">
                            <c:url var="pageUrl" value="/saleorderlist">
                                <c:param name="page" value="${i}" />
                                <c:if test="${not empty statusId}">
                                    <c:param name="statusId" value="${statusId}" />
                                </c:if>
                                <c:if test="${not empty orderId}">
                                    <c:param name="orderId" value="${orderId}" />
                                </c:if>
                            </c:url>
                            <a href="${pageUrl}">${i}</a>
                        </c:forEach>
                        <c:if test="${currentPage < totalPages}">
                            <a href="${pageContext.request.contextPath}/warehouseorderlist?page=${currentPage + 1}&statusId=${statusId}&orderId=${orderId}">Next</a>
                        </c:if>
                    </div>
                </div>
                <!-- /.container-fluid -->
                <footer class="sticky-footer">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Copyright © Your Website 2019</span>
                        </div>
                    </div>
                </footer>

            </div>
            <!-- /.content-wrapper -->

            <!-- Scroll to Top Button-->
            <a class="scroll-to-top rounded" href="#page-top">
                <i class="fas fa-angle-up"></i>
            </a>

            <!-- Logout Modal-->
            <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
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
