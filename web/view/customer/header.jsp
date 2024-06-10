<%-- 
    Document   : header.jsp
    Created on : 21 May 2024, 11:33:02 pm
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
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

    <body>
        <header id="header"><!--header-->
            <div class="header_top"><!--header_top-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="contactinfo">
                                <ul class="nav nav-pills">
                                    <li><a href=""><i class="fa fa-phone"></i> 0367526769</a></li>
                                    <li><a href=""><i class="fa fa-envelope"></i> dvthao2k3@gmail.com</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div><!--/header_top-->

            <div class="header-middle"><!--header-middle-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="logo pull-left">
                                <a href="${pageContext.request.contextPath}/view/customer/homepage.jsp"><img src="<c:url value='/images/home/logo.png'/>" alt="" width="140" height="35" /></a>
                            </div>

                        </div>            
                        <div class="col-sm-8">
                            <div class="shop-menu pull-right">
                                <ul class="nav navbar-nav">
                                    <c:choose>
                                        <c:when test="${sessionScope.acc != null}">
                                            <li class="dropdown">
                                                <a href="#"><i class="fa fa-user"></i> Profile <i class="fa fa-angle-down"></i></a>
                                                <ul role="menu" class="sub-menu">
                                                    <li><a href="${pageContext.request.contextPath}/informationuser" style="color: #333; display: block; padding: 10px 20px; text-decoration: none; transition: background-color 0.3s ease; border: none;">Personal Information</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/view/customer/changepasswordcustomer.jsp" style="color: #333; display: block; padding: 10px 20px; text-decoration: none; transition: background-color 0.3s ease; border: none;">Password</a></li>
                                                    <li><a href="checkout.jsp" style="color: #333; display: block; padding: 10px 20px; text-decoration: none; transition: background-color 0.3s ease; border: none;">Logout</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="#"><i class="fa fa-star"></i> Wishlist</a></li>
                                            <li><a href="checkout.jsp"><i class="fa fa-crosshairs"></i> Checkout</a></li>
                                            <li><a href="cart.jsp"><i class="fa fa-shopping-cart"></i> Cart</a></li>
                                            </c:when>
                                            <c:otherwise>
                                            <li><a href="${pageContext.request.contextPath}/view/customer/logincustomer.jsp"><i class="fa fa-lock"></i> Login</a></li>
                                            </c:otherwise>
                                        </c:choose>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--/header-middle-->

            <div class="header-bottom"><!--header-bottom-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-9">
                            <div class="mainmenu pull-left">
                                <ul class="nav navbar-nav collapse navbar-collapse">
                                    <li><a href="${pageContext.request.contextPath}/view/customer/homepage.jsp" class="active">Home</a></li>

                                    <li class="dropdown"><a href="#">Shop<i class="fa fa-angle-down"></i></a>
                                        <ul role="menu" class="sub-menu">
                                            <li><a href="${pageContext.request.contextPath}/ProductListPublic">Products</a></li>
                                            <li><a href="${pageContext.request.contextPath}/ProductDetailPublic">Product Details</a></li>
                                        </ul>
                                    </li>
                                    <li class=""><a href="${pageContext.request.contextPath}/bloglist">Blog List<i></i></a>

                                    </li> 
                                </ul>
                            </div>
                        </div>
                        <%-- 
                                 <div class="col-sm-3">
                                 <div class="search_box pull-right">
                                 <input type="text" placeholder="Search"/>
                                </div>
                              </div>
                        --%>
                    </div>
                </div>
            </div><!--/header-bottom-->
        </header><!--/header-->
    </body>
</html>
