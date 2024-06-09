<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>SB Admin - Tables</title>

        <!-- Custom fonts for this template-->
        <link href="<c:url value='/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">

        <!-- Page level plugin CSS-->
        <link href="<c:url value='/vendor/datatables/dataTables.bootstrap4.css'/>" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="<c:url value='/css/sb-admin.css'/>" rel="stylesheet">
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f8f9fc;
                margin: 0;
                padding: 0;
            }
            .container {
                max-width: 1200px;
                margin: 20px auto;
                padding: 20px;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            header h1 {
                text-align: center;
                margin-bottom: 20px;
                color: #4e73df;
            }
            .search-bar form {
                display: flex;
                justify-content: center;
                margin-bottom: 20px;
                flex-wrap: wrap;
            }
            .search-bar input,
            .search-bar select,
            .search-bar button {
                margin: 5px;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
                flex: 1 1 auto;
                max-width: 200px;
            }
            .search-bar button {
                background-color: #4e73df;
                color: white;
                border: none;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            .search-bar button:hover {
                background-color: #2e59d9;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }
            table th,
            table td {
                border: 1px solid #ddd;
                padding: 10px;
                text-align: left;
            }
            table th {
                background-color: #4e73df;
                color: white;
            }
            table td img {
                width: 50px;
                height: auto;
            }
            .pagination {
                text-align: center;
                margin-bottom: 20px;
            }
            .pagination a {
                margin: 0 5px;
                padding: 10px 15px;
                border: 1px solid #ddd;
                border-radius: 5px;
                text-decoration: none;
                color: #4e73df;
                transition: background-color 0.3s, color 0.3s;
            }
            .pagination a:hover,
            .pagination a.active {
                background-color: #4e73df;
                color: white;
            }
            aside h2 {
                text-align: center;
                margin-bottom: 20px;
                color: #4e73df;
            }
            aside ul {
                list-style: none;
                padding: 0;
                text-align: center;
            }
            aside ul li {
                margin: 5px 0;
            }
            .sticky-footer {
                background-color: #4e73df;
                color: white;
                padding: 10px 0;
                text-align: center;
                position: relative;
                width: 100%;
            }
            .scroll-to-top {
                position: fixed;
                bottom: 20px;
                right: 20px;
                background-color: #4e73df;
                color: white;
                border-radius: 50%;
                padding: 10px;
                display: none;
            }
            .scroll-to-top:hover {
                background-color: #2e59d9;
            }
        </style>
    </head>

    <body id="page-top">

        <jsp:include page="headermarketing.jsp"/>

        <div id="wrapper">

            <!-- Sidebar -->
            <jsp:include page="navbarmarketing.jsp"/>

            <div class="container">
                <header>
                    <h1>Post List</h1>
                </header>
                
                <div class="main-content">
                    <!-- Search bar -->
                    <div class="search-bar">
                        <form action="postlist" method="get">
                            <input type="text" name="searchTitle" placeholder="Search by title" value="${param.searchTitle}">
                            <input type="text" name="filterCategory" placeholder="Filter by category" value="${param.filterCategory}">
                            <select name="filterStatus">
                                <option value="">Filter by status</option>
                                <option value="true" ${param.filterStatus == 'true' ? 'selected' : ''}>Show</option>
                                <option value="false" ${param.filterStatus == 'false' ? 'selected' : ''}>Hide</option>
                            </select>
                            <button type="submit">Search</button>
                        </form>
                    </div>
                    
                    <a href="${pageContext.request.contextPath}/CreatePost" class="btn btn-primary">Create New Post</a>
                    
                    <aside>
                    <h2>Categories</h2>
                    <ul>
                        <c:forEach var="category" items="${categories}">
                            <li>${category.name}</li>
                        </c:forEach>
                    </ul>
                </aside>

                    <!-- Post list -->
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Image</th>
                                <th>Title</th>
                                <th>Category</th>
                                <th>Staff</th>
                                <th>Status</th>
                                <th>Description</th>
                                <th>Content</th>
                                <th>Update Date</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="post" items="${posts}">
                                <tr>
                                    <td>${post.id}</td>
                                    <td><img src="${post.image}" alt="${post.title}"></td>
                                    <td>${post.title}</td>
                                    <td>${post.categoryBlog}</td>
                                    <td>${post.staff}</td>
                                    <td>${post.status == '0' ? 'Show' : 'Hide'}</td>
                                    <td>${post.description}</td>
                                    <td>${post.content}</td>
                                    <td>${post.updateDate}</td>
                                    <td>
                                        <a href="viewPost?id=${post.id}">View</a>
                                        <a href="updatepost?id=${post.id}">Edit</a>
                                        <a href="deletePost?id=${post.id}">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <!-- Pagination -->
                    <div class="pagination">
                        <c:forEach begin="1" end="${noOfPages}" var="pageNum">
                            <a href="postlist?page=${pageNum}" ${currentPage == pageNum ? 'class="active"' : ''}>${pageNum}</a>
                        </c:forEach>
                    </div>
                </div>

                <!-- Sidebar -->
                
            </div>

            <!-- Sticky Footer -->
            <footer class="sticky-footer">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright © Your Website 2024</span>
                    </div>
                </div>
            </footer>

        </div>
        <!-- /.content-wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
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
