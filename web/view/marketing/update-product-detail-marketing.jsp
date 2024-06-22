<%-- 
    Document   : update-product-detail-marketing
    Created on : Jun 7, 2024, 7:47:03 AM
    Author     : admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Update "${product.title}"</h1>
        <img src="images/${product.image}" width="350" height="350">
        <form action="updateProductDetailMarketing" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="${product.id}"><br/><br/>
            Title: <input type="text" name="title" value="${product.title}"><br/><br/>
            Author: <input type="text" name="author" value="${product.author}"><br/><br/>
            Quantity <input type="number" name="quantity" value="${product.quantity}"><br/><br/>
            Description: <textarea  name="description">${product.description}</textarea><br/><br/>
            Category: 
            <select name="category">
                <c:forEach items="${listCategory}" var="category">
                <option value="${category.id}" ${category.name eq product.category ? "selected" : ""}>${category.name}</option>
            </c:forEach>
            </select>
            <br/><br/>
            Original Price: <input type="text" name="originalPrice" value="${product.originalPrice}"><br/><br/>
            Sale Price: <input type="text" name="salePrice" value="${product.salePrice}"><br/><br/>
            Image: <input type="file" name="imageFile"><br/><br/>
            <input type="submit" value="UPDATE PRODUCT">
        </form>
    </body>
</html>
