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

        <title>Marketing - Add New Post</title>
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

            document.addEventListener('DOMContentLoaded', () => {
                const imageInput = document.getElementById('imageFile');
                imageInput.addEventListener('change', checkFileType);
            });
        </script>
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
                <form action="CreatePost" method="post" enctype="multipart/form-data">
                    <!--                    <div>
                                            <label for="staff">Staff ID:</label>
                                            <input type="text" name="staff" id="staff" required />
                                        </div>-->
                    <div>
                        <label for="title">Title:</label>
                        <input type="text" name="title" id="title" required />
                    </div>
                    <div>
                        <label for="category">Category:</label>
                        <select name="category" id="category">
                            <c:forEach items="${listCategoryBlog}" var="category">
                                <option value="${category.id}">${category.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div>
                        <label for="image">Image:</label>
                        <input type="file" name="imageFile" id="imageFile" required />
                    </div>
<!--                    <div>
                        <label for="updateDate">Update Date:</label>
                        <input type="date" name="updateDate" id="updateDate" required />
                    </div>-->
                    <div>
                        <label for="description">Description:</label>
                        <textarea name="description" id="description" required></textarea>
                    </div>
                    <div>
                        <label for="content">Content:</label>
                        <textarea name="content" id="content" required></textarea>
                    </div>
                    <!--                    <div>
                                            <label for="status">Status:</label>
                                            <input type="text" name="status" id="status" required />
                                        </div>-->
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
    </body>

</html>
