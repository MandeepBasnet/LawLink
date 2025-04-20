<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../common/header.jsp">
  <jsp:param name="title" value="Leave a Review" />
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
    <h1>Leave a Review</h1>

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
        </div>

        <form action="${pageContext.request.contextPath}/client/appointments/${appointment.appointmentId}/review" method="post" class="review-form needs-validation">
          <div class="form-group">
            <label for="rating">Rating</label>
            <div class="rating-input" id="rating">
              <div class="stars">
                <i class="fas fa-star star active" data-rating="1"></i>
                <i class="fas fa-star star active" data-rating="2"></i>
                <i class="fas fa-star star active" data-rating="3"></i>
                <i class="fas fa-star star active" data-rating="4"></i>
                <i class="fas fa-star star active" data-rating="5"></i>
              </div>
              <input type="hidden" name="rating" id="ratingValue" value="5" required>
            </div>
          </div>
          <div class="form-group">
            <label for="comment">Comment</label>
            <textarea class="form-control" id="comment" name="comment" rows="5" required></textarea>
          </div>
          <div class="form-group">
            <button type="submit" class="btn btn-primary">Submit Review</button>
            <a href="${pageContext.request.contextPath}/client/appointments/${appointment.appointmentId}" class="btn btn-secondary">Cancel</a>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<style>
  .lawyer-img {
    width: 80px;
    height: 80px;
    border-radius: 50%;
    object-fit: cover;
  }

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

  .rating-input {
    margin-bottom: 1rem;
  }

  .stars {
    display: flex;
    gap: 0.5rem;
    font-size: 1.5rem;
  }

  .star {
    cursor: pointer;
    color: #ccc;
  }

  .star.active {
    color: #ffc107;
  }

  .star.hover {
    color: #ffdb70;
  }
</style>

<script>
  document.addEventListener("DOMContentLoaded", function() {
    const stars = document.querySelectorAll(".star");
    const ratingField = document.getElementById("ratingValue");

    stars.forEach((star, index) => {
      star.addEventListener("click", () => {
        const ratingValue = parseInt(star.getAttribute("data-rating"));
        ratingField.value = ratingValue;

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
</script>

<jsp:include page="../common/footer.jsp" />
