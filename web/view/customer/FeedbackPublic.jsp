<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Đánh Giá Sản Phẩm | BookHaven</title>
        <link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
        <link href="<c:url value='/css/font-awesome.min.css'/>" rel="stylesheet">
        <link href="<c:url value='/css/prettyPhoto.css'/>" rel="stylesheet">
        <link href="<c:url value='/css/price-range.css'/>" rel="stylesheet">
        <link href="<c:url value='/css/animate.css'/>" rel="stylesheet">
        <link href="<c:url value='/css/main.css'/>" rel="stylesheet">
        <link href="<c:url value='/css/responsive.css'/>" rel="stylesheet">
        <link rel="shortcut icon" href="<c:url value='/images/ico/favicon.ico'/>">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="<c:url value='/images/ico/apple-touch-icon-144-precomposed.png'/>">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="<c:url value='/images/ico/apple-touch-icon-114-precomposed.png'/>">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="<c:url value='/images/ico/apple-touch-icon-72-precomposed.png'/>">
        <link rel="apple-touch-icon-precomposed" href="<c:url value='/images/ico/apple-touch-icon-57-precomposed.png'/>">
        
        <style>
            body {
                background-color: white;
                margin-top: 100px;
            }
            .container {
                margin: auto;
                padding: 20px;
            }
            .product, .service, .review, .actions {
                margin-bottom: 20px;
            }
            .rating {
                display: flex;
                align-items: center;
            }
            .stars {
                display: flex;
                gap: 5px;
            }
            .star {
                font-size: 20px;
                color: gray;
                cursor: pointer;
            }
            .star.selected {
                color: gold;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container">
            <h1>Đánh Giá Sản Phẩm</h1>

            <c:if test="${not empty error}">
                <p style="color:red;">${error}</p>
            </c:if>

            <c:if test="${not empty product}">
                <div class="product">
                    <img src="${pageContext.request.contextPath}/images/${product.image}" alt="Product Image" width="800">
                    <br><br>
                    <p><strong>${product.title}</strong></p>
                </div>

                <form action="addfeedbackpublic" method="post">
                    <input type="hidden" name="productId" value="${product.id}" />
                    <div class="review">
                        <h2>Chất lượng sản phẩm</h2>
                        <div class="rating">
                            <div class="stars" id="rateStar">
                                <span class="star" data-value="1">&#9733;</span>
                                <span class="star" data-value="2">&#9733;</span>
                                <span class="star" data-value="3">&#9733;</span>
                                <span class="star" data-value="4">&#9733;</span>
                                <span class="star" data-value="5">&#9733;</span>
                            </div>
                            <input type="hidden" name="ratedStar" id="rateStarInput" value="0"/>
                        </div>
                        <div>
                            <label>Chất lượng sản phẩm:</label><br>
                            <textarea rows="4" cols="50" name="comment"></textarea>
                        </div>
                    </div>
                    <button type="submit">Hoàn Thành</button>
                </form>
            </c:if>

            <c:if test="${not empty message}">
                <p>${message}</p>
            </c:if>
        </div>

        <script src="<c:url value='/js/jquery.js'/>"></script>
        <script src="<c:url value='/js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/js/jquery.scrollUp.min.js'/>"></script>
        <script src="<c:url value='/js/price-range.js'/>"></script>
        <script src="<c:url value='/js/jquery.prettyPhoto.js'/>"></script>
        <script src="<c:url value='/js/main.js'/>"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const stars = document.querySelectorAll('.star');
                const rateStarInput = document.getElementById('rateStarInput');

                stars.forEach((star, index) => {
                    star.addEventListener('click', function () {
                        stars.forEach(s => s.classList.remove('selected'));
                        for (let i = 0; i <= index; i++) {
                            stars[i].classList.add('selected');
                        }
                        rateStarInput.value = this.getAttribute('data-value');
                    });
                });
            });
        </script>
    </body>
</html>
