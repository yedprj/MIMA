<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <h1>나의 문의</h1>
        </div>
    </div>
</div>
<div class="lower-content">
    <ul class="bread-crumb clearfix">
        <li><a href="${pageContext.request.contextPath}">Home</a></li>
            <li>나의 문의</li>
        </ul>
    </div>
</section>
<!--page-title-two end-->

<section class="doctors-dashboard bg-color-3">

<div class="left-panel">
            <div class="profile-box">
                <div class="upper-box">
                    <figure class="profile-image"><img src="${pageContext.request.contextPath}/resources/assets/images/resource/profile-2.png" alt=""></figure>
            <div class="title-box centred">
                <div class="inner">
                    <h3>Dr. Rex Allen</h3>
                    <p>MDS - Periodontology</p>
                </div>
            </div>
        </div>
        <div class="profile-info">
            <ul class="list clearfix">
                <li><a href="docMain"><i class="fas fa-columns"></i>대쉬보드</a></li>
                <li><a href="apptManage"><i class="fas fa-clock"></i>예약관리</a></li>
                <li><a href="apptHistory"><i class="fas fa-calendar-alt"></i>진료내역</a></li>
                <li><a href="patientList"><i class="fas fa-wheelchair"></i>나의 환자들</a></li>
                <li><a href="docReview"><i class="fas fa-star"></i>나의 후기</a></li>
                <li><a href="docQna" class="current"><i class="fas fa-comments"></i>나의 문의</a></li>
                <li><a href="my-profile.html"><i class="fas fa-user"></i>프로필 관리</a></li>
                <li><a href="change-password.html"><i class="fas fa-unlock-alt"></i>비밀번호 변경</a></li>
                <li><a href="login.html"><i class="fas fa-sign-out-alt"></i>로그아웃</a></li>
            </ul>
        </div>
    </div>
</div>

<div class="right-panel">
    <div class="content-container">
        <div class="outer-container">
            <div class="review-list">
                <div class="title-box clearfix">
                    <div class="text pull-left">
                    	<h3>나의 문의</h3>
                    </div>
                </div>
                <div class="comment-inner">
                   	<c:forEach items="${docQna}" var="docQna">
        				<div class="single-comment-box">
           					<div class="comment" style="padding-left: 20px;">
                				<span class="comment-time"><i class="fas fa-calendar-alt"></i><fmt:formatDate value="${docQna.csDate}" pattern="yy-MM-dd"/></span>
				                <p>${docQna.csTitle}</p>
            				</div>
        				</div>
       				</c:forEach>
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