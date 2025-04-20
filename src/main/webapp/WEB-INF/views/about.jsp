<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="common/header.jsp">
    <jsp:param name="title" value="About Us" />
</jsp:include>
<jsp:include page="common/assets-include.jsp" />

<div class="about-container">
    <div class="about-header">
        <h1>About LawLink</h1>
        <p>Connecting clients with expert legal professionals since 2024</p>
    </div>

    <div class="about-content">
        <div class="about-text">
            <h2>Our Story</h2>
            <p>LawLink was founded with a simple yet powerful vision: to make quality legal services accessible to everyone. We understand that finding the right legal representation can be overwhelming, which is why we've created a platform that connects clients with experienced lawyers across various practice areas.</p>

            <h2>Our Mission</h2>
            <p>Our mission is to revolutionize the way people access legal services. By leveraging technology and our network of verified lawyers, we ensure that every client finds the perfect legal professional for their specific needs.</p>

            <h2>Why Choose Us</h2>
            <p>At LawLink, we pride ourselves on our commitment to excellence, transparency, and client satisfaction. Our platform offers:</p>
            <ul>
                <li>Verified and experienced lawyers</li>
                <li>Transparent pricing</li>
                <li>Easy appointment scheduling</li>
                <li>Secure communication</li>
                <li>Client-focused approach</li>
            </ul>
        </div>
        <div class="about-image-container">
            <img src="${pageContext.request.contextPath}/assets/images/about_image.png" alt="About LawLink" class="about-image">
        </div>
    </div>

    <div class="stats-section">
        <div class="stats-grid">
            <div class="stat-item">
                <h3>${teamSize}</h3>
                <p>Expert Lawyers</p>
            </div>
            <div class="stat-item">
                <h3>${experienceYears}</h3>
                <p>Years Experience</p>
            </div>
            <div class="stat-item">
                <h3>${clientsServed}</h3>
                <p>Clients Served</p>
            </div>
            <div class="stat-item">
                <h3>${successRate}</h3>
                <p>Success Rate</p>
            </div>
        </div>
    </div>

    <div class="values-section">
        <div class="values-grid">
            <div class="value-item">
                <i class="fas fa-balance-scale"></i>
                <h3>Excellence</h3>
                <p>We maintain the highest standards of legal expertise and professional service, ensuring our clients receive top-quality representation.</p>
            </div>
            <div class="value-item">
                <i class="fas fa-handshake"></i>
                <h3>Integrity</h3>
                <p>Our commitment to honesty, transparency, and ethical practices forms the foundation of every client relationship.</p>
            </div>
            <div class="value-item">
                <i class="fas fa-lightbulb"></i>
                <h3>Innovation</h3>
                <p>We continuously evolve our platform and services to meet the changing needs of our clients and the legal industry.</p>
            </div>
        </div>
    </div>
</div>

<style>
    .about-container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 60px 20px;
    }

    .about-header {
        text-align: center;
        margin-bottom: 60px;
    }

    .about-header h1 {
        font-size: 2.5rem;
        color: var(--primary-color);
        margin-bottom: 20px;
    }

    .about-content {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 60px;
        align-items: center;
        margin-bottom: 80px;
    }

    .about-text h2 {
        color: var(--primary-color);
        font-size: 1.8rem;
        margin-bottom: 20px;
    }

    .about-text p {
        margin-bottom: 25px;
        line-height: 1.6;
    }

    .about-text ul {
        list-style-type: none;
        padding-left: 0;
    }

    .about-text ul li {
        padding-left: 30px;
        position: relative;
        margin-bottom: 10px;
    }

    .about-text ul li:before {
        content: "✓";
        position: absolute;
        left: 0;
        color: var(--primary-color);
    }

    .about-image-container {
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    }

    .about-image {
        width: 100%;
        height: auto;
        display: block;
    }

    .stats-section {
        background-color: var(--primary-color);
        padding: 60px 0;
        margin: 80px -20px;
        color: white;
    }

    .stats-grid {
        max-width: 1200px;
        margin: 0 auto;
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 30px;
        padding: 0 20px;
    }

    .stat-item {
        text-align: center;
    }

    .stat-item h3 {
        font-size: 2.5rem;
        margin-bottom: 10px;
    }

    .values-section {
        padding: 80px 0;
    }

    .values-grid {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 30px;
    }

    .value-item {
        text-align: center;
        padding: 30px;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    }

    .value-item i {
        font-size: 2.5rem;
        color: var(--primary-color);
        margin-bottom: 20px;
    }

    .value-item h3 {
        margin-bottom: 15px;
    }

    @media (max-width: 768px) {
        .about-content {
            grid-template-columns: 1fr;
        }

        .stats-grid {
            grid-template-columns: repeat(2, 1fr);
        }

        .values-grid {
            grid-template-columns: 1fr;
        }
    }
</style>

<jsp:include page="common/footer.jsp" />
