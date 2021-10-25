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
.my-patients .title-box .search-form input[type='search']{
	margin-left : 20px;
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
.appointment-section, .registration-section {
    padding: 0px;
}
#modalContentCss {
	padding-right: 0px;
    padding-left: 0px;
}
.doctors-appointment .doctors-table tr td .status.pending {
    margin-right: 30px;
}
.doctors-appointment .doctors-table tr td .status {
	margin-right: 30px;
}
#checkIcon {
	color : #39cabb;
}
.statusPink{
	background-color : lightPink;
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
				<h1>약배달 현황</h1>
			</div>
		</div>
	</div>
	<div class="lower-content">
		<ul class="bread-crumb clearfix">
			<li><a href="${pageContext.request.contextPath}">Home</a></li>
			<li>약배달 현황</li>
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
							<img src="${pageContext.request.contextPath}/resources/assets/images/icon/user.png" alt="">
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
					<li><a id="delivery" href="${pageContext.request.contextPath}/pharmacy/mediDelivery" class="current"><i class="fas fa-ambulance"></i>약배달현황</a></li>
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
                        <div id="allList" style="display: block;">
                        <div class="appointment-list doctors-appointment my-patients">
                            <div class="title-box upper-box clearfix">
                                <div class="text pull-left">
                                    <h3>배달 현황 목록</h3>
                                    <span>약배달 최신순으로 전체목록을 보여줍니다.</span>
                                </div>
                                <div class="btn-box pull-right">
                                    <form id="medDel"  action="mediDelivery" method="get" class="search-form">
                                        <div class="form-group">
                                            <input type="search" name="keyword" value="" placeholder="Search" >
                                            <button type="submit"><i class="far fa-search"></i></button>
                                        </div>
                                        <input type="hidden" name="type" value="N">
                                        <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
										<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                    </form>
                                </div> 
                                <div class="select-box pull-right">
                                    <select class="wide" id="selectbox" name="selectbox" onchange="searchCheck()">
                                       <option value="0" data-display="상태 목록">상태 목록</option>
                                       	<option value="1">배달 현황목록</option>
										<option value="2">배달 완료목록</option>                                       
                                    </select>
                                </div>
                            </div>
                            <!-- 1번 -->
	                            <div class="doctors-list">
                              <div class="table-outer">
                                  <table class="doctors-table">
                                      <thead class="table-header">
                                          <tr class="text-center">
                                              <th>신청번호</th>
                                              <th>신청이름</th>
                                              <th>신청일자</th>
                                              <th>취소(사유)</th>
                                              <th>배달상태</th>
                                              <th>복약지도상태</th>
                                              <th>&nbsp;</th>
                                          </tr>    
                                      </thead>
                                      <tbody>
                                      	<c:forEach var="phaDel" items="${phaDelivery}">
                                          <tr class="text-center" id="trList">
                                              <td><p>${phaDel.medDeliveryNo}</p></td>
                                              <td>
                                                  <div class="name-box">
                                                      <figure class="image">
                                                      	<c:choose>
															<c:when test="${not empty phaDel.ptProfilePhoto }">
																<img src="FileDown.do?fname=${phaDel.ptProfilePhoto}">
															</c:when>
															<c:otherwise>
																<img src="${pageContext.request.contextPath}/resources/assets/images/icons/user.png" alt="">
															</c:otherwise>
														</c:choose>
                                                      </figure>
                                                      <h5>${phaDel.name}</h5>
                                                  </div>
                                              </td>
                                              <td><p><fmt:formatDate value="${phaDel.consultDate}" type="both" pattern="YY-MM-dd" /></p></td>
                                              <td><p id="delMemo"><c:if test="${not empty phaDel.deliveryDecline}">취소 <i id="checkIcon" class="fas fa-check-circle"></i></c:if></p>
                                              	<c:if test="${not empty phaDel.deliveryDecline}"><div id="delMemoHidden">${phaDel.deliveryDecline}</div></c:if>
                                              </td>
                                              <td>
                                              		<c:if test="${phaDel.deliveryStatus eq 'p'}">
														<span class="status">배달완료</span>
													</c:if>
													<c:if test="${phaDel.deliveryStatus eq 'y'}">
														<span style="background-color: #E5F7FB; color:#01B4D9;" class="status">배달중</span>
													</c:if>
													<c:if test="${phaDel.deliveryStatus eq 'c'}">
														<span class="status cancel">신청취소</span>
													</c:if>
													<c:if test="${phaDel.deliveryStatus eq 'n'}">
														<span class="status pending">신청접수</span>
													</c:if>
                                              </td>
                                              <td ><c:if test="${phaDel.deliveryStatus eq 'p'}">
														<p>지도</p><i id="checkIcon" class="fas fa-check-circle"></i>
													</c:if></td>
                                              <td>
                                                  
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
						<div class="pagination-wrapper" >
							<ul class="pagination">
								<c:if test="${pageMaker.prev }">
									<li class="paginate_button previous"><a href="${pageMaker.startPage-1 }">이전</a></li>
								</c:if>
									
								<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
									<li class="paginate_button"><a href="${num}" >${num}</a></li>
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
 

<!--Scroll to top-->
<button class="scroll-top scroll-to-target" data-target="html">
	<span class="fa fa-arrow-up"></span>
</button>

<script>
	
$(".pagination a").on("click", function(e) {
	e.preventDefault(); // a, submit 기능을 막음
	var p = $(this).attr("href")
	$("[name='pageNum']").val(p)
	$("#medDel").submit();
});

	function searchCheck() {
		var choose = $("#selectbox option:selected").val();

		if (choose == '2') {
			location.href= "comDelivery";
		}
	}
	
	
 	
	$(function(){
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		
		$("#logoutBtn1").on("click", function(){
			$('#logOutfrm1').submit();
		});
		
		
	
	}); // function end
	
	
</script>

