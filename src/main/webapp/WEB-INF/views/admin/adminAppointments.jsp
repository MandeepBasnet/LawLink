<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard Appointments - LawLink</title>
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
        <a href="${pageContext.request.contextPath}/admin/admin-clients" class="sidebar-item ">
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
        <a href="${pageContext.request.contextPath}/admin/admin-appointments" class="sidebar-item active">
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

        <div class="appointments-section">
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
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>
                        <img src="${pageContext.request.contextPath}/assets/images/john.png" alt="John Thapa" class="client-avatar">
                        John Thapa
                    </td>
                    <td>Property Law</td>
                    <td>24th July, 2025, 10 AM</td>
                    <td>
                        <img src="${pageContext.request.contextPath}/assets/images/susasa-acharaya.png" alt="Susasa Acharya" class="lawyer-avatar">
                        Susasa Acharya
                    </td>
                    <td>$50</td>
                    <td>
                        <button class="action-btn">
                            <img src="${pageContext.request.contextPath}/assets/images/cancel_icon.svg" alt="More">
                        </button>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>
                        <img src="${pageContext.request.contextPath}/assets/images/profile_pic.png" alt="Ram Rai" class="client-avatar">
                        Ram Rai
                    </td>
                    <td>Labour Law</td>
                    <td>25th July, 2025, 10:30 AM</td>
                    <td>
                        <img src="${pageContext.request.contextPath}/assets/images/anish-basnet.png" alt="Anish Basnet" class="lawyer-avatar">
                        Anish Basnet
                    </td>
                    <td>$50</td>
                    <td>
                        <button class="action-btn">
                            <img src="${pageContext.request.contextPath}/assets/images/cancel_icon.svg" alt="More">
                        </button>
                    </td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>
                        <img src="${pageContext.request.contextPath}/assets/images/profile_pic.png" alt="Hari Kumar" class="client-avatar">
                        Hari Kumar
                    </td>
                    <td>International Law</td>
                    <td>25th July, 2025, 01:30 PM</td>
                    <td>
                        <img src="${pageContext.request.contextPath}/assets/images/yusha-shrestha.png" alt="Yusha Shrestha" class="lawyer-avatar">
                        Yusha Shrestha
                    </td>
                    <td>$60</td>
                    <td>
                        <span class="status-badge status-cancelled">Cancelled</span>
                    </td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>
                        <img src="${pageContext.request.contextPath}/assets/images/profile_pic.png" alt="Hari Kumar" class="client-avatar">
                        Hari Kumar
                    </td>
                    <td>International Law</td>
                    <td>20th April, 2025, 02 PM</td>
                    <td>
                        <img src="${pageContext.request.contextPath}/assets/images/yusha-shrestha.png" alt="Yusha Shrestha" class="lawyer-avatar">
                        Yusha Shrestha
                    </td>
                    <td>$60</td>
                    <td>
                        <span class="status-badge status-completed">Completed</span>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>