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

    <title>SB Admin - Add New Post</title>

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
            min-height: 160vh;
            display: flex;
            flex-direction: column;
        }

        .container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            flex: 1;
        }

        header h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #4e73df;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        form label {
            font-weight: bold;
        }

        form input[type="text"],
        form input[type="date"],
        form textarea,
        form select {
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 100%;
            box-sizing: border-box;
        }

        form textarea {
            resize: vertical;
        }

        form button {
            padding: 10px 20px;
            background-color: #4e73df;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            align-self: flex-end;
            margin-top: 20px;
        }

        form button:hover {
            background-color: #2e59d9;
        }

        .sticky-footer {
            background-color: #4e73df;
            color: white;
            padding: 10px 0;
            text-align: center;
            width: 100%;
            position: relative;
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
                <h1>Add New Post</h1>
            </header>
            <form action="CreatePost" method="post">
                <div>
                    <label for="staff">Staff ID:</label>
                    <input type="text" name="staff" id="staff" required />
                </div>
                <div>
                    <label for="title">Title:</label>
                    <input type="text" name="title" id="title" required />
                </div>
                <div>
                    <label for="categoryBlogId">Category:</label>
                    <input type="text" name="categoryBlogId" id="categoryBlogId" required />
                </div>
                <div>
                    <label for="image">Image:</label>
                    <input type="text" name="image" id="image" required />
                </div>
                <div>
                    <label for="updateDate">Update Date:</label>
                    <input type="date" name="updateDate" id="updateDate" required />
                </div>
                <div>
                    <label for="description">Description:</label>
                    <textarea name="description" id="description" required></textarea>
                </div>
                <div>
                    <label for="content">Content:</label>
                    <textarea name="content" id="content" required></textarea>
                </div>
                <div>
                    <label for="status">Status:</label>
                    <input type="text" name="status" id="status" required />
                </div>
                <button type="submit">Add Post</button>
            </form>
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
