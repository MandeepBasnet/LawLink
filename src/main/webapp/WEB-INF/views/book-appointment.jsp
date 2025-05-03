<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Appointment - Law Link</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<jsp:include page="includes/header.jsp" />

<!-- Main Content -->
<div class="main-content">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <!-- Lawyer Profile -->
                <div class="lawyer-profile">
                    <img src="${pageContext.request.contextPath}/images/lawyer-zaina.jpg" alt="Zaina Rai" class="lawyer-image">
                    <div class="lawyer-info">
                        <h2 class="lawyer-name">Zaina Rai</h2>
                        <p class="lawyer-title">Principal senior adviser</p>
                        <p class="lawyer-experience">Experience: 5+ Years</p>
                        <p class="lawyer-fee">Booking fee: 120$</p>
                    </div>
                </div>

                <!-- Appointment Form -->
                <div class="appointment-form">
                    <label class="form-label">Appointment for:</label>
                    <input type="text" class="form-control" placeholder="Add your name">
                    <input type="text" class="form-control" placeholder="Add your phone number">
                </div>

                <!-- Reviews Section -->
                <div class="reviews-section">
                    <h3 class="reviews-title">Latest reviews</h3>
                    <div class="reviews-container">
                        <div class="review-card">
                            <div class="review-stars">
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i>
                            </div>
                            <h4 class="review-title">Review title</h4>
                            <p class="review-body">Review body</p>
                            <div class="reviewer">
                                <img src="lawyer1.png" alt="Reviewer" class="reviewer-avatar">
                                <div class="reviewer-info">
                                    <div class="reviewer-name">Reviewer name</div>
                                    <div class="reviewer-date">Date</div>
                                </div>
                            </div>
                        </div>

                        <div class="review-card">
                            <div class="review-stars">
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i>
                            </div>
                            <h4 class="review-title">Review title</h4>
                            <p class="review-body">Review body</p>
                            <div class="reviewer">
                                <img src="${pageContext.request.contextPath}/images/avatar2.jpg" alt="Reviewer" class="reviewer-avatar">
                                <div class="reviewer-info">
                                    <div class="reviewer-name">Reviewer name</div>
                                    <div class="reviewer-date">Date</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <!-- Calendar Section -->
                <div class="calendar-section">
                    <div class="calendar-header">
                        <h3 class="calendar-title">Select appointment date:</h3>
                        <div class="calendar-month">
                            <span class="month-nav"><i class="fas fa-chevron-left"></i></span>
                            <span>June 2024</span>
                            <span class="month-nav"><i class="fas fa-chevron-right"></i></span>
                        </div>
                    </div>

                    <div class="calendar-grid">
                        <div class="weekdays">
                            <div>SUN</div>
                            <div>MON</div>
                            <div>TUE</div>
                            <div>WED</div>
                            <div>THU</div>
                            <div>FRI</div>
                            <div>SAT</div>
                        </div>

                        <div class="days">
                            <%
                                // This would normally be calculated dynamically
                                String[] days = {"", "", "2", "3", "4", "5", "6", "7", "8",
                                        "9", "10", "11", "12", "13", "14", "15",
                                        "16", "17", "18", "19", "20", "21", "22",
                                        "23", "24", "25", "26", "27", "28", "29", "30", "", ""};

                                for(String day : days) {
                                    if(day.equals("")) {
                            %>
                            <div></div>
                            <% } else if(day.equals("26")) { %>
                            <div class="day selected"><%= day %></div>
                            <% } else if(day.equals("10")) { %>
                            <div class="day" style="color: var(--highlight-color);"><%= day %></div>
                            <% } else { %>
                            <div class="day"><%= day %></div>
                            <% } } %>
                        </div>
                    </div>

                    <button class="select-button">select date</button>

                    <!-- Time Selection -->
                    <div class="time-selection">
                        <h3 class="calendar-title">Select appointment time:</h3>
                        <div class="time-slots">
                            <div class="time-slot">10 AM</div>
                            <div class="time-slot">11 AM</div>
                            <div class="time-slot">12 PM</div>
                            <div class="time-slot">1 PM</div>
                            <div class="time-slot">2 PM</div>
                            <div class="time-slot">3 PM</div>
                            <div class="time-slot">4 PM</div>
                            <div class="time-slot">5 PM</div>
                        </div>
                    </div>

                    <button class="select-button mt-4">Book Now</button>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="includes/footer.jsp" />


<!-- Bootstrap JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Custom JavaScript for interactive elements -->
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Day selection
        const days = document.querySelectorAll('.day');
        days.forEach(day => {
            day.addEventListener('click', function() {
                // Remove selected class from all days
                days.forEach(d => d.classList.remove('selected'));
                // Add selected class to clicked day
                this.classList.add('selected');
            });
        });

        // Time slot selection
        const timeSlots = document.querySelectorAll('.time-slot');
        timeSlots.forEach(slot => {
            slot.addEventListener('click', function() {
                // Remove selected class from all time slots
                timeSlots.forEach(s => s.classList.remove('selected'));
                // Add selected class to clicked time slot
                this.classList.add('selected');
            });
        });
    });
</script>
</body>
</html>