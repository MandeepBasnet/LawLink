<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="common/header.jsp">
    <jsp:param name="title" value="Login" />
</jsp:include>

<div class="auth-container">
    <div class="card auth-card">
        <div class="card-header">
            <h2 class="text-center">Login</h2>
        </div>
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/login" method="post" class="needs-validation">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" class="form-control" id="username" name="username" required>
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
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="rememberMe" name="rememberMe">
                        <label class="form-check-label" for="rememberMe">Remember me</label>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-block">Login</button>
                </div>
                <div class="form-group text-center">
                    <a href="${pageContext.request.contextPath}/forgot-password">Forgot password?</a>
                </div>
            </form>
        </div>
        <div class="card-footer text-center">
            Don't have an account? <a href="${pageContext.request.contextPath}/register">Register</a>
        </div>
    </div>
</div>

<jsp:include page="common/footer.jsp" />
