<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="common/header.jsp">
    <jsp:param name="title" value="Change Password" />
</jsp:include>

<div class="auth-container">
    <div class="card auth-card">
        <div class="card-header">
            <h2 class="text-center">Change Password</h2>
        </div>
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/change-password" method="post" class="needs-validation">
                <div class="form-group">
                    <label for="currentPassword">Current Password</label>
                    <div class="password-input">
                        <input type="password" class="form-control" id="currentPassword" name="currentPassword" required>
                        <span class="password-toggle" data-target="currentPassword">
                            <i class="fas fa-eye"></i>
                        </span>
                    </div>
                </div>
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
                    <label for="confirmPassword">Confirm New Password</label>
                    <div class="password-input">
                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                        <span class="password-toggle" data-target="confirmPassword">
                            <i class="fas fa-eye"></i>
                        </span>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-block">Change Password</button>
                </div>
            </form>
        </div>
    </div>
</div>

<jsp:include page="common/footer.jsp" />
