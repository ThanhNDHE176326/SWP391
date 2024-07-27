<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Sale Admin - Charts</title>

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

        <!-- Page level plugin CSS-->
        <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin.css" rel="stylesheet">
       


    </head>

    <body id="page-top">
        <jsp:include page="headersaleadmin.jsp"/>

        <div id="wrapper">

            <!-- Sidebar -->
            <jsp:include page="navbarsaleadmin.jsp"/>
            <!--        
            
                    <div id="content-wrapper">
            
                        <div class="container-fluid">
            
            <!-- Breadcrumbs-->
            

            <div class="col-lg-12">
                <div class="card mb-3">
                    <div class="card-header">
                        <i class="fas fa-chart-bar"></i>
                        Bar Chart Example
                    </div>
                    <div class="card-body">
                        <img src="${pageContext.request.contextPath}/chart.png" alt="Bar Chart"/>

                    </div>
                </div>
            </div>

        </div>
        <!-- /.container-fluid -->
        <!-- Sticky Footer -->
        <footer class="sticky-footer">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright © Your Website 2019</span>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.content-wrapper -->

</div>
<!-- /#wrapper -->
<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="login.html">Logout</a>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Page level plugin JavaScript-->
<script src="vendor/chart.js/Chart.min.js"></script>

<!--     Custom scripts for all pages
    <script src="js/sb-admin.min.js"></script>

     Demo scripts for this page
    <script src="js/demo/chart-bar-demo.js"></script>-->

<script>
    $(document).ready(function () {
        $.ajax({
            url: '${pageContext.request.contextPath}/saledashboard',
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                if (data && data.successOrders && data.totalOrders && data.revenues) {
                    var ctx = document.getElementById("myBarChart").getContext('2d');
                    var myBarChart = new Chart(ctx, {
                        type: 'bar',
                        data: {
                            labels: [${dateLabels}]
                            datasets: [{
                                    label: 'Success Orders',
                                    backgroundColor: "rgba(2,117,216,1)",
                                    borderColor: "rgba(2,117,216,1)",
                                    data: data.successOrders
                                }, {
                                    label: 'Total Orders',
                                    backgroundColor: "rgba(255,0,0,0.7)",
                                    borderColor: "rgba(255,0,0,0.7)",
                                    data: data.totalOrders
                                }, {
                                    label: 'Revenues',
                                    backgroundColor: "rgba(0,255,0,0.7)",
                                    borderColor: "rgba(0,255,0,0.7)",
                                    data: data.revenues
                                }]
                        },
                        options: {
                            scales: {
                                xAxes: [{
                                        time: {
                                            unit: 'day'
                                        },
                                        gridLines: {
                                            display: false
                                        },
                                        ticks: {
                                            maxTicksLimit: 7
                                        }
                                    }],
                                yAxes: [{
                                        ticks: {
                                            min: 0,
                                            max: Math.max(...data.totalOrders, ...data.successOrders, ...data.revenues),
                                            maxTicksLimit: 5
                                        },
                                        gridLines: {
                                            display: true
                                        }
                                    }]
                            },
                            legend: {
                                display: true
                            }
                        }
                    });
                } else {
                    console.error('Unexpected data format:', data);
                }
            },
            error: function (xhr, status, error) {
                console.error('AJAX error:', status, error);
            }   
        });
    });
</script>
</body>

</html>
