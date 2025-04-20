<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Reviews Management" />
</jsp:include>

<div class="dashboard-container">
    <div class="sidebar">
        <ul>
            <li><a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/lawyers">Lawyers</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/clients">Clients</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/appointments">Appointments</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/reviews" class="active">Reviews</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/practice-areas">Practice Areas</a></li>
        </ul>
    </div>

    <div class="main-content">
        <h1>Reviews Management</h1>

        <!-- Search and Filter Section -->
        <div class="filter-section">
            <form action="${pageContext.request.contextPath}/admin/reviews" method="get" class="filter-form">
                <div class="row">
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="lawyerId">Lawyer</label>
                            <select class="form-control" id="lawyerId" name="lawyerId">
                                <option value="">All Lawyers</option>
                                <c:forEach items="${lawyers}" var="lawyer">
                                    <option value="${lawyer.lawyerId}" ${param.lawyerId eq lawyer.lawyerId ? 'selected' : ''}>${lawyer.fullName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="rating">Rating</label>
                            <select class="form-control" id="rating" name="rating">
                                <option value="">All Ratings</option>
                                <option value="5" ${param.rating eq '5' ? 'selected' : ''}>5 Stars</option>
                                <option value="4" ${param.rating eq '4' ? 'selected' : ''}>4 Stars</option>
                                <option value="3" ${param.rating eq '3' ? 'selected' : ''}>3 Stars</option>
                                <option value="2" ${param.rating eq '2' ? 'selected' : ''}>2 Stars</option>
                                <option value="1" ${param.rating eq '1' ? 'selected' : ''}>1 Star</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="dateRange">Date Range</label>
                            <input type="text" class="form-control" id="dateRange" name="dateRange" value="${param.dateRange}" placeholder="MM/DD/YYYY - MM/DD/YYYY">
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label>&nbsp;</label>
                            <button type="submit" class="btn btn-primary btn-block">Filter</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <!-- Reviews List -->
        <div class="reviews-section">
            <div class="table-responsive">
                <table class="table">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Appointment</th>
                        <th>Client</th>
                        <th>Lawyer</th>
                        <th>Rating</th>
                        <th>Date</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${reviews}" var="review">
                        <tr>
                            <td>${review.reviewId}</td>
                            <td>${review.appointmentId}</td>
                            <td>${review.clientName}</td>
                            <td>${review.lawyerName}</td>
                            <td>
                                <div class="star-rating">
                                    <c:forEach begin="1" end="5" var="i">
                                        <i class="fas fa-star ${i <= review.rating ? 'active' : ''}"></i>
                                    </c:forEach>
                                </div>
                            </td>
                            <td><fmt:formatDate value="${review.reviewDate}" pattern="MMM dd, yyyy" /></td>
                            <td>
                                <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#reviewModal${review.reviewId}">View</button>
                                <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#deleteModal${review.reviewId}">Delete</button>
                            </td>
                        </tr>

                        <!-- Review Modal -->
                        <div class="modal fade" id="reviewModal${review.reviewId}" tabindex="-1" role="dialog" aria-labelledby="reviewModalLabel${review.reviewId}" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="reviewModalLabel${review.reviewId}">Review Details</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="review-details">
                                            <p><strong>Review ID:</strong> ${review.reviewId}</p>
                                            <p><strong>Appointment ID:</strong> ${review.appointmentId}</p>
                                            <p><strong>Client:</strong> ${review.clientName}</p>
                                            <p><strong>Lawyer:</strong> ${review.lawyerName}</p>
                                            <p><strong>Rating:</strong>
                                                <span class="star-rating">
                                                       <c:forEach begin="1" end="5" var="i">
                                                           <i class="fas fa-star ${i <= review.rating ? 'active' : ''}"></i>
                                                       </c:forEach>
                                                   </span>
                                            </p>
                                            <p><strong>Date:</strong> <fmt:formatDate value="${review.reviewDate}" pattern="MMM dd, yyyy" /></p>
                                            <p><strong>Comment:</strong></p>
                                            <div class="review-comment">
                                                    ${review.comment}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Delete Modal -->
                        <div class="modal fade" id="deleteModal${review.reviewId}" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel${review.reviewId}" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="deleteModalLabel${review.reviewId}">Confirm Delete</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <p>Are you sure you want to delete this review?</p>
                                        <p>This action cannot be undone.</p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                        <form action="${pageContext.request.contextPath}/admin/reviews/delete" method="post">
                                            <input type="hidden" name="reviewId" value="${review.reviewId}">
                                            <button type="submit" class="btn btn-danger">Delete</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                    <c:if test="${empty reviews}">
                        <tr>
                            <td colspan="7" class="text-center">No reviews found.</td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
            </div>

            <!-- Pagination -->
            <c:if test="${totalPages > 1}">
                <div class="pagination-container">
                    <ul class="pagination">
                        <c:if test="${currentPage > 1}">
                            <li class="page-item">
                                <a class="page-link" href="${pageContext.request.contextPath}/admin/reviews?page=${currentPage - 1}&lawyerId=${param.lawyerId}&rating=${param.rating}&dateRange=${param.dateRange}">Previous</a>
                            </li>
                        </c:if>

                        <c:forEach begin="1" end="${totalPages}" var="i">
                            <li class="page-item ${currentPage eq i ? 'active' : ''}">
                                <a class="page-link" href="${pageContext.request.contextPath}/admin/reviews?page=${i}&lawyerId=${param.lawyerId}&rating=${param.rating}&dateRange=${param.dateRange}">${i}</a>
                            </li>
                        </c:forEach>

                        <c:if test="${currentPage < totalPages}">
                            <li class="page-item">
                                <a class="page-link" href="${pageContext.request.contextPath}/admin/reviews?page=${currentPage + 1}&lawyerId=${param.lawyerId}&rating=${param.rating}&dateRange=${param.dateRange}">Next</a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </c:if>
        </div>
    </div>
</div>

<jsp:include page="../common/footer.jsp" />
