<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	#noticeBtn{
		cursor: pointer;
		position: relative;
	    display: inline-block;
	    width: 50px;
	    height: 50px;
	    line-height: 50px;
	    background: #fff;
	    border-radius: 50%;
	    text-align: center;
	    font-size: 24px;
	    border: 1px solid #e5eded;
	    color: #061a3a;
	    box-shadow: 0 10px 30px #d5edea;
	}
	#noticeBtn:hover{
		background: #39cabb;
	}
	#xbtn {
		width:20px;
		height:20px;
	}
	#xbtn:hover {
		color : #39cabb;
	}
	
</style>
<!-- preloader -->
<div class="preloader"></div>
<!-- preloader -->


<!-- main header -->
<header class="main-header style-two">
	<!-- header-lower -->
	<div class="header-lower">
		<div class="auto-container">
			<div class="outer-box">
				<div class="logo-box">
					<figure class="logo">
						<a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/assets/images/logo-3.png"
							alt=""></a>
					</figure>
				</div>
				<div class="menu-area">
					<!--Mobile Navigation Toggler-->
					<div class="mobile-nav-toggler">
						<i class="icon-bar"></i> <i class="icon-bar"></i> <i
							class="icon-bar"></i>
					</div>
					<nav class="main-menu navbar-expand-md navbar-light">
						<div class="collapse navbar-collapse show clearfix"
							id="navbarSupportedContent">
							<ul class="navigation clearfix">
							
								<!-- li 부분 더 필요하면 만들어서 사용하면 됨 -->
								
								<!-- 진료예약 nav 시작 -->
								<li class="dropdown"><a href="#">진료예약</a>
									<ul>
										<li class="dropdown"><a href="doctors-dashboard.html">진료과목</a>
											<ul>
												<li><a href="${pageContext.request.contextPath}/subject/analysis">정신분석 / 정신치료</a></li>
												<li><a href="${pageContext.request.contextPath}/subject/stress">스트레스 / 트라우마 </a></li>
												<li><a href="${pageContext.request.contextPath}/subject/emotion">기분장애 / 공황 • 불안장애</a></li>
												<li><a href="${pageContext.request.contextPath}/subject/neurosis">신경증 / 성격장애</a></li>
												<li><a href="${pageContext.request.contextPath}/subject/work">직장인 정신건강</a></li>
												<li><a href="${pageContext.request.contextPath}/subject/addic">중독장애</a></li>
												<li><a href="${pageContext.request.contextPath}/subject/geri">노인장애</a></li>
												<li><a href="${pageContext.request.contextPath}/subject/dd">해리장애(다중인격)</a></li>
											</ul></li>
										<li><a href="${pageContext.request.contextPath}/patients/reservationForm">빠른 진료상담</a></li>
										<!-- s:1014 전체 의사 리스트로 이동 -->
										<li><a href="${pageContext.request.contextPath}/getTotalDocList">의사검색</a></li>
									</ul>
								</li>
								<!-- 진료예약 nav 끝 -->
								
								<!-- 마음 챙김 nav 시작-->
								<li class="dropdown"><a href="${pageContext.request.contextPath}/meditation/meditationMain">마음챙김</a>
									<ul>
										<li><a href="${pageContext.request.contextPath}/meditation/totalList"> 전체명상리스트</a>
									</ul>
								</li>
								<!-- 마음 챙김 nav 끝 -->
								
								<!-- 포스트 잇 nav 시작 -->
								<li><a href="${pageContext.request.contextPath}/post/mindPostIt2">포스트 잇</a>
								</li>
								<!-- 포스트 잇 nav 끝 -->
								
								<!-- 문의 nav 시작 -->
								<!-- <li class="dropdown"><a href="index.html">문의</a>
									<div class="megamenu">
										<div class="row clearfix">
											<div class="col-lg-6 col-md-12 col-sm-12 column">
												<ul>
													<li><h4>Elements 1</h4></li>
													<li><a href="about-element-1.html">About Block 01</a></li>
													<li><a href="about-element-2.html">About Block 02</a></li>
													<li><a href="about-element-3.html">About Block 03</a></li>
													<li><a href="feature-element-1.html">Feature Block
															01</a></li>
													<li><a href="feature-element-2.html">Feature Block
															02</a></li>
													<li><a href="process-element-1.html">Process Block
															01</a></li>
													<li><a href="process-element-2.html">Process Block
															02</a></li>
													<li><a href="team-element-1.html">Team Block 01</a></li>
												</ul>
											</div>
											<div class="col-lg-6 col-md-12 col-sm-12 column">
												<ul>
													<li><h4>Elements 2</h4></li>
													<li><a href="team-element-2.html">Team Block 02</a></li>
													<li><a href="news-element-1.html">News Block 01</a></li>
													<li><a href="news-element-2.html">News Block 02</a></li>
													<li><a href="category-element-1.html">Category
															Block 01</a></li>
													<li><a href="category-element-2.html">Category
															Block 02</a></li>
													<li><a href="faq-element.html">Faq Block</a></li>
													<li><a href="cta-element.html">CTA Block</a></li>
													<li><a href="clients-element.html">Clients Block</a></li>
												</ul>
											</div>
										</div>
									</div>
								</li> -->
								<!-- 문의 nav 끝 -->
								
								<!-- 로그인 nav 시작 -->
								<c:if test="${not empty session}">
								<li class="dropdown"><a href="#">마이페이지</a>
									<ul>
										<c:if test="${session.role eq 'admin' }">									
											<li><a href="${pageContext.request.contextPath}/admin/adMain">관리자 페이지</a></li>
										</c:if>
										
										<c:if test="${session.role eq 'doctor' }">
											<li><a href="${pageContext.request.contextPath}/doctor/docMain">닥터 대쉬보드</a></li>
										</c:if>
										
										<c:if test="${session.role eq 'pharmacy' }">
											<li><a href="${pageContext.request.contextPath}/pharmacy/pharmacyDash">약국 대쉬보드</a></li>								
										</c:if>
										
										<c:if test="${session.role eq 'pt' }">
											<li><a href="${pageContext.request.contextPath}/patients/ptMain">환자 대쉬보드</a></li>
										</c:if>
									</ul>
								</li>
								</c:if>
							</ul>
						</div>
					</nav>
				</div>
				<!-- 로그인 로그아웃 p.30 -->
				<!-- K. 10/17 알림 -->
				<div class="right-column pull-right">
                     <div class="author-box ">
                     	<div style="position: relative">
	                         <div class="icon-box  nice-select" tabindex="0" style="position: absolute; top:-41px; box-shadow:none; left:-28px">
	                              <a id="noticeBtn" href="#"><i class="icon-Bell"></i></a>
	                              <ul class="list">
	                         		<li data-value="" data-display="알림내역" class="option selected focus">알림내역</li>
	                         		<c:if test="${empty notice }"><li>내역이 없습니다.</li></c:if>
	                         		<c:if test="${not empty notice }">
	                         			<c:forEach var="notice" items="${notice}">
	                         				<li data-value="${notice.type }" class="option">
	                         					<c:if test="${notice.type eq 'phaCancel' }">
	                         						<span id="cancelAlarm"><b>${notice.pharmacyInfo}</b>&nbsp;&nbsp;취소알림이 있습니다.</span>&nbsp;&nbsp; 
	                         						<a id="xbtn" data-no="${notice.pushNo }"><i class="fas fa-times"></i></a>
	                         					</c:if>
	                         				</li>	
	                         			</c:forEach>
	                         		</c:if>
	                         	</ul>
	                         </div>
                     	</div>
       	             </div>
                </div>
                <!-- 알림 end -->	
				
				<div class="btn-box">
					<sec:authorize access="isAnonymous()">
						<a href="${pageContext.request.contextPath}/login" class="theme-btn-one"><i
							class="icon-image"></i>Login Now</a>
					</sec:authorize>
					
					<sec:authorize access="isAuthenticated()">
						${session.name }님
						<form id="logOutfrm" name="logOutfrm" action="${pageContext.request.contextPath}/logout" method="post">
							<a href="#" id="logoutBtn" class="theme-btn-one mx-3"><i class="icon-image"></i>Logout</a>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}">
						</form>
					</sec:authorize>
				</div>
			<div id="msgStack"></div>
			</div>
		</div>
	</div>

	<!--sticky Header-->
	<div class="sticky-header">
		<div class="auto-container">
			<div class="outer-box">
				<div class="logo-box">
					<figure class="logo">
						<a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/assets/images/small-logo.png"
							alt=""></a>
					</figure>
				</div>
				<div class="menu-area">
					<nav class="main-menu clearfix">
						<!--Keep This Empty / Menu will come through Javascript-->
					</nav>
				</div>
				
						
				<div class="btn-box">
					<sec:authorize access="isAnonymous()">
						<a href="${pageContext.request.contextPath}/login" class="theme-btn-one"><i
							class="icon-image"></i>Login Now</a>
					</sec:authorize>
					
					<sec:authorize access="isAuthenticated()">
						${session.name }님
						<form id="logOutfrm" name="logOutfrm" action="${pageContext.request.contextPath}/logout" method="post">
							<a href="#" id="logoutBtn" class="theme-btn-one mx-3"><i class="icon-image"></i>Logout</a>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}">
						</form>
					</sec:authorize>
				</div>
				<div id="msgStack"></div>
			</div>
		</div>
	</div>
</header>
<!-- main-header end -->

<!-- Mobile Menu  -->
<div class="mobile-menu">
	<div class="menu-backdrop"></div>
	<div class="close-btn">
		<i class="fas fa-times"></i>
	</div>

	<nav class="menu-box">
		<div class="nav-logo">
			<a href="index.html"><img src="${pageContext.request.contextPath}/resources/assets/images/logo-2.png" alt=""
				title=""></a>
		</div>
		<div class="menu-outer">
			<!--Here Menu Will Come Automatically Via Javascript / Same Menu as in Header-->
		</div>
		<div class="contact-info">
			<h4>Contact Info</h4>
			<ul>
				<li>대구 중구 국채보상로 537 5층(상서동)</li>
				<li>+82 053-421-2460</li>
				<li><a href="mailto:info@example.com">info@miraclemind.com</a></li>
			</ul>
		</div>
		<div class="social-links">
			<ul class="clearfix">
				<li><a href="index.html"><span class="fab fa-twitter"></span></a></li>
				<li><a href="index.html"><span
						class="fab fa-facebook-square"></span></a></li>
				<li><a href="index.html"><span class="fab fa-pinterest-p"></span></a></li>
				<li><a href="index.html"><span class="fab fa-instagram"></span></a></li>
				<li><a href="index.html"><span class="fab fa-youtube"></span></a></li>
			</ul>
		</div>
	</nav>
</div>

<!-- End Mobile Menu -->
<script>
	$(function() {
		
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		
		$("#logoutBtn").on("click", function(){
			$('#logOutfrm').submit();
		});
		
		$("#noticeBtn").on("click", function(){
			$("#noticeSelect").css("display","block");
		});
		
		// K. 10/19 알림 클릭시 이동
		$(document).on("click","#cancelAlarm", function(){
			location.href= "${pageContext.request.contextPath}/patients/ptDeliveryList";
		}); // 약국알림 리스트 클릭시 이동	
		
		// K. 10/19 알림 x 버튼 클릭시 push 삭제  ---> 수정해야함 삭제가 안됨 ㅠㅠ
		$(document).on("click","#xbtn", function(){
			var pushNo = $(this).data("no");
			
			console.log(pushNo);
			var li = $(this).parent();
			$.ajax({
				url : 'pushDelete',
				type : 'post',
				data : { 
					pushNo : pushNo
				},
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},		 
				success : function(data) {
					console.log(data);
					li.remove();
				}
			});// ajax end
			
		});
		
	});
</script>