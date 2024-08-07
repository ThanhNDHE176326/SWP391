<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Sale Admin - Dashboard</title>

        <style>
            /* Reset */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            /* Global styles */
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f8f9fc;
            }

            .container {
                max-width: 1200px;
                margin: 20px auto;
                padding: 0 15px;
            }

            h1 {
                color: #4e73df;
                text-align: center;
                margin-bottom: 20px;
                font-size: 2rem;
            }

            form {
                display: flex;
                justify-content: center;
                margin-bottom: 20px;
            }

            form label {
                margin: 0 10px;
            }

            form input,
            form button,
            form select {
                margin: 0 10px;
                padding: 5px 10px;
                font-size: 1rem;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
                font-size: 0.9rem;
            }

            table,
            th,
            td {
                border: 1px solid #ddd;
            }

            th,
            td {
                padding: 12px;
                text-align: center;
                vertical-align: middle;
            }

            th {
                background-color: #4e73df;
                color: white;
                font-size: 1rem;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            .pagination {
                margin-top: 20px;
                text-align: center;
            }

            .pagination a {
                display: inline-block;
                margin: 0 5px;
                padding: 8px 12px;
                text-decoration: none;
                background-color: #4e73df;
                color: white;
                border-radius: 3px;
                font-size: 0.9rem;
            }

            .pagination a:hover {
                background-color: #2e59d9;
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

            .form-row {
                display: flex;
                justify-content: space-between;
                align-items: center;
                flex-wrap: wrap;
            }

            .form-group {
                margin-bottom: 15px;
                flex: 1;
                min-width: 150px;
            }

            .form-group label {
                display: block;
                margin-bottom: 5px;
            }

            .form-group input,
            .form-group select,
            .form-group button {
                width: 100%;
                
            }

            button {
                background-color: #4e73df;
                color: white;
                border: none;
                cursor: pointer;
            }

            /*            button:hover {
                            background-color: #2e59d9;
                        }*/

            a.btn {
                background-color: #4e73df;
                color: white;
                padding: 5px 10px;
                text-decoration: none;
                border-radius: 3px;
            }

            a.btn:hover {
                background-color: #2e59d9;
            }
            .titleTable{
                color: #0056b3;
            }
        </style>
    </head>

    <body id="page-top">

        <jsp:include page="headersaleadmin.jsp" />

        <div id="wrapper">
            <!-- Sidebar -->
            <jsp:include page="navbarsaleadmin.jsp" />

            <div id="content-wrapper">
                <div class="container-fluid">
                    <h1>Orders List - Sale Admin</h1>
                    <form action="${pageContext.request.contextPath}/saleadminorderlist" method="get" style="margin-bottom: 20px;">
                        <div class="form-row justify-content-center">
                            <div class="form-group col-md-3">
                                <label for="orderId">Order ID:</label>
                                <input type="text" class="form-control" id="orderId" name="orderId" value="${param.orderId}">
                            </div>
                            <div class="form-group">
                                <label for="statusId">Status:</label>
                                <select class="form-control" id="statusId" name="statusId">
                                    <option value="">All</option>
                                    <c:forEach var="status" items="${OrderStatusList}">
                                        <option value="${status.id}" ${param.statusId == status.id ? 'selected' : ''}>${status.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="customerName">Customer Name:</label>
                                <input type="text" class="form-control" id="customerName" name="customerName"
                                       value="${param.customer_name}">
                            </div>
                            <div class="form-group" style="margin-top:30px"> 
                                <button type="submit" class="btn btn-primary">Filter</button>
                            </div>
                        </div>
                    </form>

                    <div class="table-container">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th class="titleTable">ID</th>
                                    <th class="titleTable">Customer</th>
                                    <th class="titleTable">Total Cost</th>
                                    <th class="titleTable">Order Date</th>
                                    <th class="titleTable">View Details</th>
                                    <th class="titleTable">Staff</th>
                                    <!--<th>Change</th>-->
                                    <th class="titleTable">Status</th>
                                    <th class="titleTable"> Update Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="order" items="${orders}">
                                    <tr>
                                        <td><a href="saleadminorderdetails?id=${order.id}">${order.id}</a></td>
                                        <td>${order.customer_name}</td>
                                        <td>${order.totalCost}</td>
                                        <td>${order.orderDate}</td>
                                        <td><a href="saleadminorderdetails?id=${order.id}" class="btn btn-info">View
                                                Details</a></td>


                                        <!--<td>${order.staff_name}</td>-->
                                        <td>
                                            <form action="${pageContext.request.contextPath}/saleadminorderlist" method="post" id="staffSubmit_${order.id}">
                                                <input type="hidden" name="orderId" value="${order.id}">
                                                <select name="staffId" onchange="document.getElementById('staffSubmit_${order.id}').submit()">
                                                    <c:forEach var="staff" items="${staffList}">
                                                        <option value="${staff.id}" ${order.staff_name eq staff.fullname ? "selected" : ""}>
                                                            ${staff.fullname} (${staff.orderCount} orders)
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                                <!--<button type="submit">Change</button>-->
                                            </form>
                                        </td>
                                        <td>${order.status_name}</td>
                                        <td>
                                            <form action="${pageContext.request.contextPath}/saleadminorderlist" method="post">
                                                <input type="hidden" name="orderId" value="${order.id}">
                                                <c:choose>
                                                    <c:when test="${order.status_id == '1'}">
                                                        <button type="submit" name="statusId" value="2">Confirm</button>
                                                        <button type="submit" name="statusId" value="7">Order Canceled</button>
                                                    </c:when>
                                                    <c:when test="${order.status_id == '4'}">
                                                        <button type="submit" name="statusId" value="5">Success</button>
                                                        <button type="submit" name="statusId" value="8">Canceled</button>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <button type="button" disabled>
                                                            <c:choose>
                                                                <c:when test="${order.status_id == '7'}">Order Canceled</c:when>

                                                                <c:when test="${order.status_id == '8'}">Cancel</c:when>
                                                            </c:choose>
                                                        </button>
                                                    </c:otherwise>
                                                </c:choose>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                        <div class="pagination">
                            <c:if test="${currentPage > 1}">
                                <a href="${pageContext.request.contextPath}/saleadminorderlist?page=${currentPage - 1}&statusId=${statusId}&orderId=${orderId}">Previous</a>
                            </c:if>
                            <c:forEach begin="1" end="${totalPages}" var="i">
                                <c:url var="pageUrl" value="/saleadminorderlist">
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
                                <a href="${pageContext.request.contextPath}/saleadminorderlist?page=${currentPage + 1}&statusId=${statusId}&orderId=${orderId}">Next</a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>

            

        </div>

        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

    </body>

</html>
