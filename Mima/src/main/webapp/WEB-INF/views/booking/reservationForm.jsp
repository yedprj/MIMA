<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- placeholder 및 input date, time 태그에 사용할 스타일 추가 p.01 -->
<style>
.good-date {
	height: 44px;
    border: 1px solid #e5eded !important;
    border-radius: 30px;
    padding: 3px 20px;
    width : 75%;
    color: #061a3a;
    font-size: 14px;
    font-weight: 500;
}

.good-select {
	height: 44px;
    border: 1px solid #e5eded !important;
    border-radius: 30px;
    padding: 3px 20px;
    width: 75%;
    color: #061a3a;
    font-size: 14px;
    font-weight: 500;
}

input[type="date"]::before {
	content:attr(data-placeholder);
	width: 100%;
}

input[type="date"]:focus::before,
input[type="date"]:valid::before {
	display : none;
}

input[type="time"]::before {
	content:attr(data-placeholder);
	width: 100%;
}

input[type="time"]:focus::before,
input[type="time"]:valid::before {
	display : none;
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
				<h1>진료 예약</h1>
			</div>
		</div>
	</div>
	<div class="lower-content">
		<div class="auto-container">
			<ul class="bread-crumb clearfix">
				<li><a href="">Home</a></li>
				<li>진료 예약</li>
			</ul>
		</div>
	</div>
</section>
<!--page-title-two end-->


<!-- appointment-section -->
<section class="appointment-section bg-color-3">
	<div class="auto-container">
		<div class="row clearfix">
			<div class="col-lg-12 col-md-12 col-sm-12">
				<div class="appointment-information">
					<div align="center" class="title-box">
						<h3>진료 예약(medical appointment)</h3>
					</div>
					<div class="inner-box">
						<div class="single-box">
							<div class="information-form">
								<form id="frm" name="frm">
									<div class="row clearfix">
									
										<div class="col-lg-12 col-md-12 col-sm-12 form-group">
											<label>의사</label>
											<div class="select-box">
												<select class="good-select wide" id="doctorSelect" name="doctorSelect">
													<option data-display="의사를 선택해주세요">의사를 선택해주세요</option>
													<c:forEach items="${doctors}" var="doc">
														<option value="${doc.memberNo}">Dr. ${doc.name}</option>
													</c:forEach>
												</select>
											</div>
										</div>
									
										<div class="col-lg-12 col-md-12 col-sm-12 form-group">
											<label>진료 날짜</label> 
											<input type="date" id="date" name="date" class="good-date"
												data-placeholder="진료 받고 싶은 날을 정해주세요" required="required">
											<button type="button" id="selecttime" name="selecttime" class="theme-btn-one">조회</button>
										</div>
										
										<div class="col-lg-12 col-md-12 col-sm-12 form-group">
											<label>진료 시간</label> 
											<div id="addTime"></div>
										</div>
										
										<div align="center" class="col-lg-12 col-md-12 col-sm-12 form-group">
											<button type="button" id="checkTime" name="checkTime" 
												class="theme-btn-one" style="width: 45%;">
												진료 예약 체크
											</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div id="daycheckAfter" style="display: none;">
						<div class="inner-box">
							<div class="single-box">
								<h3>Are You a New Patient?</h3>
								<div class="custom-check-box">
									<div class="custom-controls-stacked">
										<label class="custom-control material-checkbox"> <input
											type="checkbox" class="material-control-input" checked="">
											<span class="material-control-indicator"></span> <span
											class="description">Yes i have seen this doctor before</span>
										</label>
									</div>
								</div>
								<div class="custom-check-box">
									<div class="custom-controls-stacked">
										<label class="custom-control material-checkbox"> <input
											type="checkbox" class="material-control-input"> <span
											class="material-control-indicator"></span> <span
											class="description">No i am a new patient</span>
										</label>
									</div>
								</div>
							</div>
							<div class="single-box">
								<h3>Please Specify Your Sex</h3>
								<div class="custom-check-box">
									<div class="custom-controls-stacked">
										<label class="custom-control material-checkbox"> <input
											type="checkbox" class="material-control-input" checked="">
											<span class="material-control-indicator"></span> <span
											class="description">Male</span>
										</label>
									</div>
								</div>
								<div class="custom-check-box">
									<div class="custom-controls-stacked">
										<label class="custom-control material-checkbox"> <input
											type="checkbox" class="material-control-input"> <span
											class="material-control-indicator"></span> <span
											class="description">Female</span>
										</label>
									</div>
								</div>
							</div>
							<div class="information-form">
								<h3>Your Information:</h3>
								<form action="book-appointment.html" method="post">
									<div class="row clearfix">
										<div class="col-lg-6 col-md-6 col-sm-12 form-group">
											<label>Your name</label> <input type="text" name="name"
												placeholder="Enter your name" required="">
										</div>
										<div class="col-lg-6 col-md-6 col-sm-12 form-group">
											<label>Your email</label> <input type="email" name="email"
												placeholder="Enter your email" required="">
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12 form-group">
											<label>Address</label> <input type="text" name="address"
												placeholder="Address" required="">
										</div>
										<div class="col-lg-6 col-md-12 col-sm-12 form-group">
											<label>City</label> <select class="wide">
												<option data-display="Select City">Select City</option>
												<option value="1">Select Text 01</option>
												<option value="2">Select Text 02</option>
												<option value="3">Select Text 03</option>
												<option value="4">Select Text 04</option>
											</select>
										</div>
										<div class="col-lg-6 col-md-12 col-sm-12 form-group">
											<label>State</label> <select class="wide">
												<option data-display="Select State">Select State</option>
												<option value="1">Select Text 01</option>
												<option value="2">Select Text 02</option>
												<option value="3">Select Text 03</option>
												<option value="4">Select Text 04</option>
											</select>
										</div>
										<div class="col-lg-6 col-md-12 col-sm-12 form-group">
											<label>Zip</label> <input type="text" name="zip"
												placeholder="Zip" required="">
										</div>
										<div class="col-lg-6 col-md-12 col-sm-12 form-group">
											<label>Birthday</label> <input type="text" name="birthday"
												placeholder="Date" required="">
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12 form-group">
											<label>Note to the doctor (optional)</label>
											<textarea name="message" placeholder="Write your not..."></textarea>
										</div>
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- appointment-section end -->

<script>
	
	$(function() {
		
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		
		$("#selecttime").on("click", function() {
			
			var week = new Array('SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT');
			var date = $("#date").val();
			var today = new Date(date).getDay();
			var day = week[today];
			var docNo = $("#doctorSelect option:selected").val();
			console.log(day);
			console.log(docNo);
			
			$.ajax({
				url : "selectDocTime",
				type : "post",
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				data : JSON.stringify({day : day,
									docNo : docNo}),
				contentType : "application/json",
				success : function(data){
					console.log(data);
					
					for (i = 0; i < data.length; i++){
						console.log(data[i]);
						//makediv(data[i], i);
						$("#addTime").append(makediv(data[i], i));
					}
				},
				error : function(reject){
					console.log(reject);
				}
			});
		});
		
		function makediv(time, i){
			let hTag = $("<h3 />").css("display", "inline");;
			let aTag = $("<a />")
					.addClass("mx-3")
					.addClass("fs-3")
					.attr("id","checkDocTime"+i)
					.click(checkTime)
					.attr("href", "#")
					.text(time);
					
			$(hTag).append(aTag);
			return hTag;
		}
		
		function checkTime(e){
			e.preventDefault();
		}
	});
	
</script>