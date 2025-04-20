<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="common/header.jsp">
  <jsp:param name="title" value="${lawyer.fullName}" />
</jsp:include>
<jsp:include page="common/assets-include.jsp" />

<div class="container">
  <div class="lawyer-profile">
    <div class="profile-header">
      <div class="profile-image">
        <img src="${pageContext.request.contextPath}/${not empty lawyer.profileImage ? lawyer.profileImage : 'assets/images/default-profile.jpg'}" alt="${lawyer.fullName}">
      </div>
      <div class="profile-info">
        <h1>${lawyer.fullName}</h1>
        <div class="lawyer-availability ${lawyer.available ? 'available' : 'unavailable'}">
          <span class="status-dot"></span>
          <span>${lawyer.available ? 'Available' : 'Unavailable'}</span>
        </div>
        <div class="lawyer-specialization">
          <span>${lawyer.specialization}</span>
          <span class="experience-badge">${lawyer.experienceYears} Years</span>
        </div>
        <div class="lawyer-rating">
          <c:forEach begin="1" end="5" var="i">
            <i class="fas fa-star ${i <= lawyer.rating ? 'active' : ''}"></i>
          </c:forEach>
          <span>(${lawyer.rating})</span>
        </div>
        <div class="consultation-fee">
          <span>Consultation Fee:</span>
          <span class="fee">$${lawyer.consultationFee}</span>
        </div>
      </div>
    </div>

    <div class="profile-tabs">
      <ul class="nav nav-tabs">
        <li class="nav-item">
          <a class="nav-link active" data-toggle="tab" href="#about">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-toggle="tab" href="#reviews">Reviews</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-toggle="tab" href="#appointment">Book Appointment</a>
        </li>
      </ul>

      <div class="tab-content">
        <div id="about" class="tab-pane active">
          <h3>About</h3>
          <p>${lawyer.aboutMe}</p>

          <h3>Education</h3>
          <p>${lawyer.education}</p>

          <h3>Practice Areas</h3>
          <ul class="practice-areas-list">
            <c:forEach items="${practiceAreas}" var="area">
              <li>${area.areaName}</li>
            </c:forEach>
          </ul>
        </div>

        <div id="reviews" class="tab-pane">
          <h3>Reviews</h3>

          <c:if test="${not empty reviews}">
            <div class="reviews-list">
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
                </div>
              </c:forEach>
            </div>
          </c:if>

          <c:if test="${empty reviews}">
            <div class="no-reviews">
              <p>No reviews yet.</p>
            </div>
          </c:if>
        </div>

        <div id="appointment" class="tab-pane">
          <h3>Book Appointment</h3>

          <c:choose>
            <c:when test="${empty sessionScope.user}">
              <div class="login-prompt">
                <p>Please <a href="${pageContext.request.contextPath}/login">login</a> or <a href="${pageContext.request.contextPath}/register">register</a> to book an appointment.</p>
              </div>
            </c:when>
            <c:when test="${sessionScope.user.role ne 'CLIENT'}">
              <div class="login-prompt">
                <p>Only clients can book appointments.</p>
              </div>
            </c:when>
            <c:when test="${not lawyer.available}">
              <div class="unavailable-message">
                <p>This lawyer is currently unavailable for appointments.</p>
              </div>
            </c:when>
            <c:otherwise>
              <form action="${pageContext.request.contextPath}/appointments/book" method="post" class="appointment-form needs-validation">
                <input type="hidden" id="lawyer-id" name="lawyerId" value="${lawyer.lawyerId}">

                <div class="form-group">
                  <label for="appointment-date">Date</label>
                  <input type="date" class="form-control" id="appointment-date" name="appointmentDate" min="${minDate}" max="${maxDate}" required onchange="updateAvailableTimeSlots()">
                </div>

                <div class="form-group">
                  <label>Time</label>
                  <div id="time-slot-container" class="time-slot-container">
                    <p>Please select a date first.</p>
                  </div>
                </div>

                <div class="form-group">
                  <label for="notes">Notes (Optional)</label>
                  <textarea class="form-control" id="notes" name="notes" rows="3"></textarea>
                </div>

                <div class="form-group">
                  <button type="submit" class="btn btn-primary">Book Appointment</button>
                </div>
              </form>
            </c:otherwise>
          </c:choose>
        </div>
      </div>
    </div>
  </div>

  <div class="related-lawyers">
    <h3>Related Lawyers</h3>
    <div class="lawyer-grid">
      <c:forEach items="${relatedLawyers}" var="relatedLawyer">
        <div class="lawyer-card">
          <div class="lawyer-image">
            <img src="${pageContext.request.contextPath}/${not empty relatedLawyer.profileImage ? relatedLawyer.profileImage : 'assets/images/default-profile.jpg'}" alt="${relatedLawyer.fullName}">
          </div>
          <div class="lawyer-info">
            <div class="lawyer-availability ${relatedLawyer.available ? 'available' : 'unavailable'}">
              <span class="status-dot"></span>
              <span>${relatedLawyer.available ? 'Available' : 'Unavailable'}</span>
            </div>
            <h3>${relatedLawyer.fullName}</h3>
            <p>${relatedLawyer.specialization}</p>
            <div class="lawyer-rating">
              <c:forEach begin="1" end="5" var="i">
                <i class="fas fa-star ${i <= relatedLawyer.rating ? 'active' : ''}"></i>
              </c:forEach>
              <span>(${relatedLawyer.rating})</span>
            </div>
            <a href="${pageContext.request.contextPath}/lawyers/${relatedLawyer.lawyerId}" class="btn btn-primary">View Profile</a>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
</div>

<!-- JavaScript for lawyer profile demo data -->
<script>
  document.addEventListener('DOMContentLoaded', function() {
    // Check if we need to use demo data
    if (!document.querySelector('.profile-header h1').textContent.trim()) {
      // Get lawyer ID from URL
      const pathParts = window.location.pathname.split('/');
      const lawyerId = pathParts[pathParts.length - 1];

      // Find the lawyer in the demo data
      if (window.lawyers) {
        const lawyer = window.lawyers.find(l => l._id === lawyerId);

        if (lawyer) {
          // Update profile header
          document.querySelector('.profile-image img').src = lawyer.image;
          document.querySelector('.profile-header h1').textContent = lawyer.name;
          document.querySelector('.lawyer-specialization span:first-child').textContent = lawyer.practice;
          document.querySelector('.experience-badge').textContent = lawyer.experience;
          document.querySelector('.consultation-fee .fee').textContent = '$' + lawyer.fees;

          // Update about section
          document.querySelector('#about p').textContent = lawyer.about;
          document.querySelector('#about h3:nth-of-type(2) + p').textContent = lawyer.degree;

          // Add practice areas
          const practiceAreasList = document.querySelector('.practice-areas-list');
          if (practiceAreasList) {
            practiceAreasList.innerHTML = `<li>${lawyer.practice}</li>`;
          }
        }
      }
    }
  });
</script>

<jsp:include page="common/footer.jsp" />
