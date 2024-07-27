<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Marketing - Feedback List</title>
    <style>
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .pagination a {
            margin: 0 5px;
            padding: 8px 16px;
            text-decoration: none;
            color: #007bff;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .pagination a.active {
            background-color: #007bff;
            color: white;
            border: 1px solid #007bff;
        }
        .pagination a:hover {
            background-color: #ddd;
        }
        th {
            cursor: pointer;
            position: relative;
        }
        .sort-icon {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 0.8em;
            color: #888;
        }
        .sort-icon.asc::before {
            content: '▲';
        }
        .sort-icon.desc::before {
            content: '▼';
        }
    </style>
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
                    <li class="breadcrumb-item active">Feedback List</li>
                </ol>
                <!-- Feedback List -->
                <div class="card mb-3">
                    <div class="card-header">
                        <i class="fas fa-table"></i>
                        Feedback List
                    </div>
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/searchfeedback?index=1" method="post" class="form-inline mb-3">
                            <input type="text" name="txtSearch" class="form-control mr-2" size="15" required>
                            <button type="submit" name="button" class="btn btn-primary">Search</button>
                        </form>

                        <form id="statusSearch" action="${pageContext.request.contextPath}/FilterFeedbackByStatus" class="form-inline mb-3">
                            <label for="statusSearch" class="mr-2">Filter by Status:</label>
                            <select name="statusSearch" class="form-control" onchange="document.getElementById('statusSearch').submit();">
                                <option value="all" ${statusSearch eq "all" ? "selected" : ""}>All Status</option>
                                <option value="show" ${statusSearch eq "show" ? "selected" : ""}>Show</option>
                                <option value="hide" ${statusSearch eq "hide" ? "selected" : ""}>Hide</option>
                            </select>
                        </form>

                        <form id="starSearch" action="${pageContext.request.contextPath}/FilterFeedbackByStar" class="form-inline mb-3">
                            <label for="starSearch" class="mr-2">Filter by Star:</label>
                            <select name="starSearch" class="form-control" onchange="document.getElementById('starSearch').submit();">
                                <option value="1" ${starSearch eq "1" ? "selected" : ""}>1 star</option>
                                <option value="2" ${starSearch eq "2" ? "selected" : ""}>2 star</option>
                                <option value="3" ${starSearch eq "3" ? "selected" : ""}>3 star</option>
                                <option value="4" ${starSearch eq "4" ? "selected" : ""}>4 star</option>
                                <option value="5" ${starSearch eq "5" ? "selected" : ""}>5 star</option>
                            </select>
                        </form>

                        <form id="CategorySearch" action="${pageContext.request.contextPath}/FilterFeedbackByCategories" class="form-inline mb-3">
                            <label for="CategorySearch" class="mr-2">Filter by Category:</label>
                            <select name="CategorySearch" class="form-control" onchange="document.getElementById('CategorySearch').submit();">
                                <option value="1" ${CategorySearch eq "1" ? "selected" : ""}>Triết học</option>
                                <option value="2" ${CategorySearch eq "2" ? "selected" : ""}>Lịch sử</option>
                                <option value="3" ${CategorySearch eq "3" ? "selected" : ""}>Khoa học</option>
                                <option value="4" ${CategorySearch eq "4" ? "selected" : ""}>Văn học</option>
                            </select>
                        </form>

                        <div class="table-responsive">
                            <table id="feedbackTable" class="table table-bordered" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th onclick="sortTable(1)">Full Name <span class="sort-icon" id="sortFullName"></span></th>
                                        <th onclick="sortTable(2)">Product Name <span class="sort-icon" id="sortProductName"></span></th>
                                        <th onclick="sortTable(3)">Rated Star <span class="sort-icon" id="sortRatedStar"></span></th>
                                        <th onclick="sortTable(4)">Status <span class="sort-icon" id="sortStatus"></span></th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="feedback" items="${allfeedback}">
                                        <tr>
                                            <td>${feedback.id}</td>
                                            <td>${feedback.customer}</td>
                                            <td>${feedback.product}</td>
                                            <td>${feedback.ratedStar}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${feedback.status == 1}">
                                                        Show
                                                    </c:when>
                                                    <c:otherwise>
                                                        Hide
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/listfeedback?mode=4&id=${feedback.getId()}" class="btn btn-info btn-sm">View Detail</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <div id="pagination" class="pagination"></div>

                        <script>
                            document.addEventListener('DOMContentLoaded', function() {
                                var pageSize = 8;
                                var currentPage = 1;
                                var table = document.getElementById('feedbackTable');
                                var rows = table.getElementsByTagName('tbody')[0].getElementsByTagName('tr');
                                var totalPages = Math.max(1, Math.ceil(rows.length / pageSize)); // Đảm bảo ít nhất 1 trang

                                var sortColumnIndex = -1;
                                var sortOrder = 'asc'; // 'asc' or 'desc'

                                function showPage(page) {
                                    var start = (page - 1) * pageSize;
                                    var end = page * pageSize;

                                    for (var i = 0; i < rows.length; i++) {
                                        if (i >= start && i < end) {
                                            rows[i].style.display = '';
                                        } else {
                                            rows[i].style.display = 'none';
                                        }
                                    }
                                }

                                function setupPagination() {
                                    var paginationDiv = document.getElementById('pagination');
                                    paginationDiv.innerHTML = '';

                                    if (totalPages > 1) {
                                        for (var i = 1; i <= totalPages; i++) {
                                            var link = document.createElement('a');
                                            link.href = '#';
                                            link.textContent = i;
                                            if (i === currentPage) {
                                                link.className = 'active';
                                            }
                                            link.addEventListener('click', (function(page) {
                                                return function(e) {
                                                    e.preventDefault();
                                                    currentPage = page;
                                                    showPage(currentPage);
                                                    setupPagination();
                                                };
                                            })(i));
                                            paginationDiv.appendChild(link);
                                        }
                                    } else {
                                        var link = document.createElement('a');
                                        link.href = '#';
                                        link.textContent = '1';
                                        link.className = 'active';
                                        paginationDiv.appendChild(link);
                                    }
                                }

                                function sortTable(columnIndex) {
                                    var rowsArray = Array.prototype.slice.call(rows);
                                    var sortIcon = document.querySelector('.sort-icon.asc') || document.querySelector('.sort-icon.desc');

                                    if (sortColumnIndex === columnIndex) {
                                        sortOrder = (sortOrder === 'asc') ? 'desc' : 'asc';
                                    } else {
                                        sortOrder = 'asc';
                                        if (sortIcon) sortIcon.className = 'sort-icon';
                                    }

                                    rowsArray.sort(function(a, b) {
                                        var cellA = a.getElementsByTagName('td')[columnIndex].textContent.trim();
                                        var cellB = b.getElementsByTagName('td')[columnIndex].textContent.trim();

                                        if (!isNaN(cellA) && !isNaN(cellB)) {
                                            cellA = parseFloat(cellA);
                                            cellB = parseFloat(cellB);
                                        }

                                        if (cellA < cellB) {
                                            return sortOrder === 'asc' ? -1 : 1;
                                        } else if (cellA > cellB) {
                                            return sortOrder === 'asc' ? 1 : -1;
                                        } else {
                                            return 0;
                                        }
                                    });

                                    var tbody = table.getElementsByTagName('tbody')[0];
                                    tbody.innerHTML = '';
                                    rowsArray.forEach(function(row) {
                                        tbody.appendChild(row);
                                    });

                                    sortColumnIndex = columnIndex;

                                    var icon = document.getElementById(['sortFullName', 'sortProductName', 'sortRatedStar', 'sortStatus'][columnIndex - 1]);
                                    icon.className = 'sort-icon ' + sortOrder;
                                }

                                showPage(currentPage);
                                setupPagination();
                            });
                        </script>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
