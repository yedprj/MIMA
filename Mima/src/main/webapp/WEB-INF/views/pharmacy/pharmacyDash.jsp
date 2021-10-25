<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
#delMemo {
	position: relative; 
	top: 0px; 
	transition: top 0.1s;
	cursor : pointer;
}
#delMemo:hover {
	color : #39cabb;
	cursor : pointer;
}
#trList td {
    position: relative;
}
#delMemoHidden {
	display: none;
  	position: absolute;
  	width: 150px;
  	padding: 8px;
  	left: 0;
  	-webkit-border-radius: 8px;
  	-moz-border-radius: 8px;  
  	border-radius: 8px;
  	background: #ebfaf8;;
  	color: #39cabb;
  	z-index : 100;
	}
#delMemo:hover + #delMemoHidden {
  display: block;
}
.doctors-appointment .doctors-table tr td p {
    font-size: 16px;
    line-height: 18px;
    color: #061a3a;
    padding: 5px 30px
 }
 .accept, .cancel{
 	cursor : pointer;
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

<!-- doctors-dashboard -->
<section class="doctors-dashboard bg-color-3">
	<!-- 왼쪽사이드 메뉴바 연결 -->
	<div class="left-panel">
		<div class="profile-box">
			<div class="upper-box">
				<c:choose>
                     <c:when test="${not empty session.ptProfilePhoto }">
                        <img src="FileDown.do?fname=${session.ptProfilePhoto}">
                     </c:when>
                     <c:otherwise>
                        <img src="${pageContext.request.contextPath}/resources/assets/images/icons/user.png" alt="">
                     </c:otherwise>
                  </c:choose>
				<div class="title-box centred">
					<div class="inner">
						<h3>${profile.pharmacyInfo}</h3>
						<p>${profile.profileContents} </p>
					</div>
				</div>
			</div>
			<div class="profile-info">
				<ul class="list clearfix">
					<li><a id="dash" href="${pageContext.request.contextPath}/pharmacy/pharmacyDash" class="current"><i
							class="fas fa-columns"></i>대쉬보드</a></li>
					<li><a id="delivery" href="${pageContext.request.contextPath}/pharmacy/mediDelivery"><i class="fas fa-ambulance"></i>약배달현황</a></li>
					<li><a href="${pageContext.request.contextPath}/pharmacy/deliveryRegCancel"><i class="fas fa-laptop-medical"></i>약배달 등록/취소</a></li>
					<li><a id="guid" href="${pageContext.request.contextPath}/pharmacy/medGuid"><i class="fas fa-comment-medical"></i>복약지도관리</a></li>
					<li><a id="revicw" href="${pageContext.request.contextPath}/pharmacy/review"><i class="fas fa-star"></i>약국 후기</a></li>
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
										<i class="icon-Dashboard-1"></i>
									</div>
									<h3>${cnt}</h3>
									<p>오늘 약 배달 수</p>
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
										<i class="icon-Dashboard-2"></i>
									</div>
									<h3>${ptEduCnt}</h3>
									<p>오늘 복약지도수</p>
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
										<i class="icon-Dashboard-3"></i>
									</div>
									<h3>${reviewCnt }</h3>
									<p>리뷰수</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="doctors-appointment">
					<div class="title-box">
						<h3>오늘의 약배달</h3>
						<div class="btn-box">
							<a id="medDeliveryBtn" class="theme-btn-one">오늘의 배달목록<i
								class="icon-Arrow-Right"></i></a> 
						</div>
					</div>
					<div class="doctors-list">
						<div class="table-outer">
                             <table class="doctors-table">
                                 <thead class="table-header">
                                     <tr>
                                         <th>배송인 이름</th>
                                         <th>신청일자</th>
                                         <th>주소</th>
                                         <th>우편번호</th>
                                         <th>처방전</th>
                                         <th>배송메모</th>
                                         <th>&nbsp;</th>
                                     </tr>    
                                 </thead>
                                 <tbody>
                                 	<c:forEach var="del" items="${delivery}">
                                     <tr id="trList">
                                         <td>
                                             <div class="name-box">
                                                 <figure class="image" style="overflow:hidden;">
                                                 	<c:choose>
															<c:when test="${not empty del.ptProfilePhoto }">
																<img src="FileDown.do?fname=${del.ptProfilePhoto}">
															</c:when>
															<c:otherwise>
																<img src="${pageContext.request.contextPath}/resources/assets/images/icons/user.png" alt="">
															</c:otherwise>
														</c:choose>
                                                 </figure>
                                                 <h5>${del.name}</h5>
                                             </div>
                                         </td>
                                         <td><p><fmt:formatDate value="${del.consultDate}" type="both" pattern="YY-MM-dd" /></p></td>
                                         <td><p>${del.delAddr},</p><p>${del.delAddr2}  ${del.delAddr3 }</p></td>
                                         <td class="text-center"><p>${del.delPostCode }</p></td>
                                         <td class="text-center">처방전 파일</td>
                                         <td><p id="delMemo"><c:if test="${not empty del.delNote}">메모 O</c:if></p>
                                         	<c:if test="${not empty del.delNote}"><div id="delMemoHidden">${del.delNote}</div></c:if>
                                         </td>
                                         <td>
                                         </td>
                                     </tr>
                                     </c:forEach>
                                 </tbody>
                             </table>
                         </div>
					</div>
					<br><br>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- doctors-dashboard -->


<button class="scroll-top scroll-to-target" data-target="html">
    <span class="fa fa-arrow-up"></span>
</button>

<script>
	$(function(){
		$("#logoutBtn1").on("click", function(){
			$('#logOutfrm1').submit();
		});
		
		$("#medDeliveryBtn").on("click",function(){
			location.href= "deliveryRegCancel";
		});
		
	});
</script>