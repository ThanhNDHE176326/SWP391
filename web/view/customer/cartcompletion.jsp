<%-- 
    Document   : cart-completion
    Created on : 17 June 2024, 5:30:00 pm
    Author     : Your Name
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Cart Completion Details">
        <meta name="author" content="Your Name">

        <title>Cart Completion | E-Shopper</title>

        <!-- Local Stylesheets -->
        <link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
        <link href="<c:url value='/css/font-awesome.min.css'/>" rel="stylesheet">
        <link href="<c:url value='/css/prettyPhoto.css'/>" rel="stylesheet">
        <link href="<c:url value='/css/price-range.css'/>" rel="stylesheet">
        <link href="<c:url value='/css/animate.css'/>" rel="stylesheet">
        <link href="<c:url value='/css/main.css'/>" rel="stylesheet">
        <link href="<c:url value='/css/responsive.css'/>" rel="stylesheet">

        <!-- Conditional scripts for IE9 -->
        <!--[if lt IE 9]>
        <script src="<c:url value='/js/html5shiv.js'/>"></script>
        <script src="<c:url value='/js/respond.min.js'/>"></script>
        <![endif]-->

        <!-- Favicon and Apple Icons -->
        <link rel="shortcut icon" href="<c:url value='/images/favicon.ico'/>">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="<c:url value='/images/apple-touch-icon-144-precomposed.png'/>">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="<c:url value='/images/apple-touch-icon-114-precomposed.png'/>">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="<c:url value='/images/apple-touch-icon-72-precomposed.png'/>">
        <link rel="apple-touch-icon-precomposed" href="<c:url value='/images/apple-touch-icon-57-precomposed.png'/>">

        <!-- CDN for Bootstrap (ensure you need this) -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

        <!-- CDN for Font Awesome (ensure you need this) -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            /* Custom CSS specific to this page */
            /* Add your custom styles here */
            .cart-completion-details {
                background-color: #fff;
                padding: 20px;
                margin-bottom: 30px;
                border: 1px solid #ddd;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .cart-completion-details h1 {
                font-size: 24px;
                margin-bottom: 20px;
            }

            .order-details {
                margin-bottom: 30px;
            }

            .order-details table {
                width: 100%;
                border-collapse: collapse;
                border: 1px solid #ddd;
            }

            .order-details th, .order-details td {
                padding: 10px;
                border: 1px solid #ddd;
            }

            .order-details th {
                background-color: #f2f2f2;
                text-align: left;
            }

            .payment-info {
                margin-bottom: 30px;
            }

            .payment-info p {
                margin-bottom: 10px;
            }

            .receiver-info-update {
                margin-bottom: 30px;
            }

            .order-confirmation {
                margin-bottom: 30px;
            }
        </style>
    </head>

    <body>
        <%-- Include header --%>
        <jsp:include page="header.jsp"/>

        <%-- Main content section --%>
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <%-- Sidebar with product search box, categories, latest products, and static contacts/links --%>
                        <div class="sidebar">
                            <h2>Search Products</h2>
                            <%-- Include product search box --%>
                            <jsp:include page="product-search-box.jsp"/>

                            <h2>Product Categories</h2>
                            <%-- Include product categories --%>
                            <jsp:include page="product-categories.jsp"/>

                            <h2>Latest Products</h2>
                            <%-- Include latest products --%>
                            <jsp:include page="latest-products.jsp"/>

                            <h2>Static Contacts/Links</h2>
                            <%-- Include static contacts/links --%>
                            <jsp:include page="static-contacts-links.jsp"/>
                        </div>
                    </div>

                    <div class="col-sm-9">
                        <%-- Cart completion details --%>
                        <div class="cart-completion-details">
                            <h1>Order Completion</h1>
                            <p>Thank you for your order! Below are your order details:</p>

                            <%-- Display order details (product list, quantities, prices, totals, etc.) --%>
                            <div class="order-details">
                                <%-- Include your order details rendering logic here --%>
                                <jsp:include page="order-details.jsp"/>
                            </div>

                            <%-- Payment information --%>
                            <div class="payment-info">
                                <h2>Payment Information</h2>
                                <%-- Retrieve and display payment information from system configuration --%>
                                <p>Bank Account Number: XXXX-XXXX-XXXX-XXXX</p>
                                <p>Payment due date: <%= new java.util.Date() %></p>
                            </div>

                            <%-- Receiver information update message --%>
                            <div class="receiver-info-update">
                                <h2>Receiver Information</h2>
                                <%-- Check and update receiver information if necessary --%>
                                <%-- Store updated receiver information in system history --%>
                                <%-- Display confirmation message --%>
                                <p id="receiver-update-message"></p>
                            </div>

                            <%-- Order confirmation and guides --%>
                            <div class="order-confirmation">
                                <h2>Order Confirmation</h2>
                                <%-- Send confirmation email to customer/user --%>
                                <%-- Display confirmation message on the page --%>
                                <p>An order confirmation email has been sent to your email address.</p>
                            </div>

                            <%-- Form for updating receiver information --%>
                            <form id="receiverInfoForm" action="${pageContext.request.contextPath}/updateReceiverInfo" method="POST">
                                <h2>Update Receiver Information</h2>
                                <div class="form-group">
                                    <label for="name">Name:</label>
                                    <input type="text" id="name" name="name" placeholder="Enter name">
                                </div>
                                <div class="form-group">
                                    <label for="email">Email:</label>
                                    <input type="email" id="email" name="email" placeholder="Enter email">
                                </div>
                                <div class="form-group">
                                    <label for="phone">Phone:</label>
                                    <input type="text" id="phone" name="phone" placeholder="Enter phone number">
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary">Update</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <%-- Include footer --%>
        <jsp:include page="footer.jsp"/>

        <!-- JavaScript files -->
        <script src="<c:url value='/js/jquery.js'/>"></script>
        <script src="<c:url value='/js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/js/jquery.scrollUp.min.js'/>"></script>
        <script src="<c:url value='/js/price-range.js'/>"></script>
        <script src="<c:url value='/js/jquery.prettyPhoto.js'/>"></script>
        <script src="<c:url value='/js/main.js'/>"></script>

        <!-- Custom scripts -->
        <script>
            // Add your custom scripts here

            // Example: Form submission validation
            document.addEventListener('DOMContentLoaded', function () {
                document.getElementById('receiverInfoForm').addEventListener('submit', function (event) {
                    event.preventDefault(); // Prevent form submission for now

                    var name = document.getElementById('name').value.trim();
                    var email = document.getElementById('email').value.trim();
                    var phone = document.getElementById('phone').value.trim();

                    if (name === '' || email === '' || phone === '') {
                        alert('Please fill out all fields.');
                        return;
                    }

                    // Simulate AJAX request to update receiver information
                    var formData = {
                        name: name,
                        email: email,
                        phone: phone
                    };

                    // Assuming jQuery is included for AJAX handling
                    $.ajax({
                        type: 'POST',
                        url: '${pageContext.request.contextPath}/updateReceiverInfo',
                        data: formData,
                        success: function (response) {
                            // Update confirmation message
                            var messageElement = document.getElementById('receiver-update-message');
                            messageElement.textContent = 'Receiver information updated successfully.';
                        },
                        error: function (xhr, status, error) {
                            console.error('Error updating receiver information:', error);
                            alert('Failed to update receiver information. Please try again.');
                        }
                    });
                });
            });
        </script>


