<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
th, td {
	text-align: center;
	span: center;
}
.doctors-appointment .doctors-table tr td .status {
	margin-right: 30px;
}

</style>

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
				<h1>예약관리</h1>
			</div>
		</div>
	</div>
	<div class="lower-content">
		<ul class="bread-crumb clearfix">
			<li><a href="${pageContext.request.contextPath}">Home</a></li>
			<li>예약관리</li>
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
					<li><a href="ptBookManage"><i class="fas fa-calendar-alt"></i>나의 예약관리</a></li>
					<li><a href="ptHistory"><i class="fas fa-calendar-alt"></i>나의 진료내역</a></li>
					<li><a href="ptDoctor"><i class="fas fa-wheelchair"></i>내가 찜한 의사</a></li>
					<li><a href="ptReview"><i class="fas fa-star"></i>나의 후기</a></li>
					<li><a href="ptMedelivery"><i class="fas fa-ambulance"></i>약 배달관리</a></li>
					<li><a href="ptProfileDetail"><i class="fas fa-user"></i>프로필 관리</a></li>
					<li><a href="ptPwChangeForm"><i class="fas fa-unlock-alt"></i>비밀번호 변경</a></li>
					<li><a href="login.html"><i class="fas fa-sign-out-alt"></i>로그아웃</a></li>
	            </ul>
			</div>
		</div>
	</div>

	<div class="right-panel">
		<div class="content-container">
			<div class="outer-container">
				<div class="appointment-list">
					<div class="upper-box clearfix">
						<div class="text pull-left">
							<h3>예약관리</h3>
							<span>예정 혹은 취소된 접수들을 확인하고 관리할 수 있습니다.</span>
						</div>

						<div class="select-box pull-right">
							<select class="wide">
								<option data-display="모두보기">모두보기</option>
								<option value="1">예약된 접수</option>
								<option value="2">취소된 접수</option>
							</select>
						</div>
					</div>
					<div class="doctors-appointment">
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
											<th>결제상태</th>
											<th>예약상태</th>

											<th></th>
										</tr>
									</thead>
									<tbody id="contentAll">
										<c:forEach items="${ptbmList}" var="ptbmList">
											<tr>
												<td>
													<div class="name-box">
													<figure class="image">
															<img src="${pageContext.request.contextPath}/resources/assets/images/resource/dashboard-doc-1.png" alt="">
														</figure>
														<h5>${ptbmList.name}</h5>
														<span class="docno"># ${ptbmList.docNo}</span>
													</div>
												</td>
												<td>${ptbmList.bookingNo}</td>
												<td><fmt:formatDate value="${ptbmList.consultDate}"
														pattern="yy-MM-dd" /> <span class="time">${ptbmList.consultTime}</span>
												</td>
												<td><fmt:formatDate value="${ptbmList.bookingDate}"
														pattern="yy-MM-dd" /></td>
												<td><fmt:setLocale value="ko_KR" />
													<fmt:formatNumber type="currency" value="${ptbmList.price}" /></td>
												<td><c:if test="${ptbmList.bookingStatus eq 'p'}">
														<span class="status">결제완료</span>
													</c:if>
													<c:if test="${ptbmList.bookingStatus eq 'y'}">
														<span class="status pending">예약완료</span>
													</c:if> <c:if test="${ptbmList.bookingStatus eq 'c'}">
														<span class="status cancel">취소완료</span>
													</c:if></td>
												<td>
													<c:if test="${ptbmList.bookingStatus eq 'y' || ptbmList.bookingStatus == 'p'}">
														<!-- 버튼 기능 구현을 위해 수정 p.10/10  -->
                                                    	<button class="cancel" id="paymentCancel" name="paymentCancel">
                                                    		<i class="fas fa-times"></i>Cancel
                                                    	</button>
                                                    	<input type="hidden" id="bookingNo" name="bookingNo" value="${ptbmList.bookingNo}"/>
													</c:if>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							</div>
						</div>
					</div>
				</div>
			</div>
					<!-- pagination  -->
					<div class="pagination-wrapper">
						<ul class="pagination">
							<c:if test="${pageMaker.prev }">
								<li class="paginate_button previous"><a href="ptBookManage?pageNum=${pageMaker.startPage-1 }">이전</a></li>
							</c:if>
								
							<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
								<li class="paginate_button"><a href="ptBookManage?pageNum=${num }">${num }</a></li>
							</c:forEach>
								
							<c:if test="${pageMaker.next }">
								<li class="paginate_button next"><a href="ptBookManage?pageNum=${pageMaker.endPage+1 }">다음</a></li>
							</c:if>
						</ul>
					</div>
					<!-- pagination end -->
		</div>
	</div>

</section>
<!-- doctors-dashboard -->

<!--Scroll to top-->
<button class="scroll-top scroll-to-target" data-target="html">
	<span class="fa fa-arrow-up"></span>
</button>

<!-- End of .page_wrapper -->
<script>
	$(function() {
		$('#paymentCancel').on('click', function(){
			
			var csrfHeaderName = "${_csrf.headerName}";
			var csrfTokenValue = "${_csrf.token}";
			var bookingNo = $('#paymentCancel').parent().children("input").val();
			
			console.log(bookingNo);
			
			$.ajax({
				url : 'paymentCancel',
				type : 'post',
				data : {bookingNo : bookingNo},
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				success : function(object) {
					console.log(object);
				},
				error : function(reject) {
					console.log(reject);
				}
			});
		});
	});
</script>