<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Marketing - Product Details</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f9f9f9;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .product-details {
                background-color: #ffffff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                overflow: hidden;
                max-width: 900px;
                width: 100%;
            }
            .product-details h1 {
                text-align: center;
                background-color: #0480be;
                color: white;
                margin: 0;
                padding: 15px 0;
            }
            .product-details table {
                width: 100%;
                border-collapse: collapse;
            }
            .product-details td {
                padding: 20px;
            }
            .product-details img {
                display: block;
                margin: 0 auto;
                border-radius: 10px;
            }
            .product-info {
                font-size: 16px;
                line-height: 1.6;
            }
            .product-info strong {
                display: inline-block;
                width: 150px;
            }
            .update-product-button {
                display: inline-block;
                text-align: center; /* Center align content */
            }

            .update-product-button a {
                display: inline-block;
                padding: 12px 24px;
                background-color: #2196f3; /* Blue background */
                color: white;
                border: none;
                border-radius: 5px;
                font-size: 16px;
                text-decoration: none;
                transition: background-color 0.3s ease;
            }

            .update-product-button a:hover {
                background-color: #0e7ae6; /* Darker blue on hover */
            }
            .change-status-button {
                display: inline-block;
                text-align: center; /* Center align content */
            }

            .change-status-button a {
                display: inline-block;
                padding: 8px 16px;
                background-color: #f9f9f9; /* Light background */
                color: #333; /* Dark text color */
                border: 1px solid #ccc; /* Gray border */
                border-radius: 5px;
                text-decoration: none;
                transition: background-color 0.3s ease, color 0.3s ease, border-color 0.3s ease;
            }

            .change-status-button a:hover {
                background-color: #e0e0e0; /* Light gray background on hover */
                color: #000; /* Darken text color on hover */
                border-color: #999; /* Darken border color on hover */
            }

            .change-status-button a span {
                font-weight: bold; /* Make text bold */
            }

            .change-status-button a span.status-active {
                color: blue; /* Blue color for active status */
            }

            .change-status-button a span.status-inactive {
                color: red; /* Red color for inactive status */
            }

        </style>
    </head>
    <body>
        <div class="product-details">
            <h1>Detail of "${product.title}"</h1>
            <div class="update-product-button">
                <button type="button">
                    <a href="updateProductDetailMarketing?productID=${product.id}">
                        Update Product
                    </a>
                </button>
            </div>

            <table>
                <tr>
                    <td><img src="images/${product.image}" width="400px" height="400px" alt="image of ${product.title}"/></td>
                    <td class="product-info">
                        <div><strong>Title:</strong> ${product.title}</div>
                        <div><strong>Author:</strong> ${product.author}</div>
                        <div><strong>Category:</strong> ${product.category}</div>
                        <div><strong>Brief information:</strong> ${product.description}</div>
                        <div><strong>Quantity:</strong> ${product.quantity}</div>
                        <div><strong>Import Price:</strong> ${product.originalPrice}</div>
                        <div><strong>Sale Price:</strong> ${product.salePrice}</div>
                        <div><strong>Hold:</strong> ${product.hold}</div>
                    </td>
                </tr>
            </table>
            <div class="change-status-button">
                <button type="button">
                    <a href="changeStatus?productID=${product.id}&status=${product.status}">
                        <c:choose>
                            <c:when test="${product.status == 1}">
                                <span class="status-active">Change Status</span>
                            </c:when>
                            <c:when test="${product.status == 0}">
                                <span class="status-inactive">Change Status</span>
                            </c:when>
                        </c:choose>
                    </a>
                </button>
            </div>

        </div>
    </body>
</html>
