<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Our Lawyers - LawLink</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<!-- Header Section -->
<jsp:include page="includes/header.jsp" />

<!-- Lawyers Grid -->
<div class="lawyers-container">
    <%-- Dynamic lawyers from database --%>
    <c:forEach var="lawyer" items="${lawyers}">
        <div class="lawyer-card">
            <div class="lawyer-image">
                <img src="${pageContext.request.contextPath}/images/lawyers/${lawyer.imageFile}" alt="${lawyer.name}" onerror="this.src='${pageContext.request.contextPath}/images/placeholder.svg?height=150&width=120'">
            </div>
            <div class="lawyer-info">
                <h2 class="lawyer-name">${lawyer.name}</h2>
                <p class="lawyer-title">${lawyer.title}</p>
                <p class="lawyer-location"><i class="fas fa-map-marker-alt"></i> ${lawyer.location}</p>
                <p class="lawyer-phone"><i class="fas fa-phone"></i> ${lawyer.phoneLabel}: ${lawyer.phone}</p>
                <a href="${pageContext.request.contextPath}/client/book-appointment?id=${lawyer.id}" class="book-button">
                    Book ${lawyer.gender == 'female' ? 'her' : 'him'} now!
                </a>
            </div>
        </div>
    </c:forEach>

    <%-- Fallback if no lawyers are loaded from the database --%>
    <c:if test="${empty lawyers}">
        <!-- Lawyer 1 -->
        <div class="lawyer-card">
            <div class="lawyer-image">
                <img src="${pageContext.request.contextPath}/assets/images/zaina-rai.png" alt="Zaina Raj" onerror="this.src='${pageContext.request.contextPath}/assets/images/profile_pic.png'">
            </div>
            <div class="lawyer-info">
                <h2 class="lawyer-name">Zaina Raj</h2>
                <p class="lawyer-title">Principal senior advisor</p>
                <p class="lawyer-location"><i class="fas fa-map-marker-alt"></i> Itahari</p>
                <p class="lawyer-phone"><i class="fas fa-phone"></i> Phone NO: +977-9086706541</p>
                <a href="${pageContext.request.contextPath}/client/book-appointment" class="book-button">Book her now!</a>
            </div>
        </div>

        <!-- Lawyer 2 -->
        <div class="lawyer-card">
            <div class="lawyer-image">
                <img src="${pageContext.request.contextPath}/assets/images/rayan-rajbangsi.png" alt="Rayan Rajbangsi" onerror="this.src='${pageContext.request.contextPath}/assets/images/profile_pic.png'">
            </div>
            <div class="lawyer-info">
                <h2 class="lawyer-name">Rayan Rajbangsi</h2>
                <p class="lawyer-title">Manager partner</p>
                <p class="lawyer-location"><i class="fas fa-map-marker-alt"></i> Itahari</p>
                <p class="lawyer-phone"><i class="fas fa-phone"></i> Phone NO: +977-9705523049</p>
                <a href="${pageContext.request.contextPath}/client/book-appointment" class="book-button">Book him now!</a>
            </div>
        </div>

        <!-- Lawyer 3 -->
        <div class="lawyer-card">
            <div class="lawyer-image">
                <img src="${pageContext.request.contextPath}/assets/images/manish-khanal.png" alt="MANISH KHANAL" onerror="this.src='${pageContext.request.contextPath}/assets/images/profile_pic.png'">
            </div>
            <div class="lawyer-info">
                <h2 class="lawyer-name">MANISH KHANAL</h2>
                <p class="lawyer-title">LEGAL ASSOCIATE</p>
                <p class="lawyer-location"><i class="fas fa-map-marker-alt"></i> Kathmandu</p>
                <p class="lawyer-phone"><i class="fas fa-phone"></i> Contact NO: +977-9812395010</p>
                <a href="${pageContext.request.contextPath}/client/book-appointment" class="book-button">Book him now!</a>
            </div>
        </div>

        <!-- Lawyer 4 -->
        <div class="lawyer-card">
            <div class="lawyer-image">
                <img src="${pageContext.request.contextPath}/assets/images/baviyan-koirala.png" alt="Baviyan Koirala" onerror="this.src='${pageContext.request.contextPath}/assets/images/profile_pic.png'">
            </div>
            <div class="lawyer-info">
                <h2 class="lawyer-name">Baviyan Koirala</h2>
                <p class="lawyer-title">Founding partner</p>
                <p class="lawyer-location"><i class="fas fa-map-marker-alt"></i> Itahari</p>
                <p class="lawyer-phone"><i class="fas fa-phone"></i> Phone NO: +977-9867063791</p>
                <a href="${pageContext.request.contextPath}/client/book-appointment" class="book-button">Book him now!</a>
            </div>
        </div>

        <!-- Lawyer 5 -->
        <div class="lawyer-card">
            <div class="lawyer-image">
                <img src="${pageContext.request.contextPath}/assets/images/lalita-puri.png" alt="Lalita Puri" onerror="this.src='${pageContext.request.contextPath}/assets/images/profile_pic.png'">
            </div>
            <div class="lawyer-info">
                <h2 class="lawyer-name">Lalita Puri</h2>
                <p class="lawyer-title">Principal senior advisor</p>
                <p class="lawyer-location"><i class="fas fa-map-marker-alt"></i> Biratnagar</p>
                <p class="lawyer-phone"><i class="fas fa-phone"></i> Contact NO: +977-9706146926</p>
                <a href="${pageContext.request.contextPath}/client/book-appointment" class="book-button">Book her now!</a>
            </div>
        </div>

        <!-- Lawyer 6 -->
        <div class="lawyer-card">
            <div class="lawyer-image">
                <img src="${pageContext.request.contextPath}/assets/images/ashutosh-srivastava.png" alt="Ashutosh Srivastava" onerror="this.src='${pageContext.request.contextPath}/assets/images/profile_pic.png'">
            </div>
            <div class="lawyer-info">
                <h2 class="lawyer-name">Ashutosh Srivastava</h2>
                <p class="lawyer-title">ADVOCATE & LEGAL ADVISOR</p>
                <p class="lawyer-location"><i class="fas fa-map-marker-alt"></i> Morang</p>
                <p class="lawyer-phone"><i class="fas fa-phone"></i> Contact No: +977-9823543129</p>
                <a href="${pageContext.request.contextPath}/client/book-appointment" class="book-button">Book him now!</a>
            </div>
        </div>

        <!-- Lawyer 7 -->
        <div class="lawyer-card">
            <div class="lawyer-image">
                <img src="${pageContext.request.contextPath}/images/lawyers/yusha.jpg" alt="Yusha Shrestha" onerror="this.src='${pageContext.request.contextPath}/assets/images/profile_pic.png'">
            </div>
            <div class="lawyer-info">
                <h2 class="lawyer-name">Yusha Shrestha</h2>
                <p class="lawyer-title">Junior associate</p>
                <p class="lawyer-location"><i class="fas fa-map-marker-alt"></i> Tarahara</p>
                <p class="lawyer-phone"><i class="fas fa-phone"></i> Contact NO: +977-9703304911</p>
                <a href="${pageContext.request.contextPath}/client/book-appointment" class="book-button">Book her now!</a>
            </div>
        </div>

        <!-- Lawyer 8 -->
        <div class="lawyer-card">
            <div class="lawyer-image">
                <img src="${pageContext.request.contextPath}/assets/images/anish-basnet.png" alt="Anish Basnet" onerror="this.src='${pageContext.request.contextPath}/assets/images/profile_pic.png'">
            </div>
            <div class="lawyer-info">
                <h2 class="lawyer-name">Anish Basnet</h2>
                <p class="lawyer-title">Legal Associate</p>
                <p class="lawyer-location"><i class="fas fa-map-marker-alt"></i> Jhapa</p>
                <p class="lawyer-phone"><i class="fas fa-phone"></i> Contact NO: +977-9708203041</p>
                <a href="${pageContext.request.contextPath}/client/book-appointment" class="book-button">Book him now!</a>
            </div>
        </div>

        <!-- Lawyer 9 -->
        <div class="lawyer-card">
            <div class="lawyer-image">
                <img src="${pageContext.request.contextPath}/assets/images/susasa-acharaya.png" alt="SUSASA ACHARYA" onerror="this.src='${pageContext.request.contextPath}/assets/images/profile_pic.png'">
            </div>
            <div class="lawyer-info">
                <h2 class="lawyer-name">SUSASA ACHARYA</h2>
                <p class="lawyer-title">LEGAL ASSOCIATE</p>
                <p class="lawyer-location"><i class="fas fa-map-marker-alt"></i> Biratnagar</p>
                <p class="lawyer-phone"><i class="fas fa-phone"></i> Contact NO: +977-9703129941</p>
                <a href="${pageContext.request.contextPath}/client/book-appointment" class="book-button">Book her now!</a>
            </div>
        </div>
    </c:if>
</div>
<jsp:include page="includes/footer.jsp" />
</body>
</html>