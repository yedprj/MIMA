<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
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
                                <li>예약일<span>${resvinfo.consultDate}</span></li>
                                <li>예약시간<span>${resvinfo.consultTime}</span></li>
                                <li>진료과목<span>${resvinfo.subject}</span></li>
                            </ul>
                        </div>
                        <div class="single-box">
                            <ul class="clearfix">
                                <li>결제 금액
                                	<c:set var="subj" value="${resvinfo.subject}"/>
                                	<c:if test="${priceinfo.category1 eq subj}">
	                                	<span>${priceinfo.price1 }</span>
                                	</c:if>
                                	<c:if test="${priceinfo.category2 eq subj}">
	                                	<span>${priceinfo.price2 }</span>
                                	</c:if>
                                	<c:if test="${priceinfo.category3 eq subj}">
	                                	<span>${priceinfo.price3 }</span>
                                	</c:if>
                                </li>
                            </ul>
                        </div>
                        <div class="total-box">
                            <h5>Total<span>$110</span></h5>
                        </div>
                    </div>
                    <div class="btn-box">
                        <a href="confirm.html" class="theme-btn-one">Confirm and Pay<i class="icon-Arrow-Right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- appointment-section end -->
