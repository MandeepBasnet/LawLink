<jsp:include page="../common/header.jsp">
  <jsp:param name="title" value="Page Not Found" />
</jsp:include>

<div class="error-container">
  <div class="error-content">
    <h1>404</h1>
    <h2>Page Not Found</h2>
    <p>The page you are looking for does not exist or has been moved.</p>
    <a href="${pageContext.request.contextPath}/" class="btn btn-primary">Go Home</a>
  </div>
</div>

<jsp:include page="../common/footer.jsp" />
