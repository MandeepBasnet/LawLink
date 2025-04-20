<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="common/header.jsp">
  <jsp:param name="title" value="Reset Password" />
</jsp:include>

<div class="auth-container">
  <div class="card auth-card">
    <div class="card-header">
      <h2 class="text-center">Reset Password</h2>
    </div>
    <div class="card-body">
      <form action="${pageContext.request.contextPath}/reset-password" method="post" class="needs-validation">
        <input type="hidden" name="token" value="${token}">
        <input type="hidden" name="userId" value="${userId}">
        <div class="form-group">
          <label for="newPassword">New Password</label>
          <div class="password-input">
            <input type="password" class="form-control" id="newPassword" name="newPassword" required>
            <span class="password-toggle" data-target="newPassword">
                            <i class="fas fa-eye"></i>
                        </span>
          </div>
        </div>
        <div class="form-group">
          <label for="confirmPassword">Confirm Password</label>
          <div class="password-input">
            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
            <span class="password-toggle" data-target="confirmPassword">
                            <i class="fas fa-eye"></i>
                        </span>
          </div>
        </div>
        <div class="form-group">
          <button type="submit" class="btn btn-primary btn-block">Reset Password</button>
        </div>
      </form>
    </div>
  </div>
</div>

<jsp:include page="common/footer.jsp" />
