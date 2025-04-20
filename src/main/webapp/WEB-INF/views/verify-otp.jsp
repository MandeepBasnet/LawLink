<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="common/header.jsp">
    <jsp:param name="title" value="Verify OTP" />
</jsp:include>

<div class="auth-container">
    <div class="card auth-card">
        <div class="card-header">
            <h2 class="text-center">Verify OTP</h2>
        </div>
        <div class="card-body">
            <p class="text-center mb-3">Please enter the OTP sent to your email address.</p>
            <form action="${pageContext.request.contextPath}/verify-otp" method="post" class="needs-validation">
                <input type="hidden" name="token" value="${token}">
                <div class="form-group">
                    <label for="otp">OTP</label>
                    <input type="text" class="form-control" id="otp" name="otp" required>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-block">Verify OTP</button>
                </div>
            </form>
        </div>
    </div>
</div>

<jsp:include page="common/footer.jsp" />
