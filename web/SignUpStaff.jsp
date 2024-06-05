<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign Up</title>
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section">Sign Up</h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-12 col-lg-10">
                        <div class="wrap d-md-flex">
                            <div class="img" style="background-image: url(images/loginstaff.jpg);">
                            </div>
                            <div class="login-wrap p-4 p-md-5">
                                <div class="d-flex">
                                    <div class="w-100">
                                        <h3 class="mb-4">Create an Account</h3>
                                    </div>      
                                </div>
                                <form action="signupstaff" method="POST" class="signin-form">
                                    <div class="form-group mb-3">
                                        <label class="label" for="fullname">Full Name</label>
                                        <input name="fullname" type="text" class="form-control" placeholder="Full Name" required>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="label" for="username">Username</label>
                                        <input name="username" type="text" class="form-control" placeholder="Username" required>
                                    </div>
                                    <div class="form-group d-md-flex">
                                        <div class="mr-md-2 mb-3 flex-grow-1">
                                            <label class="label" for="password">Password</label>
                                            <input name="password" type="password" class="form-control" placeholder="Password" required>
                                        </div>
                                        <div class="ml-md-2 mb-3 flex-grow-1">
                                            <label class="label" for="re-password">Re-Password</label>
                                            <input name="repassword" type="password" class="form-control" placeholder="Re-Password" required>
                                        </div>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="label" for="email">Email</label>
                                        <input name="email" type="email" class="form-control" placeholder="Email" required>
                                    </div>
                                    <div class="form-group d-md-flex">
                                        <div class="mr-md-2 mb-3">
                                            <label class="label" for="phone">Phone</label>
                                            <input name="phone" type="text" class="form-control" placeholder="Phone" required>
                                        </div>
                                        <div class="ml-md-2 mb-3">
                                            <label class="label" for="address">Address</label>
                                            <input name="address" type="text" class="form-control" placeholder="Address" required>
                                        </div>
                                    </div>
                                    <div class="form-group d-md-flex">
                                        <div class="mr-md-2 mb-3 flex-grow-1">
                                            <label class="label" for="gender">Gender</label>
                                            <select name="gender" class="form-control" required>
                                                <option value="1">Male</option>
                                                <option value="0">Female</option>
                                            </select>
                                        </div>
                                        <div class="ml-md-2 mb-3 flex-grow-1">
                                            <label class="label" for="role">Role</label>
                                            <select name="role" class="form-control" required>
                                                <option value="1">User</option>
                                                <option value="2">Admin</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="form-control btn btn-primary rounded submit px-3">Sign Up</button>
                                    </div>
                                    <div class="form-group d-md-flex">
                                    </div>
                                </form>
                                <p class="text-center">Already have an account? <a href="loginstaff.jsp">Login</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="js/jquery.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
