<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
th, td {
	text-align: center;
}

.doctors-appointment .title-box h3 {
	margin-bottom: 5px;
}

.doctors-appointment .title-box .btn-box .theme-btn-one {
	margin-top: 20px;
}

.doctors-dashboard .review-list .comment-inner .single-comment-box .comment h4 {
	margin-bottom: 5px;
}

.cusBtn {
	padding: 9px 28px;
	margin-top: 20px;
}

#deliveryCancelBtn {
	cursor: pointer;
}
.modal{ 
  position:absolute; 
  width:100%; 
  height:100%; 
  background: rgba(0,0,0,0.8); 
  top:0; 
  left:0; 
  display:none;
}
.modal_content{
  width:500px;
  background:#fff; border-radius:10px;
  position:relative; top:35%; left:50%;
  margin-top:-300px; 
  margin-left:-200px;
  text-align:center;
  box-sizing:border-box; padding:74px 0;
  line-height:23px; cursor:pointer;
}
</style>

<!-- doctors-dashboard -->
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
				<h1>환자 대쉬보드</h1>
			</div>
		</div>
	</div>
	<div class="lower-content">
		<ul class="bread-crumb clearfix">
			<li><a href="${pageContext.request.contextPath}">Home</a></li>
			<li>환자 대쉬보드</li>
		</ul>
	</div>
</section>
<!--page-title-two end-->

<section class="doctors-dashboard bg-color-3">

	<div class="left-panel">
		<div class="profile-box">
			<div class="upper-box">
				<figure class="profile-image">
					<c:choose>
							<c:when test="${not empty session.ptProfilePhoto }">
								<img src="FileDown.do?fname=${session.ptProfilePhoto}">
							</c:when>
							<c:otherwise>
								<img src="${pageContext.request.contextPath}/resources/assets/images/resource/profile-2.png" alt="">
							</c:otherwise>
						</c:choose>

				</figure>
				<div class="title-box centred">
					<div class="inner">
						<h3>${session.name}</h3>
						<p>MDS - Periodontology</p>
					</div>
				</div>
			</div>
			<div class="profile-info">
				<ul class="list clearfix">
					<li><a href="ptMain" class="current"><i class="fas fa-columns"></i>대쉬보드</a></li>
					<li><a href="ptBookManage"><i class="fas fa-calendar-alt"></i>나의 예약관리</a></li>
					<li><a href="ptHistory"><i class="fas fa-calendar-alt"></i>나의 진료내역</a></li>
					<li><a href="ptReview"><i class="fas fa-star"></i>나의 후기</a></li>
					<li><a href="ptMedelivery"><i class="fas fa-comment-medical"></i>약배달 신청</a></li>
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
				<div class="feature-content">
					<div class="row clearfix">
						<div class="col-xl-4 col-lg-12 col-md-12 feature-block">
							<div class="feature-block-two">
								<div class="inner-box">
									<div class="pattern">
										<div class="pattern-1"
											style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-79.png);"></div>
										<div class="pattern-2"
											style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-80.png);"></div>
									</div>
									<div class="icon-box">
										<i class="icon-Dashboard-3"></i>
									</div>
									<h3>${ptMyListCount}</h3>
									<p>나의 예약 수</p>
								</div>
							</div>
						</div>
						<div class="col-xl-4 col-lg-12 col-md-12 feature-block">
							<div class="feature-block-two">
								<div class="inner-box">
									<div class="pattern">
										<div class="pattern-1"
											style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-81.png);"></div>
										<div class="pattern-2"
											style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-82.png);"></div>
									</div>
									<div class="icon-box">
										<i class="icon-Dashboard-1"></i>
									</div>
									<h3>${ptMyHistoryCount}</h3>
									<p>진료내역 수</p>
								</div>
							</div>
						</div>
						<div class="col-xl-4 col-lg-12 col-md-12 feature-block">
							<div class="feature-block-two">
								<div class="inner-box">
									<div class="pattern">
										<div class="pattern-1"
											style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-83.png);"></div>
										<div class="pattern-2"
											style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-84.png);"></div>
									</div>
									<div class="icon-box">
										<i class="icon-Dashboard-2"></i>
									</div>
									<h3>${ptMyReviewCount}</h3>
									<p>나의 후기 수</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="doctors-appointment">
					<div class="title-box">
						<h3>오늘의 예약</h3>
						<span>오늘 예정된 접수를 보여줍니다.</span>
						<div class="btn-box">
							<a href="ptBookManage" class="theme-btn-one">예약관리<i
								class="icon-Arrow-Right"></i></a>
						</div>
					</div>
					<div class="doctors-list">
						<div class="table-outer">
							<table class="doctors-table">
								<thead class="table-header">
									<tr>
										<th>의사명</th>
										<th>예약번호</th>
										<th>진료일</th>
										<th>예약일</th>
										<th>결제금액</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="list">
										<tr>
											<td>
												<div class="name-box">
													<figure class="image">
														<c:choose>
															<c:when test="${not empty session.ptProfilePhoto }">
																<img src="FileDown.do?fname=${session.ptProfilePhoto}">
															</c:when>
															<c:otherwise>
																<img
																	src="${pageContext.request.contextPath}/resources/assets/images/resource/profile-2.png"
																	alt="">
															</c:otherwise>
														</c:choose>
													</figure>
													<h5>${list.name} 의사</h5>
													<span class="docno"># ${list.docNo}</span>
												</div>
											</td>
											<td>${list.bookingNo}</td>
											<td><fmt:formatDate value="${list.consultDate}"
													pattern="yy-MM-dd" /> <span class="time">${list.consultTime}</span>
											</td>
											<td><fmt:formatDate value="${list.bookingDate}"
													pattern="yy-MM-dd" /></td>
											<td><fmt:setLocale value="ko_KR" /> <fmt:formatNumber
													type="currency" value="${list.price}" /></td>
											<td>${list.payStatus}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<br>

				<div class="doctors-appointment">
					<div class="title-box">
						<h3>진료내역</h3>
						<span>최근 진행된 진료 5건을 조회합니다.</span>
						<div class="btn-box">
							<a href="ptHistory" class="theme-btn-one">전체보기<i
								class="icon-Arrow-Right"></i></a>
						</div>
					</div>
					<div class="doctors-list">
						<div class="table-outer">
							<table class="doctors-table">
								<thead class="table-header">
									<tr>
										<th>의사명</th>
										<th>예약번호</th>
										<th>진료일</th>
										<th>예약일</th>
										<th>결제금액</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${ptMainhisList}" var="ptMainhisList">
										<tr>
											<td>
												<div class="name-box">
													<figure class="image">
														<c:choose>
															<c:when test="${not empty session.ptProfilePhoto }">
																<img src="FileDown.do?fname=${session.ptProfilePhoto}">
															</c:when>
															<c:otherwise>
																<img
																	src="${pageContext.request.contextPath}/resources/assets/images/resource/profile-2.png"
																	alt="">
															</c:otherwise>
														</c:choose>
													</figure>
													<h5>${ptMainhisList.name} 의사</h5>
													<span class="ptno">#${ptMainhisList.ptNo}</span>
												</div>
											</td>
											<td>${ptMainhisList.bookingNo}</td>
											<td><fmt:formatDate
													value="${ptMainhisList.consultDate}" pattern="yy-MM-dd" />
												<span class="time">${ptMainhisList.consultTime}</span></td>
											<td><fmt:formatDate
													value="${ptMainhisList.bookingDate}" pattern="yy-MM-dd" /></td>
											<td><fmt:setLocale value="ko_KR" /> <fmt:formatNumber
													type="currency" value="${ptMainhisList.price}" /></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				
				<!-- K. 10/ 17 배송현황 -->
				<br>
				<div class="doctors-appointment">
					<div class="title-box">
						<h3>배송현황</h3>
						<span>최근 배송현황 5건을 조회합니다.</span>
						<div class="btn-box">
							<a href="ptDeliveryList" class="theme-btn-one">자세히 보기<i
								class="icon-Arrow-Right"></i></a>
						</div>
					</div>
					<div class="doctors-list">
						<div class="table-outer">
							<table class="doctors-table">
								<thead class="table-header">
									<tr>
										<th>진료일</th>
										<th>진료과목</th>
										<th>진료의사</th>
										<th>신청약국</th>
										<th>약배달 배송현황</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="del" items="${ptDeliveryStatusList}">
										<tr style="height:80px;">
											<td><p><fmt:formatDate value="${del.consultDate}" type="both" pattern="YY-MM-dd" /></p></td>
											<td><p>${del.subject}</p></td>
											<td><p><b>Dr.</b> ${del.docName}<p></td>
											<td><p>${del.pharmacyName}</p></td>
											<td id="delstatus">
												<c:if test="${del.deliveryStatus eq 'p'}">
													<span class="status">배달완료</span>
												</c:if>
												<c:if test="${del.deliveryStatus eq 'n'}">
													<span class="status pending">신청완료</span>
												</c:if>
												<c:if test="${del.deliveryStatus eq 'c'}">
													<span id="deliveryCancelBtn" data-no="${del.bookingNo }" class="status cancel">신청취소</span>
												</c:if>
												<c:if test="${del.deliveryStatus eq 'y'}">
													<span class="status pending">배송시작</span>
												</c:if>
											</td>
											<td></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<br>

				<div class="review-list">
					<div class="title-box">
						<h3>나의 후기</h3>
						<span>최근에 작성한 후기 5건을 조회합니다.</span>
						<div class="btn-box">
							<a href="ptReview" class="theme-btn-one cusBtn">전체보기<i
								class="icon-Arrow-Right"></i></a>
						</div>
					</div>
					<div class="comment-inner">
						<c:forEach items="${ptMainreList}"
							var="ptMainreList">
							<div class="single-comment-box">
								<div class="comment">
									<figure class="comment-thumb">
										<c:choose>
											<c:when test="${not empty session.ptProfilePhoto }">
												<img src="FileDown.do?fname=${session.ptProfilePhoto}">
											</c:when>
											<c:otherwise>
												<img
													src="${pageContext.request.contextPath}/resources/assets/images/resource/profile-2.png"
													alt="">
											</c:otherwise>
										</c:choose>
									</figure>
									<c:if test="${ptMainreList.cmainCategory eq 'doc'}">
						             	<h4>${ptMainreList.name} 의사</h4>
						             </c:if>
						             <c:if test="${ptMainreList.cmainCategory eq 'pha'}">
						             	<h4>${ptMainreList.name} 약사</h4>
						             </c:if>
									
									<span class="comment-time"><i
										class="fas fa-calendar-alt"></i>
									<fmt:formatDate value="${ptMainreList.regDate}"
											pattern="yy-MM-dd" /></span>
									<ul class="rating clearfix">
										<c:forEach var="i" begin="1"
											end="${ptMainreList.reviewPoint}">
											<span style="color: #ffab01;"><i class="icon-Star"></i></span>
										</c:forEach>
										<c:forEach var="i" begin="1"
											end="${5-ptMainreList.reviewPoint}">
											<i class="icon-Star"></i>
										</c:forEach>
									</ul>
									<p>${ptMainreList.contents}</p>
								</div>
							</div>
						</c:forEach>
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

 <!-- appointment-section -->
 		<div class="modal">
        <section class="modal_content appointment-section bg-color-3">
            <div class="auto-container">
                <div class="row clearfix">
                    <div id="modalContentCss" class="col-lg-12 col-md-12 col-sm-12 left-column">
                        <div class="appointment-information">
                            <div class="title-box">
                                <h3>약배달 취소건</h3>
                            </div>
                            <div class="inner-box">
                                <div class="information-form">
                                    <h3>약배달 신청 취소 내역</h3>
                                    <form action="book-appointment.html" method="post">
                                        <div class="row clearfix">
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>취소 약국명</label>
                                                <input type="text" name=pharmacyName >
                                            </div>
                                            <div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                                <label>(취소사유)</label>
                                                <textarea id="message" name="deliveryDecline" ></textarea>
                                            </div>
                                        </div>
                                    </form>
                                </div>
		                        <div class="btn-box">
		                            <a id="delReturnBtn" class="theme-btn-one">재신청하러 가기<i class="icon-Arrow-Right"></i></a>
		                            <button id="cancelBtn" class="cancel-btn">취소</button>
		                        </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- appointment-section end -->
        </div>

<script>
$(function(){
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
  $("#logoutBtn1").on("click", function(){
			$('#logOutfrm1').submit();
	});	
	// K.10/18 약배달 취소 버튼 클릭시 사유 가져오기
	$(document).on("click","#deliveryCancelBtn", function(){
		var bookingNo = $(this).data("no");
		
		// 취소건 내역 ajax로 호출
		$.ajax({
			url : 'ptDelCancelSelect',
			type : 'post',
			data : { 
				bookingNo : bookingNo
			},
			beforeSend : function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},		 
			success : function(data) {
				console.log(data);
				$(".modal").fadeIn();
				$("input[name='pharmacyName']").val(data.pharmacyName);
				$("#message").val(data.deliveryDecline);
				
			}
		});// ajax end
		
		
					
		  
		$("#cancelBtn").click(function(){
		    $(".modal").fadeOut();
		});
		
		
	}); // 약배달 취소버튼 클릭 end
	
});
 
</script>
