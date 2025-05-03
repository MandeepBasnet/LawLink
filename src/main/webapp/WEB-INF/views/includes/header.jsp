<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><c:out value="${title}" default="Default Title"/></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<header>
    <div class="container header-content">
        <div class="logo-container">
            <img src="${pageContext.request.contextPath}/assets/images/logo.png" alt="LawLink Logo" class="logo">
            <div class="logo-text">LawLink</div>
        </div>
        <nav>
            <ul>
                <li><a href="${pageContext.request.contextPath}/home">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/appointment">Appointments</a></li>
                <li><a href="${pageContext.request.contextPath}/lawyers">Lawyers</a></li>
                <li><a href="${pageContext.request.contextPath}/about-us">About Us</a></li>
                <li><a href="${pageContext.request.contextPath}/contact-us">Contact Us</a></li>
                <c:if test="${not empty sessionScope.user}">
                    <li>
                        <div class="profile">
                            <img src="${pageContext.request.contextPath}/assets/images/<c:out value="${sessionScope.user.getProfileImage()}" default="profile_pic.png" />" alt="Profile">
                            <div class="profile-menu">
                                <a href="${pageContext.request.contextPath}/client/my-appointments">My Appointments</a>
                                <a href="${pageContext.request.contextPath}/client/my-profile">My Profile</a>
                                <form action="${pageContext.request.contextPath}/logout" method="post" style="margin:0;">
                                    <button type="submit">Logout</button>
                                </form>
                            </div>
                        </div>
                    </li>
                </c:if>
                <li><a href="${pageContext.request.contextPath}/log-in" class="login-btn">Log In</a></li>
            </ul>
        </nav>
    </div>
</header>