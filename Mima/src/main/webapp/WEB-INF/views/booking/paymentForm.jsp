<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!--page-title-two-->
<section class="page-title-two">
	<div class="title-box centred bg-color-2">
		<div class="pattern-layer">
			<div class="pattern-1" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-70.png);"></div>
			<div class="pattern-2" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-71.png);"></div>
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
                                <li>예약일<span><fmt:formatDate value="${resvinfo.consultDate}" pattern="yyyy년 MM월 dd일"/></span></li>
                                <li>예약시간<span>${resvinfo.consultTime}</span></li>
                                <li>진료과목<span>${resvinfo.subject}</span></li>
                            </ul>
                        </div>
                        <div class="single-box">
                            <ul class="clearfix">
                                <li>결제 금액
                                	<c:set var="subj" value="${resvinfo.subject}"/>
                                	<c:if test="${priceinfo.category1 eq subj}">
	                                	<span>${priceinfo.price1 }원</span>
                                	</c:if>
                                	<c:if test="${priceinfo.category2 eq subj}">
	                                	<span>${priceinfo.price2 }원</span>
                                	</c:if>
                                	<c:if test="${priceinfo.category3 eq subj}">
	                                	<span>${priceinfo.price3 }원</span>
                                	</c:if>
                                </li>
                            </ul>
                        </div>
                        <div class="total-box">
                            <h5>Total
                            	<c:set var="subj" value="${resvinfo.subject}"/>
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
                        <a href="#" id="paybtnClick" class="theme-btn-one">Confirm and Pay<i class="icon-Arrow-Right"></i></a>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                        <input type="hidden" value="${resvinfo.bookingNo}" id="bookingNo" name="bookingNo">
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- appointment-section end -->

<!-- 결제 api 연동 p.10/08 -->
<script>
	$(function(){
		$('#paybtnClick').on('click', function(e){
			e.preventDefault();
			
			// 아임포트 결제 api 연동
			function payment(){
				var IMP = window.IMP;	// 생략가능
				IMP.init("imp42110057");	// 가맹정 식별코드
				var name = ${session.name}; // 로그인한 회원의 이름
				var subject = ${resvinfo.subject};	// 진료과목
				var email = ${session.email};		// 로그인한 회원의 이메일
				var price = $('#price').data("price");	// 금액
				var phone = ${session.phone};			// 폰 번호
				var bookingNo = $('#bookingNo').val();	// bookingNo
				
				IMP.request_pay({			// params
					pg : 'html5_inicis',
					pay_method : 'card',
					merchant_uid : 'merchant_' + new Date().getTime(),
					name : subject,
					amount : price,
					buyer_email : email,
					buyer_name : name,
					buyer_tel : phone,	
				}, function(rsp) {		// callback
					console.log(rsp);
					var msg = "";
					
					if (rsp.success) {	// 결제 성공 시 : 결제 승인 또는 가상계좌 발급에 성공한 경우
						alert("결제 성공");
					
						// 결제 성공 시 결과 저장
						$.ajax({
							url : 'insertPayment',
							method : 'post',
							data : { payItem : bookingNo,
								     payMethod : rsp.pay_method,
								     payResult : rsp.merchant_uid,
								     payAmount : rsp.amount,
								     payConfirmnum : rsp.apply_num},
							success : function(data) {
								
							},
							error : function(reject) {
								console.log(reject);
							}
						});
					}
				});
			}
		});
	});
</script>