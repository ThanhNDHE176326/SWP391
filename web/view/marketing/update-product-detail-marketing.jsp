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
        <form action="updateProductServlet" method="post" enctype="multipart/form-data">
            <!-- Hidden field to store the product ID -->
            <input type="hidden" name="id" value="${product.id}" />

            <!-- Text input fields for various product attributes -->
            <label for="title">Title:</label><br>
            <input type="text" id="title" name="title" value="${product.title}"><br><br>

            <label for="author">Author:</label><br>
            <input type="text" id="author" name="author" value="${product.author}"><br><br>

            <label for="quantity">Quantity:</label><br>
            <input type="number" id="quantity" name="quantity" value="${product.quantity}"><br><br>

<!--            <label for="updateDate">Update Date:</label><br>
            <input type="text" id="updateDate" name="updateDate" value="${product.updateDate}"><br><br>-->

            <label for="description">Description:</label><br>
            <textarea id="description" name="description">${product.description}</textarea><br><br>

            <label for="category">Category:</label><br>
            <select name="category" >   
                <c:forEach items="${listCategory}" var="category">
                    <option value="${category.id}" ${category.id == categorySearch ? "selected" : ""}>${category.name}</option>
                </c:forEach>
            </select><br><br>

            <label for="originalPrice">Original Price:</label><br>
            <input type="text" id="originalPrice" name="originalPrice" value="${product.originalPrice}"><br><br>

            <label for="salePrice">Sale Price:</label><br>
            <input type="text" id="salePrice" name="salePrice" value="${product.salePrice}"><br><br>

            <label for="staff">Staff:</label><br>
            <input type="text" id="staff" name="staff" value="${product.staff}" readonly=""><br><br>

<!--            <label for="status">Status:</label><br>
            <input type="text" id="status" name="status" value="${product.status}"><br><br>-->

            <!-- File input field for image upload -->
            <label for="image">Image:</label> &nbsp;
            <input type="file" id="image" name="image"><br><br>

            <input type="submit" value="Update Product">
        </form>
    </body>
</html>
