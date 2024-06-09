<%-- 
    Document   : SearchFeedback
    Created on : 6 June 2024, 7:42:38 pm
    Author     : dat ngo huy
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Feedbacks</title>
    </head>
    <body>
        <h1>Feedback List</h1>

        <form action="searchfeedback?index=1" method="post" >
            <input type="text" name="txtSearch" size="15" required>
            <input type="submit" name="button" value="Search" >
        </form>

        <table border="1">
            <tr>
                <th>ID</th>
                <th><a href="FeedbackServlet?sortField=fullName&sortOrder=asc">Full Name</a></th>
                <th><a href="FeedbackServlet?sortField=productName&sortOrder=asc">Product Name</a></th>
                <th><a href="FeedbackServlet?sortField=ratedStar&sortOrder=asc">Rated Star</a></th>
                <th><a href="FeedbackServlet?sortField=status&sortOrder=asc">Status</a></th>
                <th>Actions</th>
            </tr>
            <c:forEach var="feedback" items="${list}">
                <tr>
                    <td>${feedback.id}</td>
                    <td>${feedback.customer}</td>
                    <td>${feedback.product}</td>
                    <td>${feedback.ratedStar}</td>
                    <td>${feedback.status}</td>
                    
                    <td>
                        <a href="listfeedback?mode=4&id=${feedback.getId()}">View Detail</a>
                    
                    </td>
                </tr>
            </c:forEach>
        </table>

        
       <div>
           <c:forEach begin="1" end="${end}" var="i">
                <a id="${i}" href="searchfeedback?index=${i}&txtSearch=${txtSearch}"> 
                    ${i}</a>
                </c:forEach>
        </div>
        <script>
            document.getElementById('${index}').style.color = "red";
        </script>
    </body>
</html>

