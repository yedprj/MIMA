<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
					<li><a href="${pageContext.request.contextPath}/pharmacy/pharmacyDash" class="current"><i
							class="fas fa-columns"></i>대쉬보드</a></li>
					<li><a href="${pageContext.request.contextPath}/pharmacy/medDelivery"><i
							class="fas fa-calendar-alt"></i>약배달관리</a></li>
					<li><a href="${pageContext.request.contextPath}/pharmacy/medGuid"><i
							class="fas fa-wheelchair"></i>복약지도관리</a></li>
					<li><a href="${pageContext.request.contextPath}/pharmacy/review"><i class="fas fa-star"></i>약국 후기</a></li>
					<li><a href="message.html"><i class="fas fa-comments"></i>문의</a><span>20</span></li>
					<li><a href="${pageContext.request.contextPath}/pharmacy/myProfile?memberNo=${profile.memberNo}"><i class="fas fa-user"></i>약국 프로필</a></li>
					<li><a href="${pageContext.request.contextPath}/pharmacy/pwUpdate?memberNo=${profile.memberNo}"><i
							class="fas fa-unlock-alt"></i>비밀번호 변경</a></li>
					<li><a href="login.html"><i class="fas fa-sign-out-alt"></i>로그아웃</a></li>
				</ul>
			</div>
		</div>
	</div>