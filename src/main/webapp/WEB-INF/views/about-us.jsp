<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - LawLink</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', sans-serif;
        }

        body {
            background-color: #f5f5f5;
            color: #333;
            line-height: 1.6;
        }

        .about-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }


        /* About Us Hero section */
        .about-hero {
            background-color: #d1d5db;
            padding: 60px 0;
            text-align: center;
        }

        .about-hero h1 {
            color: #1e3a8a;
            font-size: 2.5rem;
            margin-bottom: 20px;
        }

        .about-hero p {
            font-size: 1.2rem;
            max-width: 800px;
            margin: 0 auto;
        }

        /* What we do section */
        .about-what-we-do {
            padding: 60px 0;
            text-align: center;
        }

        .about-what-we-do h2 {
            color: #1e3a8a;
            font-size: 2rem;
            margin-bottom: 20px;
        }

        .about-what-we-do p {
            font-size: 1.1rem;
            max-width: 900px;
            margin: 0 auto 40px;
        }

        .about-services {
            display: flex;
            justify-content: center;
            gap: 40px;
            flex-wrap: wrap;
            margin-top: 40px;
        }

        .about-service {
            width: 200px;
            text-align: center;
        }

        .about-service-icon {
            width: 60px;
            height: 60px;
            margin: 0 auto 15px;
        }

        .about-service h3 {
            font-size: 1rem;
            font-weight: 600;
        }

        /* The firm section */
        .about-the-firm {
            padding: 60px 0;
            text-align: center;
            background-color: #f9fafb;
        }

        .about-the-firm h2 {
            color: #1e3a8a;
            font-size: 2rem;
            margin-bottom: 20px;
        }

        .about-the-firm p {
            font-size: 1.1rem;
            max-width: 900px;
            margin: 0 auto;
        }

        /* Awards section */
        .about-awards {
            padding: 60px 0;
            text-align: center;
        }

        .about-awards h2 {
            color: #1e3a8a;
            font-size: 2rem;
            margin-bottom: 40px;
        }

        .about-award-logos {
            display: flex;
            justify-content: center;
            gap: 30px;
            flex-wrap: wrap;
            margin-bottom: 60px;
        }

        .about-award-logo {
            max-width: 180px;
            height: auto;
        }

        /* Testimonials section */
        .about-testimonials {
            display: flex;
            justify-content: space-between;
            gap: 40px;
            margin-bottom: 60px;
        }

        .about-testimonial-heading {
            flex: 1;
            display: flex;
            align-items: center;
        }

        .about-testimonial-heading h2 {
            color: #1e3a8a;
            font-size: 2rem;
            text-align: left;
        }

        .about-testimonial {
            flex: 1;
            background-color: #fff;
            border: 1px solid #e5e7eb;
            padding: 30px;
            border-radius: 8px;
            display: flex;
            gap: 20px;
        }

        .about-testimonial-image {
            width: 80px;
            height: 80px;
        }

        .about-testimonial-content {
            flex: 1;
        }

        .about-testimonial-name {
            font-weight: 600;
            margin-bottom: 5px;
        }

        .about-testimonial-position {
            color: #6b7280;
            font-size: 0.9rem;
            margin-bottom: 10px;
        }

        .about-testimonial-text {
            font-size: 0.95rem;
        }

    </style>
</head>
<body>
<!-- Header -->
<%@ include file="includes/header.jsp" %>

<!-- Hero Section -->
<section class="about-hero">
    <div class="about-container">
        <h1>NEPAL'S LEADING LAW FIRM</h1>
        <p>We deliver the highest international standards with an extensive local expertise.</p>
    </div>
</section>

<!-- What We Do Section -->
<section class="about-what-we-do">
    <div class="about-container">
        <h2>WHAT WE DO</h2>
        <p>We combine our specialist legal knowledge, deep commercial understanding, and extensive local expertise to deliver the best results for our clients.</p>

        <div class="about-services">
            <c:forEach var="service" items="${services}">
                <div class="about-service">
                    <img src="${pageContext.request.contextPath}/assets/images/icons/${service.icon}" alt="${service.name}" class="about-service-icon" onerror="this.src='${pageContext.request.contextPath}/assets/images/placeholder.svg'">
                    <h3>${service.name}</h3>
                </div>
            </c:forEach>

            <!-- Fallback if services attribute is not set -->
            <c:if test="${empty services}">
                <div class="about-service">
                    <svg class="about-service-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <rect x="2" y="5" width="20" height="14" rx="2" />
                        <line x1="2" y1="10" x2="22" y2="10" />
                    </svg>
                    <h3>Banking & Finance</h3>
                </div>

                <div class="about-service">
                    <svg class="about-service-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <rect x="2" y="7" width="20" height="14" rx="2" ry="2" />
                        <path d="M16 21V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16" />
                    </svg>
                    <h3>Corporate & Commercial</h3>
                </div>

                <div class="about-service">
                    <svg class="about-service-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <line x1="12" y1="5" x2="12" y2="19" />
                        <line x1="5" y1="12" x2="19" y2="12" />
                        <line x1="5" y1="5" x2="19" y2="19" />
                        <line x1="19" y1="5" x2="5" y2="19" />
                    </svg>
                    <h3>Mergers & Acquisition</h3>
                </div>

                <div class="about-service">
                    <svg class="about-service-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M3 3h18v18H3zM8 12h8M12 8v8" />
                    </svg>
                    <h3>Litigation & Arbitration</h3>
                </div>
            </c:if>
        </div>
    </div>
</section>

<!-- The Firm Section -->
<section class="about-the-firm">
    <div class="about-container">
        <h2>THE FIRM</h2>
        <p>We are a group of lawyers who strive for excellence in providing legal services. We aim to offer the highest international standards and extensive local expertise. We have advised our clients in many notable transactions and disputes for over 15 years.</p>
    </div>
</section>

<!-- Awards Section -->
<section class="about-awards">
    <div class="about-container">
        <h2>Awards & Recognition</h2>

        <div class="about-award-logos">
            <c:forEach var="award" items="${awards}">
                <img src="${pageContext.request.contextPath}/assets/images/awards/${award.image}" alt="${award.name}" class="about-award-logo">
            </c:forEach>

            <!-- Fallback if awards attribute is not set -->
            <c:if test="${empty awards}">
                <img src="${pageContext.request.contextPath}/assets/images/awards/legal-awards-2024.png" alt="Legal Awards 2024" class="about-award-logo" onerror="this.src='${pageContext.request.contextPath}/assets/images/placeholder.svg'">
                <img src="${pageContext.request.contextPath}/assets/images/awards/law-firm-leaders-2025.png" alt="Law Firm Leaders 2025" class="about-award-logo" onerror="this.src='${pageContext.request.contextPath}/assets/images/placeholder.svg'">
                <img src="${pageContext.request.contextPath}/assets/images/awards/top-lawyers-2015.png" alt="Top Lawyers 2015" class="about-award-logo" onerror="this.src='${pageContext.request.contextPath}/assets/images/placeholder.svg'">
                <img src="${pageContext.request.contextPath}/assets/images/awards/legal-500-asia-2022.png" alt="Legal 500 Asia Pacific 2022" class="about-award-logo" onerror="this.src='${pageContext.request.contextPath}/assets/images/placeholder.svg'">
            </c:if>
        </div>

        <div class="about-testimonials">
            <div class="about-testimonial-heading">
                <h2>What does our client has to say about us?</h2>
            </div>

            <div class="about-testimonial">
                <c:choose>
                    <c:when test="${not empty testimonial}">
                        <img src="${pageContext.request.contextPath}/assets/images/testimonials/${testimonial.image}" alt="${testimonial.name}" class="about-testimonial-image" onerror="this.src='${pageContext.request.contextPath}/assets/images/placeholder.svg'">
                        <div class="about-testimonial-content">
                            <div class="about-testimonial-name">${testimonial.name}</div>
                            <div class="about-testimonial-position">${testimonial.position}</div>
                            <div class="about-testimonial-text">${testimonial.text}</div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <img src="${pageContext.request.contextPath}/assets/images/testimonials/john-basnet.jpg" alt="John Basnet" class="about-testimonial-image" onerror="this.src='${pageContext.request.contextPath}/assets/images/placeholder.svg'">
                        <div class="about-testimonial-content">
                            <div class="about-testimonial-name">John Basnet</div>
                            <div class="about-testimonial-position">Property Developer</div>
                            <div class="about-testimonial-text">
                                I was going through a complex property dispute, unsure of if I ever had justice. But from the moment I consulted with Zaina, I knew I was in capable hands. They deeply understood my case, provided clear guidance, and ultimately achieved a favorable outcome. I'm incredibly grateful for their support and highly recommend their services to anyone seeking legal guidance.
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<%@ include file="includes/footer.jsp" %>
</body>
</html>