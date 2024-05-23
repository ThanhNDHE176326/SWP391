<%-- 
    Document   : ProductListMarketing
    Created on : May 17, 2024, 4:01:26 PM
    Author     : admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f9f9f9;
                color: #333;
                margin: 0;
                padding: 0;
            }
            h1 {
                background-color: #007bff;
                color: #fff;
                padding: 20px;
                text-align: center;
                margin: 0;
            }
            .container {
                width: 80%;
                margin: auto;
                padding: 20px;
            }
            .form-inline {
                display: flex;
                flex-wrap: wrap;
                align-items: center;
                margin-bottom: 20px;
            }
            .form-inline input[type="text"] {
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                flex: 1;
                margin-right: 10px;
                box-sizing: border-box;
            }
            .form-inline input[type="submit"] {
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                background-color: #007bff;
                color: #fff;
                cursor: pointer;
            }
            .form-inline input[type="submit"]:hover {
                background-color: #0056b3;
            }
            select {
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                margin-top: 10px;
                background-color: #fff;
                color: #333;
            }
            table {

                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            table, th, td {
                border: 1px solid #ddd;
            }
            th, td {
                padding: 10px;
                text-align: left;
            }
            th {
                background-color: #007bff;
                color: white;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            tr:hover {
                background-color: #ddd;
            }
            img {
                border-radius: 8px;
            }
        </style>
    </head>
    <body>
        <h1>Product List By Marketing</h1>
        <div class="container">
            Search Products:
            <form class="form-inline" action="productMarketingSearchByTitle">
                <input type="text" name="titleSearch" placeholder="search by title" value="${titleSearch}"> 
                <input type="submit" value="SEARCH"> 
            </form>
            <form class="form-inline" action="productMarketingSearchByBriefInfo">
                <input type="text" name="breifInfoSearch" placeholder="search by brief info" value="${breifInfoSearch}">
                <input type="submit" value="SEARCH">
            </form>
        </div>

        <div>
            ${error}
        </div>

        <br/>
        <div>
            <form id="categorySearch" action="productMarketingFilterByCategory">
                Filter by Category:
                <select name="categorySearch" onchange="document.getElementById('categorySearch').submit();">
                    <option value="0" ${categorySearch eq "0" ? "selected" : ""}>ALL Category</option>
                    <c:forEach items="${listCategory}" var="category">
                        <option value="${category.id}" ${category.id == categorySearch ? "selected" : ""}>${category.name}</option>
                    </c:forEach>
                </select>
            </form>
        </div>
        <div>
            <form id="statusSearch" action="productMarketingFilterByStatus">
                Filter by Status:
                <select name="statusSearch" onchange="document.getElementById('statusSearch').submit();">
                    <option value="all" ${statusSearch eq "all"? "selected":""}>All Status</option>
                    <option value="show" ${statusSearch eq "show"? "selected":""}>Show</option>
                    <option value="hide"${statusSearch eq "hide"? "selected":""}>Hide</option>
                </select>  
            </form>
        </div>

        <div>
            <form action="changeStatus" id="product">
                <table border="1">
                    <tr>
                        <th>ID</th>
                        <th><a href="sortList?listType=${listTypeFromServlet}&field=title&mode=${mode}">Title</a></th>
                        <th>Image</th>
                        <th><a href="sortList?listType=${listTypeFromServlet}&field=category&mode=${mode}&categoryID=${categoryID}">Category</a></th>
                        <th><a href="sortList?listType=${listTypeFromServlet}&field=original_price&mode=${mode}">Original Price</a></th>
                        <th><a href="sortList?listType=${listTypeFromServlet}&field=sale_price&mode=${mode}">Sale Price</a></th>
                        <th>Stock</th>
                        <th>Brief Info</th>
                        <th><a href="sortList?listType=${listTypeFromServlet}&field=status&mode=${mode}&statusMode=${statusModeFromServlet}">Status</a></th>
                    </tr>
                    <c:forEach items="${listProduct}" var="product">
                        <tr>
                            <td><input type="text" name="productID" readonly="" value="${product.id}"></td>
                            <td>${product.title}</td>
                            <td><img src="${product.image}" width="125px" height="125px"/></td>
                            <td>${product.category}</td>
                            <td>${product.originalPrice}</td>
                            <td>${product.salePrice}</td>

                            <c:if test="${product.quantity > 0}">
                                <td style="color: green">In Stock</td>
                            </c:if>
                            <c:if test="${product.quantity == 0}">
                                <td style="color: red">Out stock</td>
                            </c:if>

                            <td>${product.description}</td>

                            <c:if test="${product.status == 1}">
                                <td style="color: blue">Show</td>
                            </c:if>
                            <c:if test="${product.status == 0}">
                                <td style="color: red">Hide</td>
                            </c:if>
                            <td>

                                <select name="status" onchange="document.getElementById('product').submit();">
                                    <option value="1" ${product.status == 1 ? "selected" : ""}>Show</option>
                                    <option value="0" ${product.status == 0 ? "selected" : ""}>Hide</option>
                                </select>


                            </td>
                        </tr>
                    </c:forEach>

                </table>
            </form>    
        </div>
    </body>
</html>
