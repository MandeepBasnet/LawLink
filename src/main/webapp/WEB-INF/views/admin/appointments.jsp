<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="All Appointments" />
</jsp:include>

<div class="dashboard-container">
    <div class="sidebar">
        <ul>
            <li><a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/lawyers">Lawyers</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/clients">Clients</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/appointments" class="active">Appointments</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/reviews">Reviews</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/practice-areas">Practice Areas</a></li>
        </ul>
    </div>

    <div class="main-content">
        <h1>All Appointments</h1>

        <!-- Filter and Search Section -->
        <div class="filter-section">
            <form action="${pageContext.request.contextPath}/admin/appointments" method="get" class="filter-form">
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label for="status">Status</label>
                        <select class="form-control" id="status" name="status">
                            <option value="ALL" ${param.status eq 'ALL' ? 'selected' : ''}>All</option>
                            <option value="PENDING" ${param.status eq 'PENDING' || empty param.status ? 'selected' : ''}>Pending</option>
                            <option value="CONFIRMED" ${param.status eq 'CONFIRMED' ? 'selected' : ''}>Confirmed</option>
                            <option value="COMPLETED" ${param.status eq 'COMPLETED' ? 'selected' : ''}>Completed</option>
                            <option value="CANCELLED" ${param.status eq 'CANCELLED' ? 'selected' : ''}>Cancelled</option>
                        </select>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="lawyer">Lawyer</label>
                        <select class="form-control" id="lawyer" name="lawyerId">
                            <option value="">All Lawyers</option>
                            <c:forEach items="${lawyers}" var="lawyer">
                                <option value="${lawyer.lawyerId}" ${param.lawyerId eq lawyer.lawyerId ? 'selected' : ''}>${lawyer.fullName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="client">Client</label>
                        <select class="form-control" id="client" name="clientId">
                            <option value="">All Clients</option>
                            <c:forEach items="${clients}" var="client">
                                <option value="${client.clientId}" ${param.clientId eq client.clientId ? 'selected' : ''}>${client.fullName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="date">Date</label>
                        <input type="date" class="form-control" id="date" name="date" value="${param.date}">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-9">
                        <label for="search">Search</label>
                        <input type="text" class="form-control" id="search" name="search" placeholder="Search by ID, lawyer name, or client name" value="${param.search}">
                    </div>
                    <div class="form-group col-md-3">
                        <label>&nbsp;</label>
                        <button type="submit" class="btn btn-primary btn-block">Filter</button>
                    </div>
                </div>
            </form>
        </div>

        <!-- Appointments List -->
        <div class="appointments-section">
            <c:if test="${not empty appointments}">
                <div class="table-responsive">
                    <table class="table table-striped">
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
                        <c:forEach items="${appointments}" var="appointment">
                            <tr>
                                <td>${appointment.appointmentId}</td>
                                <td>${appointment.lawyerName}</td>
                                <td>${appointment.clientName}</td>
                                <td>${appointment.appointmentDate}</td>
                                <td>${appointment.appointmentTime}</td>
                                <td>
                                    <span class="status-badge ${appointment.status.toLowerCase()}">${appointment.status}</span>
                                </td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/admin/appointments/${appointment.appointmentId}" class="btn btn-primary btn-sm">View</a>

                                    <c:if test="${appointment.status eq 'PENDING'}">
                                        <form action="${pageContext.request.contextPath}/admin/appointments/${appointment.appointmentId}/confirm" method="post" class="d-inline">
                                            <button type="submit" class="btn btn-success btn-sm">Confirm</button>
                                        </form>
                                    </c:if>

                                    <c:if test="${appointment.status eq 'PENDING' || appointment.status eq 'CONFIRMED'}">
                                        <form action="${pageContext.request.contextPath}/admin/appointments/${appointment.appointmentId}/cancel" method="post" class="d-inline">
                                            <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to cancel this appointment?')">Cancel</button>
                                        </form>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                <!-- Pagination -->
                <c:if test="${totalPages > 1}">
                    <div class="pagination-container">
                        <ul class="pagination">
                            <c:if test="${currentPage > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="${pageContext.request.contextPath}/admin/appointments?page=${currentPage - 1}&status=${param.status}&lawyerId=${param.lawyerId}&clientId=${param.clientId}&date=${param.date}&search=${param.search}">Previous</a>
                                </li>
                            </c:if>

                            <c:forEach begin="1" end="${totalPages}" var="i">
                                <li class="page-item ${currentPage eq i ? 'active' : ''}">
                                    <a class="page-link" href="${pageContext.request.contextPath}/admin/appointments?page=${i}&status=${param.status}&lawyerId=${param.lawyerId}&clientId=${param.clientId}&date=${param.date}&search=${param.search}">${i}</a>
                                </li>
                            </c:forEach>

                            <c:if test="${currentPage < totalPages}">
                                <li class="page-item">
                                    <a class="page-link" href="${pageContext.request.contextPath}/admin/appointments?page=${currentPage + 1}&status=${param.status}&lawyerId=${param.lawyerId}&clientId=${param.clientId}&date=${param.date}&search=${param.search}">Next</a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </c:if>
            </c:if>

            <c:if test="${empty appointments}">
                <div class="no-data-message">
                    <p>No appointments found matching your criteria.</p>
                </div>
            </c:if>
        </div>
    </div>
</div>

<jsp:include page="../common/footer.jsp" />
