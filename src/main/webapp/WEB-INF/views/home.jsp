<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.User" %>
<%@ page session="true" %>

<%
    User loggedInUser = (User) session.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<!-- Header Section -->
<jsp:include page="includes/header.jsp" />


<!-- Hero Section -->
<section class="hero">
    <div class="hero-content">
        <h1>Innocent until proven guilty.</h1>
        <p>Organize your task through our LawLink.<br>we provide the best services.</p>
        <a href="${pageContext.request.contextPath}/appointment" class="cta-button">Book your appointment</a>
        <div class="phone-number">
            <span class="phone-icon"><i class="fas fa-phone"></i></span>
            <span>or call us at<br>${contactPhone}</span>
        </div>
    </div>
    <div class="hero-image">
        <img src="${pageContext.request.contextPath}/assets/images/jeniffer.png" alt="Professional Lawyer">
        <div class="experience-badge">
            10+ Year<br>of<br>experience
        </div>
    </div>
</section>

<!-- Search Section -->
<section class="search-section">
    <div class="search-heading">
        <p>Search by the name of attorney<br>and practice areas.</p>
    </div>
    <form action="${pageContext.request.contextPath}/search" method="get" class="search-form">
        <input type="text" name="query" placeholder="Search" class="search-input">
        <select name="practiceArea" class="search-dropdown">
            <option value="">Practice area</option>
            <option value="">Criminal Law</option>
            <option value="">Labour Law</option>
            <option value="">International Law</option>
            <option value="">Property Law</option>
            <option value="">Corporate Law</option>
            <option value="">Family Law</option>
        </select>
        <button type="submit" class="search-button">Search</button>
    </form>
</section>

<!-- Attorneys Section -->
<section class="attorneys-section">
    <div class="attorneys-heading">
        <h2>MEET OUR MOST<br>TALANTED ATTORNEYS</h2>
    </div>
    <div class="attorneys-description">
        <p>Their work involves legal research, courtroom representation, and the protection of both civil and criminal rights. With deep knowledge of the law, they stand as protectors of individual and public rights.</p>
    </div>
    <div class="attorneys-cta">
        <a href="${pageContext.request.contextPath}/appointment" class="book-appointment-btn">Book appointment</a>
    </div>
</section>

<!-- Attorney Profiles -->
<section class="attorney-profiles">
    <%-- Dynamic attorney profiles from database --%>
    <c:forEach var="attorney" items="${attorneys}" varStatus="status">
        <div class="attorney-card">
            <img src="${pageContext.request.contextPath}/images/attorneys/${attorney.imageFile}" alt="${attorney.name}">
            <div class="attorney-info">
                <h3>${attorney.name}</h3>
                <p>${attorney.description}</p>
            </div>
        </div>
    </c:forEach>

    <%-- Fallback if no attorneys are loaded from the database --%>
    <c:if test="${empty attorneys}">
        <div class="attorney-card">
            <img src="${pageContext.request.contextPath}/assets/images/zaina-rai.png" alt="Attorney Profile">
            <div class="attorney-info">
                <h3>Zaina Rai</h3>
                <p>She has won 100+ case till now one of the most demanding attorney at your service.</p>
            </div>
        </div>
        <div class="attorney-card">
            <img src="${pageContext.request.contextPath}/assets/images/rayan-rajbangsi.png" alt="Attorney Profile">
            <div class="attorney-info">
                <h3>Rayan Raibangsi</h3>
                <p>With the experience of 5 years he has been thriving in our company.</p>
            </div>
        </div>
        <div class="attorney-card">
            <img src="${pageContext.request.contextPath}/assets/images/baviyan-koirala.png" alt="Attorney Profile">
            <div class="attorney-info">
                <h3>Baviyan Koir</h3>
                <p>One of our most demanding attorney, with the 95% of success.</p>
            </div>
        </div>
    </c:if>
</section>

<!-- Testimonials Section -->
<section class="testimonials-section">
    <h2 class="testimonials-heading">What does our client have to say about us?</h2>
    <div class="testimonial-container">
        <%-- Dynamic testimonials from database --%>
        <c:forEach var="testimonial" items="${testimonials}" varStatus="status">
            <div class="testimonial-card">
                <div class="testimonial-image">
                    <img src="${pageContext.request.contextPath}/images/clients/${testimonial.imageFile}" alt="${testimonial.name}">
                </div>
                <div class="testimonial-content">
                    <h3>${testimonial.name}</h3>
                    <p class="position">${testimonial.position}</p>
                    <p>${testimonial.content}</p>
                </div>
            </div>
        </c:forEach>

        <%-- Fallback if no testimonials are loaded from the database --%>
        <c:if test="${empty testimonials}">
            <div class="testimonial-card">
                <div class="testimonial-image">
                    <img src="${pageContext.request.contextPath}/images/clients/client1.jpg" alt="Client">
                </div>
                <div class="testimonial-content">
                    <h3>Jhon Basnet</h3>
                    <p class="position">Civil case client</p>
                    <p>I was facing a long and stressful property dispute, unsure if I'd ever find justice. But from the moment I consulted with Zaina, I knew I was in capable hands. Their deep understanding of the law, attention to detail, and calm professionalism helped me win the case confidently. I'm incredibly grateful for their support and highly recommend their services to anyone seeking legal guidance.</p>
                </div>
            </div>
        </c:if>
    </div>
</section>

<!-- Footer -->
<jsp:include page="includes/footer.jsp" />


<!-- Optional: Add JavaScript at the end of the body -->
<script>
    // You can add your JavaScript here
    document.addEventListener('DOMContentLoaded', function() {
        console.log('Page loaded successfully');

        // Example: Form validation
        const searchForm = document.querySelector('.search-form');
        if (searchForm) {
            searchForm.addEventListener('submit', function(e) {
                const searchInput = document.querySelector('.search-input');
                if (searchInput.value.trim() === '') {
                    e.preventDefault();
                    alert('Please enter a search term');
                }
            });
        }
    });
</script>
</body>
</html>