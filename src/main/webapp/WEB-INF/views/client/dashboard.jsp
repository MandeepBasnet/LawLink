<jsp:include page="../common/header.jsp">
  <jsp:param name="title" value="Dashboard" />
</jsp:include>

<div class="dashboard-container">
  <div class="sidebar">
    <ul>
      <li><a href="${pageContext.request.contextPath}/client/dashboard" class="active">Dashboard</a></li>
      <li><a href="${pageContext.request.contextPath}/client/appointments">My Appointments</a></li>
      <li><a href="${pageContext.request.contextPath}/client/profile">My Profile</a></li>
    </ul>
  </div>

  <div class="main-content">
    <h1>Welcome, ${sessionScope.user.fullName}</h1>

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
    </div>

    <div class="upcoming-appointments">
      <h2>Upcoming Appointments</h2>

      <c:if test="${not empty upcomingAppointments}">
        <div class="appointment-list">
          <c:forEach items="${upcomingAppointments}" var="appointment">
            <div class="appointment-card">
              <div class="lawyer-info">
                <img src="${pageContext.request.contextPath}/${appointment.lawyerImage}" alt="${appointment.lawyerName}">
                <div>
                  <h3>${appointment.lawyerName}</h3>
                  <p>${appointment.lawyerSpecialization}</p>
                </div>
              </div>
              <div class="appointment-details">
                <p><i class="fas fa-calendar"></i> ${appointment.appointmentDate}</p>
                <p><i class="fas fa-clock"></i> ${appointment.appointmentTime}</p>
                <p><i class="fas fa-tag"></i> ${appointment.status}</p>
              </div>
              <div class="appointment-actions">
                <a href="${pageContext.request.contextPath}/client/appointments/${appointment.appointmentId}" class="btn btn-primary">View Details</a>
              </div>
            </div>
          </c:forEach>
        </div>
      </c:if>

      <c:if test="${empty upcomingAppointments}">
        <div class="no-appointments">
          <p>You have no upcoming appointments.</p>
          <a href="${pageContext.request.contextPath}/lawyers" class="btn btn-primary">Find a Lawyer</a>
        </div>
      </c:if>
    </div>
  </div>
</div>

<jsp:include page="../common/footer.jsp" />
