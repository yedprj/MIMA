<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link href="assets/css/style.css" rel="stylesheet">
<link href="assets/css/responsive.css" rel="stylesheet">

</head>


<!-- page wrapper -->
<body>

	<!-- pricing-section -->
	<section class="pricing-section bg-color-3 sec-pad">
		<div class="auto-container">
			<div class="sec-title centred">
				<h2>관리자 페이지</h2>
			</div>
			<div class="tabs-box">
				<div class="tabs-content">
					<div class="tab active-tab" id="tab-1">
						<div class="row clearfix">
							<div class="col-lg-4 col-md-6 col-sm-12 pricing-block">
								<div class="pricing-block-one">
									<div class="pricing-table">
										<div class="pattern">
											<div class="pattern-1"
												style="background-image: url(assets/images/shape/shape-75.png);"></div>
											<div class="pattern-2"
												style="background-image: url(assets/images/shape/shape-76.png);"></div>
										</div>
										<div class="table-header">
											<h2>회원정보조회</h2>
										</div>
										<div class="table-content">
											<img alt="" src="${pageContext.request.contextPath }/resources/assets/images/profilee.jpg" width="80px" height="80px">
										</div>
										<div class="table-footer">
											<div class="link">
												<a href="pricing.html"><i class="icon-Arrow-Right"></i></a>
											</div>
											<div class="btn-box">
												<a href="../patients/list" class="theme-btn-one">GO<i
													class="icon-Arrow-Right"></i></a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-6 col-sm-12 pricing-block">
								<div class="pricing-block-one">
									<div class="pricing-table active">
										<div class="pattern">
											<div class="pattern-1"
												style="background-image: url(assets/images/shape/shape-75.png);"></div>
											<div class="pattern-2"
												style="background-image: url(assets/images/shape/shape-76.png);"></div>
											<div class="pattern-3"
												style="background-image: url(assets/images/shape/shape-77.png);"></div>
										</div>
										<div class="table-header">
											<h2>의사/약국 승인 조회</h2>
										</div>
										<div class="table-content">
											<img alt="" src="${pageContext.request.contextPath }/resources/assets/images/logo.png" width="300px" height="300px">
										</div>
										<div class="table-footer">
											<div class="link">
												<a href="pricing.html"><i class="icon-Arrow-Right"></i></a>
											</div>
											<div class="btn-box">
												<a href="patnerStatusSelect" class="theme-btn-one">GO<i
													class="icon-Arrow-Right"></i></a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-6 col-sm-12 pricing-block">
								<div class="pricing-block-one">
									<div class="pricing-table">
										<div class="pattern">
											<div class="pattern-1"
												style="background-image: url(assets/images/shape/shape-75.png);"></div>
											<div class="pattern-2"
												style="background-image: url(assets/images/shape/shape-76.png);"></div>
										</div>
										<div class="table-header">
											<h2>신고글 조회</h2>
										</div>
										<div class="table-content">
											<img alt="" src="${pageContext.request.contextPath }/resources/assets/images/report.jpg" width="70px" height="70px">
										</div>
										<div class="table-footer">
											<div class="link">
												<a href="pricing.html"><i class="icon-Arrow-Right"></i></a>
											</div>
											<div class="btn-box">
												<a href="pricing.html" class="theme-btn-one">GO<i
													class="icon-Arrow-Right"></i></a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="tab" id="tab-2">
						<div class="row clearfix">
							<div class="col-lg-4 col-md-6 col-sm-12 pricing-block">
								<div class="pricing-block-one">
									<div class="pricing-table">
										<div class="pattern">
											<div class="pattern-1"
												style="background-image: url(assets/images/shape/shape-75.png);"></div>
											<div class="pattern-2"
												style="background-image: url(assets/images/shape/shape-76.png);"></div>
										</div>
										<div class="table-header">
											<h2>Basic Pack</h2>
											<h3>$50 USD</h3>
										</div>
										<div class="table-content">
											<ul class="list clearfix">
												<li>1 Bathroom Cleaning</li>
												<li>Up to 3 Bedrooms Cleaning</li>
												<li class="light">1 Livingroom Cleaning</li>
												<li class="light">Kitchen Cleaning</li>
											</ul>
										</div>
										<div class="table-footer">
											<div class="link">
												<a href="pricing.html"><i class="icon-Arrow-Right"></i></a>
											</div>
											<div class="btn-box">
												<a href="pricing.html" class="theme-btn-one">Buy Package<i
													class="icon-Arrow-Right"></i></a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-6 col-sm-12 pricing-block">
								<div class="pricing-block-one">
									<div class="pricing-table active">
										<div class="pattern">
											<div class="pattern-1"
												style="background-image: url(assets/images/shape/shape-75.png);"></div>
											<div class="pattern-2"
												style="background-image: url(assets/images/shape/shape-76.png);"></div>
											<div class="pattern-3"
												style="background-image: url(assets/images/shape/shape-77.png);"></div>
										</div>
										<div class="table-header">
											<h2>Popular Pack</h2>
											<h3>$60 USD</h3>
										</div>
										<div class="table-content">
											<ul class="list clearfix">
												<li>1 Bathroom Cleaning</li>
												<li>Up to 3 Bedrooms Cleaning</li>
												<li>1 Livingroom Cleaning</li>
												<li class="light">Kitchen Cleaning</li>
											</ul>
										</div>
										<div class="table-footer">
											<div class="link">
												<a href="pricing.html"><i class="icon-Arrow-Right"></i></a>
											</div>
											<div class="btn-box">
												<a href="pricing.html" class="theme-btn-one">Buy Package<i
													class="icon-Arrow-Right"></i></a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-6 col-sm-12 pricing-block">
								<div class="pricing-block-one">
									<div class="pricing-table">
										<div class="pattern">
											<div class="pattern-1"
												style="background-image: url(assets/images/shape/shape-75.png);"></div>
											<div class="pattern-2"
												style="background-image: url(assets/images/shape/shape-76.png);"></div>
										</div>
										<div class="table-header">
											<h2>Premium Pack</h2>
											<h3>$70 USD</h3>
										</div>
										<div class="table-content">
											<ul class="list clearfix">
												<li>1 Bathroom Cleaning</li>
												<li>Up to 3 Bedrooms Cleaning</li>
												<li>1 Livingroom Cleaning</li>
												<li>Kitchen Cleaning</li>
											</ul>
										</div>
										<div class="table-footer">
											<div class="link">
												<a href="pricing.html"><i class="icon-Arrow-Right"></i></a>
											</div>
											<div class="btn-box">
												<a href="pricing.html" class="theme-btn-one">Buy Package<i
													class="icon-Arrow-Right"></i></a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- pricing-section end -->




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

	<!-- main-js -->
	<script src="assets/js/script.js"></script>

</body>
<!-- End of .page_wrapper -->
</html>
