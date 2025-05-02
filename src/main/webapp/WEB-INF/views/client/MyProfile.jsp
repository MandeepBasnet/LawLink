<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Profile - LawLink</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/clientStyle.css">
</head>
<body>
<!-- Navigation Bar -->
<div class="navbar">
  <div class="logo-container">
    <img src="${pageContext.request.contextPath}/assets/images/logo.png" alt="LawLink Logo" class="logo-img">
    <span class="logo-text">LawLink</span>
  </div>

  <div class="nav-links">
    <a href="${pageContext.request.contextPath}/home">Home</a>
    <a href="${pageContext.request.contextPath}/appointment">Appointment</a>
    <a href="${pageContext.request.contextPath}/lawyers">Lawyers</a>
    <a href="${pageContext.request.contextPath}/about-us">About Us</a>
    <a href="${pageContext.request.contextPath}/contact-us">Contact Us</a>
  </div>

  <div class="profile">
    <img src="${pageContext.request.contextPath}/assets/images/profile_pic.png" alt="John Thapa" class="profile-pic">
    <div class="profile-menu">
      <a href="${pageContext.request.contextPath}/client/my-appointments">My Appointments</a>
      <a href="${pageContext.request.contextPath}/client/my-profile">My Profile</a>
      <form action="${pageContext.request.contextPath}/logout" method="post" style="margin:0;">
        <button type="submit">Logout</button>
      </form>
    </div>
  </div>
</div>

<!-- Main Content -->
<div class="container">
  <h1>My Profile</h1>

  <div class="user-name">${user.fullName}</div>

  <div class="info-container">
    <div class="info-column">
      <div class="info-heading">Basic Information</div>

      <div class="info-item">
        <div class="info-label">Username:</div>
        <div>${user.username}</div>
      </div>

      <div class="info-item">
        <div class="info-label">Gender:</div>
        <div>${user.gender}</div>
      </div>

      <div class="info-item">
        <div class="info-label">Date of Birth:</div>
        <div>${user.dateOfBirth}</div>
      </div>
    </div>

    <div class="info-column">
      <div class="info-heading">Contact Information</div>

      <div class="info-item">
        <div class="info-label">Email:</div>
        <div>${user.email}</div>
      </div>

      <div class="info-item">
        <div class="info-label">Phone:</div>
        <div>${user.phone}</div>
      </div>

      <div class="info-item">
        <div class="info-label">Address:</div>
        <div>${user.address}</div>
      </div>
    </div>
  </div>

  <div class="button-group">
    <form action="${pageContext.request.contextPath}/edit-profile" method="get">
      <button type="submit" class="btn btn-edit">Edit</button>
    </form>

    <form action="${pageContext.request.contextPath}/save-profile" method="post">
      <button type="submit" class="btn btn-save">Save</button>
    </form>

    <form action="${pageContext.request.contextPath}/change-password" method="get">
      <button type="submit" class="btn btn-password">Change Password</button>
    </form>
  </div>
</div>
</body>
</html>