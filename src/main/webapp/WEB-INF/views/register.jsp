<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up Form</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<div class="container">
    <div class="image-container">
        <img src="${pageContext.request.contextPath}/assets/images/lady%20justice.jpg" alt="Lady Justice statue">
    </div>
    <div class="form-container">
        <div class="form-content">
            <h1>SIGN UP</h1>
            <p class="subtitle">Enter your Personal details to create your account</p>

            <form action="${pageContext.request.contextPath}/register" method="post">
                <div class="form-group">
                    <input type="text" name="fullName" placeholder="Full Name" required>
                </div>
                <div class="form-group">
                    <input type="text" name="userName" placeholder="User Name" required>
                </div>
                <div class="form-group">
                    <input type="email" name="email" placeholder="Email Address" required>
                </div>
                <div class="form-group">
                    <input type="password" name="password" placeholder="Password" required>
                </div>
                <div class="form-group">
                    <input type="password" name="confirmPassword" placeholder="Confirm Password" required>
                </div>
                <div class="form-group">
                    <input type="text" name="profilePicture" placeholder="Profile Picture">
                </div>
                <button type="submit">Create Account</button>
            </form>

            <div class="login-section">
                <span class="login-text">Already Have An Account?</span>
                <a href="${pageContext.request.contextPath}/log-in">
                    <button type="button" class="login-btn">LOG IN</button>
                </a>
            </div>
        </div>
    </div>
</div>
</body>
</html>