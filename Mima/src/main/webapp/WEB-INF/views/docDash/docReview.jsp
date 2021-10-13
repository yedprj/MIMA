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
                    <figure class="profile-image"><img src="${pageContext.request.contextPath}/resources/assets/images/resource/profile-2.png" alt=""></figure>
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
                <li><a href="apptManage"><i class="fas fa-clock"></i>예약관리</a></li>
                <li><a href="apptHistory"><i class="fas fa-calendar-alt"></i>진료내역</a></li>
                <li><a href="patientList"><i class="fas fa-wheelchair"></i>나의 환자들</a></li>
                <li><a href="docReview" class="current"><i class="fas fa-star"></i>나의 후기</a></li>
                <li><a href="docQna"><i class="fas fa-comments"></i>나의 문의</a></li>
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
            <div class="review-list">
                <div class="title-box clearfix">
                    <div class="text pull-left">
                    	<h3>나의 후기</h3>
                    	<span>환자가 등록한 후기를 조회할 수 있습니다.</span>
                    </div>
                    
                    <div class="select-box pull-right">
                        <select class="wide" id="selectBox" name="selectBox" onchange="searchCheck()" value="${cri.keyword}">
                           <option value="latest">최신순</option>
                           <option value="oldest">오래된순</option>
                        </select>
                    </div>
                    
                </div>
               
               <div class="comment-inner" id="latest" style="display:block;">
                   	<c:forEach items="${docReviewPage}" var="docReviewPage">
     					<div class="single-comment-box">
         					<div class="comment" style="padding-left: 20px;">
             					<span class="comment-time"><i class="fas fa-calendar-alt"></i><fmt:formatDate value="${docReviewPage.regDate}" pattern="yy-MM-dd"/></span>
					             <ul class="rating clearfix">
					              <c:forEach var="i" begin="1" end="${docReviewPage.reviewPoint}">
					             		<span style="color:#ffab01;"><i class="icon-Star"></i></span>
					             	</c:forEach>
					             	<c:forEach var="i" begin="1" end="${5-docReviewPage.reviewPoint}">
					             		<i class="icon-Star"></i>
					             	</c:forEach>
					             </ul>
             					<p>${docReviewPage.contents}</p>
				         </div>
				     </div>
				    </c:forEach>
               </div>
               
               <div class="comment-inner" id="oldest" style="display:none;">
                   	<c:forEach items="${docReviewPageOldest}" var="docReviewPageOldest">
     					<div class="single-comment-box">
         					<div class="comment" style="padding-left: 20px;">
             					<span class="comment-time"><i class="fas fa-calendar-alt"></i><fmt:formatDate value="${docReviewPageOldest.regDate}" pattern="yy-MM-dd"/></span>
					             <ul class="rating clearfix">
					              <c:forEach var="i" begin="1" end="${docReviewPageOldest.reviewPoint}">
					             		<span style="color:#ffab01;"><i class="icon-Star"></i></span>
					             	</c:forEach>
					             	<c:forEach var="i" begin="1" end="${5-docReviewPageOldest.reviewPoint}">
					             		<i class="icon-Star"></i>
					             	</c:forEach>
					             </ul>
             					<p>${docReviewPageOldest.contents}</p>
				         </div>
				     </div>
				    </c:forEach>
               </div>
               
            </div>
                <!-- pagination  -->
				<div class="pagination-wrapper">
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a href="docReview?pageNum=${pageMaker.startPage-1}">이전</a></li>
						</c:if>
							
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
							<li class="paginate_button"><a href="docReview?pageNum=${num}">${num}</a></li>
						</c:forEach>
							
						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a href="docReview?pageNum=${pageMaker.endPage+1}">다음</a></li>
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
			
			if (choose == 'latest') {
				$("#latest").css('display', 'block');   
				$("#oldest").css('display', 'none');
			} else if (choose == 'oldest') {
				$("#latest").css('display', 'none');   
				$("#oldest").css('display', 'block');
			}
		}
		
		$(document).ready(function() {
			$('#selectBox').val('${cri.category}').prop("selected", true);
			searchCheck();
			
			$("#logoutBtn1").on("click", function(){
				$('#logOutfrm1').submit();
			});
		});
	
</script>