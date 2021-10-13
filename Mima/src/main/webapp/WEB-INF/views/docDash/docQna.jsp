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
                    <h3>${session.name}</h3>
                    <p>${clinicName}</p>
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
                <li><a href="docProfileInsertForm"><i class="fas fa-user"></i>프로필 관리</a></li>
                <li><a href="docProfileForm"><i class="fas fa-stethoscope"></i>진료관리</a></li>
                <li><a href="docPwChangeForm"><i class="fas fa-unlock-alt"></i>비밀번호 변경</a></li>
                <li><a href="login.html"><i class="fas fa-sign-out-alt"></i>로그아웃</a></li>
            </ul>
        </div>
    </div>
</div>

<div class="right-panel">
    <div class="content-container">
        <div class="outer-container">
            <div class="review-list">
            
            <section class="questions-section bg-color-3 sec-pad">
	<div class="auto-container">
	    <div class="row clearfix">
	        <div class="col-xl-8 col-lg-12 col-md-12 offset-xl-2 inner-column">
	            <div class="sec-title centred">
	                <p>Have any question?</p>
	                <h2>Ask A Questions</h2>
	            </div>
	            <div class="form-inner">
	                <form action="faq.html" method="post">
	                    <div class="row clearfix">
	                        <div class="col-lg-6 col-md-6 col-sm-12 form-group">
	                            <input type="text" name="name" placeholder="Your Phone" required="">
	                        </div>
	                        <div class="col-lg-6 col-md-6 col-sm-12 form-group">
	                            <input type="text" name="subject" placeholder="Subject" required="">
	                        </div>
	                        <div class="col-lg-12 col-md-12 col-sm-12 form-group">
	                            <textarea name="message" placeholder="Your Message"></textarea>
	                        </div>
	                        <div class="col-lg-12 col-md-12 col-sm-12 form-group message-btn centred">
	                            <button type="submit" class="theme-btn-one">Send Message<i class="icon-Arrow-Right"></i></button>
	                        </div>
	                    </div>
	                </form>
	            </div>
	        </div>
	    </div>
	</div>
</section>
            
                <div class="single-box">
	                <div class="title-box">
	                    <h3>문의하기</h3>
	                </div>
	                <div class="inner-box">
	                    <form action="add-listing.html" method="post">
	                        <div class="row clearfix">
	                            <div class="col-lg-12 col-md-12 col-sm-12 form-group">
	                                <textarea name="message" placeholder="문의사항을 입력하세요."></textarea>
	                            </div>
	                        </div>
	                    </form>
	                </div>
					<div class="btn-box">
				        <a href="add-listing.html" class="theme-btn-one">문의하기<i class="icon-Arrow-Right"></i></a>
				    </div>
	            </div>
            </div>
         </div>
    </div>
</div>



<br>
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