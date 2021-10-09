<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!--dashboard -->
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
				<h1>약 배달</h1>
			</div>
		</div>
	</div>
	<div class="lower-content">
		<ul class="bread-crumb clearfix">
			<li><a href="${pageContext.request.contextPath}">Home</a></li>
			<li>약배달</li>
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
					<li><a href="ptHistory"><i class="fas fa-calendar-alt"></i>진료내역</a></li>
					<li><a href="patientList"><i class="fas fa-wheelchair"></i>내가 찜한 의사</a></li>
					<li><a href="ptReview"><i class="fas fa-star"></i>나의 후기</a></li>
					<li><a href="docQna"><i class="fas fa-comments"></i>나의 문의</a></li>
					<li><a href="ptMedelivery"><i class="fas fa-ambulance"></i>약 배달</a></li>
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
                        <div class="add-listing">
                            <div class="single-box">
                                <div class="title-box">
                                    <h3>약 배달 신청</h3>
                                </div>
                                <div class="inner-box">
                                	예약한 진료가 존재하지 않습니다.
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