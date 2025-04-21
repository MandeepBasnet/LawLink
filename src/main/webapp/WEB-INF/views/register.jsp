<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - LawLink</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #e5e5e5;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            display: flex;
            max-width: 1000px;
            width: 100%;
            overflow: hidden;
            border-radius: 20px;
        }

        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }

            .register-image-container {
                display: none;
            }

            .register-form-container {
                width: 100%;
                padding: 20px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="register-image-container">
        <img src="${pageContext.request.contextPath}/images/lady-justice.png" alt="Lady Justice statue">
    </div>
    <div class="register-form-container">
        <div class="register-form-content">
            <h1 class="register-form-title">Register</h1>
            <p class="register-form-subtitle">Enter your Personal details to create your account</p>

            <c:if test="${not empty error}">
                <div class="error">${error}</div>
            </c:if>

            <form action="${pageContext.request.contextPath}/register" method="post">
                <div class="register-form-group">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" required>
                </div>
                <div class="register-form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <div class="register-form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div class="register-form-group">
                    <label for="fullName">Full Name:</label>
                    <input type="text" id="fullName" name="fullName" required>
                </div>
                <div class="register-form-group">
                    <label for="phone">Phone:</label>
                    <input type="tel" id="phone" name="phone" required>
                </div>
                <div class="register-form-group">
                    <label for="address">Address:</label>
                    <textarea id="address" name="address" required></textarea>
                </div>
                <div class="register-form-group">
                    <input type="text" name="profilePicture" placeholder="Profile Picture">
                </div>
                <button type="submit" class="register-form-button">Register</button>
            </form>

            <div class="register-login-section">
                <span class="register-login-text">Already Have An Account?</span>
                <a href="${pageContext.request.contextPath}/login">
                    <button type="button" class="register-login-btn">LOG IN</button>
                </a>
            </div>
        </div>
    </div>
</div>
</body>
</html>