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

    <title>View Post</title>

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
    max-width: 800px;
    margin: 20px auto;
    padding: 20px;
    background-color: #fff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
}

.product-details {
    display: flex;
}

.product-thumbnail {
    flex: 0 0 30%;
    margin-right: 20px;
}

.product-thumbnail img {
    max-width: 100%;
    height: auto;
}

.product-info {
    flex: 1;
}

.product-info h2 {
    color: #4e73df;
}

.product-info p {
    margin-bottom: 10px;
}

.edit-button {
    display: inline-block;
    padding: 10px 20px;
    background-color: #4e73df;
    color: white;
    border: none;
    border-radius: 5px;
    text-decoration: none;
    transition: background-color 0.3s;
}

.edit-button:hover {
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
    <div class="product-details">
        <div class="product-thumbnail">
            <img src="${post.image}" alt="Product Image">
        </div>
        <div class="product-info">
            <h2>${post.title}</h2>
            <p><strong>Category:</strong> ${post.categoryBlog}</p>
            <p><strong>Description:</strong> ${post.description}</p>
            <p><strong>Status:</strong> ${post.status ? 'Show' : 'Hide'}</p>
            <p><strong>Content:</strong></p>
            <p>${post.content}</p>
            <!-- Edit Post Button -->
            <a href="updatepost?id=${post.id}" class="edit-button">Edit Post</a>
        </div>
    </div>
</div>
        </footer>

    </div>

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
    <script src="<c:url
value='/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

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
