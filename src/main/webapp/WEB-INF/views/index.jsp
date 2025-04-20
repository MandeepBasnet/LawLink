<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="common/header.jsp">
    <jsp:param name="title" value="Home" />
</jsp:include>
<jsp:include page="common/assets-include.jsp" />

<div class="hero" style="background-image: url('${pageContext.request.contextPath}/assets/images/hero-bg.jpg'); background-size: cover; background-position: center;">
    <div class="container">
        <div class="hero-content">
            <h1>Book Appointment With Trusted Lawyers</h1>
            <p>Connect with experienced lawyers for all your legal needs</p>
            <a href="${pageContext.request.contextPath}/lawyers" class="btn btn-light">Find a Lawyer</a>
        </div>
    </div>
</div>

<section class="practice-areas">
    <div class="container">
        <h2 class="text-center">Find by Practice Area</h2>
        <p class="text-center">Browse through our extensive list of trusted lawyers and select the one that best suits your needs</p>
        <div class="practice-area-grid" id="practice-area-grid">
            <c:forEach items="${practiceAreas}" var="area">
                <a href="${pageContext.request.contextPath}/lawyers?area=${area.areaName}" class="practice-area-card">
                    <div class="practice-area-icon">
                        <i class="fas fa-balance-scale"></i>
                    </div>
                    <h3>${area.areaName}</h3>
                </a>
            </c:forEach>
        </div>
    </div>
</section>

<section class="top-lawyers">
    <div class="container">
        <h2 class="text-center">Top Lawyers</h2>
        <p class="text-center">Here is a list of top lawyers in the country</p>
        <div class="lawyer-grid" id="top-lawyers-grid">
            <c:forEach items="${topLawyers}" var="lawyer">
                <div class="lawyer-card">
                    <div class="lawyer-image">
                        <img src="${pageContext.request.contextPath}/${not empty lawyer.profileImage ? lawyer.profileImage : 'assets/images/default-profile.jpg'}" alt="${lawyer.fullName}">
                    </div>
                    <div class="lawyer-info">
                        <div class="lawyer-availability ${lawyer.available ? 'available' : 'unavailable'}">
                            <span class="status-dot"></span>
                            <span>${lawyer.available ? 'Available' : 'Unavailable'}</span>
                        </div>
                        <h3>${lawyer.fullName}</h3>
                        <p>${lawyer.specialization}</p>
                        <div class="lawyer-rating">
                            <c:forEach begin="1" end="5" var="i">
                                <i class="fas fa-star ${i <= lawyer.rating ? 'active' : ''}"></i>
                            </c:forEach>
                            <span>(${lawyer.rating})</span>
                        </div>
                        <a href="${pageContext.request.contextPath}/lawyers/profile/${lawyer.lawyerId}" class="btn btn-primary">View Profile</a>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="text-center mt-3">
            <a href="${pageContext.request.contextPath}/lawyers" class="btn btn-secondary">View All Lawyers</a>
        </div>
    </div>
</section>

<section class="cta">
    <div class="container">
        <div class="cta-content">
            <h2>Book Appointment Now</h2>
            <p>Connect with trusted lawyers for all your legal needs</p>
            <a href="${pageContext.request.contextPath}/register" class="btn btn-light">Create Account</a>
        </div>
    </div>
</section>

<!-- Include JavaScript to initialize the assets -->
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Check if we need to use the demo practice area data
        const practiceAreaGrid = document.getElementById('practice-area-grid');
        if (practiceAreaGrid && practiceAreaGrid.children.length === 0 && window.practiceData) {
            window.practiceData.forEach(area => {
                const areaCard = document.createElement('a');
                areaCard.className = 'practice-area-card';
                areaCard.href = '${pageContext.request.contextPath}/lawyers?area=' + encodeURIComponent(area.practice);

                areaCard.innerHTML = `
                    <div class="practice-area-icon">
                        <img src="${area.image}" alt="${area.practice}">
                    </div>
                    <h3>${area.practice}</h3>
                `;

                practiceAreaGrid.appendChild(areaCard);
            });
        }

        // Check if we need to use the demo lawyer data
        const topLawyersGrid = document.getElementById('top-lawyers-grid');
        if (topLawyersGrid && topLawyersGrid.children.length === 0 && window.lawyers) {
            // Display only the first 8 lawyers
            const topLawyers = window.lawyers.slice(0, 8);

            topLawyers.forEach(lawyer => {
                const lawyerCard = document.createElement('div');
                lawyerCard.className = 'lawyer-card';

                lawyerCard.innerHTML = `
                    <div class="lawyer-image">
                        <img src="${lawyer.image}" alt="${lawyer.name}">
                    </div>
                    <div class="lawyer-info">
                        <div class="lawyer-availability available">
                            <span class="status-dot"></span>
                            <span>Available</span>
                        </div>
                        <h3>${lawyer.name}</h3>
                        <p>${lawyer.practice}</p>
                        <div class="lawyer-rating">
                            <i class="fas fa-star active"></i>
                            <i class="fas fa-star active"></i>
                            <i class="fas fa-star active"></i>
                            <i class="fas fa-star active"></i>
                            <i class="fas fa-star"></i>
                            <span>(4.0)</span>
                        </div>
                        <a href="${pageContext.request.contextPath}/lawyers/profile/${lawyer._id}" class="btn btn-primary">View Profile</a>
                    </div>
                `;

                topLawyersGrid.appendChild(lawyerCard);
            });
        }
    });
</script>

<style>
    .practice-area-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
        gap: 20px;
        margin-top: 20px;
    }

    .practice-area-card {
        background: white;
        border-radius: 8px;
        padding: 20px;
        text-align: center;
        text-decoration: none;
        color: #333;
        transition: transform 0.3s ease;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }

    .practice-area-card:hover {
        transform: translateY(-5px);
    }

    .practice-area-icon {
        width: 60px;
        height: 60px;
        margin: 0 auto 15px;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .practice-area-icon img {
        max-width: 100%;
        max-height: 100%;
        object-fit: contain;
    }

    .practice-area-card h3 {
        margin: 0;
        font-size: 1.1rem;
    }

    .lawyer-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
        gap: 20px;
        margin-top: 20px;
    }

    .lawyer-card {
        background: white;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        overflow: hidden;
        display: flex;
        flex-direction: column;
        height: 100%;
    }

    .lawyer-image {
        position: relative;
        width: 100%;
        padding-top: 75%;
        overflow: hidden;
    }

    .lawyer-image img {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .lawyer-info {
        padding: 15px;
        flex-grow: 1;
        display: flex;
        flex-direction: column;
    }

    .lawyer-info h3 {
        margin: 10px 0;
        font-size: 1.2rem;
    }

    .lawyer-info p {
        margin: 5px 0;
        color: #666;
    }

    .lawyer-rating {
        margin: 10px 0;
    }

    .lawyer-availability {
        display: flex;
        align-items: center;
        margin-bottom: 10px;
    }

    .status-dot {
        width: 8px;
        height: 8px;
        border-radius: 50%;
        margin-right: 5px;
    }

    .available .status-dot {
        background-color: #28a745;
    }

    .unavailable .status-dot {
        background-color: #dc3545;
    }

    .btn-primary {
        margin-top: auto;
        width: 100%;
    }
</style>

<jsp:include page="common/footer.jsp" />
