<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Lawyer - LawLink</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/WEB-INF/views/admin/css/style.css">
  </head>
  <body>
    <jsp:include page="common/header.jsp" />

    <div class="main-container">
        <jsp:include page="common/sidebar.jsp">
            <jsp:param name="activePage" value="add-lawyer" />
        </jsp:include>

      <div class="main-content">
            <div class="form-container">
          <h2 class="section-title">Add Lawyer</h2>
                <form action="${pageContext.request.contextPath}/admin/add-lawyer" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="profileImage">Upload Lawyer Image</label>
                        <input type="file" id="profileImage" name="profileImage" class="form-control" accept="image/*" required>
              </div>

                    <div class="form-group">
                        <label for="fullName">Lawyer Name</label>
                        <input type="text" id="fullName" name="fullName" class="form-control" placeholder="Full Name" required>
            </div>

              <div class="form-group">
                        <label for="username">Lawyer User Name</label>
                        <input type="text" id="username" name="username" class="form-control" placeholder="Username" required>
              </div>

              <div class="form-group">
                        <label for="password">Lawyer Password</label>
                        <input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
              </div>

              <div class="form-group">
                        <label for="phone">Phone</label>
                        <input type="tel" id="phone" name="phone" class="form-control" placeholder="Phone Number" required>
              </div>

              <div class="form-group">
                        <label for="address">Address</label>
                        <input type="text" id="address" name="address" class="form-control" placeholder="Address" required>
              </div>

              <div class="form-group">
                        <label for="licenseNumber">License Number</label>
                        <input type="text" id="licenseNumber" name="licenseNumber" class="form-control" placeholder="License Number" required>
              </div>

              <div class="form-group">
                        <label for="specialization">Specialization</label>
                        <input type="text" id="specialization" name="specialization" class="form-control" placeholder="Specialization" required>
              </div>

              <div class="form-group">
                        <label for="practiceArea">Practice Area</label>
                        <select id="practiceArea" name="practiceArea" class="form-control" required>
                  <option value="">Select Practice Area</option>
                  <option value="Criminal Law">Criminal Law</option>
                            <option value="Civil Law">Civil Law</option>
                            <option value="Corporate Law">Corporate Law</option>
                  <option value="Family Law">Family Law</option>
                  <option value="Property Law">Property Law</option>
                            <option value="Immigration Law">Immigration Law</option>
                </select>
              </div>

              <div class="form-group">
                        <label for="experience">Experience</label>
                        <select id="experience" name="experience" class="form-control" required>
                  <option value="">Select Experience</option>
                  <option value="1 Year">1 Year</option>
                  <option value="2 Years">2 Years</option>
                  <option value="3 Years">3 Years</option>
                            <option value="4 Years">4 Years</option>
                  <option value="5+ Years">5+ Years</option>
                </select>
              </div>

              <div class="form-group">
                        <label for="fees">Fees</label>
                        <input type="number" id="fees" name="fees" class="form-control" placeholder="Consultation Fee" required>
              </div>

              <div class="form-group">
                        <label for="education">Education</label>
                        <input type="text" id="education" name="education" class="form-control" placeholder="Education" required>
              </div>

              <div class="form-group">
                        <label for="about">About me</label>
                        <textarea id="about" name="about" class="form-control" rows="4" placeholder="Write something about the lawyer..." required></textarea>
              </div>

                    <button type="submit" class="btn-submit">Add Lawyer</button>
                </form>
        </div>
      </div>
    </div>
  </body>
  </html>