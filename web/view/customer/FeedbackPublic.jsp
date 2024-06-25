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
            background-color: #f9f9f9;
            margin-top: 100px;
            font-family: 'Arial', sans-serif;
        }
        .container {
            margin: auto;
            padding: 20px;
            max-width: 800px;
            background: #fff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }
        .product img {
            width: 100%;
            border-radius: 10px;
        }
        .product p {
            text-align: center;
            font-size: 18px;
            color: #555;
        }
        .rating {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 20px;
        }
        .stars {
            display: flex;
            gap: 5px;
        }
        .star {
            font-size: 30px;
            color: gray;
            cursor: pointer;
            transition: color 0.3s;
        }
        .star:hover, .star.selected {
            color: gold;
        }
        .review label {
            font-weight: bold;
            color: #333;
        }
        .review textarea {
            width: 100%;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 10px;
            margin-top: 5px;
            resize: vertical;
        }
        button[type="submit"] {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #5cb85c;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        button[type="submit"]:hover {
            background-color: #4cae4c;
        }
        .message {
            text-align: center;
            color: green;
            font-size: 18px;
        }
        .error {
            text-align: center;
            color: red;
            font-size: 18px;
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp"/>
    <div class="container">
        <h1>Đánh Giá Sản Phẩm</h1>

        <c:if test="${not empty error}">
            <p class="error">${error}</p>
        </c:if>

        <c:if test="${not empty product}">
            <div class="product">
                <img src="${pageContext.request.contextPath}/images/${product.image}" alt="Product Image">
                <br><br>
                <p><strong>${product.title}</strong></p>
                <p><strong>ID sản phẩm: ${product.id}</strong></p>
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
                        <label for="comment">Nhận xét về sản phẩm:</label>
                        <textarea rows="4" cols="50" name="comment" id="comment" placeholder="Nhập nhận xét của bạn..."></textarea>
                    </div>
                </div>
                <button type="submit">Hoàn Thành</button>
            </form>
        </c:if>

        <c:if test="${not empty message}">
            <p class="message">${message}</p>
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
