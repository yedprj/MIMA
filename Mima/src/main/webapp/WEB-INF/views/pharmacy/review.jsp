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
				<h1>약국 대쉬보드</h1>
			</div>
		</div>
	</div>
	<div class="lower-content">
		<ul class="bread-crumb clearfix">
			<li><a href="${pageContext.request.contextPath}">Home</a></li>
			<li>약국 대쉬보드</li>
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
						<p>Qualitative Pharmacy</p>
					</div>
				</div>
			</div>
			<div class="profile-info">
				<ul class="list clearfix">
					<li><a id="dash" href="${pageContext.request.contextPath}/pharmacy/pharmacyDash?memberNo=${session.memberNo}" class="current"><i
							class="fas fa-columns"></i>대쉬보드</a></li>
					<li><a id="delivery" href="${pageContext.request.contextPath}/pharmacy/medDelivery"><i class="fas fa-ambulance"></i>약배달관리</a></li>
					<li><a id="guid" href="${pageContext.request.contextPath}/pharmacy/medGuid"><i class="fas fa-comment-medical"></i>복약지도관리</a></li>
					<li><a id="revicw" href="${pageContext.request.contextPath}/pharmacy/review"><i class="fas fa-star"></i>약국 후기</a></li>
					<li><a id="ques" href="${pageContext.request.contextPath}/pharmacy/phaQna"><i class="fas fa-comments"></i>문의</a><span>20</span></li>
					<li><a id="profile" href="${pageContext.request.contextPath}/pharmacy/myProfile?memberNo=${session.memberNo}"><i class="fas fa-user"></i>약국 프로필</a></li>
					<li><a id="pwUpdate" href="${pageContext.request.contextPath}/pharmacy/pwUpdate?memberNo=${session.memberNo}"><i
							class="fas fa-unlock-alt"></i>비밀번호 변경</a></li>
					<li><a id="logout" href="login.html"><i class="fas fa-sign-out-alt"></i>로그아웃</a></li>
				</ul>
			</div>
		</div>
	</div>
	
	<div class="right-panel">
                <div class="content-container">
                    <div class="outer-container">
                        <div class="review-list">
                            <div class="title-box clearfix">
                                <div class="text pull-left"><h3>Reviews List</h3></div>
                                <div class="select-box pull-right">
                                    <select class="wide">
                                       <option data-display="Any Time">Any Time</option>
                                       <option value="1">Latest Reviews</option>
                                       <option value="2">Oldest Reviews</option>
                                    </select>
                                </div>
                            </div>
                            <div class="comment-inner">
                                <div class="single-comment-box">
                                    <div class="comment">
                                        <figure class="comment-thumb"><img src="${pageContext.request.contextPath}/resources/assets/images/resource/comment-1.png" alt=""></figure>
                                        <h4>Terry Bradshaw</h4>
                                        <span class="comment-time"><i class="fas fa-calendar-alt"></i>15 Sep 2020, 09:30AM</span>
                                        <ul class="rating clearfix">
                                            <li><i class="icon-Star"></i></li>
                                            <li><i class="icon-Star"></i></li>
                                            <li><i class="icon-Star"></i></li>
                                            <li><i class="icon-Star"></i></li>
                                            <li class="light"><i class="icon-Star"></i></li>
                                        </ul>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod ux tempor incididunt labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis.</p>
                                        <a href="review.html" class="replay-btn"><i class="fas fa-share"></i>Reply Now</a>
                                    </div>
                                    <div class="comment replay-comment">
                                        <figure class="comment-thumb"><img src="${pageContext.request.contextPath}/resources/assets/images/resource/comment-2.png" alt=""></figure>
                                        <h4>Rex Allen</h4>
                                        <span class="comment-time"><i class="fas fa-calendar-alt"></i>14 Sep 2020, 09:30AM</span>
                                        <ul class="rating clearfix">
                                            <li><i class="icon-Star"></i></li>
                                            <li><i class="icon-Star"></i></li>
                                            <li><i class="icon-Star"></i></li>
                                            <li><i class="icon-Star"></i></li>
                                            <li class="light"><i class="icon-Star"></i></li>
                                        </ul>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod ux tempor incididunt labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis.</p>
                                        <a href="review.html" class="replay-btn"><i class="fas fa-share"></i>Reply Now</a>
                                    </div>
                                </div>
                                <div class="single-comment-box">
                                    <div class="comment">
                                        <figure class="comment-thumb"><img src="${pageContext.request.contextPath}/resources/assets/images/resource/comment-3.png" alt=""></figure>
                                        <h4>Julia Jhones</h4>
                                        <span class="comment-time"><i class="fas fa-calendar-alt"></i>15 Sep 2020, 09:30AM</span>
                                        <ul class="rating clearfix">
                                            <li><i class="icon-Star"></i></li>
                                            <li><i class="icon-Star"></i></li>
                                            <li><i class="icon-Star"></i></li>
                                            <li><i class="icon-Star"></i></li>
                                            <li class="light"><i class="icon-Star"></i></li>
                                        </ul>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod ux tempor incididunt labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis.</p>
                                        <a href="review.html" class="replay-btn"><i class="fas fa-share"></i>Reply Now</a>
                                    </div>
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