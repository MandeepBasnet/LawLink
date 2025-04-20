<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="My Reviews" />
</jsp:include>

<div class="dashboard-container">
    <div class="sidebar">
        <ul>
            <li><a href="${pageContext.request.contextPath}/lawyer/dashboard">Dashboard</a></li>
            <li><a href="${pageContext.request.contextPath}/lawyer/appointments">Appointments</a></li>
            <li><a href="${pageContext.request.contextPath}/lawyer/reviews" class="active">Reviews</a></li>
            <li><a href="${pageContext.request.contextPath}/lawyer/profile">My Profile</a></li>
        </ul>
    </div>

    <div class="main-content">
        <h1>My Reviews</h1>

        <!-- Review Statistics -->
        <div class="review-stats">
            <div class="rating-summary">
                <div class="overall-rating">
                    <h3>${averageRating}</h3>
                    <div class="stars">
                        <c:forEach begin="1" end="5" var="i">
                            <i class="fas fa-star ${i <= averageRating ? 'active' : ''}"></i>
                        </c:forEach>
                    </div>
                    <p>${totalReviews} reviews</p>
                </div>
                <div class="rating-breakdown">
                    <div class="rating-bar">
                        <span class="rating-label">5 <i class="fas fa-star"></i></span>
                        <div class="progress">
                            <div class="progress-bar" style="width: ${stats.fiveStarPercentage}%"></div>
                        </div>
                        <span class="rating-count">${stats.fiveStarCount}</span>
                    </div>
                    <div class="rating-bar">
                        <span class="rating-label">4 <i class="fas fa-star"></i></span>
                        <div class="progress">
                            <div class="progress-bar" style="width: ${stats.fourStarPercentage}%"></div>
                        </div>
                        <span class="rating-count">${stats.fourStarCount}</span>
                    </div>
                    <div class="rating-bar">
                        <span class="rating-label">3 <i class="fas fa-star"></i></span>
                        <div class="progress">
                            <div class="progress-bar" style="width: ${stats.threeStarPercentage}%"></div>
                        </div>
                        <span class="rating-count">${stats.threeStarCount}</span>
                    </div>
                    <div class="rating-bar">
                        <span class="rating-label">2 <i class="fas fa-star"></i></span>
                        <div class="progress">
                            <div class="progress-bar" style="width: ${stats.twoStarPercentage}%"></div>
                        </div>
                        <span class="rating-count">${stats.twoStarCount}</span>
                    </div>
                    <div class="rating-bar">
                        <span class="rating-label">1 <i class="fas fa-star"></i></span>
                        <div class="progress">
                            <div class="progress-bar" style="width: ${stats.oneStarPercentage}%"></div>
                        </div>
                        <span class="rating-count">${stats.oneStarCount}</span>
                    </div>
                </div>
            </div>
        </div>

        <!-- Reviews List -->
        <div class="reviews-list">
            <h2>All Reviews</h2>

            <c:if test="${not empty reviews}">
                <c:forEach items="${reviews}" var="review">
                    <div class="review-card">
                        <div class="review-header">
                            <div class="reviewer-info">
                                <h4>${review.clientName}</h4>
                                <span class="review-date"><fmt:formatDate value="${review.reviewDate}" pattern="MMM dd, yyyy" /></span>
                            </div>
                            <div class="review-rating">
                                <c:forEach begin="1" end="5" var="i">
                                    <i class="fas fa-star ${i <= review.rating ? 'active' : ''}"></i>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="review-content">
                            <p>${review.comment}</p>
                        </div>
                        <div class="appointment-info">
                            <p><strong>Appointment Date:</strong> <fmt:formatDate value="${review.appointmentDate}" pattern="MMM dd, yyyy" /></p>
                        </div>
                    </div>
                </c:forEach>

                <!-- Pagination -->
                <c:if test="${totalPages > 1}">
                    <div class="pagination">
                        <c:if test="${currentPage > 1}">
                            <a href="${pageContext.request.contextPath}/lawyer/reviews?page=${currentPage - 1}" class="btn btn-light">Previous</a>
                        </c:if>

                        <c:forEach begin="1" end="${totalPages}" var="i">
                            <a href="${pageContext.request.contextPath}/lawyer/reviews?page=${i}" class="btn ${currentPage eq i ? 'btn-primary' : 'btn-light'}">${i}</a>
                        </c:forEach>

                        <c:if test="${currentPage < totalPages}">
                            <a href="${pageContext.request.contextPath}/lawyer/reviews?page=${currentPage + 1}" class="btn btn-light">Next</a>
                        </c:if>
                    </div>
                </c:if>
            </c:if>

            <c:if test="${empty reviews}">
                <div class="no-reviews">
                    <p>You have no reviews yet.</p>
                </div>
            </c:if>
        </div>
    </div>
</div>

<style>
    .review-stats {
        background-color: #fff;
        border-radius: 0.5rem;
        padding: 1.5rem;
        margin-bottom: 2rem;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    .rating-summary {
        display: flex;
        gap: 2rem;
    }

    .overall-rating {
        text-align: center;
        padding-right: 2rem;
        border-right: 1px solid #eee;
    }

    .overall-rating h3 {
        font-size: 3rem;
        margin-bottom: 0.5rem;
    }

    .stars {
        color: #ffc107;
        font-size: 1.2rem;
        margin-bottom: 0.5rem;
    }

    .rating-breakdown {
        flex: 1;
    }

    .rating-bar {
        display: flex;
        align-items: center;
        margin-bottom: 0.5rem;
    }

    .rating-label {
        width: 50px;
    }

    .progress {
        flex: 1;
        height: 10px;
        background-color: #f0f0f0;
        border-radius: 5px;
        margin: 0 10px;
    }

    .progress-bar {
        height: 100%;
        background-color: #95a1f9;
        border-radius: 5px;
    }

    .rating-count {
        width: 30px;
        text-align: right;
    }

    .review-card {
        background-color: #fff;
        border-radius: 0.5rem;
        padding: 1.5rem;
        margin-bottom: 1rem;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    .review-header {
        display: flex;
        justify-content: space-between;
        margin-bottom: 1rem;
    }

    .reviewer-info h4 {
        margin-bottom: 0.25rem;
    }

    .review-date {
        color: #6c757d;
        font-size: 0.9rem;
    }

    .review-content {
        margin-bottom: 1rem;
    }

    .appointment-info {
        font-size: 0.9rem;
        color: #6c757d;
        border-top: 1px solid #eee;
        padding-top: 1rem;
    }

    .no-reviews {
        background-color: #fff;
        border-radius: 0.5rem;
        padding: 2rem;
        text-align: center;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
</style>

<jsp:include page="../common/footer.jsp" />
