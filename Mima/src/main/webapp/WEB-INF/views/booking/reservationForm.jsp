<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
											<label>진료 날짜</label> 
											<input type="date" id="date" name="date" class="good-date"
												data-placeholder="진료 받고 싶은 날을 정해주세요" required="required">
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12 form-group">
											<label>진료 시간</label> 
											<input type="time" id="time" name="time" class="good-date"
												data-placeholder="진료 받고 싶은 시간을 입력해 주세요" required="required">
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
		$("#checkTime").on("click", function(){
			
			var week = new Array('일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일');

			var date = $("#date").val();
			var time = $("#time").val();
			var today = new Date(date).getDay();
			var day = week[today];
			
			console.log(date + " 일: "+day+ " " +time);
		});
	});
</script>