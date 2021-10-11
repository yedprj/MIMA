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
						<h3>${session.name}</h3>
						<p>MDS - Periodontology</p>
					</div>
				</div>
			</div>
			<div class="profile-info">
				<ul class="list clearfix">
	                <li><a href="docMain"><i class="fas fa-columns"></i>대쉬보드</a></li>
	                <li><a href="apptManage" class="current"><i class="fas fa-clock"></i>예약관리</a></li>
	                <li><a href="apptHistory"><i class="fas fa-calendar-alt"></i>진료내역</a></li>
	                <li><a href="patientList"><i class="fas fa-wheelchair"></i>나의 환자들</a></li>
	                <li><a href="docReview"><i class="fas fa-star"></i>나의 후기</a></li>
	                <li><a href="docQna"><i class="fas fa-comments"></i>나의 문의</a></li>
	                <li><a href="docProfileInsertForm"><i class="fas fa-user"></i>프로필 관리</a></li>
	                <li><a href="docProfileForm"><i class="fas fa-user"></i>진료 관리</a></li>
	                <li><a href="docPwChangeForm"><i class="fas fa-unlock-alt"></i>비밀번호 변경</a></li>
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
							<select class="wide" id="selectBox" name="selectBox" onchange="searchCheck()">
								<option value="all">모두보기</option>
								<option value="soon">예정된 접수</option>
								<option value="canceled">취소된 접수</option>
							</select>
						</div>
						
					</div>
					<div class="doctors-appointment">
						<div class="doctors-list" id="all" style="display: block;">
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
									<tbody id="contentAll">
										<c:forEach items="${apptList}" var="apptList">
											<tr>
												<td>
													<div class="name-box">
														<figure class="image">
															<img src="${pageContext.request.contextPath}/resources/assets/images/resource/dashboard-doc-1.png" alt="">
														</figure>
														<h5>${apptList.name}</h5>
														<span class="ptno"># no.${apptList.ptNo}</span>
													</div>
												</td>
												<td>${apptList.bookingNo}</td>
												<td><fmt:formatDate value="${apptList.consultDate}"
														pattern="yy-MM-dd" /> <span class="time">${apptList.consultTime}</span>
												</td>
												<td><fmt:formatDate value="${apptList.bookingDate}"
														pattern="yy-MM-dd" /></td>
												<td><fmt:setLocale value="ko_KR" />
													<fmt:formatNumber type="currency" value="${apptList.price}" /></td>
												<td>
													<c:if test="${apptList.bookingStatus eq 'p'}">
														<span class="status">결제완료</span>
													</c:if>
													<c:if test="${apptList.bookingStatus eq 'y'}">
														<span class="status pending">결제예정</span>
													</c:if>
													<c:if test="${apptList.bookingStatus eq 'c'}">
														<span class="status cancel">취소완료</span>
													</c:if>
												</td>
												<td>
													<c:if test="${apptList.bookingStatus == 'y' || apptList.bookingStatus == 'p'}">
														<!-- 버튼 기능 구현을 위해 수정 p.10/10  -->
                                                    	<button class="cancel" id="paymentCancel" name="paymentCancel">
                                                    		<i class="fas fa-times"></i>Cancel
                                                    	</button>
													</c:if>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						
						<div class="doctors-list" id="soon" style="display: none;">
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
									<tbody id="contentAll">
										<c:forEach items="${apptList}" var="apptList">
											<tr>
												<td>
													<div class="name-box">
														<figure class="image">
															<img src="${pageContext.request.contextPath}/resources/assets/images/resource/dashboard-doc-1.png" alt="">
														</figure>
														<h5>${apptList.name}</h5>
														<span class="ptno"># no.${apptList.ptNo}</span>
													</div>
												</td>
												<td>${apptList.bookingNo}</td>
												<td><fmt:formatDate value="${apptList.consultDate}"
														pattern="yy-MM-dd" /> <span class="time">${apptList.consultTime}</span>
												</td>
												<td><fmt:formatDate value="${apptList.bookingDate}"
														pattern="yy-MM-dd" /></td>
												<td><fmt:setLocale value="ko_KR" />
													<fmt:formatNumber type="currency" value="${apptList.price}" /></td>
												<td>
													<c:if test="${apptList.bookingStatus eq 'p'}">
														<span class="status">결제완료</span>
													</c:if>
													<c:if test="${apptList.bookingStatus eq 'y'}">
														<span class="status pending">결제예정</span>
													</c:if>
													<c:if test="${apptList.bookingStatus eq 'c'}">
														<span class="status cancel">취소완료</span>
													</c:if>
												</td>
												<td>
													<c:if test="${apptList.bookingStatus == 'y' || apptList.bookingStatus == 'p'}">
                                                    	<button class="cancel"><i class="fas fa-times"></i>Cancel</button>
													</c:if>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						
						<div class="doctors-list" id="canceled" style="display: none;">
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
									<tbody id="contentAll">
										<c:forEach items="${apptList}" var="apptList">
											<tr>
												<td>
													<div class="name-box">
														<figure class="image">
															<img src="${pageContext.request.contextPath}/resources/assets/images/resource/dashboard-doc-1.png" alt="">
														</figure>
														<h5>${apptList.name}</h5>
														<span class="ptno"># no.${apptList.ptNo}</span>
													</div>
												</td>
												<td>${apptList.bookingNo}</td>
												<td><fmt:formatDate value="${apptList.consultDate}"
														pattern="yy-MM-dd" /> <span class="time">${apptList.consultTime}</span>
												</td>
												<td><fmt:formatDate value="${apptList.bookingDate}"
														pattern="yy-MM-dd" /></td>
												<td><fmt:setLocale value="ko_KR" />
													<fmt:formatNumber type="currency" value="${apptList.price}" /></td>
												<td>
													<c:if test="${apptList.bookingStatus eq 'p'}">
														<span class="status">결제완료</span>
													</c:if>
													<c:if test="${apptList.bookingStatus eq 'y'}">
														<span class="status pending">결제예정</span>
													</c:if>
													<c:if test="${apptList.bookingStatus eq 'c'}">
														<span class="status cancel">취소완료</span>
													</c:if>
												</td>
												<td>
													<c:if test="${apptList.bookingStatus == 'y' || apptList.bookingStatus == 'p'}">
                                                    	<button class="cancel"><i class="fas fa-times"></i>Cancel</button>
													</c:if>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						
					</div>
				</div>
			</div>

			<!-- pagination  -->
			<div id="allPaging" class="pagination-wrapper" style="display: block;">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li class="paginate_button previous"><a href="${pageContext.request.contextPath}/apptManage?pageNum=${pageMaker.startPage-1}">이전</a></li>
					</c:if>
						
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
						<li class="paginate_button"><a href="${pageContext.request.contextPath}/apptManage?pageNum=${num}">${num}</a></li>
					</c:forEach>
						
					<c:if test="${pageMaker.next}">
						<li class="paginate_button next"><a href="${pageContext.request.contextPath}/apptManage?pageNum=${pageMaker.endPage+1}">다음</a></li>
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
		function searchCheck() {
			var choose = $("#selectBox option:selected").val();
			
			if (choose == 'all') {
				$("#all").css('display','block');
				$("#soon").css('display', 'none');   
				$("#canceled").css('display', 'none');
			} else if (choose == 'soon') {
				$("#all").css('display','none');
				$("#soon").css('display', 'block');   
				$("#canceled").css('display', 'none');
			} else if (choose == 'canceled') {
				$("#all").css('display','none');
				$("#soon").css('display', 'none');   
				$("#canceled").css('display', 'block');
			}
		}
		
		$(document).ready(function() {
			$('#selectBox').val('${cri.category}').prop("selected", true);
			searchCheck();
		});
	
</script>
