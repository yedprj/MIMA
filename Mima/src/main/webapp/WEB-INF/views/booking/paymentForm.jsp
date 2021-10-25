<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
.modal-dialog.modal-80size {
  width: 80%;
  height: 50%;
  margin: 0;
  padding: 0;
}

.modal-content.modal-80size {
  height: auto;
  min-height: 50%;
}

.modal.modal-center {
  text-align: center;
}

@media screen and (min-width: 768px) {
  .modal.modal-center:before {
    display: inline-block;
    vertical-align: middle;
    content: " ";
    height: 100%;
  }
}

.modal-dialog.modal-center {
  display: inline-block;
  text-align: left;
  vertical-align: middle;
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
				<h1>예약 결제</h1>
			</div>
		</div>
	</div>
	<div class="lower-content">
		<div class="auto-container">
			<ul class="bread-crumb clearfix">
				<li><a href="${pageContext.request.contextPath}/">Home</a></li>
				<li>예약 결제</li>
			</ul>
		</div>
	</div>
</section>
<!--page-title-two end-->

<!-- appointment-section -->
<section class="appointment-section bg-color-3">
	<div class="auto-container">
		<div class="row clearfix">
			<div class="col-lg-12 col-md-12 col-sm-12 right-column">
				<div class="booking-information">
					<div class="title-box">
						<h3>결제 정보</h3>
					</div>
					<div class="inner-box">
						<div class="single-box">
							<ul class="clearfix">
								<li>예약일<span><fmt:formatDate
											value="${resvinfo.consultDate}" pattern="yyyy년 MM월 dd일" /></span></li>
								<li>예약시간<span>${resvinfo.consultTime}</span></li>
								<li>진료과목<span>${resvinfo.subject}</span></li>
							</ul>
						</div>
						<div class="single-box">
							<ul class="clearfix">
								<li>결제 금액 <c:set var="subj" value="${resvinfo.subject}" />
									<c:if test="${priceinfo.category1 eq subj}">
										<span>${priceinfo.price1 }원</span>
									</c:if> <c:if test="${priceinfo.category2 eq subj}">
										<span>${priceinfo.price2 }원</span>
									</c:if> <c:if test="${priceinfo.category3 eq subj}">
										<span>${priceinfo.price3 }원</span>
									</c:if>
								</li>
							</ul>
						</div>
						<div class="total-box">
							<h5>
								Total
								<c:set var="subj" value="${resvinfo.subject}" />
								<c:if test="${priceinfo.category1 eq subj}">
									<span id="price" data-price="${priceinfo.price1}">${priceinfo.price1}원</span>
								</c:if>
								<c:if test="${priceinfo.category2 eq subj}">
									<span id="price" data-price="${priceinfo.price2}">${priceinfo.price2 }원</span>
								</c:if>
								<c:if test="${priceinfo.category3 eq subj}">
									<span id="price" data-price="${priceinfo.price3}">${priceinfo.price3 }원</span>
								</c:if>
							</h5>
						</div>
					</div>
					<div class="btn-box">
						<a href="#" id="paybtnClick" class="theme-btn-one">결제하기<i class="icon-Arrow-Right"></i>
						</a>
						 <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}"> 
						 <input type="hidden" value="${resvinfo.bookingNo}" id="bookingNo" name="bookingNo">
						 <input type="hidden" value="${result}" id="result" name="result">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal 추가 p.10/09 -->
	<div class="modal modal-center fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-80size modal-center">
			<div class="modal-content modal-80size">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">결제 확인</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
				</div>
				<div class="modal-footer">
					<button type="button" id="btnSelfCheck"class="btn btn-info">자가검진표 입력</button>
					<button type="button" id="btnPtBookingManage"class="btn btn-secondary">확인</button>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- appointment-section end -->

<!-- 결제 api 연동 p.10/08 -->
<script>
	$(function() {
		$('#paybtnClick').on('click', function(e) {
			
			var csrfHeaderName = "${_csrf.headerName}";
			var csrfTokenValue = "${_csrf.token}";
			
			e.preventDefault();
			payment();
			
			// 아임포트 결제 api 연동
			function payment() {
				var IMP = window.IMP; // 생략가능
				IMP.init("imp42110057"); // 가맹정 식별코드
				var name = "${session.name}"; // 로그인한 회원의 이름
				var subject = "${resvinfo.subject}"; // 진료과목
				var email = "${session.email}"; // 로그인한 회원의 이메일
				var price = $('#price').data("price"); // 금액
				var phone = "${session.phone}"; // 폰 번호
				var bookingNo = $('#bookingNo').val(); // bookingNo
				
				IMP.request_pay({ // params
					pg : 'html5_inicis',
					pay_method : 'card',
					merchant_uid : 'merchant_' + new Date().getTime(),
					name : subject,
					amount : price,
					buyer_email : email,
					buyer_name : name,
					buyer_tel : phone,
				}, function(rsp) { // callback
					console.log(rsp);
					var msg = "";

					if (rsp.success) { // 결제 성공 시 : 결제 승인 또는 가상계좌 발급에 성공한 경우
						//alert("결제 성공");

						// 결제 성공 시 결과 저장
						// bookingNo -> 예약 번호
						// rsp.pay_method -> 결제 수단
						// rsp.merchant_uid -> 고유 주문 번호
						// rsp.paid_amount -> 결제 금액
						// rsp.imp_uid -> 아임포트 고유 결제 번호
						// ajax url 수정 p.10/10
						$.ajax({
							url : 'insertPayment',
							method : 'post',
							data : {
								payItem : bookingNo,
								payMethod : rsp.pay_method,
								payResult : rsp.merchant_uid,
								payAmount : rsp.paid_amount,
								payConfirmnum : rsp.imp_uid
							},
							beforeSend : function(xhr) {
								xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
							},
							success : function(result) {
								console.log(result);
								if ($.trim(result) == 1){
									$('.modal-body').append(addModalBody());
									$('#myModal').modal('show');
									
								}else {
									alert("DB에 등록실패");
								}
							},
							error : function(reject) {
								console.log(reject);
							}
						});
					} else {
						alert("결제에 실패하였습니다.\n"+ rsp.error_code + "\n" + rsp.error_msg);
					}
				});
			}
			function addModalBody() {
				return "<div id='successContent'>"
					 + "	<h5>＊＊결제가 완료되었습니다＊＊</h5>"
					 + "	<br>"
					 + "	<p>의사 선생님과 <b>첫 진료</b>이시면 아래의 버튼 중</p>"
					 + "	<p><b>자가검진표 입력</b> 버튼을 선택해주세요</p>"
					 + "	<br>"
					 + "	<p>첫 진료가 아니시라면 아래의 버튼 중 확인 버튼을 선택해주세요</p>"
					 + "</div>"
			}
			
			$('#btnPtBookingManage').on('click', function(e) {
				e.preventDefault();
				$('#myModal').modal('hide');
				window.location.href = 'ptBookManage';
			});
			
			$('#btnSelfCheck').on('click', function(e){
				e.preventDefault();
				$('#myModal').modal('hide');
				window.location.href = '${pageContext.request.contextPath}/consultation/preSelfAssessmentFrm';
			});
		});
	});
</script>