<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard Clients - LawLink</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminStyle.css">
</head>
<body>
<div class="header">
    <div class="logo-container">
        <img src="${pageContext.request.contextPath}/assets/images/logo.png" alt="LawLink Logo" class="logo">
        <span class="logo-text">LawLink</span>
    </div>
    <div class="user-info">
        <img src="${pageContext.request.contextPath}/assets/images/profile_pic.png" alt="Admin" class="user-avatar">
        <span>John Doe</span>
        <span>Admin</span>
        <form action="${pageContext.request.contextPath}/logout" method="post" style="display: inline;">
            <button type="submit" class="logout-btn">Logout</button>
        </form>
    </div>
</div>

<div class="main-container">
    <div class="sidebar">
        <a href="${pageContext.request.contextPath}/admin/admin-dashboard" class="sidebar-item ">
            <img src="${pageContext.request.contextPath}/assets/images/home_icon.svg" alt="Dashboard">
            Dashboard
        </a>
        <a href="${pageContext.request.contextPath}/admin/admin-clients" class="sidebar-item active">
            <img src="${pageContext.request.contextPath}/assets/images/client_icon.svg" alt="Clients">
            Clients
        </a>
        <a href="${pageContext.request.contextPath}/admin/admin-lawyers" class="sidebar-item ">
            <img src="${pageContext.request.contextPath}/assets/images/clients_icon.svg" alt="Lawyers">
            Lawyers
        </a>
        <a href="${pageContext.request.contextPath}/admin/admin-add-lawyer" class="sidebar-item ">
            <img src="${pageContext.request.contextPath}/assets/images/add_icon.svg" alt="Add Lawyer">
            Add Lawyer
        </a>
        <a href="${pageContext.request.contextPath}/admin/admin-appointments" class="sidebar-item ">
            <img src="${pageContext.request.contextPath}/assets/images/appointment_icon.svg" alt="Appointments">
            Appointments
        </a>
    </div>

    <div class="main-content">
        <div class="dashboard-stats">
            <div class="stat-card">
                <img src="${pageContext.request.contextPath}/assets/images/clients_icon.svg" alt="Clients" class="stat-icon">
                <div class="stat-number">12</div>
                <div class="stat-label">Clients</div>
            </div>
            <div class="stat-card">
                <img src="${pageContext.request.contextPath}/assets/images/lawyer_icon.png" alt="Lawyers" class="stat-icon">
                <div class="stat-number">15</div>
                <div class="stat-label">Lawyers</div>
            </div>
            <div class="stat-card">
                <img src="${pageContext.request.contextPath}/assets/images/appointments_icon.svg" alt="Appointments" class="stat-icon">
                <div class="stat-number">12</div>
                <div class="stat-label">Appointments</div>
            </div>
        </div>

        <div class="clients-section">
            <h2 class="section-title">Clients</h2>

            <table class="clients-table">
                <thead>
                <tr>
                    <th>S.N.</th>
                    <th>Client</th>
                    <th>Username</th>
                    <th>Address</th>
                    <th>Email</th>
                    <th>Phone</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>
                        <img src="${pageContext.request.contextPath}/assets/images/john.png" alt="John Thapa" class="client-avatar">
                        John Thapa
                    </td>
                    <td>john123</td>
                    <td>Itahari, Sunsari</td>
                    <td>johnthapa@gmail.com</td>
                    <td>9812345678</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>
                        <img src="${pageContext.request.contextPath}/assets/images/profile_pic.png" alt="Ram Rai" class="client-avatar">
                        Ram Rai
                    </td>
                    <td>ramrai</td>
                    <td>Biratnagar, Morang</td>
                    <td>ramrai@gmail.com</td>
                    <td>9786583211</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>