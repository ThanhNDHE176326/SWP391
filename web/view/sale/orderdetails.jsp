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

    <title>Saler - Order Details</title>

    <!-- Custom fonts for this template-->
    <link href="<c:url value='/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">

    <!-- Page level plugin CSS-->
    <link href="<c:url value='/vendor/datatables/dataTables.bootstrap4.css'/>" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<c:url value='/css/sb-admin.css'/>" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/css/colReorder-bootstrap4.css'/>">

    <!-- Additional custom styles for better appearance -->
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fc;
            color: #333;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1, h2 {
            color: #4e73df;
            text-align: center;
            margin-bottom: 20px;
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

        .sticky-footer {
            background-color: #f8f9fc;
            padding: 10px 0;
            text-align: center;
            position: fixed;
            bottom: 0;
            width: 100%;
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
            background-color: #2e59d9;
        }

        .modal-body {
            text-align: center;
        }

        .btn-primary {
            background-color: #4e73df;
            border-color: #4e73df;
        }

        .btn-primary:hover {
            background-color: #2e59d9;
            border-color: #2653d4;
        }
    </style>
</head>

<body id="page-top">
    <jsp:include page="headersale.jsp"/>

    <div id="wrapper">
        <!-- Sidebar -->
        <jsp:include page="navbarsale.jsp"/>

        <div class="container">
            <h1>Order Details</h1>
            <div>
                <p><strong>Order ID:</strong> ${order.id}</p>
                <p><strong>Customer:</strong> ${order.customer_name}</p>
                <p><strong>Total Cost:</strong> ${order.totalCost}</p>
                <p><strong>Order Date:</strong> ${order.orderDate}</p>
                <p><strong>Address:</strong> ${order.address}</p>
                <p><strong>Phone:</strong> ${order.phone}</p>
                <form action="${pageContext.request.contextPath}/saleorderdetails" method="post" class="form-inline">
                    <input type="hidden" name="orderId" value="${order.id}">
                    <div class="form-group">
                        <label for="statusId" class="mr-2">Status:</label>
                        <select name="statusId">
                            <c:forEach var="status" items="${orderStatusList}">
                                <option value="${status.id}" ${status.id eq order.status_id ? 'selected' : ''}>${status.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">Update Status</button>
                </form>
            </div>

            <h2>Order Items</h2>
            <table>
                <tr>
                    <th>Product ID</th>
                    <th>Quantity</th>
                </tr>
                <c:forEach var="detail" items="${orderDetails}">
                    <tr>
                        <td>${detail.product}</td>
                        <td>${detail.quantity}</td>
                    </tr>
                </c:forEach>
            </table>
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

    <!-- Bootstrap core JavaScript-->
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