<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Lawyer Dashboard" />
</jsp:include>

<div class="dashboard-container">
    <div class="sidebar">
        <ul>
            <li><a href="${pageContext.request.contextPath}/lawyer/dashboard" class="active">Dashboard</a></li>
            <li><a href="${pageContext.request.contextPath}/lawyer/appointments">Appointments</a></li>
            <li><a href="${pageContext.request.contextPath}/lawyer/reviews">Reviews</a></li>
            <li><a href="${pageContext.request.contextPath}/lawyer/profile">My Profile</a></li>
        </ul>
    </div>

    <div class="main-content">
        <h1>Welcome, ${sessionScope.user.fullName}</h1>

        <!-- Dashboard Statistics -->
        <div class="dashboard-stats">
            <div class="stat-card">
                <div class="stat-icon">
                    <i class="fas fa-calendar-check"></i>
                </div>
                <div class="stat-info">
                    <h3>${stats.totalAppointments}</h3>
                    <p>Total Appointments</p>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon">
                    <i class="fas fa-clock"></i>
                </div>
                <div class="stat-info">
                    <h3>${stats.pendingAppointments}</h3>
                    <p>Pending Appointments</p>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon">
                    <i class="fas fa-check-circle"></i>
                </div>
                <div class="stat-info">
                    <h3>${stats.completedAppointments}</h3>
                    <p>Completed Appointments</p>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon">
                    <i class="fas fa-dollar-sign"></i>
                </div>
                <div class="stat-info">
                    <h3>$${stats.totalEarnings}</h3>
                    <p>Total Earnings</p>
                </div>
            </div>
        </div>

        <!-- Availability Toggle -->
        <div class="availability-toggle">
            <h2>Availability</h2>
            <div class="form-check form-switch">
                <input class="form-check-input" type="checkbox" id="availabilityToggle" ${lawyer.available ? 'checked' : ''} onchange="updateAvailability(this.checked)">
                <label class="form-check-label" for="availabilityToggle">
                    ${lawyer.available ? 'Available for Appointments' : 'Not Available for Appointments'}
                </label>
            </div>
        </div>

        <!-- Recent Appointments Section -->
        <div class="recent-appointments">
            <div class="section-header">
                <h2>Recent Appointments</h2>
                <a href="${pageContext.request.contextPath}/lawyer/appointments" class="btn btn-primary btn-sm">View All</a>
            </div>

            <div class="appointment-list">
                <c:forEach items="${recentAppointments}" var="appointment">
                    <div class="appointment-card">
                        <div class="client-info">
                            <img src="${pageContext.request.contextPath}/${not empty appointment.clientImage ? appointment.clientImage : 'assets/images/default-profile.jpg'}" alt="${appointment.clientName}">
                            <div>
                                <h3>${appointment.clientName}</h3>
                                <p>${appointment.clientEmail}</p>
                            </div>
                        </div>
                        <div class="appointment-details">
                            <p><i class="fas fa-calendar"></i> <fmt:formatDate value="${appointment.appointmentDate}" pattern="MMM dd, yyyy" /></p>
                            <p><i class="fas fa-clock"></i> <fmt:formatDate value="${appointment.appointmentTime}" pattern="hh:mm a" /></p>
                            <p><i class="fas fa-tag"></i> ${appointment.status}</p>
                        </div>
                        <div class="appointment-actions">
                            <a href="${pageContext.request.contextPath}/lawyer/appointments/${appointment.appointmentId}" class="btn btn-primary">View Details</a>

                            <c:if test="${appointment.status eq 'PENDING'}">
                                <form action="${pageContext.request.contextPath}/lawyer/appointments/${appointment.appointmentId}/confirm" method="post" class="d-inline">
                                    <button type="submit" class="btn btn-success" onclick="return confirm('Are you sure you want to confirm this appointment?')">Confirm</button>
                                </form>
                            </c:if>

                            <c:if test="${appointment.status eq 'CONFIRMED'}">
                                <form action="${pageContext.request.contextPath}/lawyer/appointments/${appointment.appointmentId}/complete" method="post" class="d-inline">
                                    <button type="submit" class="btn btn-success" onclick="return confirm('Are you sure you want to mark this appointment as completed?')">Complete</button>
                                </form>
                            </c:if>

                            <c:if test="${appointment.status eq 'PENDING' || appointment.status eq 'CONFIRMED'}">
                                <form action="${pageContext.request.contextPath}/lawyer/appointments/${appointment.appointmentId}/cancel" method="post" class="d-inline">
                                    <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to cancel this appointment?')">Cancel</button>
                                </form>
                            </c:if>
                        </div>
                    </div>
                </c:forEach>

                <c:if test="${empty recentAppointments}">
                    <div class="no-appointments">
                        <p>You have no recent appointments.</p>
                    </div>
                </c:if>
            </div>
        </div>

        <!-- Recent Reviews Section -->
        <div class="recent-reviews">
            <div class="section-header">
                <h2>Recent Reviews</h2>
                <a href="${pageContext.request.contextPath}/lawyer/reviews" class="btn btn-primary btn-sm">View All</a>
            </div>

            <div class="reviews-list">
                <c:forEach items="${recentReviews}" var="review">
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
                    </div>
                </c:forEach>

                <c:if test="${empty recentReviews}">
                    <div class="no-reviews">
                        <p>You have no reviews yet.</p>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</div>

<script>
    function updateAvailability(isAvailable) {
        fetch('${pageContext.request.contextPath}/lawyer/profile/availability', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: 'available=' + isAvailable
        })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    document.querySelector('label[for="availabilityToggle"]').textContent =
                        isAvailable ? 'Available for Appointments' : 'Not Available for Appointments';
                } else {
                    alert('Failed to update availability: ' + data.message);
                    document.getElementById('availabilityToggle').checked = !isAvailable;
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('An error occurred while updating availability');
                document.getElementById('availabilityToggle').checked = !isAvailable;
            });
    }
</script>

<jsp:include page="../common/footer.jsp" />
