<%-- 
    Document   : footer
    Created on : 22 May 2024, 3:36:01 am
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
        <link href="<c:url value='/css/font-awesome.min.css'/>" rel="stylesheet">
        <link href="<c:url value='/css/prettyPhoto.css'/>" rel="stylesheet">
        <link href="<c:url value='/css/price-range.css'/>" rel="stylesheet">
        <link href="<c:url value='/css/animate.css'/>" rel="stylesheet">
        <link href="<c:url value='/css/main.css'/>" rel="stylesheet">
        <link href="<c:url value='/css/responsive.css'/>" rel="stylesheet">
        <!--[if lt IE 9]>
        <script src="<c:url value='/js/html5shiv.js'/>"></script>
        <script src="<c:url value='/js/respond.min.js'/>"></script>
        <![endif]-->
        <link rel="shortcut icon" href="<c:url value='/images/ico/favicon.ico'/>">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="<c:url value='/images/ico/apple-touch-icon-144-precomposed.png'/>">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="<c:url value='/images/ico/apple-touch-icon-114-precomposed.png'/>">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="<c:url value='/images/ico/apple-touch-icon-72-precomposed.png'/>">
        <link rel="apple-touch-icon-precomposed" href="<c:url value='/images/ico/apple-touch-icon-57-precomposed.png'/>">
        <style>
            .footer-bottom {
                border-top: 1px solid #e7e7e7;
                padding: 20px 0;
                text-align: center;
                color: #777;
                font-size: 14px;
            }

            .footer-bottom .contactinfo {
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .footer-bottom .contactinfo ul.nav {
                list-style: none;
                padding: 0;
                margin: 0;
                display: flex;
                gap: 20px;
            }

            .footer-bottom .contactinfo ul.nav li {
                display: inline;
            }

            .footer-bottom .contactinfo ul.nav li a {
                color: #777;
                text-decoration: none;
                font-weight: bold;
                font-size: 14px;
                transition: color 0.3s;
            }

            .footer-bottom .contactinfo ul.nav li a:hover {
                color: #000;
            }

            .footer-bottom .contactinfo ul.nav li a i {
                margin-right: 5px;
            }
        </style>
    </head>
    <body>
        <footer id="footer"><!--Footer-->
            <div class="footer-bottom">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="contactinfo">
                                <ul class="nav nav-pills">
                                    <li><a href="${pageContext.request.contextPath}/view/customer/homepage.jsp"><i class="fa fa-book"></i> <span>Book</span>Haven</a></li>
                                    <li><a ><i class="fa fa-phone"></i> 0367526769</a></li>
                                    <li><a ><i class="fa fa-envelope"></i> thaodvhe173219@fpt.edu.vn</a></li>
                                    <li><a ><i class="fa fa-map-marker"></i> Hola City-Đại Học FPT Hà Nội</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer><!--/Footer-->
    </body>
</html>
