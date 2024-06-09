<%-- 
    Document   : FilterSlider
    Created on : 25 May 2024, 4:29:35 am
    Author     : dat ngo huy
--%>

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
        <form id="frm" action="filter" method="post">

            Filter: 
            <select name="filter" onchange="document.getElementById('frm').submit()">
               
                <option name="all" value="1" ${slider.status == all ? "selected" : ""}>All</option>
                <option name="show" value="1" ${slider.status == how ? "selected" : ""}>Show</option>
                <option name="hide" value="0" ${slider.status == hide ? "selected" : ""}>Hide</option>

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
                <c:forEach items="${show}" var="q">
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

