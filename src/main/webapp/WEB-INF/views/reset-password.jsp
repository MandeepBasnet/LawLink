<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reset Password</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: Arial, sans-serif;
    }

    body {
      background-color: #d3d3d3;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
    }

    .container {
      background-color: #9ca3af;
      border-radius: 20px;
      padding: 40px;
      width: 100%;
      max-width: 500px;
    }
  </style>
</head>
<body>
<div class="container">
  <a href="${pageContext.request.contextPath}/home" class="reset-password-back-link">
    <span class="reset-password-back-arrow">◀</span> Back to Website
  </a>

  <h1 class="reset-password-title">Reset Password</h1>

  <form action="${pageContext.request.contextPath}/reset-password" method="post">
    <div class="reset-password-form-group">
      <label for="current-password" class="reset-password-label">Current Password</label>
      <input type="password" id="current-password" name="currentPassword" required class="reset-password-input">
    </div>

    <div class="reset-password-form-group">
      <label for="new-password" class="reset-password-label">New Password</label>
      <input type="password" id="new-password" name="newPassword" required class="reset-password-input">
    </div>

    <div class="reset-password-form-group">
      <label for="confirm-password" class="reset-password-label">New Password</label>
      <input type="password" id="confirm-password" name="confirmPassword" required class="reset-password-input">
    </div>

    <button type="submit" class="reset-password-button">Change Password</button>
  </form>
</div>
</body>
</html>