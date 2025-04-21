<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LawLink - Legal Services</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
<!-- Header Section -->
<%@ include file="includes/header.jsp" %>

<!-- Hero Section -->
<section class="home-hero">
        <div class="home-hero-content">
        <h1>Innocent until proven guilty.</h1>
        <p>Organize your task through our LawLink.<br>we provide the best services.</p>
        <a href="${pageContext.request.contextPath}/appointment" class="home-cta-button">Book your appointment</a>
        <div class="home-phone-number">
            <span class="phone-icon"><i class="fas fa-phone"></i></span>
            <span>or call us at<br>${contactPhone}</span>
        </div>
    </div>
    <div class="home-hero-image">
        <img src="${pageContext.request.contextPath}/assets/images/jeniffer.png" alt="Professional Lawyer">
        <div class="home-experience-badge">
            10+ Year<br>of<br>experience
        </div>
    </div>
</section>

<!-- Search Section -->
<section class="home-search-section">
    <div class="home-search-heading">
        <p>Search by the name of attorney<br>and practice areas.</p>
    </div>
    <form action="${pageContext.request.contextPath}/search" method="get" class="home-search-form">
        <input type="text" name="query" placeholder="Search" class="home-search-input">
        <select name="practiceArea" class="home-search-dropdown">
            <option value="">Practice area</option>
            <c:forEach var="area" items="${practiceAreas}">
                <option value="${area.areaId}">${area.areaName}</option>
            </c:forEach>
        </select>
        <button type="submit" class="home-search-button">Search</button>
    </form>
</section>

<!-- Attorneys Section -->
<section class="home-attorneys-section">
    <div class="home-attorneys-heading">
        <h2>MEET OUR MOST<br>TALANTED ATTORNEYS</h2>
                    </div>
    <div class="home-attorneys-description">
        <p>Their work involves legal research, courtroom representation, and the protection of both civil and criminal rights. With deep knowledge of the law, they stand as protectors of individual and public rights.</p>
                        </div>
    <div class="home-attorneys-cta">
        <a href="${pageContext.request.contextPath}/appointment" class="home-book-appointment-btn">Book appointment</a>
                        </div>
</section>

<!-- Attorney Profiles -->
<section class="home-attorney-profiles">
    <c:forEach var="attorney" items="${attorneys}" varStatus="status">
        <div class="home-attorney-card">
            <img src="${pageContext.request.contextPath}/assets/images/${attorney.imageFile}" alt="${attorney.name}">
            <div class="home-attorney-info">
                <h3>${attorney.name}</h3>
                <p>${attorney.description}</p>
                    </div>
                </div>
            </c:forEach>

    <%-- Fallback if no attorneys are loaded from the database --%>
    <c:if test="${empty attorneys}">
        <div class="home-attorney-card">
            <img src="${pageContext.request.contextPath}/assets/images/zaina-rai.png" alt="Attorney Profile">
            <div class="home-attorney-info">
                <h3>Zaina Rai</h3>
                <p>She has won 100+ case till now one of the most demanding attorney at your service.</p>
            </div>
        </div>
        <div class="home-attorney-card">
            <img src="${pageContext.request.contextPath}/assets/images/rayan-rajbangsi.png" alt="Attorney Profile">
            <div class="home-attorney-info">
                <h3>Rayan Raibangsi</h3>
                <p>With the experience of 5 years he has been thriving in our company.</p>
            </div>
        </div>
        <div class="home-attorney-card">
            <img src="${pageContext.request.contextPath}/assets/images/baviyan-koirala.png" alt="Attorney Profile">
            <div class="home-attorney-info">
                <h3>Baviyan Koirala</h3>
                <p>One of our most demanding attorney, with the 95% of success.</p>
        </div>
    </div>
    </c:if>
</section>

<!-- Testimonials Section -->
<section class="testimonials-section">
    <h2 class="home-testimonials-heading">What does our client has to say about us?</h2>
    <div class="home-testimonial-container">
        <!-- <c:forEach var="testimonial" items="${testimonials}" varStatus="status">
            <div class="home-testimonial-card">
                <div class="home-testimonial-image">
                    <img src="${pageContext.request.contextPath}/assets/images/abc.png" alt="${testimonial.name}">
                </div>
                <div class="home-testimonial-content">
                    <h3>${testimonial.name}</h3>
                    <p class="home-testimonial-position">${testimonial.position}</p>
                    <p>${testimonial.content}</p>
                </div>
            </div>
        </c:forEach> -->

        <%-- Fallback if no testimonials are loaded from the database --%>
        <!-- <c:if test="${empty testimonials}"> -->
            <div class="home-testimonial-card">
                <div class="home-testimonial-image">
                    <img src="${pageContext.request.contextPath}/assets/images/john.png" alt="Client">
                </div>
                <div class="home-testimonial-content">
                    <h3>Jhon Basnet</h3>
                    <p class="home-testimonial-position">Civil case client</p>
                    <p>I was facing a long and stressful property dispute, unsure if I'd ever find justice. But from the moment I consulted with Zaina, I knew I was in capable hands. Their deep understanding of the law, attention to detail, and calm professionalism helped me win the case confidently. I'm incredibly grateful for their support and highly recommend their services to anyone seeking legal guidance.</p>
                </div>
              </div>
        <!-- </c:if> -->
    </div>
</section>

<!-- Footer -->
<%@ include file="includes/footer.jsp" %>

</body>
</html>