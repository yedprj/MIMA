<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
th, td {
	text-align: center;
}

.doctors-appointment .doctors-table tr td .status.pending {
	margin-right: 30px;
}

.doctors-appointment .doctors-table tr td .status {
	margin-right: 30px;
}

.doctors-appointment .doctors-table tr td .accept {
	margin-right: 80px;
}

.cusBtn {
	padding: 9px 28px;
	margin-top: 20px;
}

.doctors-appointment .doctors-table tr td .print {
	margin-right: 80px;
}

.doctors-appointment .title-box h3 {
	margin-bottom: 5px;
}

.doctors-appointment .title-box .btn-box .theme-btn-one {
	margin-top: 20px;
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
				<h1>닥터 대쉬보드</h1>
			</div>
		</div>
	</div>
	<div class="lower-content">
		<ul class="bread-crumb clearfix">
			<li><a href="${pageContext.request.contextPath}">Home</a></li>
			<li>닥터 대쉬보드</li>
		</ul>
	</div>
</section>
<!--page-title-two end-->

<section class="doctors-dashboard bg-color-3">

	<div class="left-panel">
		<div class="profile-box">
			<div class="upper-box">
			<!-- s:1022 의사 왼쪽 프로필사진 세션에서 가져오는것-->
			<figure class="image-box profile-image">
				<c:choose>
                     <c:when test="${not empty session.ptProfilePhoto }">
                        <img src="FileDown.do?fname=${session.ptProfilePhoto}">
                     </c:when>
                     <c:otherwise>
                        <img src="${pageContext.request.contextPath}/resources/assets/images/icons/user.png" alt="">
                     </c:otherwise>
                  </c:choose>
			</figure>
				<div class="title-box centred">
					<div class="inner">
						<h3>${member.name}</h3>
						<p>${clinicName}</p>
					</div>
				</div>
			</div>
			<div class="profile-info">
				<ul class="list clearfix">
					<li><a href="docMain" class="current"><i
							class="fas fa-columns"></i>대쉬보드</a></li>
					<li><a href="apptManage"><i class="fas fa-clock"></i>예약관리</a></li>
					<li><a href="apptHistory"><i class="fas fa-calendar-alt"></i>진료내역</a></li>
					<li><a href="patientList"><i class="fas fa-wheelchair"></i>나의
							환자들</a></li>
					<li><a href="docReview"><i class="fas fa-star"></i>나의 후기</a></li>
					<li><a href="docProfileInsertForm"><i class="fas fa-user"></i>프로필
							관리</a></li>
					<li><a href="docProfileForm"><i class="fas fa-stethoscope"></i>진료관리</a></li>
					<li><a href="docPwChangeForm"><i class="fas fa-unlock-alt"></i>비밀번호
							변경</a></li>
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
									<h3>${countGetList}</h3>
									<p>오늘의 환자 수</p>
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
									<h3>${countPatientList}</h3>
									<p>담당 환자 수</p>
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
										<i class="icon-Dashboard-5"></i>
									</div>
									<h3>${countDocReview}</h3>
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
							<a href="apptManage" class="theme-btn-one">예약관리<i
								class="icon-Arrow-Right"></i></a>
						</div>
					</div>
					<div class="doctors-list">
						<div class="table-outer">
							<table class="doctors-table table-hover">
								<thead class="table-header">
									<tr>
										<th>환자명</th>
										<th>예약번호</th>
										<th>진료일</th>
										<th>예약일</th>
										<th>결제금액</th>
										<th>예약상태</th>
									</tr>
								</thead>
								<tbody id="bookingList">
									<c:forEach items="${bookingList}" var="bookingList">
										<tr>
											<td>
												<div class="name-box" style="padding-left:30px">
												<!-- s:1022환자플필사진 -->
													<figure class="image">
													  <c:choose>
									                     <c:when test="${not empty bookingList.ptProfilePhoto }">
									                        <img src="FileDown.do?fname=${bookingList.ptProfilePhoto}" style="width:55px; height:55px">
									                     </c:when>
									                     <c:otherwise>
									                         <img src="${pageContext.request.contextPath}/resources/assets/images/resource/dashboard-doc-1.png" alt="">
									                     </c:otherwise>
									                  </c:choose>
													</figure>
													<h5>${bookingList.name}</h5>
													<span class="ptno">#${bookingList.ptNo}</span>
												</div>
											</td>
											<td>${bookingList.bookingNo}</td>
											<td><fmt:formatDate value="${bookingList.consultDate}"
													pattern="yy-MM-dd" /> <span class="time">${bookingList.consultTime}</span>
											</td>
											<td><fmt:formatDate value="${bookingList.bookingDate}"
													pattern="yy-MM-dd" /></td>
											<td><fmt:setLocale value="ko_KR"/><fmt:formatNumber
													type="currency" value="${bookingList.price}" /></td>
											<td><c:if test="${bookingList.bookingStatus eq 'p'}">
													<span class="status">결제완료</span>
												</c:if> <c:if test="${bookingList.bookingStatus eq 'y'}">
													<span class="status pending">결제예정</span>
												</c:if> <c:if test="${bookingList.bookingStatus eq 'c'}">
													<span class="status cancel">취소완료</span>
												</c:if></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						</div>
					</div>
				</div>

				<br>

				<div class="doctors-appointment">
					<div class="title-box">
						<h3>진료내역</h3>
						<span>최근 진료 5건을 조회합니다.</span>
						<div class="btn-box">
							<a href="apptHistory" class="theme-btn-one">전체보기<i
								class="icon-Arrow-Right"></i></a>
						</div>
					</div>
					<div class="doctors-list">
						<div class="table-outer table-hover">
							<table class="doctors-table">
								<thead class="table-header">
									<tr>
										<th>환자명</th>
										<th>예약번호</th>
										<th>진료일</th>
										<th>예약일</th>
										<th>결제금액</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${getlatestapptList}" var="getlatestapptList">
										<tr>
											<td>
												<div class="name-box" style="padding-left: 50px;">
												<!--s:1022 의사에게 달린 리뷰올린 환자 사진 -->
													<figure class="image">
														  <c:choose>
										                     <c:when test="${not empty getlatestapptList.ptProfilePhoto }">
										                        <img src="FileDown.do?fname=${getlatestapptList.ptProfilePhoto}" style="width:55px; height:55px">
										                     </c:when>
										                     <c:otherwise>
										                         <img src="${pageContext.request.contextPath}/resources/assets/images/resource/dashboard-doc-1.png" alt="">
										                     </c:otherwise>
										                  </c:choose>
													</figure>
													<h5>${getlatestapptList.name}</h5>
													<span class="ptno">#${getlatestapptList.ptNo}</span>
												</div>
											</td>
											<td>${getlatestapptList.bookingNo}</td>
											<td><fmt:formatDate
													value="${getlatestapptList.consultDate}" pattern="yy-MM-dd" />
												<span class="time">${getlatestapptList.consultTime}</span></td>
											<td><fmt:formatDate
													value="${getlatestapptList.bookingDate}" pattern="yy-MM-dd" /></td>
											<td><fmt:setLocale value="ko_KR" /> <fmt:formatNumber
													type="currency" value="${getlatestapptList.price}" /></td>
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
						<span>최근 후기 5건을 조회합니다.</span>
						<div class="btn-box">
							<a href="docReview" class="theme-btn-one cusBtn">전체보기<i
								class="icon-Arrow-Right"></i></a>
						</div>
					</div>
					<div class="comment-inner">
						<c:forEach items="${getlatestreviewList}" var="getlatestreviewList">
							<div class="single-comment-box">
								<div class="comment">
									<!--s:1022 의사에게 달린 리뷰올린 환자 사진 -->
									<figure class="comment-thumb">
										<c:choose>
						                     <c:when test="${not empty getlatestreviewList.ptProfilePhoto }">
						                        <img src="FileDown.do?fname=${getlatestreviewList.ptProfilePhoto}" style="width:80px; height:80px">
						                     </c:when>
						                     <c:otherwise>
						                         <img src="${pageContext.request.contextPath}/resources/assets/images/resource/comment-1.png" alt="">
						                     </c:otherwise>
						                  </c:choose>
									</figure>
	             					<h4>${getlatestreviewList.nickname}</h4>
									<span class="comment-time"><i
										class="fas fa-calendar-alt"></i>
									<fmt:formatDate value="${getlatestreviewList.regDate}"
											pattern="yy-MM-dd" /></span>
									<ul class="rating clearfix">
										<c:forEach var="i" begin="1"
											end="${getlatestreviewList.reviewPoint}">
											<span style="color: #ffab01;"><i class="icon-Star"></i></span>
										</c:forEach>
										<c:forEach var="i" begin="1"
											end="${5-getlatestreviewList.reviewPoint}">
											<i class="icon-Star"></i>
										</c:forEach>
									</ul>
									<p>${getlatestreviewList.contents}</p>
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

<script>
$(function(){
	
	/* s:1014 진료시작 버튼 이벤트 붙이기 */
	console.log('${session.ptProfilePhoto}');
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	$('#bookingList').on('click','.move', function(e){
		
		e.preventDefault();
		let bookingNo =$(this).attr("href");
		console.log("예약번호 ", bookingNo);
		
		alert('진료를 시작합니다.');
		let url="";
		//uuid 구해서 링크 받아오기 s:1011
		$.ajax({ 
            url: '${pageContext.request.contextPath}/socket/getRmId',
            type: 'GET',
            cache: false, 
            data: {
               bookingNo: bookingNo
            },
            beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					//xhr.setRequestHeader("aa", "bb");
			},
			async: false,
            success: function(data) {
                        console.log("진료방 시작후 방번호",data.roomId);
                        console.log("진료방 시작후 환자번호",data.ptNo);
                        url="http://localhost:3000/"+data.roomId+"?roomId="+data.roomId+"&bookingNo="+bookingNo;
                        console.log(url);
                      },
            error: function(jqXHR, textStatus, err){
                 alert('text status '+textStatus+', err '+err);
             }
          })
		//소켓메세지 보내기
          socket.send(url);
		
		window.open('http://localhost:3000/?bookingNo='+bookingNo,'진료방','width=1200,height=900,location=no,status=no,scrollbars=yes');
	})
	
	// 로그아웃_J17
	$("#logoutBtn1").on("click", function(){
		$('#logOutfrm1').submit();
	});

});//end of page on load
</script>
