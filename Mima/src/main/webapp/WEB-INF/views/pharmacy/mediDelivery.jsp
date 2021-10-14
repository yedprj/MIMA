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
				<h1>약배달 관리</h1>
			</div>
		</div>
	</div>
	<div class="lower-content">
		<ul class="bread-crumb clearfix">
			<li><a href="${pageContext.request.contextPath}">Home</a></li>
			<li>약배달 관리</li>
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
					<img src="${pageContext.request.contextPath}/resources/assets/images/resource/profile-2.png" alt="">
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
					<li><a id="delivery" href="${pageContext.request.contextPath}/pharmacy/mediDelivery" class="current"><i class="fas fa-ambulance"></i>약배달관리</a></li>
					<li><a id="guid" href="${pageContext.request.contextPath}/pharmacy/medGuid"><i class="fas fa-comment-medical"></i>복약지도관리</a></li>
					<li><a id="revicw" href="${pageContext.request.contextPath}/pharmacy/review"><i class="fas fa-star"></i>약국 후기</a></li>
					<li><a id="ques" href="${pageContext.request.contextPath}/pharmacy/phaQna"><i class="fas fa-comments"></i>문의</a><span>20</span></li>
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
                                    <h3>약배달 현황</h3>
                                </div>
                                <div class="btn-box pull-right">
                                    <form action="my-patients.html" method="post" class="search-form">
                                        <div class="form-group">
                                            <input type="search" name="search-field" placeholder="Search" required="">
                                            <button type="submit"><i class="far fa-search"></i></button>
                                        </div>
                                    </form>
                                </div> 
                                <div class="select-box pull-right">
                                    <select class="wide" id="selectbox" name="selectbox" onchange="searchCheck()">
                                       <option value="0" data-display="상태 목록">상태 목록</option>
                                       <option value="1">약배달 등록/취소</option>
                                       <option value="2">약배달 현황목록</option>
                                    </select>
                                </div>
                            </div>
                            <!-- 1번 -->
	                            <div class="single-item">
	                                <figure class="image-box"><img src="${pageContext.request.contextPath}/resources/assets/images/resource/appointment-1.jpg" alt=""></figure>
	                                <div class="inner">
	                                    <h4>Mary Astor</h4>
	                                    <ul class="info-list clearfix">
	                                        <li><i class="fas fa-clock"></i>15 Oct 2020, 09:30AM</li>
	                                        <li><i class="fas fa-map-marker-alt"></i>G87P, Birmingham, UK</li>
	                                        <li><i class="fas fa-hourglass-start"></i>Cardiology Test, Diabetic Diagnose</li>
	                                        <li><i class="fas fa-envelope"></i><a href="mailto:anna@example.com">anna@example.com</a></li>
	                                        <li><i class="fas fa-phone"></i><a href="tel:2265458856">+(22) 65_458_856</a></li>
	                                    </ul>
	                                    <ul class="confirm-list clearfix">
	                                        <li><i class="fas fa-check"></i>Accept</li>
	                                        <li><i class="fas fa-times"></i>Cancel</li>
	                                    </ul>
	                                </div>
	                            </div> 
	                            <div class="single-item">
	                                <figure class="image-box"><img src="${pageContext.request.contextPath}/resources/assets/images/resource/appointment-2.jpg" alt=""></figure>
	                                <div class="inner">
	                                    <h4>Rex Allen</h4>
	                                    <ul class="info-list clearfix">
	                                        <li><i class="fas fa-clock"></i>15 Oct 2020, 09:30AM</li>
	                                        <li><i class="fas fa-map-marker-alt"></i>G87P, Birmingham, UK</li>
	                                        <li><i class="fas fa-hourglass-start"></i>Cardiology Test, Diabetic Diagnose</li>
	                                        <li><i class="fas fa-envelope"></i><a href="mailto:anna@example.com">anna@example.com</a></li>
	                                        <li><i class="fas fa-phone"></i><a href="tel:2265458856">+(22) 65_458_856</a></li>
	                                    </ul>
	                                    <ul class="confirm-list clearfix">
	                                        <li><i class="fas fa-check"></i>Accept</li>
	                                        <li><i class="fas fa-times"></i>Cancel</li>
	                                    </ul>
	                                </div>
	                            </div>
                        	</div>
                        </div>
	                        <!-- 1번 끝 -->
                      <!-- 2번 -->
                      <div id="deliverys" style="display: none;">
                       <div class="appointment-list doctors-appointment my-patients">
                          <div class="title-box upper-box clearfix">
                              <div class="text pull-left">
                                  <h3>약배달 등록/취소</h3>
                              </div>
                              <div class="btn-box pull-right">
                                  <form action="my-patients.html" method="post" class="search-form">
                                      <div class="form-group">
                                          <input type="search" name="search-field" placeholder="Search" required="">
                                          <button type="submit"><i class="far fa-search"></i></button>
                                      </div>
                                  </form>
                              </div> 
                              <div class="select-box pull-right">
                                  <select class="wide" id="selectboxs" name="selectboxs" onchange="searchChecks()">
                                     <option value="0" data-display="상태 목록">상태 목록</option>
                                     <option value="1">약배달 등록/취소</option>
                                     <option value="2">약배달 현황목록</option>
                                  </select>
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
                                              <th>&nbsp;</th>
                                          </tr>    
                                      </thead>
                                      <tbody>
                                      	<c:forEach var="del" items="${delivery}">
                                          <tr id="trList">
                                              <td>
                                                  <div class="name-box">
                                                      <figure class="image"><img src="${pageContext.request.contextPath}/resources/assets/images/resource/patient-1.png" alt=""></figure>
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
                                                  <span class="accept" data-no="${del.bookingNo}" data-name="${del.name}"><i class="fas fa-pencil-alt"></i>배달등록</span>
                                              </td>
                                              <td>
                                                  <span class="cancel" data-no="${del.bookingNo}" data-name="${del.name}"><i class="fas fa-times"></i>반환</span>
                                              </td>
                                          </tr>
                                          </c:forEach>
                                      </tbody>
                                  </table>
                              </div>
                          </div>
                      </div>
                      </div>
                      
					
					<!-- paging -->
						<div class="pagination-wrapper">
							<ul class="pagination">
                                <li><a href="clinic-1.html" class="current">1</a></li>
                                <li><a href="clinic-1.html">2</a></li>
                                <li><a href="clinic-1.html">3</a></li>
                                <li><a href="clinic-1.html"><i class="icon-Arrow-Right"></i></a></li>
							</ul>
						</div>
						
						
                    </div>
                </div>
            </div>
            <!-- modal 
            <div class="modal">
				<div class="modal_content"  title="클릭하면 창이 닫힙니다.">
				    여기에 모달창 내용을 적어줍니다.<br>
				    이미지여도 좋고 글이어도 좋습니다.
				</div>
			</div>
		 modal  end -->
		 
</section>
<!-- doctors-dashboard -->
 <!-- appointment-section -->
 		<div class="modal">
        <section class="modal_content appointment-section bg-color-3">
            <div class="auto-container">
                <div class="row clearfix">
                    <div id="modalContentCss" class="col-lg-12 col-md-12 col-sm-12 left-column">
                        <div class="appointment-information">
                            <div class="title-box">
                                <h3>약배달 취소건</h3>
                            </div>
                            <div class="inner-box">
                                <div class="information-form">
                                    <h3>약배달 취소시 신청한 고객님께 메세지와 함께 전송됩니다</h3>
                                    <form action="book-appointment.html" method="post">
                                        <div class="row clearfix">
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>취소 신청 약국</label>
                                                <input type="text" name="name" value="${profile.pharmacyInfo}">
                                                <input id="returnPhaNo" type="hidden" name="pharmacyNo"  >
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>고객 성함</label>
                                                <input type="text" name="customerName" >
                                                <input id="returnBookingNo" type="hidden" name="bookingNo" >
                                            </div>
                                            <div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                                <label>(취소사유)</label>
                                                <textarea name="message" placeholder="취소하는 구체적인 이유를 고객님께 전달하세요..."></textarea>
                                            </div>
                                        </div>
                                    </form>
                                </div>
		                        <div class="btn-box">
		                            <a id="delReturnBtn" class="theme-btn-one">약배달 취소 및 반환<i class="icon-Arrow-Right"></i></a>
		                            <button id="cancelBtn" class="cancel-btn">취소</button>
		                        </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- appointment-section end -->
        </div>

<!--Scroll to top-->
<button class="scroll-top scroll-to-target" data-target="html">
	<span class="fa fa-arrow-up"></span>
</button>

<script>


	function searchCheck() {
		var choose = $("#selectbox option:selected").val();

		if (choose == '1') {
			$("#deliverys").css('display','block');
			$("#allList").css('display', 'none');
			$("#selectboxs option:eq(0)").prop("selected", true);
		}
	}
	
	function searchChecks() {
		var choose = $("#selectboxs option:selected").val();

		if (choose == '2') {
			$("#deliverys").css('display','none');
			$("#allList").css('display', 'block');
			$("#selectbox option:eq(0)").prop("selected", true);
		}
	}
 	
	$(function(){
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		
		$("#logoutBtn1").on("click", function(){
			$('#logOutfrm1').submit();
		});
		
		// 배달 등록 btn
		$("#trList > td").on("click",".accept",function(){
			var bookingNo = $(this).data("no");
			var name = $(this).data("name");
			var thisTr = $(this).parent().parent();
			console.log(thisTr);
			var result = confirm("["+name +"님] 처방약이 배송 시작되었나요?");
			if(result){
				$.ajax({
					url : 'deliveryStatusUpdate',
					type : 'post',
					data : { 
						bookingNo : bookingNo,
						deliveryStatus : "y"
					},
					beforeSend : function(xhr) {
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},		 
					success : function(data) {
						if(data > 0 ){
							console.log(data);
							thisTr.remove();
						}else {
							alert("배송등록이 실패했습니다!")
						}
					}
				});// ajax end
			} else { return; } 
			
		}); // 배달 등록 btn end
		
		// 반환 btn
		$("#trList > td").on("click",".cancel",function(){
			var bookingNo = $(this).data("no");
			var name = $(this).data("name");
			$("input[name='customerName']").val(name);
			
			$(".modal").fadeIn();			
			  
			$("#cancelBtn").click(function(){
			    $(".modal").fadeOut();
			});
			
			$("#delReturnBtn").click(function(){
				
			});
			
			
			
			
			
		}); // 반환 btn end
	
	}); // function end
	
	
</script>

