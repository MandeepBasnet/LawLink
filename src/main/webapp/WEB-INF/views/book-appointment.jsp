<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Appointment - LawLink</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
<!-- Header -->
<%@ include file="includes/header.jsp" %>

<!-- Main Content -->
<main class="book-appointment-main-content">
    <div class="container">
        <div class="book-appointment-container">
            <!-- Lawyer Profile -->
            <div class="book-appointment-lawyer-profile">
                <c:choose>
                    <c:when test="${not empty lawyer}">
                        <img src="${pageContext.request.contextPath}/assets/images/lawyers/${lawyer.imageUrl}" alt="${lawyer.name}" class="book-appointment-lawyer-image" onerror="this.src='${pageContext.request.contextPath}/assets/images/placeholder.svg'">
                        <div class="book-appointment-lawyer-info">
                            <div class="book-appointment-lawyer-name">${lawyer.name}</div>
                            <div class="book-appointment-lawyer-title">${lawyer.title}</div>
                            <div class="book-appointment-lawyer-specialty">${lawyer.specialty}</div>
                            <div class="book-appointment-lawyer-experience">Experience: ${lawyer.experience}</div>
                            <div class="book-appointment-lawyer-fee">Booking fee: ${lawyer.fee}</div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <img src="${pageContext.request.contextPath}/assets/images/lawyers/zaina-rai.jpg" alt="Zaina Rai" class="book-appointment-lawyer-image" onerror="this.src='${pageContext.request.contextPath}/assets/images/placeholder.svg'">
                        <div class="book-appointment-lawyer-info">
                            <div class="book-appointment-lawyer-name">Zaina Rai</div>
                            <div class="book-appointment-lawyer-title">Principal senior advisor</div>
                            <div class="book-appointment-lawyer-specialty">Criminal Law</div>
                            <div class="book-appointment-lawyer-experience">Experience: 5 Years</div>
                            <div class="book-appointment-lawyer-fee">Booking fee: 120$</div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- Appointment Form -->
            <div class="book-appointment-form">
                <form id="appointmentForm" action="${pageContext.request.contextPath}/book-appointment" method="post">
                    <input type="hidden" name="lawyerId" value="${lawyer.id != null ? lawyer.id : '1'}">

                    <label for="name" class="book-appointment-form-label">Appointment for:</label>
                    <input type="text" id="name" name="clientName" class="book-appointment-form-input" placeholder="Add your name" required>

                    <input type="tel" id="phone" name="clientPhone" class="book-appointment-form-input" placeholder="Add your phone number" required>

                    <input type="hidden" id="selectedDate" name="appointmentDate" value="">
                    <input type="hidden" id="selectedTime" name="appointmentTime" value="">
                </form>
            </div>

            <!-- Appointment Calendar -->
            <div class="book-appointment-calendar">
                <div class="book-appointment-calendar-header">
                    <div class="book-appointment-calendar-title">Select appointment date:</div>
                    <div class="book-appointment-month-selector">
                        <button class="month-nav" id="prev-month">&lt;</button>
                        <div class="month-name">
                            <c:set var="now" value="<%=new java.util.Date()%>" />
                            <fmt:formatDate value="${now}" pattern="MMMM yyyy" />
                        </div>
                        <button class="month-nav" id="next-month">&gt;</button>
                    </div>
                </div>

                <table class="book-appointment-calendar" id="appointment-calendar">
                    <thead>
                    <tr>
                        <th>SUN</th>
                        <th>MON</th>
                        <th>TUE</th>
                        <th>WED</th>
                        <th>THU</th>
                        <th>FRI</th>
                        <th>SAT</th>
                    </tr>
                    </thead>
                    <tbody>
                    <!-- Calendar days will be generated by JavaScript -->
                    </tbody>
                </table>

                <button type="button" class="book-appointment-btn" id="select-date-btn">select date</button>

                <div class="book-appointment-time-slots">
                    <div class="book-appointment-time-slots-title">Select appointment time:</div>
                    <div class="book-appointment-time-slots-grid">
                        <c:forEach var="timeSlot" items="${availableTimeSlots}">
                            <div class="book-appointment-time-slot" data-time="${timeSlot}">${timeSlot}</div>
                        </c:forEach>

                        <!-- Fallback if availableTimeSlots attribute is not set -->
                        <c:if test="${empty availableTimeSlots}">
                            <div class="book-appointment-time-slot">10 AM</div>
                            <div class="book-appointment-time-slot">11 AM</div>
                            <div class="book-appointment-time-slot">12 PM</div>
                            <div class="book-appointment-time-slot">1 PM</div>
                            <div class="book-appointment-time-slot">2 PM</div>
                            <div class="book-appointment-time-slot">3 PM</div>
                            <div class="book-appointment-time-slot">4 PM</div>
                            <div class="book-appointment-time-slot">5 PM</div>
                        </c:if>
                    </div>

                    <button type="button" class="book-appointment-btn" id="select-time-btn">Select time</button>
                </div>
            </div>
        </div>

        <!-- Reviews Section -->
        <div class="book-appointment-reviews-section">
            <h2 class="book-appointment-reviews-title">Latest reviews</h2>
            <div class="book-appointment-reviews-container">
                <c:forEach var="review" items="${lawyerReviews}">
                    <div class="book-appointment-review-card">
                        <div class="book-appointment-review-stars">
                            <c:forEach begin="1" end="${review.rating}">★</c:forEach>
                        </div>
                        <div class="book-appointment-review-title">${review.title}</div>
                        <div class="book-appointment-review-body">${review.content}</div>
                        <div class="book-appointment-reviewer">
                            <img src="${pageContext.request.contextPath}/assets/images/clients/${review.clientImage}" alt="${review.clientName}" class="book-appointment-reviewer-image" onerror="this.src='${pageContext.request.contextPath}/assets/images/placeholder.svg'">
                            <div class="book-appointment-reviewer-info">
                                <div class="book-appointment-reviewer-name">${review.clientName}</div>
                                <div class="book-appointment-review-date">${review.date}</div>
                            </div>
                        </div>
                    </div>
                </c:forEach>

                <!-- Fallback if lawyerReviews attribute is not set -->
                <c:if test="${empty lawyerReviews}">
                    <div class="book-appointment-review-card">
                        <div class="book-appointment-review-stars">★★★★★</div>
                        <div class="book-appointment-review-title">Review title</div>
                        <div class="book-appointment-review-body">Review body</div>
                        <div class="book-appointment-reviewer">
                            <img src="${pageContext.request.contextPath}/assets/images/placeholder.svg" alt="Reviewer" class="book-appointment-reviewer-image">
                            <div class="book-appointment-reviewer-info">
                                <div class="book-appointment-reviewer-name">Reviewer name</div>
                                <div class="book-appointment-review-date">Date</div>
                            </div>
                        </div>
                    </div>

                    <div class="book-appointment-review-card">
                        <div class="book-appointment-review-stars">★★★★★</div>
                        <div class="book-appointment-review-title">Review title</div>
                        <div class="book-appointment-review-body">Review body</div>
                        <div class="book-appointment-reviewer">
                            <img src="${pageContext.request.contextPath}/assets/images/placeholder.svg" alt="Reviewer" class="reviewer-image">
                            <div class="book-appointment-reviewer-info">
                                <div class="book-appointment-reviewer-name">Reviewer name</div>
                                <div class="book-appointment-review-date">Date</div>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</main>

<!-- Footer -->
<%@ include file="includes/footer.jsp" %>

<script>
    // Generate calendar
    function generateCalendar(year, month) {
        const calendarBody = document.querySelector('#appointment-calendar tbody');
        calendarBody.innerHTML = '';

        const firstDay = new Date(year, month, 1);
        const lastDay = new Date(year, month + 1, 0);
        const daysInMonth = lastDay.getDate();

        let dayCounter = 1;
        let rowCount = 0;

        // Create rows for the calendar
        while (dayCounter <= daysInMonth) {
            const row = document.createElement('tr');

            // Create cells for each day of the week
            for (let i = 0; i < 7; i++) {
                const cell = document.createElement('td');

                // Skip days before the first day of the month in the first row
                if (rowCount === 0 && i < firstDay.getDay()) {
                    cell.textContent = '';
                }
                // Add days of the month
                else if (dayCounter <= daysInMonth) {
                    cell.textContent = dayCounter;

                    // Check if the day is in the past
                    const currentDate = new Date();
                    const cellDate = new Date(year, month, dayCounter);

                    if (cellDate < new Date(currentDate.getFullYear(), currentDate.getMonth(), currentDate.getDate())) {
                        cell.classList.add('disabled');
                    } else {
                        cell.addEventListener('click', function() {
                            if (!this.classList.contains('disabled')) {
                                const allDays = document.querySelectorAll('#appointment-calendar td');
                                allDays.forEach(day => day.classList.remove('selected'));
                                this.classList.add('selected');

                                // Update hidden input
                                const selectedDate = new Date(year, month, parseInt(this.textContent));
                                document.getElementById('selectedDate').value = selectedDate.toISOString().split('T')[0];
                            }
                        });
                    }

                    dayCounter++;
                }

                row.appendChild(cell);
            }

            calendarBody.appendChild(row);
            rowCount++;
        }
    }

    // Initialize calendar
    const currentDate = new Date();
    let currentYear = currentDate.getFullYear();
    let currentMonth = currentDate.getMonth();

    generateCalendar(currentYear, currentMonth);

    // Update month name
    function updateMonthName() {
        const monthNames = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
        document.querySelector('.month-name').textContent = `${monthNames[currentMonth]} ${currentYear}`;
    }

    updateMonthName();

    // Month navigation
    document.getElementById('prev-month').addEventListener('click', function() {
        currentMonth--;
        if (currentMonth < 0) {
            currentMonth = 11;
            currentYear--;
        }
        updateMonthName();
        generateCalendar(currentYear, currentMonth);
    });

    document.getElementById('next-month').addEventListener('click', function() {
        currentMonth++;
        if (currentMonth > 11) {
            currentMonth = 0;
            currentYear++;
        }
        updateMonthName();
        generateCalendar(currentYear, currentMonth);
    });

    // Time slot selection
    const timeSlots = document.querySelectorAll('.time-slot');
    timeSlots.forEach(slot => {
        slot.addEventListener('click', function() {
            if (!this.classList.contains('disabled')) {
                timeSlots.forEach(s => s.classList.remove('selected'));
                this.classList.add('selected');

                // Update hidden input
                document.getElementById('selectedTime').value = this.textContent.trim();
            }
        });
    });

    // Form submission
    document.getElementById('select-date-btn').addEventListener('click', function() {
        const selectedDay = document.querySelector('#appointment-calendar td.selected');
        if (selectedDay) {
            alert(`Date selected: ${selectedDay.textContent} ${document.querySelector('.month-name').textContent}`);

            // In a real application, you might want to fetch available time slots for the selected date
            // For example:
            // fetch(`${pageContext.request.contextPath}/api/time-slots?date=${document.getElementById('selectedDate').value}&lawyerId=${document.querySelector('input[name="lawyerId"]').value}`)
            //     .then(response => response.json())
            //     .then(data => {
            //         // Update available time slots
            //     });
        } else {
            alert('Please select a date');
        }
    });

    document.getElementById('select-time-btn').addEventListener('click', function() {
        const selectedTime = document.querySelector('.time-slot.selected');
        const nameInput = document.getElementById('name');
        const phoneInput = document.getElementById('phone');
        const selectedDay = document.querySelector('#appointment-calendar td.selected');

        if (!nameInput.value.trim()) {
            alert('Please enter your name');
            return;
        }

        if (!phoneInput.value.trim()) {
            alert('Please enter your phone number');
            return;
        }

        if (!selectedDay) {
            alert('Please select a date');
            return;
        }

        if (selectedTime) {
            // Submit the form
            document.getElementById('appointmentForm').submit();
        } else {
            alert('Please select a time slot');
        }
    });
</script>
</body>
</html>