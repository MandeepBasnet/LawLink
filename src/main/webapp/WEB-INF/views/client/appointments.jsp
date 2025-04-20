<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../common/header.jsp">
  <jsp:param name="title" value="My Appointments" />
</jsp:include>

<%--
   Client Appointments Page
   This page displays all appointments for the client and allows them to:
   - View appointment details
   - Cancel pending appointments
   - Leave reviews for completed appointments
   - Filter appointments by status
--%>

<div class="dashboard-container">
  <%-- Sidebar Navigation --%>
  <div class="sidebar">
    <ul>
      <li><a href="${pageContext.request.contextPath}/client/dashboard">Dashboard</a></li>
      <li><a href="${pageContext.request.contextPath}/client/appointments" class="active">My Appointments</a></li>
      <li><a href="${pageContext.request.contextPath}/client/profile">My Profile</a></li>
    </ul>
  </div>

  <%-- Main Content Area --%>
  <div class="main-content">
    <h1>My Appointments</h1>

    <%-- Appointment Tabs --%>
    <div class="appointment-tabs">
      <ul class="nav nav-tabs">
        <li class="nav-item">
          <a class="nav-link ${param.status eq 'PENDING' || empty param.status ? 'active' : ''}" href="${pageContext.request.contextPath}/client/appointments?status=PENDING">Pending</a>
        </li>
        <li class="nav-item">
          <a class="nav-link ${param.status eq 'CONFIRMED' ? 'active' : ''}" href="${pageContext.request.contextPath}/client/appointments?status=CONFIRMED">Confirmed</a>
        </li>
        <li class="nav-item">
          <a class="nav-link ${param.status eq 'COMPLETED' ? 'active' : ''}" href="${pageContext.request.contextPath}/client/appointments?status=COMPLETED">Completed</a>
        </li>
        <li class="nav-item">
          <a class="nav-link ${param.status eq 'CANCELLED' ? 'active' : ''}" href="${pageContext.request.contextPath}/client/appointments?status=CANCELLED">Cancelled</a>
        </li>
        <li class="nav-item">
          <a class="nav-link ${param.status eq 'ALL' ? 'active' : ''}" href="${pageContext.request.contextPath}/client/appointments?status=ALL">All</a>
        </li>
      </ul>

      <div class="tab-content mt-4">
        <div class="tab-pane active">
          <c:if test="${not empty appointments}">
            <div class="appointment-list">
              <c:forEach items="${appointments}" var="appointment">
                <div class="appointment-card">
                  <div class="lawyer-info">
                    <img src="${pageContext.request.contextPath}/${appointment.lawyerImage}" alt="${appointment.lawyerName}" class="avatar">
                    <div>
                      <h3>${appointment.lawyerName}</h3>
                      <p>${appointment.lawyerSpecialization}</p>
                    </div>
                  </div>
                  <div class="appointment-details">
                    <p><i class="fas fa-calendar"></i> <fmt:formatDate value="${appointment.appointmentDate}" pattern="EEEE, MMMM d, yyyy" /></p>
                    <p><i class="fas fa-clock"></i> <fmt:formatDate value="${appointment.appointmentTime}" pattern="h:mm a" /></p>
                    <p><i class="fas fa-tag"></i> <span class="status-badge status-${appointment.status.toLowerCase()}">${appointment.status}</span></p>
                    <p><i class="fas fa-dollar-sign"></i> $${appointment.consultationFee}</p>
                  </div>
                  <div class="appointment-actions">
                    <a href="${pageContext.request.contextPath}/client/appointments/${appointment.appointmentId}" class="btn btn-primary">View Details</a>

                    <c:if test="${appointment.status eq 'PENDING' || appointment.status eq 'CONFIRMED'}">
                      <form action="${pageContext.request.contextPath}/client/appointments/${appointment.appointmentId}/cancel" method="post" class="d-inline">
                        <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to cancel this appointment?')">Cancel</button>
                      </form>
                    </c:if>

                    <c:if test="${appointment.status eq 'COMPLETED' && empty appointment.review}">
                      <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#reviewModal${appointment.appointmentId}">Leave Review</button>

                      <%-- Review Modal --%>
                      <div class="modal fade" id="reviewModal${appointment.appointmentId}" tabindex="-1" role="dialog" aria-labelledby="reviewModalLabel${appointment.appointmentId}" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title" id="reviewModalLabel${appointment.appointmentId}">Leave a Review for ${appointment.lawyerName}</h5>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                              </button>
                            </div>
                            <form action="${pageContext.request.contextPath}/client/appointments/${appointment.appointmentId}/review" method="post">
                              <div class="modal-body">
                                <div class="form-group">
                                  <label for="rating${appointment.appointmentId}">Rating</label>
                                  <div class="rating-input" id="rating${appointment.appointmentId}">
                                    <div class="stars">
                                      <i class="fas fa-star star" data-rating="1"></i>
                                      <i class="fas fa-star star" data-rating="2"></i>
                                      <i class="fas fa-star star" data-rating="3"></i>
                                      <i class="fas fa-star star" data-rating="4"></i>
                                      <i class="fas fa-star star" data-rating="5"></i>
                                    </div>
                                    <input type="hidden" name="rating" id="ratingValue${appointment.appointmentId}" value="5" required>
                                  </div>
                                </div>
                                <div class="form-group">
                                  <label for="comment${appointment.appointmentId}">Comment</label>
                                  <textarea class="form-control" id="comment${appointment.appointmentId}" name="comment" rows="4" required></textarea>
                                </div>
                              </div>
                              <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                <button type="submit" class="btn btn-primary">Submit Review</button>
                              </div>
                            </form>
                          </div>
                        </div>
                      </div>
                    </c:if>

                    <c:if test="${appointment.status eq 'COMPLETED' && not empty appointment.review}">
                      <button type="button" class="btn btn-info" data-toggle="modal" data-target="#viewReviewModal${appointment.appointmentId}">View Review</button>

                      <%-- View Review Modal --%>
                      <div class="modal fade" id="viewReviewModal${appointment.appointmentId}" tabindex="-1" role="dialog" aria-labelledby="viewReviewModalLabel${appointment.appointmentId}" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title" id="viewReviewModalLabel${appointment.appointmentId}">Your Review for ${appointment.lawyerName}</h5>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                              </button>
                            </div>
                            <div class="modal-body">
                              <div class="review-rating mb-3">
                                <c:forEach begin="1" end="5" var="i">
                                  <i class="fas fa-star ${i <= appointment.review.rating ? 'active' : ''}"></i>
                                </c:forEach>
                              </div>
                              <div class="review-date mb-2">
                                <small>Submitted on <fmt:formatDate value="${appointment.review.reviewDate}" pattern="MMM dd, yyyy" /></small>
                              </div>
                              <div class="review-comment">
                                <p>${appointment.review.comment}</p>
                              </div>
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                          </div>
                        </div>
                      </div>
                    </c:if>
                  </div>
                </div>
              </c:forEach>
            </div>

            <%-- Pagination --%>
            <c:if test="${totalPages > 1}">
              <div class="pagination">
                <c:if test="${currentPage > 1}">
                  <a href="${pageContext.request.contextPath}/client/appointments?page=${currentPage - 1}&status=${param.status}" class="btn btn-light">Previous</a>
                </c:if>

                <c:forEach begin="1" end="${totalPages}" var="i">
                  <a href="${pageContext.request.contextPath}/client/appointments?page=${i}&status=${param.status}" class="btn ${currentPage eq i ? 'btn-primary' : 'btn-light'}">${i}</a>
                </c:forEach>

                <c:if test="${currentPage < totalPages}">
                  <a href="${pageContext.request.contextPath}/client/appointments?page=${currentPage + 1}&status=${param.status}" class="btn btn-light">Next</a>
                </c:if>
              </div>
            </c:if>
          </c:if>

          <c:if test="${empty appointments}">
            <div class="no-appointments">
              <p>No appointments found.</p>
              <a href="${pageContext.request.contextPath}/lawyers" class="btn btn-primary">Find a Lawyer</a>
            </div>
          </c:if>
        </div>
      </div>
    </div>
  </div>
</div>

<%-- JavaScript for Rating Stars --%>
<script>
  document.addEventListener("DOMContentLoaded", function() {
    const ratingInputs = document.querySelectorAll(".rating-input");

    ratingInputs.forEach(input => {
      const stars = input.querySelectorAll(".star");
      const ratingField = input.nextElementSibling;

      // Set all stars active by default (5-star rating)
      stars.forEach((star, index) => {
        if (index < 5) {
          star.classList.add("active");
        }
      });

      stars.forEach((star, index) => {
        star.addEventListener("click", () => {
          const ratingValue = parseInt(star.getAttribute("data-rating"));
          const modalId = ratingField.id.replace("ratingValue", "");
          document.getElementById("ratingValue" + modalId).value = ratingValue;

          stars.forEach((s, i) => {
            if (i < ratingValue) {
              s.classList.add("active");
            } else {
              s.classList.remove("active");
            }
          });
        });

        star.addEventListener("mouseover", () => {
          const ratingValue = parseInt(star.getAttribute("data-rating"));

          stars.forEach((s, i) => {
            if (i < ratingValue) {
              s.classList.add("hover");
            } else {
              s.classList.remove("hover");
            }
          });
        });

        star.addEventListener("mouseout", () => {
          stars.forEach(s => {
            s.classList.remove("hover");
          });
        });
      });
    });
  });
</script>

<jsp:include page="../common/footer.jsp" />
