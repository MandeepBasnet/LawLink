<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="common/header.jsp">
    <jsp:param name="title" value="Practice Areas" />
</jsp:include>
<jsp:include page="common/assets-include.jsp" />

<div class="practice-areas-container">
    <div class="practice-areas-header">
        <h1>Our Practice Areas</h1>
        <p>Explore our wide range of legal services</p>
    </div>

    <div class="practice-areas-grid">
        <script>
            // Use the practiceData from assets.js to generate the practice areas
            document.addEventListener('DOMContentLoaded', function() {
                const practiceAreasGrid = document.querySelector('.practice-areas-grid');

                window.practiceData.forEach(area => {
                    const areaElement = document.createElement('div');
                    areaElement.className = 'practice-area-card';

                    areaElement.innerHTML = `
                        <div class="practice-area-image">
                            <img src="${area.image}" alt="${area.practice}">
                        </div>
                        <h3>${area.practice}</h3>
                        <a href="${pageContext.request.contextPath}/lawyers?area=${encodeURIComponent(area.practice)}" class="btn btn-primary">Find Lawyers</a>
                    `;

                    practiceAreasGrid.appendChild(areaElement);
                });
            });
        </script>
    </div>
</div>

<style>
    .practice-areas-container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 60px 20px;
    }

    .practice-areas-header {
        text-align: center;
        margin-bottom: 60px;
    }

    .practice-areas-header h1 {
        font-size: 2.5rem;
        color: var(--primary-color);
        margin-bottom: 15px;
    }

    .practice-areas-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
        gap: 30px;
    }

    .practice-area-card {
        background: #fff;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease;
        text-align: center;
        padding-bottom: 20px;
    }

    .practice-area-card:hover {
        transform: translateY(-10px);
    }

    .practice-area-image {
        height: 200px;
        overflow: hidden;
    }

    .practice-area-image img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .practice-area-card h3 {
        margin: 20px 0;
        color: var(--secondary-color);
    }

    @media (max-width: 768px) {
        .practice-areas-grid {
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
        }
    }
</style>

<jsp:include page="common/footer.jsp" />
