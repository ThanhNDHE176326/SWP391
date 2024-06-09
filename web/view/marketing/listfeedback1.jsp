<%-- 
    Document   : List SLider
    Created on : 30 May 2024, 5:55:44 pm
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
        
             <form id="statusSearch" action="FilterFeedbackByStatus">
                Filter by Status:
                <select name="statusSearch" onchange="document.getElementById('statusSearch').submit();">
                    <option value="all" ${statusSearch eq "all"? "selected":""}>All Status</option>
                    <option value="show" ${statusSearch eq "show"? "selected":""}>Show</option>
                    <option value="hide"${statusSearch eq "hide"? "selected":""}>Hide</option>
                </select>  
            </form>
                      
        <table border="1">
            <tr>
                <th><a href="FeedbackServlet?sortField=fullName&sortOrder=asc">Full Name</a></th>
                <th><a href="FeedbackServlet?sortField=productName&sortOrder=asc">Product Name</a></th>
                <th><a href="FeedbackServlet?sortField=ratedStar&sortOrder=asc">Rated Star</a></th>
                <th><a href="FeedbackServlet?sortField=status&sortOrder=asc">Status</a></th>
                <th>Actions</th>
            </tr>
            
            <c:forEach var="feedback" items="${allfeedback}">
                <tr>
                    
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

