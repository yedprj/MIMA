<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">


<!-- Fav Icon -->
<link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">

<!-- Stylesheets -->
<link href="assets/css/font-awesome-all.css" rel="stylesheet">
<link href="assets/css/flaticon.css" rel="stylesheet">
<link href="assets/css/owl.css" rel="stylesheet">
<link href="assets/css/bootstrap.css" rel="stylesheet">
<link href="assets/css/jquery.fancybox.min.css" rel="stylesheet">
<link href="assets/css/animate.css" rel="stylesheet">
<link href="assets/css/color.css" rel="stylesheet">
<link href="assets/css/nice-select.css" rel="stylesheet">
<link href="assets/css/style.css" rel="stylesheet">
<link href="assets/css/responsive.css" rel="stylesheet">

</head>


<!-- page wrapper -->
<body>

	<div class="boxed_wrapper">

		<!-- doctors-dashboard -->
		<section class="doctors-dashboard bg-color-3">
			<div class="left-panel"></div>
			<div>
				<div class="content-container">
					<div class="outer-container">
						<div class="doctors-appointment my-patients">
							<div class="title-box clearfix">
								<div class="text pull-left">
									<h3>회원정보조회</h3>
								</div>
								<div class="btn-box pull-right">
									<form action="my-patients.html" method="post"
										class="search-form">
										<div class="form-group">
											<input type="search" name="search-field" placeholder="Search"
												required="">
											<button type="submit">
												<i class="far fa-search"></i>
											</button>
										</div>
									</form>
								</div>
							</div>
							<div class="doctors-list">
								<div class="table-outer">
									<table class="table table-hover">
										<thead class="table-header">
											<tr align="center">
												<th>NO</th>
												<th>과거진료기록</th>
												<th>자가진단표</th>
												<th>진료분야</th>
												<th>약배달</th>
												<th>등록일</th>
												<th>수정일</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${list}" var="patients">
												<tr onclick="location.href='get?memberNo=${patients.memberNo}'"
												align="center">
													<td>${patients.memberNo }</td>
													<td>${patients.pastHx }</td>
													<td>${patients.preSelfAx }</td>
													<td>${patients.topic }</td>
													<td>${patients.medDelivery }</td>
													<td><fmt:formatDate value="${patients.regDate }"
															pattern="yy-MM-dd" /></td>
													<td><fmt:formatDate value="${patients.editDate }"
															pattern="yy-MM-dd" /></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="pagination-wrapper" align="center">
							<ul class="pagination">
								<li><a href="clinic-1.html" class="current">1</a></li>
								<li><a href="clinic-1.html">2</a></li>
								<li><a href="clinic-1.html">3</a></li>
								<li><a href="clinic-1.html"><i class="icon-Arrow-Right"></i></a></li>
							</ul>
						</div>
						<br> <br>
						<div align="center">
							<button type="button" class="btn btn-light" style="background-color: #39CABB;" 
								onclick="location.href='../admin/adMain'">목록</button>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- doctors-dashboard -->





		<!--Scroll to top-->
		<button class="scroll-top scroll-to-target" data-target="html">
			<span class="fa fa-arrow-up"></span>
		</button>
	</div>


	<!-- jequery plugins -->
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/popper.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/owl.js"></script>
	<script src="assets/js/wow.js"></script>
	<script src="assets/js/validation.js"></script>
	<script src="assets/js/jquery.fancybox.js"></script>
	<script src="assets/js/appear.js"></script>
	<script src="assets/js/scrollbar.js"></script>
	<script src="assets/js/tilt.jquery.js"></script>
	<script src="assets/js/jquery.paroller.min.js"></script>
	<script src="assets/js/jquery.nice-select.min.js"></script>
	<script src="assets/js/product-filter.js"></script>

	<!-- map script -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA-CE0deH3Jhj6GN4YvdCFZS7DpbXexzGU"></script>
	<script src="assets/js/gmaps.js"></script>
	<script src="assets/js/map-helper.js"></script>

	<!-- main-js -->
	<script src="assets/js/script.js"></script>

</body>
<!-- End of .page_wrapper -->
</html>
