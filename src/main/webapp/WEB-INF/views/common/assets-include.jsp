<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Meta tag to store context path for JavaScript -->
<meta name="contextPath" content="${pageContext.request.contextPath}">

<!-- Include assets.js -->
<script src="${pageContext.request.contextPath}/assets/js/assets.js"></script>

<!-- Include Font Awesome for icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!-- Helper function to use assets in JSP -->
<script>
    function getAsset(name) {
        return window.assets[name];
    }

    function getPracticeAreaImage(practiceName) {
        const area = window.practiceData.find(area => area.practice === practiceName);
        return area ? area.image : '';
    }

    function getLawyerById(id) {
        return window.lawyers.find(lawyer => lawyer._id === id);
    }
</script>

