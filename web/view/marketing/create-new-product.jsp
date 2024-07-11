<%-- 
    Document   : create-new-product
    Created on : Jun 22, 2024, 10:36:12 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Product Details</title>
        <style>
            /* Your existing CSS styles */
            body {
                font-family: Arial, sans-serif;
                background-color: #f9f9f9;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                position: relative;
            }
            .back-button {
                position: absolute;
                top: 20px;
                left: 20px;
                background-color: #0480be;
                color: white;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
                text-decoration: none;
            }
            .back-button:hover {
                background-color: #036ca0;
            }
            .product-details {
                background-color: #ffffff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                overflow: hidden;
                max-width: 900px;
                width: 100%;
                margin: 20px;
            }
            .product-details h1 {
                text-align: center;
                background-color: #0480be;
                color: white;
                margin: 0;
                padding: 15px 0;
            }
            .product-details img {
                display: block;
                margin: 20px auto;
                border-radius: 10px;
                max-width: 100%;
                height: auto;
            }
            .form-container {
                padding: 20px;
            }
            .form-container form {
                display: flex;
                flex-direction: column;
            }
            .form-container label {
                margin-bottom: 5px;
                font-weight: bold;
            }
            .form-container input, .form-container textarea, .form-container select {
                margin-bottom: 15px;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 16px;
                width: 100%;
                box-sizing: border-box;
            }
            .form-container input[type="submit"] {
                background-color: #0480be;
                color: white;
                border: none;
                cursor: pointer;
                padding: 15px;
                border-radius: 5px;
                font-size: 16px;
                margin-top: 10px;
            }
            .form-container input[type="submit"]:hover {
                background-color: #036ca0;
            }
            .alert {
                padding: 10px;
                background-color: #dff0d8;
                color: #3c763d;
                border-radius: 5px;
                margin-bottom: 15px;
                text-align: center;
            }
        </style>
        <script>
            function checkFileType(event) {
                const file = event.target.files[0];
                if (file) {
                    const fileType = file.type;
                    const fileName = file.name;
                    const validFileType = /^image\/jpeg$/;

                    if (!validFileType.test(fileType) || !fileName.toLowerCase().endsWith('.jpg')) {
                        alert('Please upload a JPG image file.');
                        event.target.value = ''; // Clear the input
                    }
                }
            }

            function validateForm(event) {
                const salePriceInput = document.getElementById('salePrice');
                const originalPriceInput = document.getElementById('originalPrice');
                const salePrice = parseInt(salePriceInput.value, 10);
                const originalPrice = parseInt(originalPriceInput.value, 10);

                if (isNaN(salePrice) || salePrice <= 0) {
                    alert('Sale price must be a positive integer.');
                    event.preventDefault(); // Prevent form submission
                    return;
                }

                
            }

            document.addEventListener('DOMContentLoaded', () => {
                const imageInput = document.getElementById('imageFile');
                imageInput.addEventListener('change', checkFileType);

                const form = document.querySelector('.form-container form');
                form.addEventListener('submit', validateForm);
            });
        </script>

    </head>
    <body>
        <a href="productListMarketing" class="back-button">Back</a>
        <div class="product-details">
            <h1>Create New Product</h1>
            <div class="form-container">
                <form action="${pageContext.request.contextPath}/createNewProductMarketing" method="post" enctype="multipart/form-data">
                    <label for="title">Title:</label>
                    <input type="text" id="title" name="title" required="">

                    <label for="author">Author:</label>
                    <input type="text" id="author" name="author" required="">

                    <label for="quantity">Quantity:</label>
                    <input type="number" id="quantity" name="quantity" value="0" readonly="">

                    <label for="description">Description:</label>
                    <textarea id="description" name="description" required=""></textarea>

                    <label for="category">Category:</label>
                    <select id="category" name="category">
                        <c:forEach items="${listCategory}" var="category">
                            <option value="${category.id}">${category.name}</option>
                        </c:forEach>
                    </select>

                    <label for="originalPrice">Import Price:</label>
                    <input type="text" id="originalPrice" name="originalPrice" value="0" readonly="">

                    <label for="salePrice">Sale Price:</label>
                    <input type="text" id="salePrice" name="salePrice" required="">

                    <label for="imageFile">Image:</label>
                    <input type="file" id="imageFile" name="imageFile" required="">

                    <input type="submit" value="CREATE PRODUCT">
                </form>
            </div>
        </div>
    </body>
</html>
