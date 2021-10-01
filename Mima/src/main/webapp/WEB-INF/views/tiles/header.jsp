<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- preloader -->
<div class="preloader"></div>
<!-- preloader -->


<!-- main header -->
<header class="main-header style-two">
	<!-- header-lower -->
	<div class="header-lower">
		<div class="auto-container">
			<div class="outer-box">
				<div class="logo-box">
					<figure class="logo">
						<a href="index.html"><img src="${pageContext.request.contextPath}/resources/assets/images/logo-3.png"
							alt=""></a>
					</figure>
				</div>
				<div class="menu-area">
					<!--Mobile Navigation Toggler-->
					<div class="mobile-nav-toggler">
						<i class="icon-bar"></i> <i class="icon-bar"></i> <i
							class="icon-bar"></i>
					</div>
					<nav class="main-menu navbar-expand-md navbar-light">
						<div class="collapse navbar-collapse show clearfix"
							id="navbarSupportedContent">
							<ul class="navigation clearfix">
							
								<!-- li 부분 더 필요하면 만들어서 사용하면 됨 -->
								<!-- 홈 nav 시작 -->
								<li class="current dropdown"><a href="index.html">홈</a>
									<ul>
										<li><a href="index.html">Home Page 01</a></li>
										<li><a href="index-2.html">Home Page 02</a></li>
										<li><a href="index-3.html">Home Page 03</a></li>
										<li><a href="index-4.html">Home Page 04</a></li>
										<li><a href="index-5.html">Home Page 05</a></li>
										<li><a href="index-onepage.html">OnePage Home</a></li>
										<li><a href="index-rtl.html">RTL Home</a></li>
										<li class="dropdown"><a href="index.html">Header Style</a>
											<ul>
												<li><a href="index.html">Header Style 01</a></li>
												<li><a href="index-2.html">Header Style 02</a></li>
												<li><a href="index-3.html">Header Style 03</a></li>
												<li><a href="index-5.html">Header Style 04</a></li>
											</ul>
										</li>
									</ul>
								</li>
								<!-- 홈 nav 끝 -->
								
								<!-- 진료예약 nav 시작 -->
								<li class="dropdown"><a href="${pageContext.request.contextPath}/reservationForm">진료예약</a>
									<ul>
										<li class="dropdown"><a href="doctors-dashboard.html">진료과목</a>
											<ul>
												<li><a href="doctors-dashboard.html">정신분석 / 정신치료</a></li>
												<li><a href="appointment.html">스트레스 / 트라우마 </a></li>
												<li><a href="my-patients.html">기분장애 / 공황 • 불안장애</a></li>
												<li><a href="add-listing.html">신경증 / 성격장애</a></li>
												<li><a href="schedule-timing.html">직장인 정신건강</a></li>
												<li><a href="review.html">중독장애</a></li>
												<li><a href="message.html">노인장애</a></li>
												<li><a href="my-profile.html">해리장애(다중인격)</a></li>
											</ul></li>
										<li><a href="doctors-1.html">빠른 진료상담</a></li>
										<li><a href="doctors-2.html">추천의사</a></li>
										<li><a href="doctors-3.html">의사검색</a></li>
									</ul>
								</li>
								<!-- 진료예약 nav 끝 -->
								
								<!-- 마음 챙김 nav 시작-->
								<li class="dropdown"><a href="${pageContext.request.contextPath}/meditation/meditationMain">마음챙김</a>
									<ul>
										<li class="dropdown"><a href="${pageContext.request.contextPath}/meditation/totalList"> 전체명상리스트</a>
										<li class="dropdown"><a href="${pageContext.request.contextPath}/meditation/meditationInsertForm"> 명상 등록</a>
										<li class="dropdown"><a href="patient-dashboard.html">Patient Dashboard</a>
											<ul>
												<li><a href="patient-dashboard.html">Dashboard</a></li>
												<li><a href="favourite-doctors.html">Favourite
														Doctors</a></li>
												<li><a href="schedule-timing-2.html">Scheduleddddd
														Timing</a></li>
												<li><a href="message-2.html">Messagesddddd</a></li>
												<li><a href="patient-profile.html">My Profile</a></li>
												<li><a href="change-password-2.html">Change
														Password</a></li>
												<li><a href="login-2.html">Logout</a></li>
											</ul>
										</li>
										<li><a href="submit.html">Submit Review</a></li>
										<li><a href="book-appointment.html">Book Appointment</a></li>
										<li><a href="register-page.html">Register Page</a></li>
									</ul>
								</li>
								<!-- 마음 챙김 nav 끝 -->
								
								<!-- 포스트 잇 nav 시작 -->
								<li class="dropdown"><a href="${pageContext.request.contextPath}/post/mindPostIt2">포스트 잇</a>
								</li>
								<!-- 포스트 잇 nav 끝 -->
								
								<!-- 문의 nav 시작 -->
								<li class="dropdown"><a href="index.html">문의</a>
									<div class="megamenu">
										<div class="row clearfix">
											<div class="col-lg-6 col-md-12 col-sm-12 column">
												<ul>
													<li><h4>Elements 1</h4></li>
													<li><a href="about-element-1.html">About Block 01</a></li>
													<li><a href="about-element-2.html">About Block 02</a></li>
													<li><a href="about-element-3.html">About Block 03</a></li>
													<li><a href="feature-element-1.html">Feature Block
															01</a></li>
													<li><a href="feature-element-2.html">Feature Block
															02</a></li>
													<li><a href="process-element-1.html">Process Block
															01</a></li>
													<li><a href="process-element-2.html">Process Block
															02</a></li>
													<li><a href="team-element-1.html">Team Block 01</a></li>
												</ul>
											</div>
											<div class="col-lg-6 col-md-12 col-sm-12 column">
												<ul>
													<li><h4>Elements 2</h4></li>
													<li><a href="team-element-2.html">Team Block 02</a></li>
													<li><a href="news-element-1.html">News Block 01</a></li>
													<li><a href="news-element-2.html">News Block 02</a></li>
													<li><a href="category-element-1.html">Category
															Block 01</a></li>
													<li><a href="category-element-2.html">Category
															Block 02</a></li>
													<li><a href="faq-element.html">Faq Block</a></li>
													<li><a href="cta-element.html">CTA Block</a></li>
													<li><a href="clients-element.html">Clients Block</a></li>
												</ul>
											</div>
										</div>
									</div>
								</li>
								<!-- 문의 nav 끝 -->
								
								<!-- 로그인 nav 시작 -->
								<li class="dropdown"><a href="${pageContext.request.contextPath}/login">로그인</a>
									<ul>
										<li><a href="${pageContext.request.contextPath}/login">로그인</a></li>
										<li><a href="${pageContext.request.contextPath}/joinForm">일반 회원가입</a></li>
										<li><a href="${pageContext.request.contextPath}/partnerJoinForm">파트너 회원가입</a></li>
										<li><a href="${pageContext.request.contextPath}/admin/adMain">관리자 페이지</a></li>
										<li><a href="${pageContext.request.contextPath}/docDash/docMain">닥터 대쉬보드</a></li>
										<li><a href="${pageContext.request.contextPath}/pharmacy/pharmacyDash?memberNo=11">약국 대쉬보드</a></li>
									</ul>
								</li>
							</ul>
						</div>
					</nav>
				</div>
				<!-- 로그인 로그아웃 p.30 -->
				<div class="btn-box">
					<sec:authorize access="isAnonymous()">
						<a href="${pageContext.request.contextPath}/login" class="theme-btn-one"><i
							class="icon-image"></i>Login Now</a>
					</sec:authorize>
					
					<sec:authorize access="isAuthenticated()">
						${session.name }님
						<form id="frm" name="frm" action="${pageContext.request.contextPath}/logout" method="post">
							<a href="#" id="logoutBtn" class="theme-btn-one mx-3"><i class="icon-image"></i>Logout</a>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}">
						</form>
					</sec:authorize>
				</div>
			</div>
		</div>
	</div>

	<!--sticky Header-->
	<div class="sticky-header">
		<div class="auto-container">
			<div class="outer-box">
				<div class="logo-box">
					<figure class="logo">
						<a href="index.html"><img src="${pageContext.request.contextPath}/resources/assets/images/small-logo.png"
							alt=""></a>
					</figure>
				</div>
				<div class="menu-area">
					<nav class="main-menu clearfix">
						<!--Keep This Empty / Menu will come through Javascript-->
					</nav>
				</div>
				<div class="btn-box">
					<a href="register-page.html" class="theme-btn-one"><i
						class="icon-image"></i>Join Now</a>
				</div>
			</div>
		</div>
	</div>
</header>
<!-- main-header end -->

<!-- Mobile Menu  -->
<div class="mobile-menu">
	<div class="menu-backdrop"></div>
	<div class="close-btn">
		<i class="fas fa-times"></i>
	</div>

	<nav class="menu-box">
		<div class="nav-logo">
			<a href="index.html"><img src="${pageContext.request.contextPath}/resources/assets/images/logo-2.png" alt=""
				title=""></a>
		</div>
		<div class="menu-outer">
			<!--Here Menu Will Come Automatically Via Javascript / Same Menu as in Header-->
		</div>
		<div class="contact-info">
			<h4>Contact Info</h4>
			<ul>
				<li>Chicago 12, Melborne City, USA</li>
				<li><a href="tel:+8801682648101">+88 01682648101</a></li>
				<li><a href="mailto:info@example.com">info@example.com</a></li>
			</ul>
		</div>
		<div class="social-links">
			<ul class="clearfix">
				<li><a href="index.html"><span class="fab fa-twitter"></span></a></li>
				<li><a href="index.html"><span
						class="fab fa-facebook-square"></span></a></li>
				<li><a href="index.html"><span class="fab fa-pinterest-p"></span></a></li>
				<li><a href="index.html"><span class="fab fa-instagram"></span></a></li>
				<li><a href="index.html"><span class="fab fa-youtube"></span></a></li>
			</ul>
		</div>
	</nav>
</div>
<!-- End Mobile Menu -->
<script>
	$(function() {
		$("#logoutBtn").on("click", function(){
			frm.submit();
		});
	});
</script>