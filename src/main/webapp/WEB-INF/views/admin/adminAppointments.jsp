<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Appointments - LawLink</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/WEB-INF/views/admin/css/style.css">
</head>
<body>
    <jsp:include page="common/header.jsp" />
    
    <div class="main-container">
        <jsp:include page="common/sidebar.jsp">
            <jsp:param name="activePage" value="appointments" />
        </jsp:include>
        <div class="main-content">
            <div class="dashboard-stats">
                <div class="stat-card">
                    <img src="${pageContext.request.contextPath}/assets/icons/clients-color.png" alt="Clients"
                        class="stat-icon">
                    <div class="stat-number">12</div>
                    <div class="stat-label">Clients</div>
                </div>
                <div class="stat-card">
                    <img src="${pageContext.request.contextPath}/assets/icons/lawyers-color.png" alt="Lawyers"
                        class="stat-icon">
                    <div class="stat-number">15</div>
                    <div class="stat-label">Lawyers</div>
                </div>
                <div class="stat-card">
                    <img src="${pageContext.request.contextPath}/assets/icons/appointments-color.png"
                        alt="Appointments" class="stat-icon">
                    <div class="stat-number">12</div>
                    <div class="stat-label">Appointments</div>
                </div>
            </div>
            <h2 class="section-title">All Appointments</h2>
            <table class="appointments-table">
                <thead>
                    <tr>
                        <th>S.N.</th>
                        <th>Client</th>
                        <th>Practice Area</th>
                        <th>Date and Time</th>
                        <th>Lawyer</th>
                        <th>Fees</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>
                            <img src="${pageContext.request.contextPath}/assets/images/client1.jpg" alt="John Thapa" class="client-avatar">
                            John Thapa
                        </td>
                        <td>Property Law</td>
                        <td>24th July, 2025,10 AM</td>
                        <td>
                            <img src="${pageContext.request.contextPath}/assets/images/lawyer1.jpg" alt="Susasa Acharya" class="lawyer-avatar">
                            Susasa Acharya
                        </td>
                        <td>$50</td>
                        <td>Pending</td>
                        <td>
                            <button class="action-btn">
                                <img src="${pageContext.request.contextPath}/assets/icons/close.png" alt="Cancel">
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>
                            <img src="${pageContext.request.contextPath}/assets/images/client2.jpg" alt="Ram Rai" class="client-avatar">
                            Ram Rai
                        </td>
                        <td>Labour Law</td>
                        <td>25th July, 2025,10:30 AM</td>
                        <td>
                            <img src="${pageContext.request.contextPath}/assets/images/lawyer2.jpg" alt="Anish Basnet" class="lawyer-avatar">
                            Anish Basnet
                        </td>
                        <td>$50</td>
                        <td>Pending</td>
                        <td>
                            <button class="action-btn">
                                <img src="${pageContext.request.contextPath}/assets/icons/close.png" alt="Cancel">
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>
                            <img src="${pageContext.request.contextPath}/assets/images/client3.jpg" alt="Hari Kumar" class="client-avatar">
                            Hari Kumar
                        </td>
                        <td>International Law</td>
                        <td>25th July, 2025,01:30 PM</td>
                        <td>
                            <img src="${pageContext.request.contextPath}/assets/images/lawyer3.jpg" alt="Yusha Shrestha" class="lawyer-avatar">
                            Yusha Shrestha
                        </td>
                        <td>$60</td>
                        <td>Cancelled</td>
                        <td>
                            <button class="action-btn" disabled>
                                <img src="${pageContext.request.contextPath}/assets/icons/close.png" alt="Cancel">
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>
                            <img src="${pageContext.request.contextPath}/assets/images/client3.jpg" alt="Hari Kumar" class="client-avatar">
                            Hari Kumar
                        </td>
                        <td>International Law</td>
                        <td>20th April, 2025,02 PM</td>
                        <td>
                            <img src="${pageContext.request.contextPath}/assets/images/lawyer3.jpg" alt="Yusha Shrestha" class="lawyer-avatar">
                            Yusha Shrestha
                        </td>
                        <td>$60</td>
                        <td>Completed</td>
                        <td>
                            <button class="action-btn" disabled>
                                <img src="${pageContext.request.contextPath}/assets/icons/check.png" alt="Completed">
                            </button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>