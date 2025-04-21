<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Clients - LawLink</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/WEB-INF/views/admin/css/style.css">
</head>
<body>
    <jsp:include page="common/header.jsp" />
    
    <div class="main-container">
        <jsp:include page="common/sidebar.jsp">
            <jsp:param name="activePage" value="clients" />
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

            <h2 class="section-title">All Clients</h2>
            
            <table class="clients-table">
                <thead>
                    <tr>
                        <th>S.N.</th>
                        <th>Client</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Total Appointments</th>
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
                        <td>john.thapa@example.com</td>
                        <td>+977-9876543210</td>
                        <td>3</td>
                        <td>
                            <button class="action-btn">
                                <img src="${pageContext.request.contextPath}/assets/icons/view.png" alt="View">
                            </button>
                            <button class="action-btn">
                                <img src="${pageContext.request.contextPath}/assets/icons/delete.png" alt="Delete">
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>
                            <img src="${pageContext.request.contextPath}/assets/images/client2.jpg" alt="Ram Rai" class="client-avatar">
                            Ram Rai
                        </td>
                        <td>ram.rai@example.com</td>
                        <td>+977-9876543211</td>
                        <td>2</td>
                        <td>
                            <button class="action-btn">
                                <img src="${pageContext.request.contextPath}/assets/icons/view.png" alt="View">
                            </button>
                            <button class="action-btn">
                                <img src="${pageContext.request.contextPath}/assets/icons/delete.png" alt="Delete">
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>
                            <img src="${pageContext.request.contextPath}/assets/images/client3.jpg" alt="Hari Kumar" class="client-avatar">
                            Hari Kumar
                        </td>
                        <td>hari.kumar@example.com</td>
                        <td>+977-9876543212</td>
                        <td>4</td>
                        <td>
                            <button class="action-btn">
                                <img src="${pageContext.request.contextPath}/assets/icons/view.png" alt="View">
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