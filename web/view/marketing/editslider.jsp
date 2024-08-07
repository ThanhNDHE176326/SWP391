<%-- 
    Document   : editSlider
    Created on : 24 May 2024, 4:32:56 pm
    Author     : dat ngo huy
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Marketing - Edit Slider</title>
        <script>
            function validateDates() {
                var startDate = document.getElementById("startDate").value;
                var endDate = document.getElementById("endDate").value;

                if (new Date(startDate) >= new Date(endDate)) {
                    alert("Start Date must be earlier than End Date.");
                    return false;
                }
                return true;
            }

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
                const imageInput = document.getElementById('imageUpload');
                imageInput.addEventListener('change', checkFileType);
            });
        </script>
    </head>

    <body id="page-top">
        <jsp:include page="headermarketing.jsp"/>

        <div id="wrapper">
            <!-- Sidebar -->
            <jsp:include page="navbarmarketing.jsp"/>

            <div id="content-wrapper">
                <div class="container-fluid">
                    <!-- Breadcrumbs-->
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="homedashboard.jsp">Dashboard</a>
                        </li>
                        <li class="breadcrumb-item active">Edit Slider</li>
                    </ol>

                    <!-- Edit Form -->
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fas fa-edit"></i>
                            Edit Slider
                        </div>
                        <div class="card-body">
                            <form action="${pageContext.request.contextPath}/edit" method="post" enctype="multipart/form-data" onsubmit="return validateDates()">

                                <input type="hidden" name="id" value="${slider.id}">
                                <div class="form-group row">
                                    <label for="title" class="col-sm-2 col-form-label">Title</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="title" value="${slider.title}" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="imageUpload" class="col-sm-2 col-form-label">Image</label>
                                    <div class="col-sm-10">
                                        <img src="${pageContext.request.contextPath}/images/${slider.image}" alt="Image of Slider" class="img-fluid mb-3" width="400"><br/><br/>
                                        <input type="file" id="imageUpload" name="imageUpload">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="note" class="col-sm-2 col-form-label">Note</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="note" value="${slider.note}">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="startDate" class="col-sm-2 col-form-label">Start Date</label>
                                    <div class="col-sm-10">
                                        <input type="date" id="startDate" class="form-control" name="startDate" value="${slider.startDate}">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="endDate" class="col-sm-2 col-form-label">End Date</label>
                                    <div class="col-sm-10">
                                        <input type="date" id="endDate" class="form-control" name="endDate" value="${slider.endDate}">
                                    </div>
                                </div>                              

                                <div class="form-group row">
                                    <label for="status" class="col-sm-2 col-form-label">Status</label>
                                    <div class="col-sm-10">
                                        <select name="status" class="form-control">
                                            <option value="1" ${slider.status eq "1" ? 'selected' : ''}>Show</option>
                                            <option value="0" ${slider.status eq "0" ? 'selected' : ''}>Hide</option>
                                        </select>




                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-10 offset-sm-2">
                                        <button type="submit" class="btn btn-primary">Edit</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
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

