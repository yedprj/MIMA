<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--page-title-two-->
<section class="page-title-two">
	<div class="title-box centred bg-color-2">
		<div class="pattern-layer">
			<div class="pattern-1"
				style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-70.png);"></div>
			<div class="pattern-2"
				style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-71.png);"></div>
		</div>
		<div class="auto-container">
			<div class="title">
				<h1>약국 대쉬보드</h1>
			</div>
		</div>
	</div>
	<div class="lower-content">
		<ul class="bread-crumb clearfix">
			<li><a href="${pageContext.request.contextPath}">Home</a></li>
			<li>약국 대쉬보드</li>
		</ul>
	</div>
</section>
<!--page-title-two end-->

<!-- doctors-dashboard -->
<section class="doctors-dashboard bg-color-3">
	<!-- 왼쪽사이드 메뉴바 연결 -->
	<div class="left-panel">
		<div class="profile-box">
			<div class="upper-box">
				<figure class="profile-image">
					<img src="${pageContext.request.contextPath}/resources/assets/images/resource/profile-2.png" alt="">
				</figure>
				<div class="title-box centred">
					<div class="inner">
						<h3>${profile.pharmacyInfo}</h3>
						<p>Qualitative Pharmacy</p>
					</div>
				</div>
			</div>
			<div class="profile-info">
				<ul class="list clearfix">
					<li><a id="dash" href="${pageContext.request.contextPath}/pharmacy/pharmacyDash" class="current"><i
							class="fas fa-columns"></i>대쉬보드</a></li>
					<li><a id="delivery" href="${pageContext.request.contextPath}/pharmacy/medDelivery"><i class="fas fa-ambulance"></i>약배달관리</a></li>
					<li><a id="guid" href="${pageContext.request.contextPath}/pharmacy/medGuid"><i class="fas fa-comment-medical"></i>복약지도관리</a></li>
					<li><a id="revicw" href="${pageContext.request.contextPath}/pharmacy/review"><i class="fas fa-star"></i>약국 후기</a></li>
					<li><a id="ques" href="${pageContext.request.contextPath}/pharmacy/phaQna"><i class="fas fa-comments"></i>문의</a><span>20</span></li>
					<li><a id="profile" href="${pageContext.request.contextPath}/pharmacy/myProfile"><i class="fas fa-user"></i>약국 프로필</a></li>
					<li><a id="pwUpdate" href="${pageContext.request.contextPath}/pharmacy/pwUpdate?memberNo=${session.memberNo}"><i
							class="fas fa-unlock-alt"></i>비밀번호 변경</a></li>
					<li><a id="logout" href="login.html"><i class="fas fa-sign-out-alt"></i>로그아웃</a></li>
				</ul>
			</div>
		</div>
	</div>

	<div class="right-panel">
		<div class="content-container">
			<div class="outer-container">
				<div class="feature-content">
					<div class="row clearfix">
						<div class="col-xl-4 col-lg-12 col-md-12 feature-block">
							<div class="feature-block-two">
								<div class="inner-box">
									<div class="pattern">
										<div class="pattern-1"
											style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-79.png);"></div>
										<div class="pattern-2"
											style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-80.png);"></div>
									</div>
									<div class="icon-box">
										<i class="icon-Dashboard-1"></i>
									</div>
									<h3>2375</h3>
									<p>오늘 약 배달 수</p>
								</div>
							</div>
						</div>
						<div class="col-xl-4 col-lg-12 col-md-12 feature-block">
							<div class="feature-block-two">
								<div class="inner-box">
									<div class="pattern">
										<div class="pattern-1"
											style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-81.png);"></div>
										<div class="pattern-2"
											style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-82.png);"></div>
									</div>
									<div class="icon-box">
										<i class="icon-Dashboard-2"></i>
									</div>
									<h3>320</h3>
									<p>오늘 복약지도수</p>
								</div>
							</div>
						</div>
						<div class="col-xl-4 col-lg-12 col-md-12 feature-block">
							<div class="feature-block-two">
								<div class="inner-box">
									<div class="pattern">
										<div class="pattern-1"
											style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-83.png);"></div>
										<div class="pattern-2"
											style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-84.png);"></div>
									</div>
									<div class="icon-box">
										<i class="icon-Dashboard-3"></i>
									</div>
									<h3>275</h3>
									<p>리뷰수</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="doctors-appointment">
					<div class="title-box">
						<h3>약 배달 관리</h3>
						<div class="btn-box">
							<a href="patient-dashboard.html" class="theme-btn-one">신청목록관리<i
								class="icon-Arrow-Right"></i></a> <a href="patient-dashboard.html"
								class="theme-btn-two">오늘 배달 목록</a>
						</div>
					</div>
					<div class="doctors-list">
						<div class="table-outer">
							<table class="doctors-table">
								<thead class="table-header">
									<tr>
										<th>신청자 성함</th>
										<th>예약 날짜</th>
										<th>배달 날짜</th>
										<th>처방전</th>
										<th>&nbsp;</th>
										<th>&nbsp;</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<div class="name-box">
												<figure class="image">
													<img src="${pageContext.request.contextPath}/resources/assets/images/resource/dashboard-doc-1.png" alt="">
												</figure>
												<h5>Amelia Anna</h5>
												<span class="designation">#LK1024T01</span>
											</div>
										</td>
										<td><p>20 Oct 2020</p> <span class="time">10:30AM</span></td>
										<td><p>General</p><td>
										<td><p>Old Patient</p></td>
										<td><span class="accept"><i class="fas fa-check"></i>Accept</span></td>
										<td><span class="cancel"><i class="fas fa-times"></i>Cancel</span></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- doctors-dashboard -->


<button class="scroll-top scroll-to-target" data-target="html">
    <span class="fa fa-arrow-up"></span>
</button>

