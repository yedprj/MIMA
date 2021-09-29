<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="include/dashHeader.jsp"></jsp:include>

<!-- doctors-dashboard -->
<section class="doctors-dashboard bg-color-3">
	<!-- 왼쪽사이드 메뉴바 연결 -->
	<jsp:include page="include/sideDash.jsp"></jsp:include>
		
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