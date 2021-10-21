<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
th, td {
	text-align: center;
}

#deliveryCancelBtn {
	cursor: pointer;
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
</style>

<!-- doctors-dashboard -->
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
				<h1>환자 대쉬보드</h1>
			</div>
		</div>
	</div>
	<div class="lower-content">
		<ul class="bread-crumb clearfix">
			<li><a href="${pageContext.request.contextPath}">Home</a></li>
			<li>환자 대쉬보드</li>
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
					<li><a href="ptMain"><i class="fas fa-columns"></i>대쉬보드</a></li>
					<li><a href="ptBookManage"><i class="fas fa-calendar-alt"></i>나의 예약관리</a></li>
					<li><a href="ptHistory"><i class="fas fa-calendar-alt"></i>나의 진료내역</a></li>
					<li><a href="ptDoctor"><i class="fas fa-wheelchair"></i>내가 찜한 의사</a></li>
					<li><a href="ptReview"><i class="fas fa-star"></i>나의 후기</a></li>
					<li><a href="ptMedelivery"><i class="fas fa-comment-medical"></i>약배달 신청</a></li>
					<li><a href="ptDeliveryList" class="current"><i class="fas fa-ambulance"></i>배송 현황</a></li>
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
				<!-- K. 10/ 18 배송현황 -->
				<br>
				<div class="doctors-appointment">
					<div class="title-box">
						<h3>배송현황</h3>
						<span>신청한 약배달의 현황 목록을 조회합니다.</span>
						<br><span><b>TIP.</b> 약배달을 수령하신 다음 수령완료 버튼을 클릭해주세요, 취소버튼을 클릭시 취소사유를 확인하실 수 있습니다.</span>
					</div>
					<div class="doctors-list">
						<div class="table-outer">
							<table class="doctors-table">
								<thead class="table-header">
									<tr>
										<th>진료일</th>
										<th>진료과목</th>
										<th>진료의사</th>
										<th>신청약국</th>
										<th>약배달 배송현황</th>
										<th>현황확인</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="del" items="${ptDeliveryStatusList}">
										<tr style="height:80px;">
											<td><p><fmt:formatDate value="${del.consultDate}" type="both" pattern="YY-MM-dd" /></p></td>
											<td><p>${del.subject}</p></td>
											<td><p><b>Dr.</b> ${del.docName}<p></td>
											<td><p>${del.pharmacyName}</p></td>
											<td id="delstatus">
												<c:if test="${del.deliveryStatus eq 'p'}">
													<span class="status">배달완료</span>
												</c:if>
												<c:if test="${del.deliveryStatus eq 'n'}">
													<span class="status pending">배달신청</span>
												</c:if>
												<c:if test="${del.deliveryStatus eq 'c'}">
													<span id="deliveryCancelBtn" data-no="${del.bookingNo}" class="status cancel">신청취소</span>
												</c:if>
												<c:if test="${del.deliveryStatus eq 'y'}">
													<span class="status pending">배송시작</span>
												</c:if>
											</td>
											<td class="text-center">
												<c:if test="${del.deliveryStatus eq 'y'}">
													<span id="delCheckBtn" data-no="${del.bookingNo}" class="status">수령완료</span>
												</c:if>
												<c:if test="${del.check < 1 }">
													<span id="delReview" data-no="${del.bookingNo}" class="status cancel">후기쓰기</span>
												</c:if>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<br>

				
			</div>
		</div>
	</div>
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
                                    <form action="book-appointment.html" method="post">
                                        <div class="row clearfix">
                                            <div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                                <label>약국 취소 사유</label>
                                                <textarea id="message" name="deliveryDecline" ></textarea>
                                            </div>
                                            <div class="col-lg-10 col-md-6 col-sm-12 form-group">
                                                <label>취소 약국명</label>
                                                <input id="phaName" type="text" name=phaName >
                                                <input id="pharmacyNo" type="hidden" name=pharmacyNo value="" >
                                            </div>
                                            <div class="col-lg-2 col-md-6 col-sm-12 form-group">
												<button id="searchBtn" type="button" onclick="window.open('phaSearch', '약국찾기', 'top=100px, left=300, width=600px, height=700px , scrollbars=yes');">검색</button>                                             	
                                            </div>
                                            
                                        </div>
                                    </form>
                                </div>
		                        <div class="btn-box">
		                            <a id="delReturnBtn" class="theme-btn-one">재신청하러 가기<i class="icon-Arrow-Right"></i></a>
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
$(function(){
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	// K.10/18 약배달 취소 버튼 클릭시 사유 가져오기
	$(document).on("click","#deliveryCancelBtn", function(){
		var bookingNo = $(this).data("no");
		
		// 취소건 내역 ajax로 호출
		$.ajax({
			url : 'ptDelCancelSelect',
			type : 'post',
			data : { 
				bookingNo : bookingNo
			},
			beforeSend : function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},		 
			success : function(data) {
				console.log(data);
				$(".modal").fadeIn();
				$("input[name='phaName']").val(data.pharmacyName);
				$("#message").val(data.deliveryDecline);
				
			}
		});// ajax end
		
		// 취소 모달창 닫기
		$("#cancelBtn").click(function(){
		    $(".modal").fadeOut();
		});
		
		// 재신청 하러가기 버튼 
		$("#delReturnBtn").on("click",function(){
			var pharmacyNo = $("#pharmacyNo").val();
			var memberNo = ${memberNo};
			
			if(pharmacyNo == ""){
				alert("새로 신청할 약국을 다시 선택해주세요!");
				return;
			} else {
				$.ajax({
					url : 'delReapply',
					type : 'post',
					data : { 
						delPharmacyNo : pharmacyNo,
						bookingNo : bookingNo
					},
					beforeSend : function(xhr) {
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},		 
					success : function(data) {
						if(data > 0 ){
							var result = confirm("재신청이 완료되었습니다. /n 약배달신청도 해당약국으로 수정하시겠습니까?")
							if(result){
								// 약배달 신청 약국도 수정 (patient )
								$.ajax({
									url : 'delPhaUpdate',
									type : 'post',
									data : { 
										memberNo : memberNo,
										bookingNo : bookingNo
									},
									beforeSend : function(xhr) {
										xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
									},		 
									success : function(data) {
										console.log("약배달 신청 약국도 변경 성공!")
									}
								});// ajax end
							}
							$(".modal").fadeOut();
							location.href= "ptDeliveryList";
						} else {
							alert("다시 재신청 해주세요.")
						}
					}
				});// ajax end
			}
			
		}) // 재신청 버튼 end
		
	}); // 약배달 취소버튼 클릭 end
	
	// 수령확인 완료 버튼 클릭
	$(document).on("click","#delCheckBtn",function(){
		var bookingNo = $(this).data("no");
		
		var result = confirm("약배달을 수령하셨나요?");
		if(result){
			$.ajax({
				url : 'delcompleteUpdate',
				type : 'post',
				data : { 
					deliveryStatus : 'p',
					bookingNo : bookingNo
				},
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},		 
				success : function(data) {
					// 리다이렉트로 가는 방법로 다시 수정하기(약배달현황에서 클릭시 자꾸 주소가 더붙음)
					location.href= "ptDeliveryList";
					alert("약국에서 복약지도 연락이 가오니 잠시만 기다려주세요~!");
				}
			});// ajax end
		} else {
			return;
		}
		
	}); // 약배달 수령확인 버튼 end
	
	// K. 10/21 약배달 리뷰쓰기 Btn
	$("#delReview").on("click",function(){
		var bkNo = $(this).data("no");
		window.open("${pageContext.request.contextPath}/patients/ptPhaReviewFrm?bookingNo="+bkNo, "review", "width=680,height=950");
		console.log($(this));
		$(this).remove();
	});// 리뷰쓰기 end
	
	
});
</script>
