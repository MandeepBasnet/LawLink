<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="common/header.jsp">
    <jsp:param name="title" value="Contact Us" />
</jsp:include>
<jsp:include page="common/assets-include.jsp" />

<div class="contact-container">
    <div class="contact-header">
        <h1>Contact Us</h1>
        <p>Get in touch with us for any inquiries or assistance</p>
    </div>

    <div class="contact-content">
        <div class="contact-form">
            <h2>Send us a Message</h2>
            <form action="${pageContext.request.contextPath}/contact" method="POST">
                <div class="form-group">
                    <label for="name">Full Name</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>

                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>

                <div class="form-group">
                    <label for="subject">Subject</label>
                    <input type="text" class="form-control" id="subject" name="subject" required>
                </div>

                <div class="form-group">
                    <label for="message">Message</label>
                    <textarea class="form-control" id="message" name="message" required></textarea>
                </div>

                <button type="submit" class="btn btn-primary">Send Message</button>
            </form>
        </div>

        <div class="contact-info">
            <h2>Contact Information</h2>

            <div class="info-item">
                <i class="fas fa-map-marker-alt info-icon"></i>
                <div class="info-text">
                    <h4>Location</h4>
                    <p>123 Law Street, Legal District<br>City, State 12345</p>
                </div>
            </div>

            <div class="info-item">
                <i class="fas fa-phone info-icon"></i>
                <div class="info-text">
                    <h4>Phone</h4>
                    <p>+1 (555) 123-4567</p>
                </div>
            </div>

            <div class="info-item">
                <i class="fas fa-envelope info-icon"></i>
                <div class="info-text">
                    <h4>Email</h4>
                    <p>contact@lawlink.com</p>
                </div>
            </div>

            <div class="info-item">
                <i class="fas fa-clock info-icon"></i>
                <div class="info-text">
                    <h4>Business Hours</h4>
                    <p>Monday - Friday: 9:00 AM - 6:00 PM<br>
                        Saturday: 10:00 AM - 2:00 PM<br>
                        Sunday: Closed</p>
                </div>
            </div>

            <div class="map-container">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3022.1!2d-73.9!3d40.7!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zM40zMCcwMC4wIk4gNzPCsDU0JzAwLjAiVw!5e0!3m2!1sen!2sus!4v1234567890" allowfullscreen="" loading="lazy"></iframe>
            </div>
        </div>
    </div>
</div>

<style>
    .contact-container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 40px 20px;
    }

    .contact-header {
        text-align: center;
        margin-bottom: 50px;
    }

    .contact-header h1 {
        font-size: 2.5rem;
        color: var(--primary-color);
        margin-bottom: 15px;
    }

    .contact-content {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        gap: 40px;
        margin-top: 30px;
    }

    .contact-form {
        background: #fff;
        padding: 40px;
        border-radius: 10px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    }

    .contact-form h2 {
        color: var(--primary-color);
        margin-bottom: 30px;
    }

    .contact-info {
        background: var(--primary-color);
        padding: 40px;
        border-radius: 10px;
        color: #fff;
    }

    .contact-info h2 {
        color: #fff;
        margin-bottom: 30px;
    }

    .info-item {
        display: flex;
        align-items: flex-start;
        margin-bottom: 30px;
    }

    .info-icon {
        font-size: 1.5rem;
        margin-right: 15px;
        margin-top: 5px;
    }

    .info-text h4 {
        margin: 0 0 8px;
        font-size: 1.2rem;
    }

    .info-text p {
        margin: 0;
        line-height: 1.6;
    }

    .map-container {
        margin-top: 30px;
        border-radius: 10px;
        overflow: hidden;
    }

    .map-container iframe {
        width: 100%;
        height: 250px;
        border: none;
    }

    @media (max-width: 768px) {
        .contact-content {
            grid-template-columns: 1fr;
        }
    }
</style>

<jsp:include page="common/footer.jsp" />
