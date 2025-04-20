<jsp:include page="../common/header.jsp">
  <jsp:param name="title" value="My Profile" />
</jsp:include>

<div class="dashboard-container">
  <div class="sidebar">
    <ul>
      <li><a href="${pageContext.request.contextPath}/client/dashboard">Dashboard</a></li>
      <li><a href="${pageContext.request.contextPath}/client/appointments">My Appointments</a></li>
      <li><a href="${pageContext.request.contextPath}/client/profile" class="active">My Profile</a></li>
    </ul>
  </div>

  <div class="main-content">
    <h1>My Profile</h1>

    <div class="profile-container">
      <div class="profile-image">
        <img src="${pageContext.request.contextPath}/${client.profileImage != null ? client.profileImage : 'assets/images/default-profile.jpg'}" alt="${client.fullName}">
        <form action="${pageContext.request.contextPath}/client/profile/image" method="post" enctype="multipart/form-data" class="mt-2">
          <div class="form-group">
            <label for="profileImage" class="btn btn-secondary btn-sm">Change Image</label>
            <input type="file" id="profileImage" name="profileImage" class="d-none" onchange="this.form.submit()">
          </div>
        </form>
      </div>

      <div class="profile-details">
        <div class="card">
          <div class="card-header">
            <h3>Personal Information</h3>
            <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#editProfileModal">Edit</button>
          </div>
          <div class="card-body">
            <div class="profile-info">
              <div class="info-item">
                <span class="info-label">Full Name:</span>
                <span class="info-value">${client.fullName}</span>
              </div>
              <div class="info-item">
                <span class="info-label">Username:</span>
                <span class="info-value">${client.username}</span>
              </div>
              <div class="info-item">
                <span class="info-label">Email:</span>
                <span class="info-value">${client.email}</span>
              </div>
              <div class="info-item">
                <span class="info-label">Phone:</span>
                <span class="info-value">${client.phone != null ? client.phone : 'Not provided'}</span>
              </div>
              <div class="info-item">
                <span class="info-label">Address:</span>
                <span class="info-value">${client.address != null ? client.address : 'Not provided'}</span>
              </div>
              <div class="info-item">
                <span class="info-label">Date of Birth:</span>
                <span class="info-value">${client.dateOfBirth != null ? client.dateOfBirth : 'Not provided'}</span>
              </div>
              <div class="info-item">
                <span class="info-label">Gender:</span>
                <span class="info-value">${client.gender != null ? client.gender : 'Not provided'}</span>
              </div>
            </div>
          </div>
        </div>

        <div class="card mt-3">
          <div class="card-header">
            <h3>Security</h3>
          </div>
          <div class="card-body">
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#changePasswordModal">Change Password</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Edit Profile Modal -->
<div class="modal fade" id="editProfileModal" tabindex="-1" role="dialog" aria-labelledby="editProfileModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="editProfileModalLabel">Edit Profile</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="${pageContext.request.contextPath}/client/profile" method="post" class="needs-validation">
        <div class="modal-body">
          <div class="form-group">
            <label for="fullName">Full Name</label>
            <input type="text" class="form-control" id="fullName" name="fullName" value="${client.fullName}" required>
          </div>
          <div class="form-group">
            <label for="phone">Phone</label>
            <input type="tel" class="form-control" id="phone" name="phone" value="${client.phone}">
          </div>
          <div class="form-group">
            <label for="address">Address</label>
            <textarea class="form-control" id="address" name="address" rows="3">${client.address}</textarea>
          </div>
          <div class="form-group">
            <label for="dateOfBirth">Date of Birth</label>
            <input type="date" class="form-control" id="dateOfBirth" name="dateOfBirth" value="${client.dateOfBirth}">
          </div>
          <div class="form-group">
            <label for="gender">Gender</label>
            <select class="form-control" id="gender" name="gender">
              <option value="">Select Gender</option>
              <option value="MALE" ${client.gender eq 'MALE' ? 'selected' : ''}>Male</option>
              <option value="FEMALE" ${client.gender eq 'FEMALE' ? 'selected' : ''}>Female</option>
              <option value="OTHER" ${client.gender eq 'OTHER' ? 'selected' : ''}>Other</option>
            </select>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary">Save Changes</button>
        </div>
      </form>
    </div>
  </div>
</div>

<!-- Change Password Modal -->
<div class="modal fade" id="changePasswordModal" tabindex="-1" role="dialog" aria-labelledby="changePasswordModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="changePasswordModalLabel">Change Password</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="${pageContext.request.contextPath}/client/profile/password" method="post" class="needs-validation">
        <div class="modal-body">
          <div class="form-group">
            <label for="currentPassword">Current Password</label>
            <input type="password" class="form-control" id="currentPassword" name="currentPassword" required>
          </div>
          <div class="form-group">
            <label for="newPassword">New Password</label>
            <input type="password" class="form-control" id="newPassword" name="newPassword" required>
          </div>
          <div class="form-group">
            <label for="confirmPassword">Confirm New Password</label>
            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary">Change Password</button>
        </div>
      </form>
    </div>
  </div>
</div>

<jsp:include page="../common/footer.jsp" />
