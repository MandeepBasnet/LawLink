<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="contextPath" content="${pageContext.request.contextPath}">
    <title>LawLink - ${param.title}</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <script src="${pageContext.request.contextPath}/assets/js/assets.js"></script>
</head>
<body>
<nav class="navbar">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <div class="logo">
                <a href="${pageContext.request.contextPath}/">
                    <img src="${pageContext.request.contextPath}/assets/images/logo.png" alt="LawLink Logo" width="150">
                </a>
            </div>
            <button id="mobile-menu-toggle" class="btn btn-light d-md-none">
                <i class="fas fa-bars"></i>
            </button>
            <ul id="navbar-menu">
                <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/lawyers">Lawyers</a></li>
                <li><a href="${pageContext.request.contextPath}/about">About</a></li>
                <li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
                <c:choose>
                    <c:when test="${empty sessionScope.user}">
                        <li><a href="${pageContext.request.contextPath}/login">Login</a></li>
                        <li><a href="${pageContext.request.contextPath}/register" class="btn btn-primary">Register</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle">
                                <img src="${pageContext.request.contextPath}/${not empty sessionScope.user.profileImage ? sessionScope.user.profileImage : 'assets/images/default-profile.jpg'}"
                                     alt="Profile" class="profile-img" width="30" height="30">
                                    ${sessionScope.user.fullName}
                            </a>
                            <div class="dropdown-menu">
                                <c:choose>
                                    <c:when test="${sessionScope.user.role eq 'ADMIN'}">
                                        <a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a>
                                    </c:when>
                                    <c:when test="${sessionScope.user.role eq 'LAWYER'}">
                                        <a href="${pageContext.request.contextPath}/lawyer/dashboard">Dashboard</a>
                                    </c:when>
                                    <c:when test="${sessionScope.user.role eq 'CLIENT'}">
                                        <a href="${pageContext.request.contextPath}/client/dashboard">Dashboard</a>
                                        <a href="${pageContext.request.contextPath}/client/appointments">My Appointments</a>
                                    </c:when>
                                </c:choose>
                                <a href="${pageContext.request.contextPath}/profile">My Profile</a>
                                <a href="${pageContext.request.contextPath}/change-password">Change Password</a>
                                <a href="${pageContext.request.contextPath}/logout">Logout</a>
                            </div>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-3">
    <c:if test="${not empty sessionScope.message}">
        <div class="alert alert-success alert-dismissible">
                ${sessionScope.message}
            <button type="button" class="close">&times;</button>
        </div>
        <c:remove var="message" scope="session" />
    </c:if>

    <c:if test="${not empty sessionScope.error}">
        <div class="alert alert-danger alert-dismissible">
                ${sessionScope.error}
            <button type="button" class="close">&times;</button>
        </div>
        <c:remove var="error" scope="session" />
    </c:if>

    <c:if test="${not empty requestScope.message}">
        <div class="alert alert-success alert-dismissible">
                ${requestScope.message}
            <button type="button" class="close">&times;</button>
        </div>
    </c:if>

    <c:if test="${not empty requestScope.error}">
        <div class="alert alert-danger alert-dismissible">
                ${requestScope.error}
            <button type="button" class="close">&times;</button>
        </div>
    </c:if>
</div>
