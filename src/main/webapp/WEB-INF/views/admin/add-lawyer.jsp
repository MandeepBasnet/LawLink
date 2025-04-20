<jsp:include page="../common/header.jsp">
  <jsp:param name="title" value="Add Lawyer" />
</jsp:include>

<div class="dashboard-container">
  <div class="sidebar">
    <ul>
      <li><a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a></li>
      <li><a href="${pageContext.request.contextPath}/admin/lawyers" class="active">Lawyers</a></li>
      <li><a href="${pageContext.request.contextPath}/admin/clients">Clients</a></li>
      <li><a href="${pageContext.request.contextPath}/admin/appointments">Appointments</a></li>
      <li><a href="${pageContext.request.contextPath}/admin/practice-areas">Practice Areas</a></li>
    </ul>
  </div>

  <div class="main-content">
    <h1>Add Lawyer</h1>

    <div class="card">
      <div class="card-body">
        <form action="${pageContext.request.contextPath}/admin/lawyers/add" method="post" enctype="multipart/form-data" class="needs-validation">
          <div class="form-row">
            <div class="form-group col-md-6">
              <label for="username">Username</label>
              <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="form-group col-md-6">
              <label for="password">Password</label>
              <input type="password" class="form-control" id="password" name="password" required>
            </div>
          </div>

          <div class="form-row">
            <div class="form-group col-md-6">
              <label for="fullName">Full Name</label>
              <input type="text" class="form-control" id="fullName" name="fullName" required>
            </div>
            <div class="form-group col-md-6">
              <label for="email">Email</label>
              <input type="email" class="form-control" id="email" name="email" required>
            </div>
          </div>

          <div class="form-row">
            <div class="form-group col-md-6">
              <label for="phone">Phone</label>
              <input type="tel" class="form-control" id="phone" name="phone">
            </div>
            <div class="form-group col-md-6">
              <label for="licenseNumber">License Number</label>
              <input type="text" class="form-control" id="licenseNumber" name="licenseNumber" required>
            </div>
          </div>

          <div class="form-row">
            <div class="form-group col-md-6">
              <label for="specialization">Specialization</label>
              <input type="text" class="form-control" id="specialization" name="specialization" required>
            </div>
            <div class="form-group col-md-6">
              <label for="experienceYears">Experience (Years)</label>
              <input type="number" class="form-control" id="experienceYears" name="experienceYears" min="0" required>
            </div>
          </div>

          <div class="form-row">
            <div class="form-group col-md-6">
              <label for="consultationFee">Consultation Fee ($)</label>
              <input type="number" class="form-control" id="consultationFee" name="consultationFee" min="0" step="0.01" required>
            </div>
            <div class="form-group col-md-6">
              <label for="profileImage">Profile Image</label>
              <div class="custom-file">
                <input type="file" class="custom-file-input" id="profileImage" name="profileImage">
                <label class="custom-file-label" for="profileImage">Choose file</label>
              </div>
            </div>
          </div>

          <div class="form-group">
            <label for="education">Education</label>
            <textarea class="form-control" id="education" name="education" rows="2" required></textarea>
          </div>

          <div class="form-group">
            <label for="address">Address</label>
            <textarea class="form-control" id="address" name="address" rows="2"></textarea>
          </div>

          <div class="form-group">
            <label for="aboutMe">About</label>
            <textarea class="form-control" id="aboutMe" name="aboutMe" rows="4" required></textarea>
          </div>

          <div class="form-group">
            <label>Practice Areas</label>
            <div class="practice-areas-checkboxes">
              <c:forEach items="${practiceAreas}" var="area">
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="practiceAreas" value="${area.areaId}" id="area${area.areaId}">
                  <label class="form-check-label" for="area${area.areaId}">
                      ${area.areaName}
                  </label>
                </div>
              </c:forEach>
            </div>
          </div>

          <div class="form-group">
            <div class="form-check">
              <input class="form-check-input" type="checkbox" id="isVerified" name="isVerified">
              <label class="form-check-label" for="isVerified">
                Verified
              </label>
            </div>
          </div>

          <div class="form-group">
            <div class="form-check">
              <input class="form-check-input" type="checkbox" id="isAvailable" name="isAvailable" checked>
              <label class="form-check-label" for="isAvailable">
                Available for Appointments
              </label>
            </div>
          </div>

          <button type="submit" class="btn btn-primary">Add Lawyer</button>
        </form>
      </div>
    </div>
  </div>
</div>

<jsp:include page="../common/footer.jsp" />
