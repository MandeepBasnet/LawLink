<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="common/header.jsp">
    <jsp:param name="title" value="Lawyers" />
</jsp:include>
<jsp:include page="common/assets-include.jsp" />

<style>
    .lawyer-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
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
        padding-top: 100%; /* Square aspect ratio */
        overflow: hidden;
        background-color: #f8f9fa; /* Light background for images */
    }

    .lawyer-image img {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 100%;
        height: 100%;
        object-fit: cover;
        object-position: center;
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

    /* Responsive adjustments */
    @media (max-width: 768px) {
        .lawyer-grid {
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
        }
    }

    @media (max-width: 576px) {
        .lawyer-grid {
            grid-template-columns: 1fr;
        }
    }
</style>

<div class="container">
    <input type="hidden" id="hasLawyers" value="${not empty lawyers}">
    <h1 class="mt-3 mb-3">Find a Lawyer</h1>

    <div class="lawyer-search">
        <form action="${pageContext.request.contextPath}/lawyers" method="get" class="search-form">
            <div class="form-group">
                <input type="text" class="form-control" name="search" placeholder="Search by name or specialization" value="${param.search}">
            </div>
            <div class="form-group">
                <select class="form-control" name="area">
                    <option value="">All Practice Areas</option>
                    <c:forEach items="${practiceAreas}" var="area">
                        <option value="${area.areaName}" ${param.area eq area.areaName ? 'selected' : ''}>${area.areaName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Search</button>
            </div>
        </form>
    </div>

    <div class="lawyer-list">
        <div class="row">
            <div class="col-md-3">
                <div class="filter-sidebar">
                    <h3>Filters</h3>
                    <div class="filter-section">
                        <h4>Practice Areas</h4>
                        <ul class="filter-list">
                            <c:forEach items="${practiceAreas}" var="area">
                                <li>
                                    <a href="${pageContext.request.contextPath}/lawyers?area=${area.areaName}" class="${param.area eq area.areaName ? 'active' : ''}">
                                            ${area.areaName}
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="filter-section">
                        <h4>Availability</h4>
                        <ul class="filter-list">
                            <li>
                                <a href="${pageContext.request.contextPath}/lawyers?available=true" class="${param.available eq 'true' ? 'active' : ''}">
                                    Available Now
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-9">
                <div class="lawyer-grid">
                    <c:forEach items="${lawyers}" var="lawyer">
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

                    <c:if test="${empty lawyers}">
                        <div class="no-results">
                            <p>No lawyers found matching your criteria.</p>
                        </div>
                    </c:if>
                </div>

                <c:if test="${totalPages > 1}">
                    <div class="pagination">
                        <c:if test="${currentPage > 1}">
                            <a href="${pageContext.request.contextPath}/lawyers?page=${currentPage - 1}&search=${param.search}&area=${param.area}&available=${param.available}" class="btn btn-light">Previous</a>
                        </c:if>

                        <c:forEach begin="1" end="${totalPages}" var="i">
                            <a href="${pageContext.request.contextPath}/lawyers?page=${i}&search=${param.search}&area=${param.area}&available=${param.available}" class="btn ${currentPage eq i ? 'btn-primary' : 'btn-light'}">${i}</a>
                        </c:forEach>

                        <c:if test="${currentPage < totalPages}">
                            <a href="${pageContext.request.contextPath}/lawyers?page=${currentPage + 1}&search=${param.search}&area=${param.area}&available=${param.available}" class="btn btn-light">Next</a>
                        </c:if>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</div>

<!-- Include JavaScript to initialize the assets -->
<script>
    // Check if we need to use the demo lawyer data from assets.js
    const hasLawyers = document.getElementById('hasLawyers').value === 'true';
    if (!hasLawyers) {
        // Create lawyer elements from the demo data
        document.addEventListener('DOMContentLoaded', function() {
            if (window.lawyers && window.lawyers.length > 0) {
                const lawyerGrid = document.querySelector('.lawyer-grid');
                if (lawyerGrid) {
                    // Clear the "no results" message if it exists
                    lawyerGrid.innerHTML = '';

                    // Add lawyers from the demo data
                    window.lawyers.forEach(lawyer => {
                        const lawyerCard = document.createElement('div');
                        lawyerCard.className = 'lawyer-card';

                        lawyerCard.innerHTML = `
                            <div class="lawyer-image">
                                <img src="\${lawyer.image}" alt="\${lawyer.name}">
                            </div>
                            <div class="lawyer-info">
                                <div class="lawyer-availability available">
                                    <span class="status-dot"></span>
                                    <span>Available</span>
                                </div>
                                <h3>\${lawyer.name}</h3>
                                <p>\${lawyer.practice}</p>
                                <div class="lawyer-rating">
                                    <i class="fas fa-star active"></i>
                                    <i class="fas fa-star active"></i>
                                    <i class="fas fa-star active"></i>
                                    <i class="fas fa-star active"></i>
                                    <i class="fas fa-star"></i>
                                    <span>(4.0)</span>
                                </div>
                                <a href="${pageContext.request.contextPath}/lawyers/profile/\${lawyer._id}" class="btn btn-primary">View Profile</a>
                            </div>
                        `;

                        lawyerGrid.appendChild(lawyerCard);
                    });
                }
            }
        });
    }
</script>

<jsp:include page="common/footer.jsp" />
