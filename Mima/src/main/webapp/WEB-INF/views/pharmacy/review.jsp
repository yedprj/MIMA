<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				<h1>약국 리뷰</h1>
			</div>
		</div>
	</div>
	<div class="lower-content">
		<ul class="bread-crumb clearfix">
			<li><a href="${pageContext.request.contextPath}">Home</a></li>
			<li>약국 리뷰</li>
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
						<h3>${profile.pharmacyInfo}</h3>
						<p>${profile.profileContents}</p>
					</div>
				</div>
			</div>
			<div class="profile-info">
				<ul class="list clearfix">
					<li><a id="dash" href="${pageContext.request.contextPath}/pharmacy/pharmacyDash" ><i
							class="fas fa-columns"></i>대쉬보드</a></li>
					<li><a id="delivery" href="${pageContext.request.contextPath}/pharmacy/mediDelivery"><i class="fas fa-ambulance"></i>약배달현황</a></li>
					<li><a href="${pageContext.request.contextPath}/pharmacy/deliveryRegCancel"><i class="fas fa-laptop-medical"></i>약배달 등록/취소</a></li>
					<li><a id="guid" href="${pageContext.request.contextPath}/pharmacy/medGuid"><i class="fas fa-comment-medical"></i>복약지도관리</a></li>
					<li><a id="revicw" href="${pageContext.request.contextPath}/pharmacy/review" class="current"><i class="fas fa-star"></i>약국 후기</a></li>
					<li><a id="profile" href="${pageContext.request.contextPath}/pharmacy/myProfile"><i class="fas fa-user"></i>약국 프로필</a></li>
					<li><a id="pwUpdate" href="${pageContext.request.contextPath}/pharmacy/pwUpdate"><i
							class="fas fa-unlock-alt"></i>비밀번호 변경</a></li>
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
                        	<h3>약국 리뷰 후기</h3>
                        	<span>약배송을 받은 고객님들의 배송후 리뷰를 조회할 수 있습니다.</span>
                        </div>
                        <div class="btn-box pull-right">
                        	<h3>리뷰 수 : ${reviewCnt}</h3>
                 			<form id="review"  action="review" method="get" >
                                 <input type="hidden" name="type" value="N">
                                 <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
								 <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
								 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                             </form>
                        </div>
                    </div>
                    <div class="comment-inner">
                    	<c:forEach var="review" items="${review}">
                        <div class="single-comment-box">
                            <div class="comment">
                                <figure class="comment-thumb">
                                	<c:if test="${review.gender eq '여'}">
                                		<img src="${pageContext.request.contextPath}/resources/assets/images/icons/girl.png" alt="여자아이콘">
                                	</c:if>
                                	<c:if test="${review.gender eq '남'}">
                                		<img src="${pageContext.request.contextPath}/resources/assets/images/icons/man.png" alt="남자아이콘">
                                	</c:if>
                                </figure>
                                <h4>${review.nickname }</h4>
                                <span class="comment-time"><i class="fas fa-calendar-alt"></i><fmt:formatDate value="${review.regDate}" type="both" pattern="yyyy-MM-dd HH:mm:ss" /></span>
                                <ul class="rating clearfix">
	                                <c:forEach var="i" begin="1" end="${review.reviewPoint}">
	                                    <li><i class="icon-Star"></i></li>
						           	</c:forEach>
						           	<c:forEach var="i" begin="1" end="${5-review.reviewPoint}">
										<li class="light"><i class="icon-Star"></i></li>
						           	</c:forEach>
                                </ul>
                                <p>${review.contents }</p>
                            </div>
                        </div>
                        </c:forEach>
                      
                    </div>
                </div>
                <div class="pagination-wrapper">
					<ul class="pagination">
						<c:if test="${pageMaker.prev }">
							<li class="paginate_button previous"><a href="${pageMaker.startPage-1 }">이전</a></li>
						</c:if>
							
						<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
							<li class="paginate_button"><a href="${num}" > ${num}</a></li>
						</c:forEach>
						<c:if test="${pageMaker.next }">
							<li class="paginate_button next"><a href="${pageMaker.endPage+1 }">다음</a></li>
						</c:if>
					</ul>
				</div>
            </div>
        </div>
    </div>
</section>
        <!-- doctors-dashboard -->
<script>
	$(function(){
		$("#logoutBtn1").on("click", function(){
			$('#logOutfrm1').submit();
		});
		
		$(".pagination a").on("click", function(e) {
			e.preventDefault(); // a, submit 기능을 막음
			var p = $(this).attr("href")
			$("[name='pageNum']").val(p)
			$("#review").submit();
		});
		
		
		
	});
</script>