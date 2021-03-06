<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">

<title>Docpro - HTML 5 Template Preview</title>
<!-- Fav Icon -->
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/assets/images/favicon.ico"
	type="image/x-icon">

<!-- Google Fonts -->
<link
	href="https:/fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
<link
	href="https:/fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
	
<!-- Stylesheets -->
<link
	href="${pageContext.request.contextPath}/resources/assets/css/font-awesome-all.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/assets/css/flaticon.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/assets/css/owl.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/assets/css/jquery.fancybox.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/assets/css/animate.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/assets/css/color.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/assets/css/style.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/assets/css/responsive.css"
	rel="stylesheet">
	
<link href="${pageContext.request.contextPath}/resources/assets/css/nice-select.css" rel="stylesheet">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>	
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>


<!-- page wrapper -->
<body>
		
	<div class="boxed_wrapper">
		<div>
			<tiles:insertAttribute name="content"/>
		</div>
	</div>



	<!-- jequery plugins -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/owl.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/wow.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/validation.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.fancybox.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/appear.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/scrollbar.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/tilt.jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.paroller.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.nice-select.min.js"></script>
	

	<!-- main-js -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/script.js"></script>

</body>
<!-- End of .page_wrapper -->
</html>