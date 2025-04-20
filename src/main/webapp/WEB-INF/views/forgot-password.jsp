<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="common/header.jsp">
  <jsp:param name="title" value="Forgot Password" />
</jsp:include>

<div class="auth-container">
  <div class="card auth-card">
    <div class="card-header">
      <h2 class="text-center">Forgot Password</h2>
    </div>
    <div class="card-body">
      <p class="text-center mb-3">Enter your email address and we'll send you a link to reset your password.</p>
      <form action="${pageContext.request.contextPath}/forgot-password" method="post" class="needs-validation">
        <div class="form-group">
          <label for="email">Email</label>
          <input type="email" class="form-control" id="email" name="email" required>
        </div>
        <div class="form-group">
          <button type="submit" class="btn btn-primary btn-block">Send Reset Link</button>
        </div>
      </form>
    </div>
    <div class="card-footer text-center">
      <a href="${pageContext.request.contextPath}/login">Back to Login</a>
    </div>
  </div>
</div>

<jsp:include page="common/footer.jsp" />
