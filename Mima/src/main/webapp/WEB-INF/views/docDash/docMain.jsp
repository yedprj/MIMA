<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
th, td {
	text-align: center;
}
</style>

<!-- doctors-dashboard -->
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
				<h1>닥터 대쉬보드</h1>
			</div>
		</div>
	</div>
	<div class="lower-content">
		<ul class="bread-crumb clearfix">
			<li><a href="${pageContext.request.contextPath}">Home</a></li>
			<li>닥터 대쉬보드</li>
		</ul>
	</div>
</section>
<!--page-title-two end-->

<section class="doctors-dashboard bg-color-3">

	<div class="left-panel">
		<div class="profile-box">
			<div class="upper-box">
				<figure class="profile-image">
					<img
						src="${pageContext.request.contextPath}/resources/assets/images/resource/profile-2.png"
						alt="">
				</figure>
				<div class="title-box centred">
					<div class="inner">
						<h3>Dr. Rex Allen</h3>
						<p>MDS - Periodontology</p>
					</div>
				</div>
			</div>
			<div class="profile-info">
				<ul class="list clearfix">
					<li><a href="docMain" class="current"><i
							class="fas fa-columns"></i>대쉬보드</a></li>
					<li><a href="apptManage"><i class="fas fa-clock"></i>예약관리</a></li>
					<li><a href="apptHistory"><i class="fas fa-calendar-alt"></i>진료내역</a></li>
					<li><a href="patientList"><i class="fas fa-wheelchair"></i>나의 환자들</a></li>
					<li><a href="docReview"><i class="fas fa-star"></i>나의 후기</a></li>
					<li><a href="docQna"><i class="fas fa-comments"></i>나의 문의</a></li>
					<li><a href="docProfile"><i class="fas fa-user"></i>프로필 관리</a></li>
					<li><a href="change-password.html"><i class="fas fa-unlock-alt"></i>비밀번호 변경</a></li>
					<li><a href="login.html"><i class="fas fa-sign-out-alt"></i>로그아웃</a></li>
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
										<i class="icon-Dashboard-3"></i>
									</div>
									<h3>9</h3>
									<p>오늘의 환자 수</p>
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
										<i class="icon-Dashboard-1"></i>
									</div>
									<h3>121</h3>
									<p>담당 환자 수</p>
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
										<i class="icon-Dashboard-2"></i>
									</div>
									<h3>212</h3>
									<p>나의 리뷰 수</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="doctors-appointment">
					<div class="title-box">
						<h3>오늘의 예약</h3>
						<div class="btn-box">
							<a href="apptManage" class="theme-btn-one">예약관리<i
								class="icon-Arrow-Right"></i></a>
						</div>
					</div>
					<div class="doctors-list">
						<div class="table-outer">
							<table class="doctors-table">
								<thead class="table-header">
									<tr>
										<th>환자명</th>
										<th>예약번호</th>
										<th>진료일</th>
										<th>예약일</th>
										<th>결제금액</th>
										<th>결제상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${bookingList}" var="bookingList">
										<tr>
											<td>
												<div class="name-box">
													<figure class="image">
														<img
															src="${pageContext.request.contextPath}/resources/assets/images/resource/dashboard-doc-1.png"
															alt="">
													</figure>
													<h5>${bookingList.name}</h5>
													<span class="ptno">#${bookingList.ptNo}</span>
												</div>
											</td>
											<td>${bookingList.bookingNo}</td>
											<td><fmt:formatDate value="${bookingList.consultDate}"
													pattern="yy-MM-dd" /> <span class="time">${bookingList.consultTime}</span>
											</td>
											<td><fmt:formatDate value="${bookingList.bookingDate}"
													pattern="yy-MM-dd" /></td>
											<td><fmt:setLocale value="ko_KR" /> <fmt:formatNumber
													type="currency" value="${bookingList.price}" /></td>
											<td>${bookingList.payStatus}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<br>

				<div class="doctors-appointment">
					<div class="title-box">
						<h3>진료내역</h3>
						<div class="btn-box">
							<a href="apptHistory" class="theme-btn-one">전체보기<i
								class="icon-Arrow-Right"></i></a>
						</div>
					</div>
					<div class="doctors-list">
						<div class="table-outer">
							<table class="doctors-table">
								<thead class="table-header">
									<tr>
										<th>환자명</th>
										<th>예약번호</th>
										<th>진료일</th>
										<th>예약일</th>
										<th>결제금액</th>
										<th>결제상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${getlatestapptList}" var="getlatestapptList">
										<tr>
											<td>
												<div class="name-box">
													<figure class="image">
														<img
															src="${pageContext.request.contextPath}/resources/assets/images/resource/dashboard-doc-1.png"
															alt="">
													</figure>
													<h5>${getlatestapptList.name}</h5>
													<span class="ptno">#${getlatestapptList.ptNo}</span>
												</div>
											</td>
											<td>${getlatestapptList.bookingNo}</td>
											<td><fmt:formatDate
													value="${getlatestapptList.consultDate}" pattern="yy-MM-dd" />
												<span class="time">${getlatestapptList.consultTime}</span></td>
											<td><fmt:formatDate
													value="${getlatestapptList.bookingDate}" pattern="yy-MM-dd" /></td>
											<td><fmt:setLocale value="ko_KR" /> <fmt:formatNumber
													type="currency" value="${getlatestapptList.price}" /></td>
											<td>${getlatestapptList.payStatus}</td>
											<td><span class="print"><i class="fas fa-print"></i>처방전</span>
											</td>
											<td><span class="view"><i class="fas fa-eye"></i>진료노트</span>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<br>

				<div class="doctors-appointment">
					<div class="title-box">
						<h3>나의 후기</h3>
						<div class="btn-box">
							<a href="patient-dashboard.html" class="theme-btn-one">전체보기<i
								class="icon-Arrow-Right"></i></a>
						</div>
					</div>
					<div class="doctors-list">
						<div class="table-outer">
							<table class="doctors-table">
								<thead class="table-header">
									<tr>
										<th>닉네임</th>
										<th>별점</th>
										<th>날짜</th>
										<th>내용</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${getlatestreviewList}"
										var="getlatestreviewList">
										<tr>
											<td>
												<div class="name-box">
													<figure class="image">
														<img
															src="${pageContext.request.contextPath}/resources/assets/images/resource/dashboard-doc-1.png"
															alt="">
													</figure>
													<h5>${getlatestreviewList.nickname}</h5>
												</div>
											</td>
											<td><c:forEach var="i" begin="1"
													end="${getlatestreviewList.reviewPoint}">
													<span style="color: #ffab01;"><i class="icon-Star"></i></span>
												</c:forEach> <c:forEach var="i" begin="1"
													end="${5-getlatestreviewList.reviewPoint}">
													<i class="icon-Star"></i>
												</c:forEach></td>
											<td><fmt:formatDate
													value="${getlatestreviewList.regDate}" pattern="yy-MM-dd" /></td>
											<td>${getlatestreviewList.contents}</td>
										</tr>
									</c:forEach>
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

<!--Scroll to top-->
<button class="scroll-top scroll-to-target" data-target="html">
	<span class="fa fa-arrow-up"></span>
</button>
