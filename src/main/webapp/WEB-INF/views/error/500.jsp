<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Server Error" />
</jsp:include>

<div class="error-container">
    <div class="error-content">
        <h1>500</h1>
        <h2>Server Error</h2>
        <p>Something went wrong on our end. Please try again later.</p>
        <a href="${pageContext.request.contextPath}/" class="btn btn-primary">Go Home</a>
    </div>
</div>

<jsp:include page="../common/footer.jsp" />
