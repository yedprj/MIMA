<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>

<div class="boxed_wrapper">

	<!-- preloader -->
	<div class="preloader"></div>
	<!-- preloader -->

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
					<c:if test="${category1 eq '정신분석' }">
						<h1>정신분석 / 정신치료 전문의 리스트</h1>
					</c:if>
					<c:if test="${category1 eq '스트레스' }">
						<h1>스트레스 / 트라우마 전문의 리스트</h1>
					</c:if>
					<c:if test="${category1 eq '기분' }">
						<h1>기분 / 공황 / 불안장애 전문의 리스트</h1>
					</c:if>
					<c:if test="${category1 eq '신경증' }">
						<h1>신경증 / 성격장애 전문의 리스트</h1>
					</c:if>
					<c:if test="${category1 eq '직장인' }">
						<h1>직장인 정신건강 전문의 리스트</h1>
					</c:if>
					<c:if test="${category1 eq '중독' }">
						<h1>중독장애 전문의 리스트</h1>
					</c:if>
					<c:if test="${category1 eq '노인' }">
						<h1>노인장애 전문의 리스트</h1>
					</c:if>
					<c:if test="${category1 eq '해리' }">
						<h1>해리장애(다중인격) 전문의 리스트</h1>
					</c:if>	
				</div>
			</div>
		</div>
		<div class="lower-content">
			<div class="auto-container">
				<ul class="bread-crumb clearfix">
					<li><a href="${pageContext.request.contextPath}/">Home</a></li>
					<c:if test="${category1 eq '정신분석' }">
						<li>정신분석 / 정신치료 전문의 리스트</li>
					</c:if>
					<c:if test="${category1 eq '스트레스' }">
						<li>스트레스 / 트라우마 전문의 리스트</li>
					</c:if>
					<c:if test="${category1 eq '기분' }">
						<li>기분 / 공황 / 불안장애 전문의 리스트</li>
					</c:if>
					<c:if test="${category1 eq '신경증' }">
						<li>신경증 / 성격장애 전문의 리스트</li>
					</c:if>
					<c:if test="${category1 eq '직장인' }">
						<li>직장인 정신건강 전문의 리스트</li>
					</c:if>
					<c:if test="${category1 eq '중독' }">
						<li>중독장애 전문의 리스트</li>
					</c:if>
					<c:if test="${category1 eq '노인' }">
						<li>노인장애 전문의 리스트</li>
					</c:if>
					<c:if test="${category1 eq '해리' }">
						<li>해리장애(다중인격) 전문의 리스트</li>
					</c:if>	
				</ul>
			</div>
		</div>
	</section>
	<!--page-title-two end-->

	<!-- doctors-page-section -->
	<section class="clinic-section doctors-page-section">
		<div class="auto-container">
			<div class="row clearfix d-flex justify-content-center">
				<div class="col-lg-2 col-md-12 col-sm-12 content-side"></div>
				<div class="col-lg-8 col-md-12 col-sm-12 content-side">
					<!-- 아이템 정렬 바 시작 -->
					<div class="item-shorting clearfix">
						<div class="right-column pull-right clearfix">
							<div class="short-box clearfix">
								<div class="select-box">
									<select class="wide">
										<option data-display="Sort by">Sort by</option>
										<option value="스트레스">스트레스/트라우마</option>
										<option value="기분">기분장애/공황•불안장애</option>
										<option value="신경">신경증/성격장애</option>
										<option value="직장">직장인 정신건강</option>
										<option value="중독">중독장애</option>
										<option value="노인">노인장애</option>
										<option value="해리">해리장애(다중인격)</option>
									</select>
								</div>
							</div>
							<div class="menu-box">
								<button class="list-view on">
									<i class="icon-List"></i>
								</button>
								<button class="grid-view">
									<i class="icon-Grid"></i>
								</button>
							</div>
						</div>
					</div>
					<!-- 아이템 정렬 바 끝 -->

					<!-- 의사 리스트 랩퍼 시작 -->
					<div class="wrapper list">
						<!-- 의사 블록 컨텐츠 리스트 -->
						<div class="clinic-list-content list-item">

							<c:forEach var="item" items="${list }">
								<div class="clinic-block-one">
									<div class="inner-box">
										<div class="pattern">
											<div class="pattern-1"
												style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-24.png);"></div>
											<div class="pattern-2"
												style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-25.png);"></div>
										</div>
										<figure class="image-box">
											<img
												src="${pageContext.request.contextPath}/resources/assets/images/team/team-1.jpg"
												alt="">
										</figure>
										<div class="content-box">
											<div class="like-box">
												<a href="${item.memberNo }"><i class="far fa-heart"></i></a>
											</div>
											<ul class="name-box clearfix">
												<li class="name">
													<h3>
														<a class="move" href="${item.memberNo }">Dr.${item.name }
															num ${item.memberNo }</a>
													</h3>
												</li>
												<li><i class="icon-Trust-1"></i></li>
												<li><i class="icon-Trust-2"></i></li>
											</ul>
											<span class="designation">${item.profileEducation }</span>
											<div class="text">
												<p>${item.profileContents }</p>
											</div>
											<div class="rating-box clearfix">
												<ul class="rating clearfix">
													<li><i class="icon-Star"></i></li>
													<li><i class="icon-Star"></i></li>
													<li><i class="icon-Star"></i></li>
													<li><i class="icon-Star"></i></li>
													<li><i class="icon-Star"></i></li>
													<li><a href="doctors-details.html">(${item.commentsCnt })</a></li>
												</ul>
												<div class="link">
													<a href="doctors-details.html">24/7 Available</a>
												</div>
											</div>
											<div class="location-box">
												<p>
													<i class="fas fa-map-marker-alt"></i>${item.addr1 }</p>
											</div>
											<div class="btn-box">
												<a href="${item.memberNo }" class="move">Visit Now</a>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<!-- 의사 블록 컨텐츠 끝 -->

						<!-- 의사 그리드 컨텐츠 -->
						<div class="clinic-grid-content">
							<div class="row clearfix">
								<c:forEach var="item" items="${list }">
									<div class="col-lg-6 col-md-6 col-sm-12 team-block">
										<div class="team-block-three">
											<div class="inner-box">
												<figure class="image-box">
													<img
														src="${pageContext.request.contextPath}/resources/assets/images/team/team-5.jpg"
														alt="">
													<a href="doctors-details.html"><i class="far fa-heart"></i></a>
												</figure>
												<div class="lower-content">
													<ul class="name-box clearfix">
														<li class="name">
															<h3>
																<a href="${item.memberNo }">Dr. ${item.name }</a>
															</h3>
														</li>
														<li><i class="icon-Trust-1"></i></li>
														<li><i class="icon-Trust-2"></i></li>
													</ul>
													<span class="designation">${item.profileEducation }</span>
													<div class="rating-box clearfix">
														<ul class="rating clearfix">
															<li><i class="icon-Star"></i></li>
															<li><i class="icon-Star"></i></li>
															<li><i class="icon-Star"></i></li>
															<li><i class="icon-Star"></i></li>
															<li><i class="icon-Star"></i></li>
															<li><a href="doctors-details.html">(${item.commentsCnt })</a></li>
														</ul>
													</div>
													<div class="location-box">
														<p>
															<i class="fas fa-map-marker-alt"></i>${item.addr1 }</p>
													</div>
													<div class="lower-box clearfix">
														<span class="text">24/7 Available</span> <a
															href="doctors-details.html">Book Now</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
						<!-- 의사 그리드 컨텐츠 리스트 끝 -->
					</div>
					<!-- 의사 리스트 랩퍼 시작 -->
				</div>
			</div>
		</div>
	</section>
	<!-- doctors-page-section end -->
</div>

