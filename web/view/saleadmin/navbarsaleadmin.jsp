<%-- 
    Document   : navbar
    Created on : 8 Jun 2024, 6:47:19 pm
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Sale Admin - Dashboard</title>

        <!-- Custom fonts for this template-->
        <link href="<c:url value='/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">

        <!-- Page level plugin CSS-->
        <link href="<c:url value='/vendor/datatables/dataTables.bootstrap4.css'/>" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="<c:url value='/css/sb-admin.css'/>" rel="stylesheet">

        <link rel="stylesheet" href="<c:url value='/css/colReorder-bootstrap4.css'/>">

    </head>
    <body>
        <!-- Sidebar -->
        <ul class="sidebar navbar-nav">
            
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/saledashboard" >
                    <i class="fas fa-fw fa-folder"></i>
                    <span>Dashboard</span>
                </a>
                
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/saleorderlist">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>Order List</span></a>
            </li>
            
        </ul>
    </body>
</html>
