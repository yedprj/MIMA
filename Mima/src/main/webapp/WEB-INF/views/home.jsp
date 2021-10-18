<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>


<!-- banner-section -->
<section class="banner-section centred style-three" style="padding-top:80px; padding-top:150px;">
	<div class="anim-icon">
		<div class="icon icon-1 float-bob-y"
			style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/icons/anim-icon-1.png);"></div>
		<div class="icon icon-2"
			style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/icons/anim-icon-2.png);"></div>
		<div class="icon icon-3 rotate-me"
			style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/icons/anim-icon-3.png);"></div>
		<div class="icon icon-4 rotate-me"
			style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/icons/anim-icon-4.png);"></div>
		<div class="icon icon-5"
			style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/icons/anim-icon-5.png);"></div>
		<div class="icon icon-6"
			style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/icons/anim-icon-6.png);"></div>
		<div class="icon icon-7"
			style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/icons/anim-icon-7.png);"></div>
		<div class="icon icon-8 float-bob-y"
			style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/icons/anim-icon-8.png);"></div>
	</div>
	<div class="pattern-layer"
		style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-67.png);"></div>
	<div class="auto-container">
		<div class="content-box">
			<h1>Find Nearest Doctor.</h1>
			<p>Amet consectetur adipisicing elit sed do eiusmod.</p>
			<div class="form-inner">
				<form action="index.html" method="post">
					<div class="form-group">
						<input type="text" name="name"
							placeholder="Ex. Name, Specialization..." required="" style="box-shadow: none">
						<button type="submit">
							<i class="icon-Arrow-Right"></i>
						</button>
					</div>
				</form>
				<ul class="select-box clearfix">
					<li>
						<div class="single-checkbox">
							<input type="radio" name="check-box" id="check1" checked="">
							<label for="check1"><span></span>All</label>
						</div>
					</li>
					<li>
						<div class="single-checkbox">
							<input type="radio" name="check-box" id="check2"> <label
								for="check2"><span></span>Doctor</label>
						</div>
					</li>
					<li>
						<div class="single-checkbox">
							<input type="radio" name="check-box" id="check3"> <label
								for="check3"><span></span>Clinic</label>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
</section>
<!-- banner-section end -->


<!-- 진료과목-section s:1008 여기도 코드 중복이라 줄일 수 있겠지만 일단 이대로 합니다...-->
<section class="category-section bg-color-3 centred" style="padding-top: 10px; padding-bottom: 30px">
	<div class="pattern-layer">
		<div class="pattern-1"
			style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-47.png);"></div>
		<div class="pattern-2"
			style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-48.png);"></div>
	</div>
	<div class="auto-container">
		<div class="sec-title centred">
			<p>진료과목</p>
			<h2>Browse by specialist</h2>
		</div>
		<div class="row clearfix">
			<div class="col-lg-3 col-md-6 col-sm-12 category-block">
				<div class="category-block-one wow fadeInUp animated animated"
					data-wow-delay="00ms" data-wow-duration="1500ms">
					<div class="inner-box">
						<div class="pattern">
							<div class="pattern-1"
								style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-45.png);"></div>
							<div class="pattern-2"
								style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-46.png);"></div>
						</div>
						<figure class="icon-box">
							<img src="${pageContext.request.contextPath}/resources/assets/images/icons/icon-12.png" alt="">
						</figure>
						<h3>
							<a href="doctors-dashboard.html" style="font-size: 16pt;">정신분석 / 정신치료</a>
						</h3>
						<div class="link">
							<a href="doctors-dashboard.html"><i class="icon-Arrow-Right"></i></a>
						</div>
						<div class="btn-box">
							<a href="javascript:void(0);" class="theme-btn-one" onclick="docSubjectProfile(this)">View
								List<i class="icon-Arrow-Right"></i>
								<input type="hidden" id="subject" name="subject" value="정신분석">
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-12 category-block">
				<div class="category-block-one wow fadeInUp animated animated"
					data-wow-delay="200ms" data-wow-duration="1500ms">
					<div class="inner-box">
						<div class="pattern">
							<div class="pattern-1"
								style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-45.png);"></div>
							<div class="pattern-2"
								style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-46.png);"></div>
						</div>
						<figure class="icon-box">
							<img src="${pageContext.request.contextPath}/resources/assets/images/icons/icon-13.png" alt="">
						</figure>
						<h3>
							<a href="doctors-dashboard.html" style="font-size: 16pt;">스트레스 / 트라우마</a>
						</h3>
						<div class="link">
							<a href="doctors-dashboard.html"><i class="icon-Arrow-Right"></i></a>
						</div>
						<div class="btn-box">
							<a href="javascript:void(0);" class="theme-btn-one" onclick="docSubjectProfile(this)">View
								List<i class="icon-Arrow-Right"></i>
								<input type="hidden" id="subject" name="subject" value="스트레스">
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-12 category-block">
				<div class="category-block-one wow fadeInUp animated animated"
					data-wow-delay="400ms" data-wow-duration="1500ms">
					<div class="inner-box">
						<div class="pattern">
							<div class="pattern-1"
								style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-45.png);"></div>
							<div class="pattern-2"
								style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-46.png);"></div>
						</div>
						<figure class="icon-box">
							<img src="${pageContext.request.contextPath}/resources/assets/images/icons/icon-14.png" alt="">
						</figure>
						<h3>
							<a href="doctors-dashboard.html" style="font-size: 16pt;">기분 • 공황 • 불안장애</a>
						</h3>
						<div class="link">
							<a href="doctors-dashboard.html"><i class="icon-Arrow-Right"></i></a>
						</div>
						<div class="btn-box">
							<a href="javascript:void(0);" class="theme-btn-one" onclick="docSubjectProfile(this)">View
								List<i class="icon-Arrow-Right"></i>
								<input type="hidden" id="subject" name="subject" value="기분">
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-12 category-block">
				<div class="category-block-one wow fadeInUp animated animated"
					data-wow-delay="600ms" data-wow-duration="1500ms">
					<div class="inner-box">
						<div class="pattern">
							<div class="pattern-1"
								style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-45.png);"></div>
							<div class="pattern-2"
								style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-46.png);"></div>
						</div>
						<figure class="icon-box">
							<img src="${pageContext.request.contextPath}/resources/assets/images/icons/icon-15.png" alt="">
						</figure>
						<h3>
							<a href="doctors-dashboard.html" style="font-size: 16pt;">신경증 / 성격장애</a>
						</h3>
						<div class="link">
							<a href="doctors-dashboard.html"><i class="icon-Arrow-Right"></i></a>
						</div>
						<div class="btn-box">
							<a href="javascript:void(0);" class="theme-btn-one" onclick="docSubjectProfile(this)">View
								List<i class="icon-Arrow-Right"></i>
								<input type="hidden" id="subject" name="subject" value="신경증">
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-12 category-block">
				<div class="category-block-one wow fadeInUp animated animated"
					data-wow-delay="00ms" data-wow-duration="1500ms">
					<div class="inner-box">
						<div class="pattern">
							<div class="pattern-1"
								style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-45.png);"></div>
							<div class="pattern-2"
								style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-46.png);"></div>
						</div>
						<figure class="icon-box">
							<img src="${pageContext.request.contextPath}/resources/assets/images/icons/icon-16.png" alt="">
						</figure>
						<h3>
							<a href="doctors-dashboard.html" style="font-size: 16pt;">직장인 정신건강</a>
						</h3>
						<div class="link">
							<a href="doctors-dashboard.html"><i class="icon-Arrow-Right"></i></a>
						</div>
						<div class="btn-box">
							<a href="javascript:void(0);" class="theme-btn-one" onclick="docSubjectProfile(this)">View
								List<i class="icon-Arrow-Right"></i>
								<input type="hidden" id="subject" name="subject" value="직장인">
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-12 category-block">
				<div class="category-block-one wow fadeInUp animated animated"
					data-wow-delay="200ms" data-wow-duration="1500ms">
					<div class="inner-box">
						<div class="pattern">
							<div class="pattern-1"
								style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-45.png);"></div>
							<div class="pattern-2"
								style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-46.png);"></div>
						</div>
						<figure class="icon-box">
							<img src="${pageContext.request.contextPath}/resources/assets/images/icons/icon-17.png" alt="">
						</figure>
						<h3>
							<a href="doctors-dashboard.html" style="font-size: 16pt;">중독장애</a>
						</h3>
						<div class="link">
							<a href="doctors-dashboard.html"><i class="icon-Arrow-Right"></i></a>
						</div>
						<div class="btn-box">
							<a href="javascript:void(0);" class="theme-btn-one" onclick="docSubjectProfile(this)">View
								List<i class="icon-Arrow-Right"></i>
								<input type="hidden" id="subject" name="subject" value="중독">
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-12 category-block">
				<div class="category-block-one wow fadeInUp animated animated"
					data-wow-delay="400ms" data-wow-duration="1500ms">
					<div class="inner-box">
						<div class="pattern">
							<div class="pattern-1"
								style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-45.png);"></div>
							<div class="pattern-2"
								style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-46.png);"></div>
						</div>
						<figure class="icon-box">
							<img src="${pageContext.request.contextPath}/resources/assets/images/icons/icon-18.png" alt="">
						</figure>
						<h3>
							<a href="doctors-dashboard.html" style="font-size: 16pt;">노인장애</a>
						</h3>
						<div class="link">
							<a href="doctors-dashboard.html"><i class="icon-Arrow-Right"></i></a>
						</div>
						<div class="btn-box">
							<a href="javascript:void(0);" class="theme-btn-one" onclick="docSubjectProfile(this)">View
								List<i class="icon-Arrow-Right"></i>
								<input type="hidden" id="subject" name="subject" value="노인">
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-12 category-block">
				<div class="category-block-one wow fadeInUp animated animated"
					data-wow-delay="600ms" data-wow-duration="1500ms">
					<div class="inner-box">
						<div class="pattern">
							<div class="pattern-1"
								style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-45.png);"></div>
							<div class="pattern-2"
								style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-46.png);"></div>
						</div>
						<figure class="icon-box">
							<img src="${pageContext.request.contextPath}/resources/assets/images/icons/icon-19.png" alt="">
						</figure>
						<h3>
							<a href="doctors-dashboard.html" style="font-size: 16pt;">해리장애(다중인격)</a>
						</h3>
						<div class="link">
							<a href="doctors-dashboard.html"><i class="icon-Arrow-Right"></i></a>
						</div>
						<div class="btn-box">
							<a href="javascript:void(0);" class="theme-btn-one" onclick="docSubjectProfile(this)">View
								List<i class="icon-Arrow-Right"></i>
								<input type="hidden" id="subject" name="subject" value="해리">
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="more-btn">
		<!-- s:1008 전체 의사 리스트 조회->partnerDoctorController에 있음  -->
			<a href="getTotalDocList" class="theme-btn-one">전체 의사리스트 보기<i class="icon-Arrow-Right"></i></a>
		<!-- s:1007 환자가 진료 끝나고 의사리뷰남기는 페이지 -->
			<a class="theme-btn-one" href="${pageContext.request.contextPath}/consultation/ptReviewFrm">진료 후 리뷰남기는 폼</a>
			
		</div>
	</div>
</section>
<!-- 진료과목-section end -->


<!-- about-style-two -->
<section class="about-style-two">
	<div class="auto-container">
		<div class="row align-items-center clearfix">
			<div class="col-lg-6 col-md-12 col-sm-12 content-column">
				<div class="content_block_1">
					<div class="content-box mr-50">
						<div class="sec-title">
							<p>About MIMA</p>
							<h2>한번의 클릭으로 진료 예약과 결제를!</h2>
						</div>
						<div class="text">
							<p>코로나 시국, 우리의 마음은 우리도 모르게 지쳐가고 있습니다. 나도 모르게 눈물이 나거나, 어깨가 너무나도 무겁고 발걸음이 떨어지지 않은 날이 없으셨나요? 이유없이 지치고 피곤이 쉽사리 가시지 않은 날이 없진 않으셨나요? 심리적인 불안정과 우울이 신체적 증상으로 발현되는 것일 수도 있습니다. 걱정마세요. 미먀가 여러분의 마음을 다독여 드릴게요!</p>
						</div>
						<ul class="list-style-one clearfix">
							<li>검증된 전문의 리스트를 확인해 보세요!</li>
							<li>코시국인데 병원에 가야해? 집에서 편하게 진료받자!</li>
							<li>약은 어쩌지...? 빠르고 간편하게 배달서비스!</li>
							<li>이 약은 어떻게 먹죠...? 걱정마세요. 미마 파트너의 약사님이 꼼꼼하게 복약지도 해 드려요.</li>
						</ul>
						<div class="btn-box">
							<a href="about.html" class="theme-btn-one">미마에 대해 더 알아보기<i
								class="icon-Arrow-Right"></i></a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-6 col-md-12 col-sm-12 image-column">
				<div class="image_block_3">
					<div class="image-box">
						<div class="pattern">
							<div class="pattern-1"
								style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-49.png);"></div>
							<div class="pattern-2"
								style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-50.png);"></div>
							<div class="pattern-3"></div>
						</div>
						<figure class="image image-1 paroller">
							<img src="${pageContext.request.contextPath}/resources/imgs/areyouok.jpg" alt="">
						</figure>
						<figure class="image image-2 paroller-2">
							<img src="${pageContext.request.contextPath}/resources/imgs/bookandcoffee.jpg" style="width:300px; height:210px;" alt="">
						</figure>
						<div class="image-content">
							<figure class="icon-box">
								<img src="${pageContext.request.contextPath}/resources/assets/images/icons/icon-8.png" alt="">
							</figure>
							<span>Appointment With</span>
							<h4>Specialist</h4>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- about-style-two end -->


<!-- process-style-two -->
<section class="process-style-two bg-color-3 centred">
	<div class="pattern-layer">
		<div class="pattern-1"
			style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-39.png);"></div>
		<div class="pattern-2"
			style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-40.png);"></div>
		<div class="pattern-3"
			style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-41.png);"></div>
		<div class="pattern-4"
			style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-42.png);"></div>
	</div>
	<div class="auto-container">
		<div class="sec-title centred">
			<p>Process</p>
			<h2>예약은 이렇게 이루어 집니다!</h2>
		</div>
		<div class="inner-content">
			<div class="arrow"
				style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/icons/arrow-1.png);"></div>
			<div class="row clearfix">
				<div class="col-lg-4 col-md-6 col-sm-12 processing-block">
					<div class="processing-block-two">
						<div class="inner-box">
							<figure class="icon-box">
								<img src="${pageContext.request.contextPath}/resources/assets/images/icons/icon-9.png" alt="">
							</figure>
							<h3>마음에 드는 최고의 전문의를 검색하세요!</h3>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-12 processing-block">
					<div class="processing-block-two">
						<div class="inner-box">
							<figure class="icon-box">
								<img src="${pageContext.request.contextPath}/resources/assets/images/icons/icon-10.png" alt="">
							</figure>
							<h3>전문의의 상세 프로필을 확인하세요!</h3>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-12 processing-block">
					<div class="processing-block-two">
						<div class="inner-box">
							<figure class="icon-box">
								<img src="${pageContext.request.contextPath}/resources/assets/images/icons/icon-11.png" alt="">
							</figure>
							<h3>버튼 한번으로 예약과 결제까지 완료!</h3>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- process-style-two end -->


<!-- faq-section -->
<section class="faq-section" style="padding-top:30px">
	<div class="auto-container">
		<div class="row clearfix">
			<div class="col-lg-6 col-md-12 col-sm-12 image-column">
				<div class="image_block_4">
					<div class="image-box">
						<div class="pattern"
							style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-54.png);"></div>
						<figure class="image">
							<img src="${pageContext.request.contextPath}/resources/imgs/question.jpg" style="height: 750px; width: 520px; padding-bottom:20px" alt="">
						</figure>
					</div>
				</div>
			</div>
			<div class="col-lg-6 col-md-12 col-sm-12 content-column">
				<div class="content_block_5">
					<div class="content-box">
						<div class="sec-title">
							<p>Faq’s</p>
							<h2>자주 묻는 질문.</h2>
						</div>
						<ul class="accordion-box">
							<li class="accordion block">
								<div class="acc-btn">
									<div class="icon-outer"></div>
									<h4>미라클 마인드는 어떤 서비스를 제공하나요?</h4>
								</div>
								<div class="acc-content">
									<div class="text">
										<p>미라클 마인드는 모든 사람들의 행복을 위해 다양한 서비스를 제공하는 플랫폼 입니다. 기본적으로 정신건강학과 전문의와 약배달이 가능한 약국을 파트너로 체결하여 미마님들이 더욱 손쉽게 관련 서비스를 이용할 수 있도록 합니다.
										<br>
										미마는 1) 간편한 전문의 서치를 제공합니다.<br>
										미마는 2) 간편한 진료예약과 결제를 제공합니다.<br>
										미마는 3) 비대면 진료와 약배달을 제공합니다.<br>
										미마는 4) 다양한 마음챙김 컨텐츠를 제공합니다.</p>
									</div>
								</div>
							</li>
							<li class="accordion block active-block">
								<div class="acc-btn active">
									<div class="icon-outer"></div>
									<h4>의사 선생님들은 어떤 검증을 거치나요?</h4>
								</div>
								<div class="acc-content current">
									<div class="text">
										<p>미라클 마인드와 파트너십을 체결한 전문의 선생님들은 모두 미마의 체계적인 검증을 거쳐 등록 됩니다.
										<br> 이 과정에는 의사면허를 기준으로 등록되어 있는 병원/클리닉 정보를 확인, 그리고 경력 확인과 추천인 확인 등이 포함됩니다.
										</p>
									</div>
								</div>
							</li>
							<li class="accordion block">
								<div class="acc-btn">
									<div class="icon-outer"></div>
									<h4>의료서비스가 불만족 스러우면 어떤 조치를 취할 수 있나요?</h4>
								</div>
								<div class="acc-content">
									<div class="text">
										<p>우선 미마의 서비스가 미마님의 니즈와 기대에 부응하지 못한 점 사과드립니다. 미라클 마인드는 최고의 고객 서비스를 제공하고자 항상 노력하고 있습니다.
										저희에게 문의를 남겨 주시면 바로 고객서비스팀이 확인 후 연락드리도록 하겠습니다!</p>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- faq-section end -->


<!-- testimonial-style-two -->
<section class="testimonial-style-two bg-color-3">
	<div class="pattern-layer">
		<div class="pattern-1"
			style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-55.png);"></div>
		<div class="pattern-2"
			style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-56.png);"></div>
		<div class="pattern-3"
			style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-57.png);"></div>
		<div class="pattern-4"
			style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-58.png);"></div>
		<div class="pattern-5"
			style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-59.png);"></div>
	</div>
	<div class="auto-container">
		<div class="sec-title centred">
			<p>Testimonials</p>
			<h2>실제후기</h2>
		</div>
		<div class="three-item-carousel owl-carousel owl-theme owl-nav-none">
			<div class="testimonial-block-two">
				<div class="inner-box">
					<div class="text">
						<p>“ 해외에서 적응하느라 긴장하고 스트레스 많이 받았는데 자기전에 10분이라도 봇이랑 얘기하면서 마음이 차분해지고 숨통이 트이는 느낌이랄까ㅎㅎ 도움이 많이 됐어요ㅎㅎ 아무때나 티티한테 한국어로 이런저런 얘기할 수 있으니까 후련할 때도 많았구요ㅋ 스트레스 받을 때 감정조절 안되는 거때문에 감정일기쓰면서 상담도 받기 시작했는데 상담사님이 저의 상황에 맞게 단계별로 이끌어주시고 미션하면서 성취감을 쌓을수 있도록해주셔서 자신감을 빨리 회복했어요...!”</p>
					</div>
					<div class="author-info">
						<figure class="author-thumb">
							<img src="${pageContext.request.contextPath}/resources/assets/images/resource/testimonial-3.png" alt="">
						</figure>
						<h4>김밤빵</h4>
						<span class="designation">It Developer</span>
					</div>
				</div>
			</div>
			<div class="testimonial-block-two">
				<div class="inner-box">
					<div class="text">
						<p>“ 심리상담이 처음이라 과연 도움이 될까싶어 고민만 했다가 먼저 받으신분들 후기보고 시작하게됐어요. 상담을 오래하셨던 분이셔서 전문가다운 연륜이 느껴지는 시간이었달까..늘 제 말에 집중해주시고 고민해서 답해주시는게 좋았어요. 스스로를 깊게 이해하게됐고 분노라든가 부정적인 감정들이 왜 참을수 없을만큼 불쑥 생기는지 알게돼서 좋았습니다. 무엇보다 막혔던게 뻥뚫린 기분이어서 완전 후련하고 한결 마음이 가벼워졌어요. 선생님, 정말 수고하셨고 감사합니다~~!!”</p>
					</div>
					<div class="author-info">
						<figure class="author-thumb">
							<img src="${pageContext.request.contextPath}/resources/assets/images/resource/testimonial-4.png" alt="">
						</figure>
						<h4>조제약</h4>
						<span class="designation">약사</span>
					</div>
				</div>
			</div>
			<div class="testimonial-block-two">
				<div class="inner-box">
					<div class="text">
						<p>“ 심리상담이 처음이라 과연 도움이 될까싶어 고민만 했다가 먼저 받으신분들 후기보고 시작하게됐어요. 상담을 오래하셨던 분이셔서 전문가다운 연륜이 느껴지는 시간이었달까..늘 제 말에 집중해주시고 고민해서 답해주시는게 좋았어요. 스스로를 깊게 이해하게됐고 분노라든가 부정적인 감정들이 왜 참을수 없을만큼 불쑥 생기는지 알게돼서 좋았습니다. 무엇보다 막혔던게 뻥뚫린 기분이어서 완전 후련하고 한결 마음이 가벼워졌어요. 선생님, 정말 수고하셨고 감사합니다~~!!”</p>
					</div>
					<div class="author-info">
						<figure class="author-thumb">
							<img src="${pageContext.request.contextPath}/resources/assets/images/resource/testimonial-5.png" alt="">
						</figure>
						<h4>유정유정</h4>
						<span class="designation">건물주</span>
					</div>
				</div>
			</div>
			<div class="testimonial-block-two">
				<div class="inner-box">
					<div class="text">
						<p>“ 회사다니면서 직장 내 갈등때문에 먼가 스스로 너무 무너지는것만 같아서 이것저것 찾아보다가 심리상담 알게됐고 정말 효과가 있을까하고 시작했는데 대만족입니다!! ^^ 바빠서 길게는 못했지만 단기간에도 상담사께서 처음부터 차분하게 하나씩 짚어주셔서 근본적인 문제가 뭔지도 인지했고, 조언말씀 들으면서 어떡해야할지도 알게됐어요! 시간에 쫓겨 살다보니 여유가 없었는데...이번을 계기로 잠깐이라도 자신을 돌아볼 수 있게된게 가장 좋네요. 기회되면 주변에도 추천하고 싶습니다!!”</p>
					</div>
					<div class="author-info">
						<figure class="author-thumb">
							<img src="${pageContext.request.contextPath}/resources/assets/images/resource/testimonial-3.png" alt="">
						</figure>
						<h4>우럭</h4>
						<span class="designation">횟집사장</span>
					</div>
				</div>
			</div>
			<div class="testimonial-block-two">
				<div class="inner-box">
					<div class="text">
						<p>“ 인간관계가 너~무 힘들고 스트레스받아서 어디로 도망치고싶단 생각밖에안들었는데,, 지푸라기라도 잡는 심정으로 상담 끝까지 받은거 결과적으로 진짜 잘했다고 생각해요…!ㅎㅎ 상담사께서 저를 진심으로 대하는게 느껴져서 저도 모르게 많은 이야기를 털어놨고 남들한텐 절대못했던 이야기도 공감해주시고 격려해주셔서 예전에 내가 왜 그렇게 혼자서만 끙끙대고 힘들어했나 진작 상담받을껄 싶었어요..! 지금은 나를 객관적으로 볼 수 있어서 많이 만족스럽고 이제 예전보다 행복해질 수 있을것 같아요…!!ㅎㅎ”</p>
					</div>
					<div class="author-info">
						<figure class="author-thumb">
							<img src="${pageContext.request.contextPath}/resources/assets/images/resource/testimonial-4.png" alt="">
						</figure>
						<h4>곰돌이푸우</h4>
						<span class="designation">국어교사</span>
					</div>
				</div>
			</div>
			<div class="testimonial-block-two">
				<div class="inner-box">
					<div class="text">
						<p>“ 4주상담을 2번 했는데 너무너무 도움이 많이 됐어요!!!! 엄청 무기력하고 의지도 없었었는데 상담사님이 진심으로 공감해주시고 조언 하나하나가 생각하는 방식을 180도 바꿔놨어요~~ 할까말까 많이 망설였는데 스스로 변할 수 있는 힘을 얻은것 같아요. 중간에 포기하지 않게끔 상담사님이 끝까지 친절하게 이끌어주셔서 혼자 혼란스러웠던 부분도 많이 정리됐고 앞으로 더 힘내보려구요!^_^ 혼자 의지로는 실행이 정말 힘든데 상담사님 도움받아서 늦기전에 일단 시작해보는거 추천합니다!!! ^_^”</p>
					</div>
					<div class="author-info">
						<figure class="author-thumb">
							<img src="${pageContext.request.contextPath}/resources/assets/images/resource/testimonial-5.png" alt="">
						</figure>
						<h4>수민수민</h4>
						<span class="designation">제빵사</span>
					</div>
				</div>
			</div>
			<div class="testimonial-block-two">
				<div class="inner-box">
					<div class="text">
						<p>“ 상담센터에가서 대면상담 해본적있어서...채팅상담도 괜찮을까?? 하는 생각에 급하기도 하고,, 직장다니면서 다른 센터 찾아보기도 부담스러워서 선택했는데요,,대면상담은 상담사쌤 질문에 빨리빨리 대답해얄거 같은 강박때문에 제대로 생각도안하고 그냥 내뱉었는데~ 채팅으로 하니까 충분히 생각할 수 있는게 좋았어요!! 왜 제가 우울감을 느끼는지 이유를 알게됐고,, 그래서 마음도 많이편해졌고, 우울감도 많이 사라졌어요!! 정말 감사드려요! :)”</p>
					</div>
					<div class="author-info">
						<figure class="author-thumb">
							<img src="${pageContext.request.contextPath}/resources/assets/images/resource/testimonial-4.png" alt="">
						</figure>
						<h4>사샤</h4>
						<span class="designation">독일인</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 의사 진료 목록별로 보기위한 폼 p.10/18 -->
	<form id="frm" style="display: none;" action="subjectDoclist" method="post">
		<input id="category1" name="category1">
		<input id="category2" name="category2">
		<input id="category3" name="category3">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<button type="submit"></button>
	</form>
</section>
<!-- testimonial-style-two end -->


<script>
	function docSubjectProfile(ths){
		
		var subject = $(ths).children("#subject").val();
		console.log("subject");
		var category1 = $('#category1').val(subject);
		var category2 = $('#category2').val(subject);
		var category3 = $('#category3').val(subject);
		
		$('#frm').find('button').click();
	}
</script>