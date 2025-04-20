<jsp:include page="../common/header.jsp">
  <jsp:param name="title" value="Appointment Details" />
</jsp:include>

<div class="dashboard-container">
  <div class="sidebar">
    <ul>
      <li><a href="${pageContext.request.contextPath}/client/dashboard">Dashboard</a></li>
      <li><a href="${pageContext.request.contextPath}/client/appointments" class="active">My Appointments</a></li>
      <li><a href="${pageContext.request.contextPath}/client/profile">My Profile</a></li>
    </ul>
  </div>

  <div class="main-content">
    <h1>Appointment Details</h1>

    <div class="card">
      <div class="card-body">
        <div class="appointment-header">
          <div class="lawyer-info">
            <img src="${pageContext.request.contextPath}/${appointment.lawyerImage}" alt="${appointment.lawyerName}" class="lawyer-img">
            <div>
              <h2>${appointment.lawyerName}</h2>
              <p>${appointment.lawyerSpecialization}</p>
            </div>
          </div>
          <div class="appointment-status ${appointment.status.toLowerCase()}">
            <span>${appointment.status}</span>
          </div>
        </div>

        <div class="appointment-info">
          <div class="info-row">
            <div class="info-item">
              <span class="info-label">Date</span>
              <span class="info-value">${appointment.appointmentDate}</span>
            </div>
            <div class="info-item">
              <span class="info-label">Time</span>
              <span class="info-value">${appointment.appointmentTime}</span>
            </div>
          </div>

          <div class="info-row">
            <div class="info-item">
              <span class="info-label">Duration</span>
              <span class="info-value">${appointment.duration} minutes</span>
            </div>
            <div class="info-item">
              <span class="info-label">Consultation Fee</span>
              <span class="info-value">$${appointment.consultationFee}</span>
            </div>
          </div>

          <div class="info-row">
            <div class="info-item full-width">
              <span class="info-label">Notes</span>
              <span class="info-value">${not empty appointment.notes ? appointment.notes : 'No notes provided.'}</span>
            </div>
          </div>
        </div>

        <div class="appointment-actions">
          <c:if test="${appointment.status eq 'PENDING' || appointment.status eq 'CONFIRMED'}">
            <form action="${pageContext.request.contextPath}/client/appointments/${appointment.appointmentId}/cancel" method="post" class="d-inline">
              <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to cancel this appointment?')">Cancel Appointment</button>
            </form>
          </c:if>

          <c:if test="${appointment.status eq 'COMPLETED' && empty review}">
            <a href="${pageContext.request.contextPath}/client/appointments/${appointment.appointmentId}/review" class="btn btn-primary">Leave Review</a>
          </c:if>

          <a href="${pageContext.request.contextPath}/client/appointments" class="btn btn-secondary">Back to Appointments</a>
        </div>

        <!-- Display review if exists -->
        <c:if test="${not empty review}">
          <div class="review-section">
            <h3>Your Review</h3>
            <div class="review-card">
              <div class="review-header">
                <div class="review-rating">
                  <c:forEach begin="1" end="5" var="i">
                    <i class="fas fa-star ${i <= review.rating ? 'active' : ''}"></i>
                  </c:forEach>
                </div>
                <span class="review-date">${review.reviewDate}</span>
              </div>
              <div class="review-content">
                <p>${review.comment}</p>
              </div>
            </div>
          </div>
        </c:if>
      </div>
    </div>
  </div>
</div>

<style>
  .appointment-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 2rem;
    padding-bottom: 1rem;
    border-bottom: 1px solid #eee;
  }

  .lawyer-info {
    display: flex;
    align-items: center;
    gap: 1rem;
  }

  .lawyer-img {
    width: 80px;
    height: 80px;
    border-radius: 50%;
    object-fit: cover;
  }

  .appointment-status {
    padding: 0.5rem 1rem;
    border-radius: 2rem;
    font-weight: 500;
  }

  .appointment-status.pending {
    background-color: #fff3cd;
    color: #856404;
  }

  .appointment-status.confirmed {
    background-color: #d1ecf1;
    color: #0c5460;
  }

  .appointment-status.completed {
    background-color: #d4edda;
    color: #155724;
  }

  .appointment-status.cancelled {
    background-color: #f8d7da;
    color: #721c24;
  }

  .appointment-info {
    margin-bottom: 2rem;
  }

  .info-row {
    display: flex;
    margin-bottom: 1rem;
  }

  .info-item {
    flex: 1;
    display: flex;
    flex-direction: column;
  }

  .info-item.full-width {
    flex: 2;
  }

  .info-label {
    font-weight: 500;
    color: #6c757d;
    margin-bottom: 0.25rem;
  }

  .info-value {
    font-size: 1.1rem;
  }

  .appointment-actions {
    display: flex;
    gap: 1rem;
    margin-bottom: 2rem;
  }

  .review-section {
    margin-top: 2rem;
    padding-top: 1rem;
    border-top: 1px solid #eee;
  }

  .review-card {
    background-color: #f9f9f9;
    border-radius: 0.5rem;
    padding: 1rem;
    margin-top: 1rem;
  }

  .review-header {
    display: flex;
    justify-content: space-between;
    margin-bottom: 0.5rem;
  }

  .review-rating {
    color: #ffc107;
  }

  .review-date {
    color: #6c757d;
    font-size: 0.9rem;
  }
</style>

<jsp:include page="../common/footer.jsp" />
