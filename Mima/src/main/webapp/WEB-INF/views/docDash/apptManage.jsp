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
				 <!-- s:1022 의사 왼쪽 프로필사진 세션에서 가져오는것-->
                <figure class="image-box profile-image">
					<c:choose>
	                     <c:when test="${not empty session.ptProfilePhoto }">
	                        <img src="FileDown.do?fname=${session.ptProfilePhoto}">
	                     </c:when>
	                     <c:otherwise>
	                        <img src="${pageContext.request.contextPath}/resources/assets/images/resource/profile-2.png"
	                  alt="">
	                     </c:otherwise>
	                  </c:choose>
				</figure>
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
	                <li><a href="apptManage" class="current"><i class="fas fa-clock"></i>예약관리</a></li>
	                <li><a href="apptHistory"><i class="fas fa-calendar-alt"></i>진료내역</a></li>
	                <li><a href="patientList"><i class="fas fa-wheelchair"></i>나의 환자들</a></li>
	                <li><a href="docReview"><i class="fas fa-star"></i>나의 후기</a></li>
	                <li><a href="docProfileInsertForm"><i class="fas fa-user"></i>프로필 관리</a></li>
	                <li><a href="docProfileForm"><i class="fas fa-stethoscope"></i>진료관리</a></li>
	                <li><a href="docPwChangeForm"><i class="fas fa-unlock-alt"></i>비밀번호 변경</a></li>
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
						
						<form>
							<div class="form-group">
								<input type="hidden" name="type" value="">
		                    	<input type="hidden" id="pageNum" name="pageNum" value="${pageMaker.cri.pageNum}">
              					<input type="hidden" id="amount" name="amount" value="${pageMaker.cri.amount}">
              					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			                </div>
						</form>
						
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
											<th></th>
										</tr>
									</thead>
									<tbody id="contentAll bookingList">
										<c:forEach items="${apptListPage}" var="apptList">
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
													<c:if test="${apptList.bookingStatus eq 'p'}">
	                                                   	<button type="button" id="${apptList.bookingNo}" class="accept move"><i class="fas fa-check"></i>진료
														시작하기</button>
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
											<th></th>
										</tr>
									</thead>
									<tbody id="contentAll bookingList_soon">
										<c:forEach items="${apptListSoonPage}" var="apptListSoon">
											<tr>
												<td>
													<div class="name-box">
														<figure class="image">
															<img src="${pageContext.request.contextPath}/resources/assets/images/resource/dashboard-doc-1.png" alt="">
														</figure>
														<h5>${apptListSoon.name}</h5>
														<span class="ptno"># no.${apptListSoon.ptNo}</span>
													</div>
												</td>
												<td>${apptListSoon.bookingNo}</td>
												<td><fmt:formatDate value="${apptListSoon.consultDate}"
														pattern="yy-MM-dd" /> <span class="time">${apptListSoon.consultTime}</span>
												</td>
												<td><fmt:formatDate value="${apptListSoon.bookingDate}"
														pattern="yy-MM-dd" /></td>
												<td><fmt:setLocale value="ko_KR" />
													<fmt:formatNumber type="currency" value="${apptListSoon.price}" /></td>
												<td>
													<c:if test="${apptListSoon.bookingStatus eq 'p'}">
														<span class="status">결제완료</span>
													</c:if>
													<c:if test="${apptListSoon.bookingStatus eq 'y'}">
														<span class="status pending">결제예정</span>
													</c:if>
													<c:if test="${apptListSoon.bookingStatus eq 'c'}">
														<span class="status cancel">취소완료</span>
													</c:if>
												</td>
												<td>
													<c:if test="${apptListSoon.bookingStatus eq 'p'}">
	                                                   <button type="button" id="${apptList.bookingNo}" class="accept move"><i class="fas fa-check"></i>진료
														시작하기</button>
	                                                </c:if>
	                                            </td>
											</tr>
											
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
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
										<c:forEach items="${apptListCanceledPage}" var="apptListCanceled">
											<tr>
												<td>
													<div class="name-box">
														<figure class="image">
															<img src="${pageContext.request.contextPath}/resources/assets/images/resource/dashboard-doc-1.png" alt="">
														</figure>
														<h5>${apptListCanceled.name}</h5>
														<span class="ptno"># no.${apptListCanceled.ptNo}</span>
													</div>
												</td>
												<td>${apptListCanceled.bookingNo}</td>
												<td><fmt:formatDate value="${apptListCanceled.consultDate}"
														pattern="yy-MM-dd" /> <span class="time">${apptListCanceled.consultTime}</span>
												</td>
												<td><fmt:formatDate value="${apptListCanceled.bookingDate}"
														pattern="yy-MM-dd" /></td>
												<td><fmt:setLocale value="ko_KR" />
													<fmt:formatNumber type="currency" value="${apptListCanceled.price}" /></td>
												<td>
													<c:if test="${apptListCanceled.bookingStatus eq 'p'}">
														<span class="status">결제완료</span>
													</c:if>
													<c:if test="${apptListCanceled.bookingStatus eq 'y'}">
														<span class="status pending">결제예정</span>
													</c:if>
													<c:if test="${apptListCanceled.bookingStatus eq 'c'}">
														<span class="status cancel">취소완료</span>
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
						
						<!-- pagination  -->
						<div class="pagination-wrapper" id="allPage" style="display: block;">
							<ul class="pagination">
								<c:if test="${pageMaker.prev}">
									<li class="paginate_button previous"><a href="${pageMaker.startPage-1}">이전</a></li>
								</c:if>
									
								<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
									<li class="paginate_button"><a href="${num}">${num}</a></li>
								</c:forEach>
									
								<c:if test="${pageMaker.next}">
									<li class="paginate_button next"><a href="${pageMaker.endPage+1}">다음</a></li>
								</c:if>
							</ul>
						</div>
						<!-- pagination end -->
						
						<!-- pagination  -->
						<div class="pagination-wrapper" id="soonPage" style="display: none;">
							<ul class="pagination">
								<c:if test="${pageMaker.prev}">
									<li class="paginate_button previous"><a href="${pageMaker.startPage-1}">이전</a></li>
								</c:if>
									
								<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
									<li class="paginate_button"><a href="${num}">${num}</a></li>
								</c:forEach>
									
								<c:if test="${pageMaker.next}">
									<li class="paginate_button next"><a href="${pageMaker.endPage+1}">다음</a></li>
								</c:if>
							</ul>
						</div>
						<!-- pagination end -->
						
						<!-- pagination  -->
						<div class="pagination-wrapper" id="canceledPage" style="display: none;">
							<ul class="pagination">
								<c:if test="${pageMaker.prev}">
									<li class="paginate_button previous"><a href="${pageMaker.startPage-1}">이전</a></li>
								</c:if>
									
								<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
									<li class="paginate_button"><a href="${num}">${num}</a></li>
								</c:forEach>
									
								<c:if test="${pageMaker.next}">
									<li class="paginate_button next"><a href="${pageMaker.endPage+1}">다음</a></li>
								</c:if>
							</ul>
						</div>
						<!-- pagination end -->
			</div>
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
				$("#allPage").css('display','block');
				$("#soonPage").css('display', 'none');   
				$("#canceledPage").css('display', 'none');
			} else if (choose == 'soon') {
				$("#all").css('display','none');
				$("#soon").css('display', 'block');   
				$("#canceled").css('display', 'none');
				$("#allPage").css('display','none');
				$("#soonPage").css('display', 'block');   
				$("#canceledPage").css('display', 'none');
			} else if (choose == 'canceled') {
				$("#all").css('display','none');
				$("#soon").css('display', 'none');   
				$("#canceled").css('display', 'block');
				$("#allPage").css('display','none');
				$("#soonPage").css('display', 'none');   
				$("#canceledPage").css('display', 'block');
			}
		}
		
		$(document).ready(function() {
			/* s:1014 진료시작 버튼 이벤트 붙이기 */
			
			var csrfHeaderName = "${_csrf.headerName}";
			var csrfTokenValue = "${_csrf.token}";
			
			$('#selectBox').val('${cri.category}').prop("selected", true);
			searchCheck();
			
			//진료시작 이벤트 s:1018 (없어진거 수정)
			$(document).on('click','.move', function(e){
				
				e.preventDefault();
				let bookingNo =$(this).attr("id");
				console.log("예약번호 ", bookingNo);
				
				alert('진료를 시작합니다.');
				
				//window.open('https://mima.miraclemind.kro.kr:3000/?bookingNo='+bookingNo,'진료방','width=1200,height=900,location=no,status=no,scrollbars=yes');
				window.open('http://localhost:3000/?bookingNo='+bookingNo,'진료방','width=1200,height=900,location=no,status=no,scrollbars=yes');
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
		                        //url="https://mima.miraclemind.kro.kr:3000/"+data.roomId+"?roomId="+data.roomId+"&bookingNo="+bookingNo;
		                        url="http://localhost:3000/"+data.roomId+"?roomId="+data.roomId+"&bookingNo="+bookingNo;
		                        console.log(url);
		                      },
		            error: function(jqXHR, textStatus, err){
		                 alert('text status '+textStatus+', err '+err);
		             }
		          });
		          //ajax 끝
				//소켓메세지 보내기
		          socket.send(url);
				
			})//진료시작 이벤트 끝
			
			
			
			// 로그아웃_J17
			$("#logoutBtn1").on("click", function(){
				$('#logOutfrm1').submit();
			});
		});
	
</script>