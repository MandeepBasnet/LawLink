<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="common/header.jsp">
    <jsp:param name="title" value="Register" />
</jsp:include>

<div class="auth-container">
    <div class="card auth-card">
        <div class="card-header">
            <h2 class="text-center">Register</h2>
        </div>
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/register" method="post" class="needs-validation">
                <div class="form-group">
                    <label for="fullName">Full Name</label>
                    <input type="text" class="form-control" id="fullName" name="fullName" required>
                </div>
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" class="form-control" id="username" name="username" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <div class="password-input">
                        <input type="password" class="form-control" id="password" name="password" required>
                        <span class="password-toggle" data-target="password">
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
                    <button type="submit" class="btn btn-primary btn-block">Register</button>
                </div>
            </form>
        </div>
        <div class="card-footer text-center">
            Already have an account? <a href="${pageContext.request.contextPath}/login">Login</a>
        </div>
    </div>
</div>

<jsp:include page="common/footer.jsp" />
