<%-- 
    Document   : SearchSlider
    Created on : 24 May 2024, 11:34:31 pm
    Author     : dat ngo huy
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Slider</title>
    </head>
    <body>
        <header class="container">
            <h1>Search Sliders</h1>
            <form action="search?index=1" method="post">
                <input type="text" name="txtSearch" size="15" placeholder="Search..." required>
                <input type="submit" name="button" value="Search">
            </form>
        </header>
        <div class="container">
            <div class="cards">
                <c:forEach items="${list}" var="q">
                    <div class="card">
                        <img src="${q.getImage()}" alt="${q.getTitle()}">
                        <h2>${q.getTitle()}</h2>
                        <p><strong>Notes:</strong> ${q.getNote()}</p>
                        <p><strong>Start Date:</strong> ${q.getStartDate()}</p>
                        <p><strong>End Date:</strong> ${q.getEndDate()}</p>
                        <div class="card-actions">
                            <a href="edit?mode=1&id=${q.id}">Edit</a>
                            <a href="detail?mode=2&id=${q.getId()}">View Detail</a>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="pagination">
                <c:forEach begin="1" end="${end}" var="i">
                    <a id="${i}" href="search?index=${i}&txtSearch=${txtSearch}">${i}</a>
                </c:forEach>
            </div>
        </div>
        <script>
            document.getElementById('${index}').style.color = "red";
        </script>
    </body>
</html>
