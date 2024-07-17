<%-- 
    Document   : product-list-marketing
    Created on : Jun 3, 2024, 10:22:40 PM
    Author     : admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <style>
            .pagination-button {
                display: inline-block;
                padding: 10px 15px;
                margin: 5px;
                text-decoration: none;
                color: #333;
                border: 1px solid #ddd;
                border-radius: 5px;
                transition: background-color 0.3s ease, border-color 0.3s ease;
            }

            .pagination-button:hover {
                background-color: #f0f0f0;
                border-color: #ccc;
            }
            .add-product-button {
                float: right;
                margin: 10px 0;
                padding: 10px 20px;
                background-color: #0480be;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            .add-product-button a {
                color: white;
                text-decoration: none;
            }
            .add-product-button:hover {
                background-color: #036ca0;
            }
            .search-container {
                display: flex;
                justify-content: center;
                align-items: center;
                margin: 20px 0;
            }

            .search-container form {
                display: flex;
                align-items: center;
                border: 1px solid #ccc;
                border-radius: 5px;
                overflow: hidden;
                box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
                max-width: 700px; /* Adjust the max-width as needed */
                width: 100%;
            }

            .search-container input[type="text"] {
                padding: 10px;
                border: none;
                outline: none;
                font-size: 16px;
                flex-grow: 1; /* Allow input to take the remaining space */
            }

            .search-container input[type="submit"] {
                padding: 10px 20px;
                background-color: #0480be;
                color: white;
                border: none;
                cursor: pointer;
                font-size: 16px;
                transition: background-color 0.3s ease;
            }

            .search-container input[type="submit"]:hover {
                background-color: #036ca0;
            }
            .err{
                color: red;
                font-weight: bold;
                text-align: center;
            }
        </style>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
            />
        <meta name="description" content="" />
        <meta name="author" content="" />

        <title>Warehouse - Products List</title>

        <!-- Custom fonts for this template-->
        <link href="<c:url value='/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">

        <!-- Page level plugin CSS-->
        <link href="<c:url value='/vendor/datatables/dataTables.bootstrap4.css'/>" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="<c:url value='/css/sb-admin.css'/>" rel="stylesheet">

        <link rel="stylesheet" href="<c:url value='/css/colReorder-bootstrap4.css'/>">

    </head>

    <body id="page-top">
        <jsp:include page="headerwarehouse.jsp"/>

        <div id="wrapper">
            <!-- Sidebar -->
            <jsp:include page="navbarwarehouse.jsp"/>

            <div id="content-wrapper">
                <div class="container-fluid">
                    <!-- Breadcrumbs-->
                    <ol class="breadcrumb">
                        
                        <li class="breadcrumb-item active">Products List</li>
                    </ol>

                    <!-- DataTables Example -->
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fas fa-table"></i>
                            Data Products List
                        </div>
                        <div class="search-container">
                            <!--Search Products:-->
                            <form class="form-inline" action="searchProductList">
                                <input type="text" name="search" placeholder="search product" value="${search}">
                                <input type="submit" value="SEARCH">
                                
                                
                            </form>
                                
                                
                        </div>
                                <h5 class="err">${error}</h5>
                                
                        <div class="filter-container">
                            <form id="categorySearch" action="filterCategoryProduct">
                                <label for="categorySearch">Filter by Category:</label>
                                <select name="categorySearch" id="categorySearch" onchange="document.getElementById('categorySearch').submit();">
                                    <option value="0" ${categorySearch eq "0" ? "selected" : ""}>ALL Category</option>
                                    <c:forEach items="${listCategory}" var="category">
                                        <option value="${category.id}" ${category.id == categorySearch ? "selected" : ""}>${category.name}</option>
                                    </c:forEach>
                                </select>
                            </form>
                            <form id="statusSearch" action="filterStatusProductWH">
                                <label for="statusSearch">Filter by Status:</label>
                                <select name="statusSearch" id="statusSearch" onchange="document.getElementById('statusSearch').submit();">
                                    <option value="all" ${statusSearch eq "all"? "selected":""}>All Status</option>
                                    <option value="show" ${statusSearch eq "show"? "selected":""}>Show</option>
                                    <option value="hide" ${statusSearch eq "hide"? "selected":""}>Hide</option>
                                </select>  
                            </form>
                        </div>

                        <div class="card-body">
                            <div class="table-responsive">
                                <table
                                    class="table table-bordered"

                                    width="100%"
                                    cellspacing="0"
                                    >
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Title</th>
                                            <th>Author</th>
                                            <th>Image</th>
                                            <th>Category</th>
                                            <th>Original Price</th>
                                            <th>Sale Price</th>
                                            <th>Stock</th>
                                            <!--<th>Brief Info</th>-->
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>ID</th>
                                            <th>Title</th>
                                            <th>Author</th>
                                            <th>Image</th>
                                            <th>Category</th>
                                            <th>Original Price</th>
                                            <th>Sale Price</th>
                                            <th>Stock</th>
                                            <!--<th>Brief Info</th>-->
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>

                                        <c:forEach items="${listProduct}" var="product">
                                            <tr>
                                                <td>
                                                    ${product.id}
                                                    <input type="hidden" name="productID" readonly="" value="${product.id}">
                                                </td>
                                                <td>${product.title}</td>
                                                <td>${product.author}</td>
                                                <td><img src="images/${product.image}" width="125px" height="125px"/></td>
                                                <td>${product.category}</td>
                                                <td>${product.originalPrice}</td>
                                                <td>${product.salePrice}</td>

                                                <c:if test="${product.quantity > 0}">
                                                    <td style="color: green">In Stock</td>
                                                </c:if>
                                                <c:if test="${product.quantity == 0}">
                                                    <td style="color: red">Out stock</td>
                                                </c:if>

                                                    <!--<td>${product.description}</td>-->

                                                <c:if test="${product.status == 1}">
                                                    <td style="color: blue">Show</td>
                                                </c:if>
                                                <c:if test="${product.status == 0}">
                                                    <td style="color: red">Hide</td>
                                                </c:if>
                                                <td>
                                                    <div>
                                                        <a href="updateProductDetailByWarehouse?productID=${product.id}">View Details</a>
                                                    </div>  
                                                    <div>
                                                        <c:if test="${product.quantity == 0}">
                                                            <button style="width: 120px">
                                                                <a href="deleteProduct?id=${product.id}">
                                                                    Delete
                                                                </a>
                                                            </button>
                                                        </c:if>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <c:forEach begin="1" end="${endPage}" var="i">
                                    <a href="${urlServlet}?index=${i}" class="pagination-button">${i}&nbsp;</a>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="card-footer small text-muted">
                            Updated yesterday at 11:59 PM
                        </div>
                    </div>

                    <p class="small text-center text-muted my-5">
                        <em>More table examples coming soon...</em>
                    </p>
                </div>
                <!-- /.container-fluid -->

                <!-- Sticky Footer -->
                <footer class="sticky-footer">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Copyright © Your Website 2019</span>
                        </div>
                    </div>
                </footer>
            </div>
            <!-- /.content-wrapper -->
        </div>
        <!-- /#wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <div
            class="modal fade"
            id="logoutModal"
            tabindex="-1"
            role="dialog"
            aria-labelledby="exampleModalLabel"
            aria-hidden="true"
            >
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button
                            class="close"
                            type="button"
                            data-dismiss="modal"
                            aria-label="Close"
                            >
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Select "Logout" below if you are ready to end your current session.
                    </div>
                    <div class="modal-footer">
                        <button
                            class="btn btn-secondary"
                            type="button"
                            data-dismiss="modal"
                            >
                            Cancel
                        </button>
                        <a class="btn btn-primary" href="login.html">Logout</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="<c:url value='/vendor/jquery/jquery.min.js'/>"></script>
        <script src="<c:url value='/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

        <!-- Core plugin JavaScript-->
        <script src="<c:url value='/vendor/jquery-easing/jquery.easing.min.js'/>"></script>

        <!-- Page level plugin JavaScript-->
        <script src="<c:url value='/vendor/datatables/jquery.dataTables.js'/>"></script>
        <script src="<c:url value='/vendor/datatables/dataTables.bootstrap4.js'/>"></script>

        <!-- Custom scripts for all pages-->
        <script src="<c:url value='/js/sb-admin.min.js'/>"></script>

        <!-- Demo scripts for this page-->
        <script src="<c:url value='/js/demo/datatables-demo.js'/>"></script>

    </body>
</html>
