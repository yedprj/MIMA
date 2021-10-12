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
				<h1>약배달 관리</h1>
			</div>
		</div>
	</div>
	<div class="lower-content">
		<ul class="bread-crumb clearfix">
			<li><a href="${pageContext.request.contextPath}">Home</a></li>
			<li>약배달 관리</li>
		</ul>
	</div>
</section>
<!--page-title-two end-->  
    
<section class="doctors-dashboard bg-color-3">
	<!-- 사이드 메뉴바 연결 -->
	<div class="left-panel">
		<div class="profile-box">
			<div class="upper-box">
				<figure class="profile-image">
					<img src="${pageContext.request.contextPath}/resources/assets/images/resource/profile-2.png" alt="">
				</figure>
				<div class="title-box centred">
					<div class="inner">
						<h3>${profile.pharmacyInfo}</h3>
						<p>${profile.profileContents}</p>
					</div>
				</div>
			</div>
			<div class="profile-info">
				<ul class="list clearfix">
					<li><a id="dash" href="${pageContext.request.contextPath}/pharmacy/pharmacyDash" ><i
							class="fas fa-columns"></i>대쉬보드</a></li>
					<li><a id="delivery" href="${pageContext.request.contextPath}/pharmacy/mediDelivery" class="current"><i class="fas fa-ambulance"></i>약배달관리</a></li>
					<li><a id="guid" href="${pageContext.request.contextPath}/pharmacy/medGuid"><i class="fas fa-comment-medical"></i>복약지도관리</a></li>
					<li><a id="revicw" href="${pageContext.request.contextPath}/pharmacy/review"><i class="fas fa-star"></i>약국 후기</a></li>
					<li><a id="ques" href="${pageContext.request.contextPath}/pharmacy/phaQna"><i class="fas fa-comments"></i>문의</a><span>20</span></li>
					<li><a id="profile" href="${pageContext.request.contextPath}/pharmacy/myProfile"><i class="fas fa-user"></i>약국 프로필</a></li>
					<li><a id="pwUpdate" href="${pageContext.request.contextPath}/pharmacy/pwUpdate"><i
							class="fas fa-unlock-alt"></i>비밀번호 변경</a></li>
					<li><a id="logout" href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt"></i>로그아웃</a></li>
				</ul>
			</div>
		</div>
	</div>
	
	<div class="right-panel">
                <div class="content-container">
                    <div class="outer-container">
                        <div class="appointment-list">
                            <div class="upper-box clearfix">
                                <div class="text pull-left">
                                    <h3>약배달 관리</h3>
                                </div>
                                <div class="select-box pull-right">
                                    <select class="wide">
                                       <option data-display="상태 목록">상태 목록</option>
                                       <option value="1">약배달 신청목록</option>
                                       <option value="2">약배달 확인목록</option>
                                       <option value="4">배달 확인목록</option>
                                    </select>
                                </div>
                            </div>
                            <div class="single-item">
                                <figure class="image-box"><img src="${pageContext.request.contextPath}/resources/assets/images/resource/appointment-1.jpg" alt=""></figure>
                                <div class="inner">
                                    <h4>Mary Astor</h4>
                                    <ul class="info-list clearfix">
                                        <li><i class="fas fa-clock"></i>15 Oct 2020, 09:30AM</li>
                                        <li><i class="fas fa-map-marker-alt"></i>G87P, Birmingham, UK</li>
                                        <li><i class="fas fa-hourglass-start"></i>Cardiology Test, Diabetic Diagnose</li>
                                        <li><i class="fas fa-envelope"></i><a href="mailto:anna@example.com">anna@example.com</a></li>
                                        <li><i class="fas fa-phone"></i><a href="tel:2265458856">+(22) 65_458_856</a></li>
                                    </ul>
                                    <ul class="confirm-list clearfix">
                                        <li><i class="fas fa-check"></i>Accept</li>
                                        <li><i class="fas fa-times"></i>Cancel</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="single-item">
                                <figure class="image-box"><img src="${pageContext.request.contextPath}/resources/assets/images/resource/appointment-2.jpg" alt=""></figure>
                                <div class="inner">
                                    <h4>Rex Allen</h4>
                                    <ul class="info-list clearfix">
                                        <li><i class="fas fa-clock"></i>15 Oct 2020, 09:30AM</li>
                                        <li><i class="fas fa-map-marker-alt"></i>G87P, Birmingham, UK</li>
                                        <li><i class="fas fa-hourglass-start"></i>Cardiology Test, Diabetic Diagnose</li>
                                        <li><i class="fas fa-envelope"></i><a href="mailto:anna@example.com">anna@example.com</a></li>
                                        <li><i class="fas fa-phone"></i><a href="tel:2265458856">+(22) 65_458_856</a></li>
                                    </ul>
                                    <ul class="confirm-list clearfix">
                                        <li><i class="fas fa-check"></i>Accept</li>
                                        <li><i class="fas fa-times"></i>Cancel</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="pagination-wrapper">
                            <ul class="pagination">
                                <li><a href="clinic-1.html" class="current">1</a></li>
                                <li><a href="clinic-1.html">2</a></li>
                                <li><a href="clinic-1.html">3</a></li>
                                <li><a href="clinic-1.html"><i class="icon-Arrow-Right"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
</section>
<!-- doctors-dashboard -->

