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
            <h1>나의 후기</h1>
        </div>
    </div>
</div>
<div class="lower-content">
    <ul class="bread-crumb clearfix">
        <li><a href="${pageContext.request.contextPath}">Home</a></li>
            <li>나의 후기</li>
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
						<img
							src="${pageContext.request.contextPath}/resources/assets/images/resource/profile-2.png"
							alt="">
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
					<li><a href="ptMain"><i class="fas fa-columns"></i>대쉬보드</a></li>
					<li><a href="ptBookManage"><i class="fas fa-calendar-alt"></i>나의 예약관리</a></li>
					<li><a href="ptHistory"><i class="fas fa-calendar-alt"></i>나의 진료내역</a></li>
					<li><a href="ptReview" class="current"><i class="fas fa-star"></i>나의 후기</a></li>
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
            <div class="review-list">
                <div class="title-box clearfix">
                    <div class="text pull-left">
                    	<h3>나의 후기</h3>
	                    <span>내가 등록한 후기를 조회할 수 있습니다.</span>
                    </div>
                    
                    <div class="select-box pull-right">
                        <select class="wide" id="selectBox" name="selectBox" onchange="searchCheck()">
                           <option value="latest">최신순</option>
                           <option value="oldest">오래된순</option>
                        </select>
                        <script type="text/javascript">
                        	$("#selectBox").val("${cri.keyword}"== ""?"latest" : "${cri.keyword}")
                        </script>
                    </div>
                    
                </div>
                
                <div class="comment-inner" id="latest" style="display:block;">
                   	<c:forEach items="${ptReviewList}" var="ptReviewList">
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
					             <c:if test="${ptReviewList.cmainCategory eq 'doc'}">
					             	<h4>[의사후기]&nbsp;${ptReviewList.name} 의사</h4>
					             </c:if>
					             <c:if test="${ptReviewList.cmainCategory eq 'pha'}">
					             	<h4>[약사후기]&nbsp;${ptReviewList.name} 약사</h4>
					             </c:if>
				             <span class="comment-time"><i class="fas fa-calendar-alt"></i><fmt:formatDate value="${ptReviewList.regDate}" pattern="yy-MM-dd"/></span>
				             <ul class="rating clearfix">
				              <c:forEach var="i" begin="1" end="${ptReviewList.reviewPoint}">
				             		<span style="color:#ffab01;"><i class="icon-Star"></i></span>
				             	</c:forEach>
				             	<c:forEach var="i" begin="1" end="${5-ptReviewList.reviewPoint}">
				             		<i class="icon-Star"></i>
				             	</c:forEach>
				             </ul>
				             <p>${ptReviewList.contents}</p>
				         </div>
        					<c:if test="${null ne ptReviewList.rcontents}">
	      						<div class="comment replay-comment">
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
	                                 <h4><i class="fas fa-comments"></i>&nbsp;&nbsp;${ptReviewList.name} 의사</h4>
	                                 <span class="comment-time"><i class="fas fa-calendar-alt"></i><fmt:formatDate value="${ptReviewList.rregDate}" pattern="yy-MM-dd"/></span>
	                                 <p>${ptReviewList.rcontents}</p>
	                            </div>
                         	</c:if>
				     </div>
    				</c:forEach>
                </div>
                
                <%-- <div class="comment-inner" id="oldest" style="display:none;">
                   	<c:forEach items="${ptReviewOldestList}" var="ptReviewOldestList">
				     <div class="single-comment-box">
				         <div class="comment">
				             <figure class="comment-thumb"><img src="${pageContext.request.contextPath}/resources/assets/images/resource/comment-1.png" alt=""></figure>
				             
					             <c:if test="${ptReviewOldestList.cmainCategory eq 'doc'}">
					             	<h4>${ptReviewList.name} 의사</h4>
					             </c:if>
					             <c:if test="${ptReviewOldestList.cmainCategory eq 'pha'}">
					             	<h4>${ptReviewList.name} 약사</h4>
					             </c:if>
				             <span class="comment-time"><i class="fas fa-calendar-alt"></i><fmt:formatDate value="${ptReviewList.regDate}" pattern="yy-MM-dd"/></span>
				             <ul class="rating clearfix">
				              <c:forEach var="i" begin="1" end="${ptReviewOldestList.reviewPoint}">
				             		<span style="color:#ffab01;"><i class="icon-Star"></i></span>
				             	</c:forEach>
				             	<c:forEach var="i" begin="1" end="${5-ptReviewOldestList.reviewPoint}">
				             		<i class="icon-Star"></i>
				             	</c:forEach>
				             </ul>
				             <p>${ptReviewOldestList.contents}</p>
				         </div>
				     </div>
    				</c:forEach>
                </div> --%>
                
                </div>
                <!-- pagination  -->
				<div class="pagination-wrapper">
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a href="ptReview?pageNum=${pageMaker.startPage-1}&keyword=${cri.keyword}">이전</a></li>
						</c:if>
							
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
							<li class="paginate_button"><a href="ptReview?pageNum=${num}&keyword=${cri.keyword}">${num}</a></li>
						</c:forEach>
							
						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a href="ptReview?pageNum=${pageMaker.endPage+1}&keyword=${cri.keyword}">다음</a></li>
						</c:if>
					</ul>
				</div>
				<!-- pagination end -->
            </div>
        </div>
    </div>
</section>
<!-- doctors-dashboard -->

<script>
		function searchCheck() {
			var choose = $("#selectBox option:selected").val();
			
		/* 	if (choose == 'latest') {
				$("#latest").css('display', 'block');   
				$("#oldest").css('display', 'none');
			} else if (choose == 'oldest') {
				$("#latest").css('display', 'none');   
				$("#oldest").css('display', 'block');
			} */
			
			location.href="ptReview?pageNum=1&keyword="+choose
		}
		
		$(document).ready(function() {
			$('#selectBox').val('${cri.category}').prop("selected", true);
			//searchCheck();
			
			$("#logoutBtn1").on("click", function(){
				$('#logOutfrm1').submit();
			});
		});
	
</script>
