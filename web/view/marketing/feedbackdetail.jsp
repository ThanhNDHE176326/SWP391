<%-- 
    Document   : FeedbackDetail
    Created on : 4 June 2024, 1:44:57 pm
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
        <form action="searchfeedback?index=1" method="post" >
            <input type="text" name="txtSearch" size="15" required>
            <input type="submit" name="button" value="Search" >
        </form>


        <table border="1">
            <tr>
                <th>ID</th>
                <th>Customer</th>
                <th>Product</th>
                <th>Date</th>
                <th>Rated Star</th>
                <th>Comment</th>
                <th>Change Status</th>
            </tr>
            <c:forEach var="feedback" items="${feedbackdetail}">
                <tr>
                    <td>${feedback.id}</td>
                    <td>${feedback.customer}</td>
                    <td>${feedback.product}</td>
                    <td>${feedback.date}</td>
                    <td>${feedback.ratedStar}</td>
                    <td>${feedback.comment}</td>
                    <td>
                        <form method="get" action="updatefeedback"  id="status">
                            <input type="hidden" name="customer" value="${feedback.customer}">
                            <select name="status" onchange="document.getElementById('status').submit()">
                                <option value="0" ${feedback.status == '0' ? 'selected' : ''}>Show</option>
                                <option value="1" ${feedback.status == '1' ? 'selected' : ''}>Hide</option>

                            </select>

                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>


    </body>
</html>
