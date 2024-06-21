<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="account-info-container">
    <h2>THÔNG TIN TÀI KHO?N</h2>
    <form id="profileForm" class="account-info-form" action="${pageContext.request.contextPath}/updatestaff" method="POST">
        <div class="row">
            <div class="form-group col-half">
                <label for="staffname">Username:</label>
                <input type="text" id="staffname" name="staffname" placeholder="Username" value="${staff.staffname}" readonly="readonly">
            </div>
            <div class="form-group col-half">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" placeholder="Email" value="${staff.email}" readonly="readonly">
            </div>
        </div>
        <div class="row">
            <div class="form-group col-half">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" placeholder="Name" value="${staff.name}">
            </div>
            <div class="form-group col-half">
                <label for="gender">Gender:</label>
                <select id="gender" name="gender" required>
                    <option value="" disabled selected>Gender</option>
                    <option value="1" ${staff.gender == 1 ? "selected" : ""}>Male</option>
                    <option value="0" ${staff.gender == 0 ? "selected" : ""}>Female</option>
                </select>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-half">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" placeholder="Address" value="${staff.address}">
            </div>
            <div class="form-group col-half">
                <label for="phone">Phone:</label>
                <input type="text" id="phone" name="phone" placeholder="Phone" value="${staff.phone}">
            </div>
        </div>
        <!-- Error Message -->
        <p class="error-message">${message}</p>
        <span id="phone-error" class="error-message"></span><br>
        <div class="row">
            <button type="submit" class="btn btn-default btn-block">Edit Profile</button>
<!--            <a href="${pageContext.request.contextPath}/view/customer/homepage.jsp" class="btn btn-secondary btn-block">Back to Home</a>-->
        </div>
    </form>
</div>
