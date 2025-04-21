<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - LawLink</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
<!-- Header -->
<%@ include file="includes/header.jsp" %>

<!-- Main Content -->
<main class="contact-us-main-content">
    <div class="container">
        <h1 class="contact-us-page-title">Contact Us</h1>

        <div class="contact-us-info">
            <div class="contact-us-item">
                <svg class="contact-us-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
                    <circle cx="12" cy="10" r="3"></circle>
                </svg>
                <div class="contact-us-details">
                    <h3>Office location</h3>
                    <p>${contactInfo.address != null ? contactInfo.address : 'Itahari-12, Sunsari, Sagarmatha-chowk,<br>Central mall, 1st floor, Dharan line, Nepal'}</p>
                </div>
            </div>

            <div class="contact-us-item">
                <svg class="contact-us-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path>
                </svg>
                <div class="contact-us-details">
                    <h3>Phone Number</h3>
                    <p>${contactInfo.phone != null ? contactInfo.phone : '+9802778377'}</p>
                </div>
            </div>

            <div class="contact-us-item">
                <svg class="contact-us-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
                    <polyline points="22,6 12,13 2,6"></polyline>
                </svg>
                <div class="contact-us-details">
                    <h3>Email</h3>
                    <p>${contactInfo.email != null ? contactInfo.email : 'lawlinkprivatelimited@lawlink.com'}</p>
                </div>
            </div>
        </div>
    </div>
</main>

<!-- Footer -->
<%@ include file="includes/footer.jsp" %>

</body>
</html>