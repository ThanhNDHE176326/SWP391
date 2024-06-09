<%-- 
    Document   : DetailSlider
    Created on : 25 May 2024, 4:16:27 am
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
                   
         </form>   
        <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Image</th>
                <th>Notes</th>
                <th>Staff</th>
                <th>StartDate</th>
                <th>EndDate</th>                              
                <th>Status</th>
               
                
            </tr>
        </thead>       
        <tbody>      
                <tr>
                    <td>${slider.getId()}</td>
                    <td>${slider.getTitle()}</td>
                    <td>${slider.getImage()}</td>
                    <td>${slider.getNote()}</td>
                    <td>${slider.getStaff()}</td>
                    <td>${slider.getStartDate()}</td>                   
                    <td>${slider.getEndDate()}</td>                                                        
                    <td>${slider.getStatus()}</td>                                    
                </tr>
           
        </tbody>
    </table>
    
    
    <div>
        <c:forEach begin="1" end="${end}" var="i">
                <a id="${i}" href="search?index=${i}&txtSearch=${txtSearch}"> 
                    ${i}</a>
                </c:forEach>
        </div>
    
    </body>
</html>

