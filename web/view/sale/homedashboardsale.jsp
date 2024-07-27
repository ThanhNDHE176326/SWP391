<%-- 
    Document   : dashboard
    Created on : Jun 8, 2024, 6:08:29 PM
    Author     : admin
--%>

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

        <title>Sale - Dashboard</title>

        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f8f9fc;
            }

            .container {
                max-width: 1200px;
                margin: 20px auto;
            }

            h1 {
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

            .modal-body {
                text-align: center;
            }
        </style>

    </head>

    <body id="page-top">

        <jsp:include page="headersale.jsp"/>

        <div id="wrapper">
            <!-- Sidebar -->
            <jsp:include page="navbarsale.jsp"/>

            <div class="container">
                <h1>Dashboard</h1>

                <form method="get" action="${pageContext.request.contextPath}/saledashboard">
                    <label for="fromDate">From Date:</label>
                    <input type="date" id="fromDate" name="fromDate" required>
                    <label for="toDate">To Date:</label>
                    <input type="date" id="toDate" name="toDate" required>
                    <button type="submit">Filter</button>
                </form>

                <h2>Order Trends</h2>
                <table>
                    <tr>
                        <th>Order ID</th>
                        <th>Customer</th>
                        <th>Total Cost</th>
                        <th>Order Date</th>
                    </tr>
                    <c:forEach var="order" items="${orders}">
                        <tr>
                            <td>${order.id}</td>
                            <td>${order.customer}</td>
                            <td>${order.totalCost}</td>
                            <td>${order.orderDate}</td>
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

    </div>
    <!-- /#wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    
</body>

</html>
