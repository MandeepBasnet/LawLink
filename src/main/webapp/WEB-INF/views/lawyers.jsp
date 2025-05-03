<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lawyers</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<!-- Header Section -->
<jsp:include page="includes/header.jsp" />


<!-- Team Members Grid -->
<div class="team-container">
    <!-- Team Member 1 -->
    <div class="team-member">
        <img src="${pageContext.request.contextPath}/assets/images/jeniffer.png" alt="Jalira Puri">
        <div class="member-info">
            <h2 class="member-name">Jalira Puri</h2>
            <p class="member-title">PRINCIPAL SENIOR ADVISOR</p>
            <div class="member-contact">
                <p>Contact no.: +977 9765432180</p>
                <p>Email: jalira@lawfirm.com</p>
            </div>
            <div class="member-bio">
                <p>Jalira is a Senior Advisor licensed by Nepal Bar Council. She is a seasoned litigator with decades of legal practice.</p>
            </div>
        </div>
    </div>

    <!-- Team Member 2 -->
    <div class="team-member">
        <img src="${pageContext.request.contextPath}/assets/images/ashutosh-srivastava.png" alt="Aashutosh Srivastava">
        <div class="member-info">
            <h2 class="member-name">Aashutosh Srivastava</h2>
            <p class="member-title">ADVOCATE & LEGAL ADVISOR</p>
            <div class="member-contact">
                <p>Contact No.: +977 9823843129</p>
                <p>Email: aashutosh@lawfirm.com</p>
            </div>
            <div class="member-bio">
                <p>Advocate Aashutosh Srivastava is a distinguished legal professional practicing before the Supreme Court.</p>
            </div>
        </div>
    </div>

    <!-- Team Member 3 -->
    <div class="team-member">
        <img src="${pageContext.request.contextPath}/assets/images/yusha-shrestha.png" alt="Yusha Shrestha">
        <div class="member-info">
            <h2 class="member-name">Yusha Shrestha</h2>
            <p class="member-title">LEGAL ASSOCIATE</p>
            <div class="member-contact">
                <p>Contact NO.: +977 9765432181</p>
                <p>Email: yusha@lawfirm.com</p>
            </div>
            <div class="member-bio">
                <p>Yusha is a Junior Associate at the firm and is engaged in litigation.</p>
            </div>
        </div>
    </div>

    <!-- Team Member 4 -->
    <div class="team-member">
        <img src="${pageContext.request.contextPath}/assets/images/manish-khanal.png" alt="Manish Khanal">
        <div class="member-info">
            <h2 class="member-name">MANISH KHANAL</h2>
            <p class="member-title">LEGAL ASSOCIATE</p>
            <div class="member-contact">
                <p>Contact no.: +977 9812395010</p>
                <p>Email: manish@lawfirm.com</p>
            </div>
            <div class="member-bio">
                <p>Manish is a Legal Associate at the firm and is engaged in civil law.</p>
            </div>
        </div>
    </div>

    <!-- Team Member 5 -->
    <div class="team-member">
        <img src="${pageContext.request.contextPath}/assets/images/anish-basnet.png" alt="Anish Basnet">
        <div class="member-info">
            <h2 class="member-name">ANISH BASNET</h2>
            <p class="member-title">LEGAL ASSOCIATE</p>
            <div class="member-contact">
                <p>Contact NO.: +977 9765520041</p>
                <p>Email: anish@lawfirm.com</p>
            </div>
            <div class="member-bio">
                <p>Anish is a Legal Associate at the firm and is engaged in the litigation.</p>
            </div>
        </div>
    </div>

    <!-- Team Member 6 -->
    <div class="team-member">
        <img src="${pageContext.request.contextPath}/assets/images/susasa-acharaya.png" alt="Susasa Acharya">
        <div class="member-info">
            <h2 class="member-name">SUSASA ACHARYA</h2>
            <p class="member-title">LEGAL ASSOCIATE</p>
            <div class="member-contact">
                <p>Contact NO.: +977 9765520041</p>
                <p>Email: susasa@lawfirm.com</p>
            </div>
            <div class="member-bio">
                <p>Susasa is a Junior Associate at the firm and is engaged in corporate law.</p>
            </div>
        </div>
    </div>
</div>

<jsp:include page="includes/footer.jsp" />

</body>
</html>