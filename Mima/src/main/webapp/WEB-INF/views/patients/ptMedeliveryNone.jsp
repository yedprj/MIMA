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
					<li><a href="ptMain"><i class="fas fa-columns"></i>대쉬보드</a></li>
					<li><a href="ptBookManage"><i class="fas fa-calendar-alt"></i>나의 예약관리</a></li>
					<li><a href="ptHistory"><i class="fas fa-calendar-alt"></i>나의 진료내역</a></li>
					<li><a href="ptReview"><i class="fas fa-star"></i>나의 후기</a></li>
					<li><a href="ptMedelivery" class="current"><i class="fas fa-comment-medical"></i>약배달 신청</a></li>
					<li><a href="ptDeliveryList"><i class="fas fa-ambulance"></i>배송 현황</a></li>
					<li><a href="ptProfileDetail"><i class="fas fa-user"></i>프로필 관리</a></li>
					<li><a href="ptPwChangeForm"><i class="fas fa-unlock-alt"></i>비밀번호 변경</a></li>
					<li>
						<form id="logOutfrm1" name="logOutfrm1" action="../logout" method="post">
							<a href="#" id="logoutBtn1"><i class="fas fa-sign-out-alt"></i>로그아웃</a>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						</form>
					</li>
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
                                	약 배달 신청을 등록하지 않았습니다.
                                	<br>
                                	<br>
                                	<div class="btn-box">
                                		<a id="delStatusAgreeBtn" class="theme-btn-one">약배달 신청하기<i class="icon-Arrow-Right"></i></a>
                            		</div>
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

<script>
	$(function(){ 
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";	
		
		var memberNo = ${memberNo};
		console.log("번호: "+ memberNo);
		$("#delStatusAgreeBtn").on("click",function(){
			confirm("약배달을 신청하시겠습니까?")
			if(confirm){
				$.ajax({
	    			url : "deliberyStatusUpdate",
	    			method : "post",
	    			data : JSON.stringify({
	    				memberNo : memberNo,
	    				deliveryStatus : "y"
	    			}),
	    			beforeSend : function(xhr) {
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
	    			dataType : "json", 
	    			contentType : "application/json",
	    			success : function(data){
	    				if( data > 0) {
	    					console.log("업데이트 성공!")
	    					location.href= "ptMedelivery";
	    				}else {
	    					console.log("업데이트 실패!")
	    					return;
	    				}
	    			}  // success end
	    		}); //  ajax end
			}else {
				return;
			}
			
		});// delStatusAgreeBtn end
		
		// 로그아웃_J18
		$("#logoutBtn1").on("click", function(){
			$('#logOutfrm1').submit();
		});
		
	});
</script>