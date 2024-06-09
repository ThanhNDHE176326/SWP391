<%-- 
    Document   : editSlider
    Created on : 24 May 2024, 4:32:56 pm
    Author     : dat ngo huy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Slider</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }
            .container {
                max-width: 500px;
                margin: 20px auto;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                padding: 20px;
            }
            label {
                display: inline-block;
                width: 120px;
                font-weight: bold;
                margin-bottom: 10px;
            }
            input[type="text"],
            select {
                width: calc(100% - 130px);
                padding: 8px;
                border-radius: 4px;
                border: 1px solid #ccc;
                margin-bottom: 10px;
                box-sizing: border-box;
            }
            input[type="submit"] {
                background-color: #007bff;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            input[type="submit"]:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <h2>Edit</h2>
            <form action="edit" method="post">              
                <label for="title">Title:</label>
                <input type="text" name="title" value="${slider.title}" ><br>
                
                

                <label for="image">Image:</label>                              
                <img src="${slider.image}" alt="Image of Slider"><br>    

                <label for="Note">Note:</label>                              
                <input type="text" name="note" value="${slider.note}" ><br>
                
                <label for="Staff">Staff:</label>
                <input type="text" name="staff" value="${slider.staff}" ><br>
                
                
                <label for="StartDate">StartDate:</label>
                <input type="text" name="startDate" value="${slider.startDate}" ><br>
                
                
                <label for="EndDate">EndDate:</label>
                <input type="text" name="endDate" value="${slider.endDate}" ><br>
                
                <label for="isDelete">IsDelete:</label>
                <input type="text" name="isDelete" value="${slider.isDelete}" ><br>
                                                             
                <label for="Status">Status:</label>   
                <select>
                    <option value="1" ${slider.status == 1 ? "selected" : ""}>Show</option>
                    <option value="0" ${slider.status == 0 ? "selected" : ""}>Hide</option>
                </select>
              


                <input type="submit" name="edit" value="Edit">
            </form>
        </div>

    </body>
</html>
