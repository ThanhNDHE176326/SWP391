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

    <title>Update Post</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fc;
            margin: 0;
            padding: 0;
            min-height: 160vh;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        header h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #4e73df;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        form label {
            font-weight: bold;
            margin-bottom: 5px;
        }

        form input[type="text"],
        form input[type="date"],
        form textarea,
        form select {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 100%;
            box-sizing: border-box;
        }

        form textarea {
            resize: vertical;
            height: 100px;
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
        }

        form button:hover {
            background-color: #2e59d9;
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
                <h1>Update Post</h1>
            </header>
            <form action="updatepost" method="post">
                <input type="hidden" name="id" value="${post.id}"/>
                
                <label for="title">Title:</label>
                <input type="text" name="title" id="title" value="${post.title}" required/>
                
                <label for="category_blog_id">Category:</label>
                <input type="text" name="category_blog_id" id="category_blog_id" value="${post.categoryBlog}" required/>
                
                <label for="image">Image:</label>
                <input type="text" name="image" id="image" value="${post.image}" required/>
                
                <label for="description">Description:</label>
                <textarea name="description" id="description" required>${post.description}</textarea>
                
                <label for="content">Content:</label>
                <textarea name="content" id="content" required>${post.content}</textarea>
                
                <label for="status">Status:</label>
                <input type="text" name="status" id="status" value="${post.status}" required/>
                
                <button type="submit">Update</button>
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

</body>

</html>
