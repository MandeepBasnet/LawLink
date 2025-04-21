<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%--<%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>--%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Review - LawLink</title>
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/assets/css/style.css"
    />
  </head>

  <body>

    <div class="container">
      <h1 class="reviews-title">Submit Your Review</h1>

      <div class="reviews-appointment-section">
        <img
          src="${pageContext.request.contextPath}/assets/lawyers/${appointment.lawyerImage}"
          alt="Lawyer"
          class="reviews-lawyer-image"
          onerror="this.src='${pageContext.request.contextPath}/assets/default-lawyer.jpg'"
        />

        <div class="reviews-appointment-details">
          <h2 class="reviews-appointment-title">Your Appointment</h2>
          <p class="reviews-appointment-info">
            <strong>Appointment ID:</strong> ${appointment.id}
          </p>
          <p class="reviews-appointment-info">
            <strong>Appointment Date:</strong> ${appointment.date}
          </p>
          <p class="reviews-appointment-info">
            <strong>Appointment Time:</strong> ${appointment.time}
          </p>
          <p class="reviews-appointment-info">
            <strong>Appointment Duration:</strong> ${appointment.duration}
          </p>
          <p class="reviews-appointment-info">
            <strong>Appointment Status:</strong> ${appointment.status}
          </p>

          <div class="reviews-rating-section">
            <h3 class="reviews-rating-title">Rating:</h3>
            <div class="reviews-stars">
              <span class="reviews-star" onclick="rateAppointment(1)">★</span>
              <span class="reviews-star" onclick="rateAppointment(2)">★</span>
              <span class="reviews-star" onclick="rateAppointment(3)">★</span>
              <span class="reviews-star" onclick="rateAppointment(4)">★</span>
              <span class="reviews-star" onclick="rateAppointment(5)">★</span>
            </div>

            <form
              action="${pageContext.request.contextPath}/submitReview"
              method="post"
            >
              <input
                type="hidden"
                id="appointmentId"
                name="appointmentId"
                value="${appointment.id}"
              />
              <input type="hidden" id="ratingValue" name="rating" value="0" />
              <textarea
                class="reviews-comment-area"
                name="comment"
                placeholder="Leave your comment here..."
              ></textarea>

              <div class="reviews-lawyer-info">
                <p>Yusha Shrestha</p>
                <p>By: Hari Kumar</p>
              </div>

              <button type="submit" class="reviews-submit-btn">Submit Review</button>
            </form>
          </div>
        </div>
      </div>
    </div>

    <div class="reviews-client-reviews">
      <h2 class="reviews-title">Client Reviews</h2>

      <div class="reviews-review-date">2005-2-20</div>
      <p class="reviews-review-client"><strong>Client:</strong> Ram Nepal</p>
      <p class="reviews-review-lawyer"><strong>Lawyer:</strong> Baviyan Koirala</p>

      <div class="reviews-review-stars">
        <%--
        <c:forEach begin="1" end="5" var="i"
          >--%> <%-- <span class="star" style="color: #d4af37">★</span>--%> <%-- </c:forEach
        >--%>
      </div>

      <div class="reviews-review-comment">This is comment</div>
    </div>
  </body>
  <script>
    function rateAppointment(rating) {
      // Set all stars to default color
      const stars = document.querySelectorAll(".reviews-stars .reviews-star");
      stars.forEach((star, index) => {
        if (index < rating) {
          star.style.color = "#D4AF37"; // Gold color for selected stars
        } else {
          star.style.color = "#ccc"; // Default color for unselected stars
        }
      });

      // Store the rating value
      document.getElementById("ratingValue").value = rating;
    }
  </script>
</html>
