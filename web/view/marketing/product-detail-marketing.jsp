<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Details</title>
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
        </style>
    </head>
    <body>
        <div class="product-details">
            <h1>Detail of "${product.title}"</h1>
            <div>
                <button type="button">
                    <a href="updateProductDetailMarketing?productID=${product.id}">
                        Update Product
                    </a>
                </button>
            </div>
            <table>
                <tr>
                    <td><img src="${product.image}" width="400px" height="400px" alt="image of ${product.title}"/></td>
                    <td class="product-info">
                        <div><strong>Title:</strong> ${product.title}</div>
                        <div><strong>Author:</strong> ${product.author}</div>
                        <div><strong>Category:</strong> ${product.category}</div>
                        <div><strong>Brief information:</strong> ${product.description}</div>
                        <div><strong>Quantity:</strong> ${product.quantity}</div>
                        <div><strong>List Price:</strong> ${product.originalPrice}</div>
                        <div><strong>Sale Price:</strong> ${product.salePrice}</div>
                    </td>
                </tr>
            </table>
            <div>
                <button type="button">
                    <a href="changeStatus?productID=${product.id}&status=${product.status}">
                        <c:if test="${product.status == 1}">
                            <span style="color: blue">Change Status</span>
                        </c:if>
                        <c:if test="${product.status == 0}">
                            <span style="color: red">Change Status</span>
                        </c:if>
                    </a>
                </button>
            </div>
        </div>
    </body>
</html>
