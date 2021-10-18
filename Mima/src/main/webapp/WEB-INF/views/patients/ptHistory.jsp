<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
th, td {
		text-align: center;
		}
		
.doctors-appointment .doctors-table tr td .accept {
	align: center;
	margin-right: 80px;
}
</style>

<!-- doctors-dashboard -->
<!--page-title-two-->
<section class="page-title-two">
    <div class="title-box centred bg-color-2">
        <div class="pattern-layer">
            <div class="pattern-1" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-70.png);"></div>
			<div class="pattern-2" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-71.png);"></div>
    	</div>
	    <div class="auto-container">
	        <div class="title">
	            <h1>진료내역</h1>
	        </div>
	    </div>
	</div>
	<div class="lower-content">
	    <ul class="bread-crumb clearfix">
	        <li><a href="${pageContext.request.contextPath}">Home</a></li>
	            <li>진료내역</li>
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
		            <p>MDS - Periodontology</p>
	            </div>
	        </div>
        </div>
        <div class="profile-info">
            <ul class="list clearfix">
					<li><a href="ptMain" ><i class="fas fa-columns"></i>대쉬보드</a></li>
					<li><a href="ptBookManage"><i class="fas fa-calendar-alt"></i>나의 예약관리</a></li>
					<li><a href="ptHistory" class="current"><i class="fas fa-calendar-alt"></i>나의 진료내역</a></li>
					<li><a href="ptDoctor"><i class="fas fa-wheelchair"></i>내가 찜한 의사</a></li>
					<li><a href="ptReview"><i class="fas fa-star"></i>나의 후기</a></li>
					<li><a href="ptMedelivery"><i class="fas fa-ambulance"></i>약 배달관리</a></li>
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
            <div class="appointment-list">
					<div class="upper-box clearfix">
                    <div class="text pull-left">
                        <h3>진료내역</h3>
                        <span>지난 진료내역을 조회합니다.</span>
                    </div>
                    <div class="select-box pull-right">
							<select class="wide" id="selectBox" onchange="searchCheck()">
								<option value="latest">최신순</option>
								<option value="oldest">오래된순</option>
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
				     <div class="doctors-list" id="latest" style="display: block;">
				         <div class="table-outer">
				             <table class="doctors-table">
				               <thead class="table-header">
				                   <tr>
				                       <th>환자명</th>
				                       <th>예약번호</th>
				                       <th>진료일</th>
				                       <th>예약일</th>
				                       <th>결제금액</th>
				                       <th>후기쓰기</th>
				                   </tr>    
				               </thead>
				               <tbody id="ptHxList">
				               	<c:forEach items="${ptHistoryList}" var="ptHistoryList">
									<tr>
										<td>
											<div class="name-box">
												<figure class="image">
														<img src="${pageContext.request.contextPath}/resources/assets/images/resource/dashboard-doc-1.png" alt="">
												</figure>
	                                             <h5>${ptHistoryList.name}</h5>
	                                             <span class="docno"># ${ptHistoryList.docNo}</span>
	                                        </div>
	                                    </td>
										<td id="bkNo">${ptHistoryList.bookingNo}</td>
										<td>
											<fmt:formatDate value="${ptHistoryList.consultDate}" pattern="yy-MM-dd"/>
											<span class="time">${ptHistoryList.consultTime}</span>
										</td>
										<td><fmt:formatDate value="${ptHistoryList.bookingDate}" pattern="yy-MM-dd"/></td>
										<td><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${ptHistoryList.price}" /></td>
										<!-- s:1015 후기 작성 버튼 -->
										<td id="${ptHistoryList.bookingNo}"><button class="accept" id="reviewBtn"><i class="fas fa-check"></i>후기쓰기</button></td>
									</tr>
								</c:forEach>
                               </tbody>    
                            </table>
                          </div>
                      </div>
                  </div>
                  
				<div class="doctors-appointment">
				     <div class="doctors-list" id="oldest" style="display: none;">
				         <div class="table-outer">
				             <table class="doctors-table">
				               <thead class="table-header">
				                   <tr>
				                       <th>환자명</th>
				                       <th>예약번호</th>
				                       <th>진료일</th>
				                       <th>예약일</th>
				                       <th>결제금액</th>
				                       <th>후기쓰기</th>
				                   </tr>    
				               </thead>
				               <tbody id="ptHxList">
				               	<c:forEach items="${ptHistoryOldestList}" var="ptHistoryOldestList">
									<tr>
										<td>
											<div class="name-box">
												<figure class="image">
														<img src="${pageContext.request.contextPath}/resources/assets/images/resource/dashboard-doc-1.png" alt="">
												</figure>
	                                             <h5>${ptHistoryOldestList.name}</h5>
	                                             <span class="docno"># ${ptHistoryOldestList.docNo}</span>
	                                        </div>
	                                    </td>
										<td id="bkNo">${ptHistoryOldestList.bookingNo}</td>
										<td>
											<fmt:formatDate value="${ptHistoryOldestList.consultDate}" pattern="yy-MM-dd"/>
											<span class="time">${ptHistoryOldestList.consultTime}</span>
										</td>
										<td><fmt:formatDate value="${ptHistoryOldestList.bookingDate}" pattern="yy-MM-dd"/></td>
										<td><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${ptHistoryOldestList.price}" /></td>
										<!-- s:1015 후기 작성 버튼 -->
										<td id="${ptHistoryOldestList.bookingNo}"><button class="accept" id="reviewBtn"><i class="fas fa-check"></i>후기쓰기</button></td>
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
					<div class="pagination-wrapper" id="latestPage" style="display: block;">
						<ul class="pagination">
							<c:if test="${pageMaker.prev }">
								<li class="paginate_button previous"><a href="ptHistory?pageNum=${pageMaker.startPage-1 }">이전</a></li>
							</c:if>
								
							<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
								<li class="paginate_button"><a href="ptHistory?pageNum=${num }">${num }</a></li>
							</c:forEach>
								
							<c:if test="${pageMaker.next }">
								<li class="paginate_button next"><a href="ptHistory?pageNum=${pageMaker.endPage+1 }">다음</a></li>
							</c:if>
						</ul>
					</div>
			<!-- pagination end -->
            <!-- pagination  -->
					<div class="pagination-wrapper" id="oldestPage" style="display: none;">
						<ul class="pagination">
							<c:if test="${pageMaker.prev }">
								<li class="paginate_button previous"><a href="ptHistory?pageNum=${pageMaker.startPage-1 }">이전</a></li>
							</c:if>
								
							<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
								<li class="paginate_button"><a href="ptHistory?pageNum=${num }">${num }</a></li>
							</c:forEach>
								
							<c:if test="${pageMaker.next }">
								<li class="paginate_button next"><a href="ptHistory?pageNum=${pageMaker.endPage+1 }">다음</a></li>
							</c:if>
						</ul>
					</div>
			<!-- pagination end -->
        </div>
    </div>
</section>
<!-- doctors-dashboard -->

<script type="text/javascript">
//page on load
$(function(){
	
	//리뷰 버튼 누르면 예약번호 가져와서 리뷰쓰기 폼으로 넘어가기
	$('#ptHxList').on('click', '#reviewBtn', function(){
		let bkNo= $(this).parent().attr('id');
		window.open("${pageContext.request.contextPath}/consultation/ptReviewFrm?bookingNo="+bkNo, "review", "width=680,height=950");
		console.log($(this));
		$(this).attr('disabled', true);
	})
	
	
});//end of page on load

function searchCheck() {
	var choose = $("#selectBox option:selected").val();
	
	if (choose == 'latest') {
		$("#latest").css('display','block');
		$("#oldest").css('display', 'none');   
		$("#latestPage").css('display','block');
		$("#oldestPage").css('display', 'none');   
	} else if (choose == 'oldest') {
		$("#latest").css('display','none');
		$("#oldest").css('display', 'block');   
		$("#latestPage").css('display','none');
		$("#oldestPage").css('display', 'block');   
	}
}

$(document).ready(function() {
	$('#selectBox').val('${cri.category}').prop("selected", true);
	searchCheck();
	
	// 로그아웃_J18
	$("#logoutBtn1").on("click", function(){
		$('#logOutfrm1').submit();
	});
});

</script>
