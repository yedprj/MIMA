<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
th, td {
	text-align: center;
	span: center;
}
</style>

<!--page-title-two-->
<section class="page-title-two">
	<div class="title-box centred bg-color-2">
		<div class="pattern-layer">
			<div class="pattern-1" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-70.png);"></div>
			<div class="pattern-2" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-71.png);"></div>
		</div>
		<div class="auto-container">
			<div class="title">
				<h1>내가 찜한 의사</h1>
			</div>
		</div>
	</div>
	<div class="lower-content">
		<ul class="bread-crumb clearfix">
			<li><a href="${pageContext.request.contextPath}">Home</a></li>
			<li>내가 찜한 의사</li>
		</ul>
	</div>
</section>
<!--page-title-two end-->

<section class="doctors-dashboard bg-color-3">
	<div class="left-panel">
		<div class="profile-box">
			<div class="upper-box">
				<figure class="profile-image">
					<img src="${pageContext.request.contextPath}/resources/assets/images/resource/profile-2.png" >
				</figure>
				<div class="title-box centred">
					<div class="inner">
						<h3>${session.name}</h3>
						<p>${clinicName}</p>
					</div>
				</div>
			</div>
			<div class="profile-info">
				<ul class="list clearfix">
					<li><a href="ptMain"><i class="fas fa-columns"></i>대쉬보드</a></li>
					<li><a href="ptBookManage"><i class="fas fa-calendar-alt"></i>나의 예약관리</a></li>
					<li><a href="ptHistory"><i class="fas fa-calendar-alt"></i>나의 진료내역</a></li>
					<li><a href="ptDoctor" class="current"><i class="fas fa-wheelchair"></i>내가 찜한 의사</a></li>
					<li><a href="ptReview"><i class="fas fa-star"></i>나의 후기</a></li>
					<li><a href="ptMedelivery"><i class="fas fa-comment-medical"></i>약배달 신청</a></li>
					<li><a href="ptDeliveryList"><i class="fas fa-ambulance"></i>배송 현황</a></li>
					<li><a href="ptProfileDetail"><i class="fas fa-user"></i>프로필 관리</a></li>
					<li><a href="ptPwChangeForm"><i class="fas fa-unlock-alt"></i>비밀번호 변경</a></li>
					<li><a href="login.html"><i class="fas fa-sign-out-alt"></i>로그아웃</a></li>
	            </ul>
			</div>
		</div>
	</div>
	<!-- doctor-dashboard -->
	<div class="right-panel">
                <div class="content-container">
                    <div class="outer-container">
                        <div class="favourite-doctors">
                            <div class="title-box">
                                <h3>내가 찜한 의사</h3>
							<span>담당 의사들을 확인할 수 있습니다.</span>
                            </div>
                            ${list }
                            <div class="doctors-list">
                                <div class="row clearfix">
                               	 <tbody>
                                	<c:forEach items="${ptDoctorList}" var="ptDoctorList">
                                    <div class="col-xl-4 col-lg-6 col-md-12 doctors-block">
                                        <div class="team-block-three">
                                            <div class="inner-box">
                                                <figure class="image-box">
                                                    <img src="assets/images/team/team-21.jpg" alt="">
                                                    <a href="doctors-details.html"><i class="far fa-heart"></i></a>
                                                </figure>
                                                <div class="lower-content">
                                                    <ul class="name-box clearfix">
                                                        <li class="name"><h3>${ptDoctorList.memberNo}</h3></li>
                                                    </ul>
                                                    <span class="designation">${ptDoctorList.likeDate}</span>
                                                    <div class="rating-box clearfix">
                                                        <ul class="rating clearfix">
                                                        </ul>
                                                    </div>
                                                    <div class="location-box">
                                                        <p><i class="fas fa-map-marker-alt"></i>${ptDoctorList.category}</p>
                                                    </div>
                                                    <div class="lower-box clearfix">
                                                        <span class="text">${ptDoctorList.likeMainNo}</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </c:forEach>
                                    </tbody>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
</section>


<!--Scroll to top-->
<button class="scroll-top scroll-to-target" data-target="html">
	<span class="fa fa-arrow-up"></span>
</button>

<!-- End of .page_wrapper -->

<script>
$(document).ready(function() {
	 var actionForm = $('#actionForm');

		$('#nameSearch');

		/* $(enter(event){
			if(event.keyCode == 13){
				
			}
		}); */
		
	});
</script>
