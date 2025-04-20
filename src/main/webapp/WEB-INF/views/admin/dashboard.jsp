<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Admin Dashboard" />
</jsp:include>

<div class="dashboard-container">
    <div class="sidebar">
        <ul>
            <li><a href="${pageContext.request.contextPath}/admin/dashboard" class="active">Dashboard</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/lawyers">Lawyers</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/clients">Clients</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/appointments">Appointments</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/reviews">Reviews</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/practice-areas">Practice Areas</a></li>
        </ul>
    </div>

    <div class="main-content">
        <h1>Admin Dashboard</h1>

        <!-- Dashboard Statistics -->
        <div class="dashboard-stats">
            <div class="stat-card">
                <div class="stat-icon">
                    <i class="fas fa-user-tie"></i>
                </div>
                <div class="stat-info">
                    <h3>${stats.totalLawyers}</h3>
                    <p>Total Lawyers</p>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon">
                    <i class="fas fa-users"></i>
                </div>
                <div class="stat-info">
                    <h3>${stats.totalClients}</h3>
                    <p>Total Clients</p>
                </div>
            </div>
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
                    <i class="fas fa-gavel"></i>
                </div>
                <div class="stat-info">
                    <h3>${stats.totalPracticeAreas}</h3>
                    <p>Practice Areas</p>
                </div>
            </div>
        </div>

        <!-- Recent Appointments Section -->
        <div class="recent-appointments">
            <div class="section-header">
                <h2>Recent Appointments</h2>
                <a href="${pageContext.request.contextPath}/admin/appointments" class="btn btn-primary btn-sm">View All</a>
            </div>

            <div class="table-responsive">
                <table class="table">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Lawyer</th>
                        <th>Client</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${recentAppointments}" var="appointment">
                        <tr>
                            <td>${appointment.appointmentId}</td>
                            <td>${appointment.lawyerName}</td>
                            <td>${appointment.clientName}</td>
                            <td><fmt:formatDate value="${appointment.appointmentDate}" pattern="MMM dd, yyyy" /></td>
                            <td><fmt:formatDate value="${appointment.appointmentTime}" pattern="hh:mm a" /></td>
                            <td>
                                <span class="status-badge status-${appointment.status.toLowerCase()}">${appointment.status}</span>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/admin/appointments/${appointment.appointmentId}" class="btn btn-info btn-sm">View</a>
                            </td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty recentAppointments}">
                        <tr>
                            <td colspan="7" class="text-center">No recent appointments found.</td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Recent Activity Section -->
        <div class="recent-activity">
            <div class="section-header">
                <h2>Recent Activity</h2>
            </div>

            <div class="activity-list">
                <c:forEach items="${recentActivities}" var="activity">
                    <div class="activity-item">
                        <div class="activity-icon">
                            <c:choose>
                                <c:when test="${activity.type eq 'LAWYER_ADDED'}">
                                    <i class="fas fa-user-plus"></i>
                                </c:when>
                                <c:when test="${activity.type eq 'CLIENT_REGISTERED'}">
                                    <i class="fas fa-user-plus"></i>
                                </c:when>
                                <c:when test="${activity.type eq 'APPOINTMENT_BOOKED'}">
                                    <i class="fas fa-calendar-plus"></i>
                                </c:when>
                                <c:when test="${activity.type eq 'APPOINTMENT_COMPLETED'}">
                                    <i class="fas fa-check-circle"></i>
                                </c:when>
                                <c:when test="${activity.type eq 'APPOINTMENT_CANCELLED'}">
                                    <i class="fas fa-times-circle"></i>
                                </c:when>
                                <c:when test="${activity.type eq 'REVIEW_ADDED'}">
                                    <i class="fas fa-star"></i>
                                </c:when>
                                <c:otherwise>
                                    <i class="fas fa-info-circle"></i>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="activity-details">
                            <p>${activity.description}</p>
                            <span class="activity-time">${activity.timestamp}</span>
                        </div>
                    </div>
                </c:forEach>

                <c:if test="${empty recentActivities}">
                    <div class="no-activity">
                        <p>No recent activity found.</p>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../common/footer.jsp" />
