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
				<h1>환자 대쉬보드</h1>
			</div>
		</div>
	</div>
	<div class="lower-content">
		<ul class="bread-crumb clearfix">
			<li><a href="${pageContext.request.contextPath}">Home</a></li>
			<li>환자 대쉬보드</li>
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
					<li><a href="ptMain" class="current"><i class="fas fa-columns"></i>대쉬보드</a></li>
					<li><a href="ptBookManage"><i class="fas fa-calendar-alt"></i>나의 예약관리</a></li>
					<li><a href="ptHistory"><i class="fas fa-calendar-alt"></i>나의 진료내역</a></li>
					<li><a href="ptDoctor"><i class="fas fa-wheelchair"></i>내가 찜한 의사</a></li>
					<li><a href="ptReview"><i class="fas fa-star"></i>나의 후기</a></li>
					<li><a href="ptMedelivery"><i class="fas fa-ambulance"></i>약 배달관리</a></li>
					<li><a href="ptProfileDetail"><i class="fas fa-user"></i>프로필 관리</a></li>
					<li><a href="ptPwChangeForm"><i class="fas fa-unlock-alt"></i>비밀번호 변경</a></li>
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
									<h3>3</h3>
									<p>나의 예약 수</p>
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
									<h3>11</h3>
									<p>진료 내역 수</p>
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
									<h3>12</h3>
									<p>나의 후기 수</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="doctors-appointment">
					<div class="title-box">
						<h3>오늘의 예약</h3>
						<div class="btn-box">
							<a href="ptBookManage" class="theme-btn-one">예약관리<i
								class="icon-Arrow-Right"></i></a>
						</div>
					</div>
					<div class="doctors-list">
						<div class="table-outer">
							<table class="doctors-table">
								<thead class="table-header">
									<tr>
										<th>환자명</th>
										<th>진료일</th>
										<th>예약일</th>
										<th>결제금액</th>
										<th>결제상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="list">
										<tr>
											<td>
												<div class="name-box">
													<figure class="image">
														<img
															src="${pageContext.request.contextPath}/resources/assets/images/resource/dashboard-doc-1.png"
															alt="">
													</figure>
													<h5>${list.name}</h5>
												</div>
											</td>
											<td>${list.bookingNo}</td>
											<td><fmt:formatDate value="${list.consultDate}"
													pattern="yy-MM-dd" /> <span class="time">${list.consultTime}</span>
											</td>
											<td><fmt:formatDate value="${list.bookingDate}"
													pattern="yy-MM-dd" /></td>
											<td><fmt:setLocale value="ko_KR" /> <fmt:formatNumber
													type="currency" value="${list.price}" /></td>
											<td>${list.payStatus}</td>
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
							<a href="ptHistory" class="theme-btn-one">전체보기<i
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
									<c:forEach items="${ptMainhisList}" var="ptMainhisList">
										<tr>
											<td>
												<div class="name-box">
													<figure class="image">
														<img
															src="${pageContext.request.contextPath}/resources/assets/images/resource/dashboard-doc-1.png"
															alt="">
													</figure>
													<h5>${ptMainhisList.name}</h5>
													<span class="ptno">#${ptMainhisList.ptNo}</span>
												</div>
											</td>
											<td>${ptMainhisList.bookingNo}</td>
											<td><fmt:formatDate
													value="${ptMainhisList.consultDate}" pattern="yy-MM-dd" />
												<span class="time">${ptMainhisList.consultTime}</span></td>
											<td><fmt:formatDate
													value="${ptMainhisList.bookingDate}" pattern="yy-MM-dd" /></td>
											<td><fmt:setLocale value="ko_KR" /> <fmt:formatNumber
													type="currency" value="${ptMainhisList.price}" /></td>
											<td>${ptMainhisList.payStatus}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				
				<!-- K. 10/ 17 배송현황 -->
				<br>
				<div class="doctors-appointment">
					<div class="title-box">
						<h3>배송현황</h3>
						<div class="btn-box">
							<a href="ptHistory" class="theme-btn-one">자세히 보기<i
								class="icon-Arrow-Right"></i></a>
						</div>
					</div>
					<div class="doctors-list">
						<div class="table-outer">
							<table class="doctors-table">
								<thead class="table-header">
									<tr>
										<th>진료일</th>
										<th>진료과목</th>
										<th>진료의사</th>
										<th>신청약국</th>
										<th>약배달 배송현황</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="del" items="${ptDeliveryStatusList}">
										<tr style="height:80px;">
											<td><p><fmt:formatDate value="${del.consultDate}" type="both" pattern="YY-MM-dd" /></p></td>
											<td><p>${del.subject}</p></td>
											<td><p><b>Dr.</b> ${del.docName}<p></td>
											<td><p>${del.pharmacyName}</p></td>
											<td>
												<c:if test="${del.deliveryStatus eq 'p'}">
													<span class="status">배달완료</span>
												</c:if>
												<c:if test="${del.deliveryStatus eq 'y'}">
													<span class="status pending">수령완료</span>
												</c:if>
												<c:if test="${del.deliveryStatus eq 'c'}">
													<span class="status cancel">신청취소</span>
												</c:if>
												<c:if test="${del.deliveryStatus eq 'n'}">
													<span class="status pending">배송시작</span>
												</c:if>
											</td>
											<td></td>
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
							<a href="ptReview" class="theme-btn-one">전체보기<i
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
									<c:forEach items="${ptMainreList}"
										var="ptMainreList">
										<tr>
											<td>
												<div class="name-box">
													<figure class="image">
														<img
															src="${pageContext.request.contextPath}/resources/assets/images/resource/dashboard-doc-1.png"
															alt="">
													</figure>
													<h5>${ptMainreList.nickname}</h5>
												</div>
											</td>
											<td><c:forEach var="i" begin="1"
													end="${ptMainreList.reviewPoint}">
													<span style="color: #ffab01;"><i class="icon-Star"></i></span>
												</c:forEach> <c:forEach var="i" begin="1"
													end="${5-ptMainreList.reviewPoint}">
													<i class="icon-Star"></i>
												</c:forEach></td>
											<td><fmt:formatDate
													value="${ptMainreList.regDate}" pattern="yy-MM-dd" /></td>
											<td>${ptMainreList.contents}</td>
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
