<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lawyers - LawLink</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/WEB-INF/views/admin/css/style.css">
</head>
<body>
    <jsp:include page="common/header.jsp" />
    
    <div class="main-container">
        <jsp:include page="common/sidebar.jsp">
            <jsp:param name="activePage" value="lawyers" />
        </jsp:include>

        <div class="main-content">
            <div class="dashboard-stats">
                <div class="stat-card">
                    <img src="${pageContext.request.contextPath}/assets/icons/clients-color.png" alt="Clients" class="stat-icon">
                    <div class="stat-number">12</div>
                    <div class="stat-label">Clients</div>
                </div>
                <div class="stat-card">
                    <img src="${pageContext.request.contextPath}/assets/icons/lawyers-color.png" alt="Lawyers" class="stat-icon">
                    <div class="stat-number">15</div>
                    <div class="stat-label">Lawyers</div>
                </div>
                <div class="stat-card">
                    <img src="${pageContext.request.contextPath}/assets/icons/appointments-color.png" alt="Appointments" class="stat-icon">
                    <div class="stat-number">12</div>
                    <div class="stat-label">Appointments</div>
                </div>
            </div>

            <div class="header-actions">
                <h2 class="section-title">All Lawyers</h2>
                <a href="${pageContext.request.contextPath}/admin/add-lawyer" class="btn-add">
                    <img src="${pageContext.request.contextPath}/assets/icons/plus.png" alt="Add">
                    Add Lawyer
                </a>
            </div>

            <table class="lawyers-table">
                <thead>
                    <tr>
                        <th>S.N.</th>
                        <th>Lawyer</th>
                        <th>Practice Area</th>
                        <th>Experience</th>
                        <th>Phone</th>
                        <th>Total Appointments</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>
                            <img src="${pageContext.request.contextPath}/assets/images/lawyer1.jpg" alt="Susasa Acharya" class="lawyer-avatar">
                            Susasa Acharya
                        </td>
                        <td>Property Law</td>
                        <td>5+ Years</td>
                        <td>+977-9876543210</td>
                        <td>8</td>
                        <td>
                            <button class="action-btn">
                                <img src="${pageContext.request.contextPath}/assets/icons/edit.png" alt="Edit">
                            </button>
                            <button class="action-btn">
                                <img src="${pageContext.request.contextPath}/assets/icons/delete.png" alt="Delete">
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>
                            <img src="${pageContext.request.contextPath}/assets/images/lawyer2.jpg" alt="Anish Basnet" class="lawyer-avatar">
                            Anish Basnet
                        </td>
                        <td>Labour Law</td>
                        <td>3 Years</td>
                        <td>+977-9876543211</td>
                        <td>5</td>
                        <td>
                            <button class="action-btn">
                                <img src="${pageContext.request.contextPath}/assets/icons/edit.png" alt="Edit">
                            </button>
                            <button class="action-btn">
                                <img src="${pageContext.request.contextPath}/assets/icons/delete.png" alt="Delete">
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>
                            <img src="${pageContext.request.contextPath}/assets/images/lawyer3.jpg" alt="Yusha Shrestha" class="lawyer-avatar">
                            Yusha Shrestha
                        </td>
                        <td>International Law</td>
                        <td>4 Years</td>
                        <td>+977-9876543212</td>
                        <td>6</td>
                        <td>
                            <button class="action-btn">
                                <img src="${pageContext.request.contextPath}/assets/icons/edit.png" alt="Edit">
                            </button>
                            <button class="action-btn">
                                <img src="${pageContext.request.contextPath}/assets/icons/delete.png" alt="Delete">
                            </button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>