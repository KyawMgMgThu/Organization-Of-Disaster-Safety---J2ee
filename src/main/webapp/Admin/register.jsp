<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>ODS | Register</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- App css -->
    <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/app.min.css" rel="stylesheet" type="text/css" id="app-style"/>
</head>
<body class="loading" data-layout-config='{"darkMode":false}'>

    <div class="account-pages pt-2 pt-sm-5 pb-4 pb-sm-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xxl-4 col-lg-5">
                    <div class="card">

                        <div class="card-body p-4">
                            <div class="text-center w-75 m-auto">
                                <h4 class="text-dark-50 text-center mt-0 fw-bold">Admin Page Register</h4>
                                <p class="text-muted mb-4">Create your account</p>
                            </div>

                            <form action="/Disaster_Safety/authServlet" method="post">
                                <div class="mb-3">
                                    <label for="fullname" class="form-label">Full Name</label>
                                    <input class="form-control" name="username" type="text" id="fullname" placeholder="Enter your name" required>
                                </div>

                                <div class="mb-3">
                                    <label for="emailaddress" class="form-label">Email address</label>
                                    <input class="form-control" name="email" type="email" id="emailaddress" required placeholder="Enter your email">
                                </div>

                                <div class="mb-3">
                                    <label for="password" class="form-label">Password</label>
                                    <div class="input-group input-group-merge">
                                        <input type="password" name="password" id="password" class="form-control" placeholder="Enter your password">
                                        <div class="input-group-text" data-password="false">
                                            <span class="password-eye"></span>
                                        </div>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="checkbox-signup">
                                        <label class="form-check-label" for="checkbox-signup">I accept <a href="#" class="text-muted">Terms and Conditions</a></label>
                                    </div>
                                </div>

                                <div class="mb-3 text-center">
                                    <input class="btn btn-primary" type="submit" value="Sign Up">
                                </div>
                            </form>

                            <%-- Error Handling --%>
                            <%
                                String error = request.getParameter("error");
                                if (error != null) {
                                    out.println("<p style='color: red;'>" + error + "</p>");
                                }
                            %>

                        </div> <!-- end card-body -->
                    </div> <!-- end card -->
                    <div class="row mt-3">
                        <div class="col-12 text-center">
                        <p class="text-muted">Already have an account? <a href="login.html" class="text-muted ms-1"><b>Log In</b></a></p>
                        </div>
                    </div>
                </div> <!-- end col -->
            </div>
        </div>
    </div>

    <footer class="footer footer-alt">
        <script>document.write(new Date().getFullYear())</script> © All Rights Reserved. Developed by Group
    </footer>

    <!-- bundle -->
    <script src="assets/js/vendor.min.js"></script>
    <script src="assets/js/app.min.js"></script>
    
</body>
</html>
                        