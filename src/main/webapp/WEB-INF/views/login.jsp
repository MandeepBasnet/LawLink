<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login Page</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
  </head>
  <body>
    <div class="container">
      <div class="log-in-image-container">
        <img
          src="${pageContext.request.contextPath}/assets/images/legal_background.jpg"
          alt="Legal background with gavel and books"
        />
      </div>
      <div class="log-in-form-container">
        <a
          href="${pageContext.request.contextPath}/home"
          class="log-in-back-link"
        >
          <span class="log-in-back-arrow">◀</span> Back to Website
        </a>

        <h1 class="log-in-title">Welcome!</h1>
        <p class="log-in-subtitle">Login to get started</p>

        <form action="${pageContext.request.contextPath}/log-in" method="post">
          <div class="log-in-form-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" required />
          </div>

          <div class="log-in-form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required />
          </div>

          <a
            href="${pageContext.request.contextPath}/reset-password"
            class="log-in-forgot-password"
            >Forget Password?</a
          >

          <button type="submit" class="log-in-login-btn">LOGIN</button>
        </form>

        <div class="log-in-signup-section">
          <span>Don't Have An Account?</span>
          <a href="${pageContext.request.contextPath}/register">
            <button type="button" class="log-in-signup-btn">SIGN UP</button>
          </a>
        </div>
      </div>
    </div>
  </body>
</html>
