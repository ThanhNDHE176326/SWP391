<%-- 
    Document   : listSlider
    Created on : 24 May 2024, 3:11:56 pm
    Author     : dat ngo huy
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="search?index=1" method="post" >
            <input type="text" name="txtSearch" size="15" required>
            <input type="submit" name="button" value="Search" >

         <form id="frm" action="filter" method="post">

            Filter: 
            <select name="filter" onchange="document.getElementById('frm').submit()">
               
                <option name="all" value="all" ${slider.status == all ? "selected" : ""}>All</option>
                <option name="show" value="show" ${slider.status == how ? "selected" : ""}>Show</option>
                <option name="hide" value="hide" ${slider.status == hide ? "selected" : ""}>Hide</option>
               
            </select>

        </form>
        <table border="1">
            <thead>
                <tr>                   
                    <th>Title</th>
                    <th>Image</th>
                    <th>Notes</th>                
                    <th>StartDate</th>
                    <th>EndDate</th>                                                  
                    <th>Action</th>

                </tr>
            </thead>

            <tbody>
                <c:forEach items="${listslider}" var="q">
                    <tr>
                        
                        <td>${q.getTitle()}</td>
                        <td>${q.getImage()}</td>
                        <td>${q.getNote()}</td>
                       
                        <td>${q.getStartDate()}</td>                   
                        <td>${q.getEndDate()}</td>                                                        
                                         
                        <td>
                            <a href="edit?mode=1&id=${q.id}">Edit</a> 
                            <span> | </span>
                            <a href="detail?mode=2&id=${q.getId()}">View Detail</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>


        <div>
            <c:forEach begin="1" end="${end}" var="i">
                <a id="${i}" href="search?index=${i}&txtSearch=${txtSearch}"> 
                    ${i}</a>
                </c:forEach>
        </div>
        <script>
            document.getElementById('${index}').style.color = "red";
        </script>
    </body>
</html>
