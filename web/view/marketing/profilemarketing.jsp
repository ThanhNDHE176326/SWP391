<%-- 
    Document   : profile
    Created on : Jun 22, 2024, 6:08:29 PM
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

        <title>Marketing - Profile</title>

        <!-- Custom fonts for this template-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/custom.css" rel="stylesheet">

        <style>
            body {
                font-family: 'Roboto', sans-serif;
                background-color: #f8f9fa;
                color: #343a40;
            }

            .breadcrumb {
                background-color: #e9ecef;
                border-radius: 0.25rem;
            }

            .account-info-container {
                background-color: #ffffff;
                border-radius: 0.25rem;
                padding: 2rem;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                margin-top: 1rem;
            }

            .account-info-container h2 {
                margin-bottom: 1.5rem;
                font-weight: 500;
                color: #007bff;
            }

            .form-group {
                margin-bottom: 1rem;
            }

            .form-group label {
                display: block;
                margin-bottom: 0.5rem;
                font-weight: 500;
            }

            .form-group input,
            .form-group select {
                width: 100%;
                padding: 0.25rem 0.5rem;
                border: 1px solid #ced4da;
                border-radius: 0.25rem;
                box-sizing: border-box;
                font-size: 0.9rem;
                height: 1.75rem;
            }

            .form-group input:read-only {
                background-color: #e9ecef;
            }

            .form-group select {
                height: 1.75rem;
            }

            .btn {
                padding: 0.5rem;
                border: none;
                border-radius: 0.25rem;
                text-align: center;
                cursor: pointer;
            }

            .btn-block {
                display: block;
                width: 100%;
                margin-top: 0.5rem;
            }

            .btn-default {
                background-color: #007bff;
                color: #ffffff;
            }

            .btn-default:hover {
                background-color: #0056b3;
            }

            .btn-secondary {
                background-color: #6c757d;
                color: #ffffff;
            }

            .btn-secondary:hover {
                background-color: #5a6268;
            }

            .error-message {
                color: red;
                font-style: italic;
                margin-top: 1rem;
            }

            .row {
                display: flex;
                justify-content: space-between;
                gap: 1rem;
            }

            .col-half {
                width: 48%;
            }
        </style>

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
                            <a href="#">Profile</a>
                        </li>
                        <li class="breadcrumb-item active">Overview</li>
                    </ol>

                    <!-- Profile Form-->
                    <jsp:include page="profileForm.jsp"/>

                </div>
            </div>

        </div>

    </body>

</html>
