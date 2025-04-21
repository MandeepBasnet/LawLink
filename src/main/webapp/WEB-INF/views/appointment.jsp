<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Our Lawyers - LawLink</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <style>
        /* Reset and Base Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            line-height: 1.6;
            color: #333;
            background-color: #f5f5f5;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        /* Responsive */
        @media (max-width: 992px) {
            .appointment-lawyers-container {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 768px) {
            header {
                flex-direction: column;
                padding: 15px;
            }

            nav ul {
                margin-top: 15px;
                flex-wrap: wrap;
                justify-content: center;
            }

            nav ul li {
                margin: 5px 10px;
            }

            .appointment-lawyers-container {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
<!-- Header Section -->
<%@ include file="includes/header.jsp" %>

<!-- Lawyers Grid -->
<div class="appointment-lawyers-container">
    <%-- Dynamic lawyers from database --%>
    <c:forEach var="lawyer" items="${lawyers}">
        <div class="appointment-lawyer-card">
            <div class="appointment-lawyer-image">
                <img src="${pageContext.request.contextPath}/images/lawyers/${lawyer.imageFile}"
                     alt="${lawyer.name}"
                     onerror="this.src='${pageContext.request.contextPath}/images/placeholder.svg?height=150&width=120'">
            </div>
            <div class="appointment-lawyer-info">
                <h2 class="appointment-lawyer-name">${lawyer.name}</h2>
                <p class="appointment-lawyer-title">${lawyer.title}</p>
                <p class="appointment-lawyer-location"><i class="fas fa-map-marker-alt"></i> ${lawyer.location}</p>
                <p class="appointment-lawyer-phone"><i class="fas fa-phone"></i> ${lawyer.phoneLabel}: ${lawyer.phone}</p>
                <a href="${pageContext.request.contextPath}/book-appointment.jsp" class="appointment-book-button">
                    Book ${lawyer.gender == 'female' ? 'her' : 'him'} now!
                </a>
            </div>
        </div>
    </c:forEach>

    <%-- Fallback if no lawyers are loaded from the database --%>
    <c:if test="${empty lawyers}">
        <!-- Lawyer 1 -->
        <div class="appointment-lawyer-card">
            <div class="appointment-lawyer-image">
                <img src="${pageContext.request.contextPath}/images/lawyers/zaina.jpg"
                     alt="Zaina Raj"
                     onerror="this.src='${pageContext.request.contextPath}/images/placeholder.svg?height=150&width=120'">
            </div>
            <div class="appointment-lawyer-info">
                <h2 class="appointment-lawyer-name">Zaina Raj</h2>
                <p class="appointment-lawyer-title">Principal senior advisor</p>
                <p class="appointment-lawyer-location"><i class="fas fa-map-marker-alt"></i> Itahari</p>
                <p class="appointment-lawyer-phone"><i class="fas fa-phone"></i> Phone NO: +977-9086706541</p>
                <a href="${pageContext.request.contextPath}/book-appointment.jsp" class="appointment-book-button">Book her now!</a>
            </div>
        </div>

        <!-- Lawyer 2 -->
        <div class="lawyer-card">
            <div class="appointment-lawyer-image">
                <img src="${pageContext.request.contextPath}/images/lawyers/rayan.jpg"
                     alt="Rayan Rajbangsi"
                     onerror="this.src='${pageContext.request.contextPath}/images/placeholder.svg?height=150&width=120'">
            </div>
            <div class="appointment-lawyer-info">
                <h2 class="appointment-lawyer-name">Rayan Rajbangsi</h2>
                <p class="appointment-lawyer-title">Manager partner</p>
                <p class="appointment-lawyer-location"><i class="fas fa-map-marker-alt"></i> Itahari</p>
                <p class="appointment-lawyer-phone"><i class="fas fa-phone"></i> Phone NO: +977-9705523049</p>
                <a href="${pageContext.request.contextPath}/book-appointment.jsp" class="appointment-book-button">Book him now!</a>
            </div>
        </div>

        <!-- Lawyer 3 -->
        <div class="appointment-lawyer-card">
            <div class="appointment-lawyer-image">
                <img src="${pageContext.request.contextPath}/images/lawyers/manish.jpg"
                     alt="MANISH KHANAL"
                     onerror="this.src='${pageContext.request.contextPath}/images/placeholder.svg?height=150&width=120'">
            </div>
            <div class="appointment-lawyer-info">
                <h2 class="appointment-lawyer-name">MANISH KHANAL</h2>
                <p class="appointment-lawyer-title">LEGAL ASSOCIATE</p>
                <p class="appointment-lawyer-location"><i class="fas fa-map-marker-alt"></i> Kathmandu</p>
                <p class="appointment-lawyer-phone"><i class="fas fa-phone"></i> Contact NO: +977-9812395010</p>
                <a href="${pageContext.request.contextPath}/book-appointment.jsp" class="appointment-book-button">Book him now!</a>
            </div>
        </div>

        <!-- Lawyer 4 -->
        <div class="appointment-lawyer-card">
            <div class="appointment-lawyer-image">
                <img src="${pageContext.request.contextPath}/images/lawyers/baviyan.jpg"
                     alt="Baviyan Koirala"
                     onerror="this.src='${pageContext.request.contextPath}/images/placeholder.svg?height=150&width=120'">
            </div>
            <div class="appointment-lawyer-info">
                <h2 class="appointment-lawyer-name">Baviyan Koirala</h2>
                <p class="appointment-lawyer-title">Founding partner</p>
                <p class="appointment-lawyer-location"><i class="fas fa-map-marker-alt"></i> Itahari</p>
                <p class="appointment-lawyer-phone"><i class="fas fa-phone"></i> Phone NO: +977-9867063791</p>
                <a href="${pageContext.request.contextPath}/book-appointment.jsp" class="book-button">Book him now!</a>
            </div>
        </div>

        <!-- Lawyer 5 -->
        <div class="appointment-lawyer-card">
            <div class="appointment-lawyer-image">
                <img src="${pageContext.request.contextPath}/images/lawyers/lalita.jpg"
                     alt="Lalita Puri"
                     onerror="this.src='${pageContext.request.contextPath}/images/placeholder.svg?height=150&width=120'">
            </div>
            <div class="appointment-lawyer-info">
                <h2 class="appointment-lawyer-name">Lalita Puri</h2>
                <p class="appointment-lawyer-title">Principal senior advisor</p>
                <p class="appointment-lawyer-location"><i class="fas fa-map-marker-alt"></i> Biratnagar</p>
                <p class="appointment-lawyer-phone"><i class="fas fa-phone"></i> Contact NO: +977-9706146926</p>
                <a href="${pageContext.request.contextPath}/book-appointment.jsp" class="book-button">Book her now!</a>
            </div>
        </div>

        <!-- Lawyer 6 -->
        <div class="appointment-lawyer-card">
            <div class="appointment-lawyer-image">
                <img src="${pageContext.request.contextPath}/images/lawyers/ashutosh.jpg"
                     alt="Ashutosh Srivastava"
                     onerror="this.src='${pageContext.request.contextPath}/images/placeholder.svg?height=150&width=120'">
            </div>
            <div class="appointment-lawyer-info">
                <h2 class="appointment-lawyer-name">Ashutosh Srivastava</h2>
                <p class="appointment-lawyer-title">ADVOCATE & LEGAL ADVISOR</p>
                <p class="appointment-lawyer-location"><i class="fas fa-map-marker-alt"></i> Morang</p>
                <p class="appointment-lawyer-phone"><i class="fas fa-phone"></i> Contact No: +977-9823543129</p>
                <a href="${pageContext.request.contextPath}/book-appointment.jsp" class="book-button">Book him now!</a>
            </div>
        </div>

        <!-- Lawyer 7 -->
        <div class="appointment-lawyer-card">
            <div class="appointment-lawyer-image">
                <img src="${pageContext.request.contextPath}/images/lawyers/yusha.jpg"
                     alt="Yusha Shrestha"
                     onerror="this.src='${pageContext.request.contextPath}/images/placeholder.svg?height=150&width=120'">
            </div>
            <div class="appointment-lawyer-info">
                <h2 class="appointment-lawyer-name">Yusha Shrestha</h2>
                <p class="appointment-lawyer-title">Junior associate</p>
                <p class="appointment-lawyer-location"><i class="fas fa-map-marker-alt"></i> Tarahara</p>
                <p class="appointment-lawyer-phone"><i class="fas fa-phone"></i> Contact NO: +977-9703304911</p>
                <a href="${pageContext.request.contextPath}/book-appointment.jsp" class="book-button">Book her now!</a>
            </div>
        </div>

        <!-- Lawyer 8 -->
        <div class="appointment-lawyer-card">
            <div class="appointment-lawyer-image">
                <img src="${pageContext.request.contextPath}/images/lawyers/anish.jpg"
                     alt="Anish Basnet"
                     onerror="this.src='${pageContext.request.contextPath}/images/placeholder.svg?height=150&width=120'">
            </div>
            <div class="appointment-lawyer-info">
                <h2 class="appointment-lawyer-name">Anish Basnet</h2>
                <p class="appointment-lawyer-title">Legal Associate</p>
                <p class="appointment-lawyer-location"><i class="fas fa-map-marker-alt"></i> Jhapa</p>
                <p class="appointment-lawyer-phone"><i class="fas fa-phone"></i> Contact NO: +977-9708203041</p>
                <a href="${pageContext.request.contextPath}/book-appointment.jsp" class="book-button">Book him now!</a>
            </div>
        </div>

        <!-- Lawyer 9 -->
        <div class="appointment-lawyer-card">
            <div class="appointment-lawyer-image">
                <img src="${pageContext.request.contextPath}/images/lawyers/susasa.jpg"
                     alt="SUSASA ACHARYA"
                     onerror="this.src='${pageContext.request.contextPath}/images/placeholder.svg?height=150&width=120'">
            </div>
            <div class="appointment-lawyer-info">
                <h2 class="appointment-lawyer-name">SUSASA ACHARYA</h2>
                <p class="appointment-lawyer-title">LEGAL ASSOCIATE</p>
                <p class="appointment-lawyer-location"><i class="fas fa-map-marker-alt"></i> Biratnagar</p>
                <p class="appointment-lawyer-phone"><i class="fas fa-phone"></i> Contact NO: +977-9703129941</p>
                <a href="${pageContext.request.contextPath}/book-appointment.jsp" class="book-button">Book her now!</a>
            </div>
        </div>
    </c:if>
</div>

<!-- Footer -->
<%@ include file="includes/footer.jsp" %>

</body>
</html>