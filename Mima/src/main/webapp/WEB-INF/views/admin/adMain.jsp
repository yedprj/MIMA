<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
							<div class="col-lg-3 col-md-6 col-sm-12 pricing-block">
								<div class="pricing-block-one">
									<div class="pricing-table">
										<div class="pattern">
											<div class="pattern-1"
												style="background-image: url(${pageContext.request.contextPath }/resources/assets/images/shape/shape-75.png);"></div>
											<div class="pattern-2"
												style="background-image: url(${pageContext.request.contextPath }/resources/assets/images/shape/shape-76.png);"></div>
										</div>
										<div class="table-header">
											<h2>회원정보조회</h2>
										</div>
										<div class="table-content">
											<img alt="" src="${pageContext.request.contextPath }/resources/assets/images/profilee.jpg" width="55px" height="55px">
											<!-- 토탈카운트 -->
											<tbody>
												<tr>
													<td><p style="font-size:25px"> 총 : ${getTotalCount } 명</p></td>
												</tr>
											</tbody>
										</div>
										<div class="table-footer">
											<div class="link">
												<a href="pricing.html"><i class="icon-Arrow-Right"></i></a>
											</div>
											<div class="btn-box">
												<a href="${pageContext.request.contextPath }/admin/adlist?category=pt" class="theme-btn-one">GO<i
													class="icon-Arrow-Right"></i></a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6 col-sm-12 pricing-block">
								<div class="pricing-block-one">
									<div class="pricing-table active">
										<div class="pattern">
											<div class="pattern-1"
												style="background-image: url(${pageContext.request.contextPath }/resources/assets/images/shape/shape-75.png);"></div>
											<div class="pattern-2"
												style="background-image: url(${pageContext.request.contextPath }/resources/assets/images/shape/shape-76.png);"></div>
											<div class="pattern-3"
												style="background-image: url(${pageContext.request.contextPath }/resources/assets/images/shape/shape-77.png);"></div>
										</div>
										<div class="table-header">
											<h2>의사/약국 승인 조회</h2>
										</div>
										<div class="table-content">
											<img alt="" src="${pageContext.request.contextPath }/resources/assets/images/logo.png" width="150px" height="150px">
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
							<div class="col-lg-3 col-md-6 col-sm-12 pricing-block">
								<div class="pricing-block-one">
									<div class="pricing-table">
										<div class="pattern">
											<div class="pattern-1"
												style="background-image: url(${pageContext.request.contextPath }/resources/assets/images/shape/shape-75.png);"></div>
											<div class="pattern-2"
												style="background-image: url(${pageContext.request.contextPath }/resources/assets/images/shape/shape-76.png);"></div>
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
												<a href="${pageContext.request.contextPath }/admin/rplist" class="theme-btn-one">GO<i
													class="icon-Arrow-Right"></i></a>
											</div>
										</div>
									</div>
								</div>
							</div>
						<div class="col-lg-3 col-md-6 col-sm-12 pricing-block">
							<div class="pricing-block-one">
								<div class="pricing-table active">
									<div class="pattern">
										<div class="pattern-1"
											style="background-image: url(${pageContext.request.contextPath }/resources/assets/images/shape/shape-75.png);"></div>
										<div class="pattern-2"
											style="background-image: url(${pageContext.request.contextPath }/resources/assets/images/shape/shape-76.png);"></div>
										<div class="pattern-3"
											style="background-image: url(${pageContext.request.contextPath }/resources/assets/images/shape/shape-77.png);"></div>
									</div>
									<div class="table-header">
										<h2>명상등록</h2>
									</div>
									<div class="table-content">
										<img alt=""
											src="${pageContext.request.contextPath }/resources/assets/images/mengsang.png"
											width="80px" height="80px">
									</div>
									<div class="table-footer">
										<div class="link">
											<a href="pricing.html"><i class="icon-Arrow-Right"></i></a>
										</div>
										<div class="btn-box">
											<a href="${pageContext.request.contextPath }/admin/meditationInsertForm" class="theme-btn-one">GO<i
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

