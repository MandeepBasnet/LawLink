<footer class="footer">
    <div class="container">
        <div class="footer-content">
            <div class="footer-section">
                <h3>LawLink</h3>
                <p>Connecting clients with trusted lawyers for all their legal needs.</p>
            </div>
            <div class="footer-section">
                <h3>Quick Links</h3>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/lawyers">Lawyers</a></li>
                    <li><a href="${pageContext.request.contextPath}/about">About</a></li>
                    <li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h3>Contact Us</h3>
                <p><i class="fas fa-map-marker-alt"></i> 123 Legal Street, City, Country</p>
                <p><i class="fas fa-phone"></i> +1 234 567 8900</p>
                <p><i class="fas fa-envelope"></i> info@lawlink.com</p>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; <%= java.time.Year.now().getValue() %> LawLink. All rights reserved.</p>
        </div>
    </div>
</footer>

<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
</body>
</html>
