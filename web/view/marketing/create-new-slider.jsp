<%-- 
    Document   : create-new-slider
    Created on : Jun 27, 2024, 5:21:31 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
    <body>
        <h1>Hello World!</h1>
        <form action="${pageContext.request.contextPath}/createNewSlider" method="post" enctype="multipart/form-data">
            Title: <input type="text" name="title"required=""><br/><br/>
            Image: <input type="file" id="imageFile" name="imageFile" required=""><br/><br/>
            Note: <input type="text" name="note" required=""><br/><br/>
            Start Date: <input type="date" name="startDate"> 
            &nbsp;&nbsp;&nbsp;&nbsp;
            End Date: <input type="date" name="endDate"><br/><br/>
            <input type="submit" value="CREATE">
        </form>
    </body>
</html>
