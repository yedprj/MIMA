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
    width: 85%;
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
						<div id="resTime"></div>
					</div>
					<div class="inner-box">
						<div class="single-box">
							<div class="information-form">
								<form id="frm" name="frm">
									<div class="row clearfix">
									
										<div class="col-lg-12 col-md-12 col-sm-12 form-group">
											<label>의사</label>
											<div class="select-box">
												<select class="good-select wide" id="doctorSelect" name="doctorSelect"
														onchange="categorySelect();">
													<option data-display="의사를 선택해주세요">의사를 선택해주세요</option>
													<c:forEach items="${doctors}" var="doc">
														<option value="${doc.memberNo}">Dr. ${doc.name}</option>
													</c:forEach>
												</select>
											</div>
										</div>
										
										<div class="col-lg-12 col-md-12 col-sm-12 form-group" id="selectCategory">
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
										<div class="col-lg-12 col-md-12 col-sm-12 form-group">
											<div id="firstCheck"></div>
										</div>
										<div align="center" class="col-lg-12 col-md-12 col-sm-12 form-group">
											<button type="button" id="reservationTime" name="reservationTime" 
												class="theme-btn-one" style="width: 45%;">
												진료 예약 체크
											</button>
										</div>
									</div>
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
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
	
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	//진료과목 추가 수정 p.10/23 
	function categorySelect(){
		
		var docNo = $("#doctorSelect option:selected").val();
		
		console.log(docNo);
		
		$.ajax({
			url : 'categorySelect',
			type : 'post',
			data : {docNo : docNo},
			beforeSend : function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success : function(data) {
				console.log(data);
				$("#selectCategory").empty();
				$('#selectCategory').append(selectCategory(data));
				
			}, error : function(reject) {
				console.log(reject);
			}
		});
	}
	
	function selectCategory(data) {
		//console.log(encodeURIComponent(data.category1))
		return '<label>진료과목</label>'
			 + '<div class="select-box">'
			 + '	<select class="good-select wide" id="categoryChoose" name="doctorChoose">'
			 + '		<option data-display="진료과목을 선택해주세요">진료과목을 선택해주세요</option>'
			 + '		<option value='+ encodeURIComponent(data.category1) +'>'+ data.category1 +'</option>'
			 + '		<option value='+ encodeURIComponent(data.category2) +'>'+ data.category2 +'</option>'
			 + '		<option value='+ encodeURIComponent(data.category3) +'>'+ data.category3 +'</option>'
			 + '	</select>'
			 + '</div>'
	}
	
	$(function() {
		 
		$("#selecttime").on("click", function() {
			
			var week = new Array('SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT');
			var date = $("#date").val();
			var today = new Date(date).getDay();
			var day = week[today];
			var docNo = $("#doctorSelect option:selected").val();
			console.log(date);
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
					$("#addTime").empty();
					$("#firstCheck").empty();
					
					for (i = 0; i < data.length; i++){
						console.log(data[i]);
						//makediv(data[i], i);
						$("#addTime").append(makediv(data[i], i));
					}
					$("#firstCheck").append(firstCheck());
				},
				error : function(reject){
					console.log(reject);
				}
			});
		});
		
		
		// 진료 가능 시간 추가 p.1003
		function makediv(time, i){
			let hTag = $("<h3 />").css("display", "inline");
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
		
		// 첫 진료 여부 체크 박스 추가 p.10/05
		function firstCheck(){
			return "<h3>이 전문의와 첫번째 진료이신가요?</h3>"
				 + "<div class='custom-check-box'>"
				 + "	<div class='custom-controls-stacked'>"
				 + "		<label class='custom-control material-checkbox'>"
				 + "			<input type='checkbox' class='material-control-input' "
				 + "				id='chooseFirst' name='chooseFirst' value='y'>"
				 + "			<span class='material-control-indicator'></span> "
				 + "			<span class='description'>"+"예. 첫번째 진료입니다"+"</span>"
				 + "		</label>"
				 + "		<label class='custom-control material-checkbox'>"
				 + "			<input type='checkbox' class='material-control-input'"
				 + "				id='chooseSecond' name='chooseSecond' value='n'>"
				 + "			<span class='material-control-indicator'></span>"
				 + "			<span class='description'>아니요.</span>"
				 + "		</label>"
				 + "	</div>"
				 + "</div>"
		}
		
		// 진료 예약 아래에 시간 확인 용 추가 코드 p.10/05 
		function checkTime(e){
			e.preventDefault();
			
			// div 자식요소 삭제 
			$("#resTime").empty();
			
			var resvTime = $(this).text();
			var date = $("#date").val();
			
			date = new Date(date);
			
			var year = date.getFullYear();	// 년도
			var month = date.getMonth()+1;	// 월
			var day = date.getDate();		// 일
			
			var time = year + "년 " + month + "월 " + day + "일"
			console.log(resvTime);
			//console.log(date);
			
			let hTag = $("<h4/>").addClass("mt-3")
								 .css("color", "white");
			let sTag = $("<span/>").text(time + " " + resvTime);
			
			let iTag = $('<input/>').attr('type', 'hidden')
									.attr('value', resvTime)
									.attr('id', 'consultTime');
			$(hTag).append(sTag);
			$(hTag).append(iTag);
			$("#resTime").append(hTag);
		}
		
		// 체크 박스 하나만 클릭 p.10/05
		$(document).on("click", 'input[type="checkbox"]', function(){
			
			// 체크박스가 클릭 되었을 때
			if($(this).prop('checked')){
				
				$('input[type="checkbox"]').prop('checked', false);
				$(this).prop('checked', true);
			}
		});
		
		// 진료 예약 체크 p.10/06
		$(document).on('click', '#reservationTime', function(e){
			e.preventDefault();
			
			var ptNo = ${session.memberNo};									// PT_NO 예약 환자 번호
			var docNo = $("#doctorSelect option:selected").val();			// DOC_NO 의사 번호
			var subject = decodeURIComponent($("#categoryChoose option:selected").val());		// 카테고리 추가
			var consultDate = $("#date").val();								// 실제 진료 날짜
			var consultTime = $('#consultTime').val();						// 실제 진료 시간
			var firstSession = "";	// 체크박스 y or n
			
			if ($('#chooseFirst').is(':checked')){
				firstSession = $('input:checkbox[id="chooseFirst"]').val();
			} else {
				firstSession = $('input:checkbox[id="chooseSecond"]').val();
			}
			
			console.log(consultDate);
			console.log(consultTime);
			
			console.log(subject);
			
			$.ajax({
				url: "reservationTime",
				type : "post",
				data : {ptNo : ptNo,
						docNo : docNo,
						subject : subject,
						consultDate : consultDate,
						consultTime : consultTime,
						firstSession : firstSession
					   },
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				success : function(data) {
					console.log(data);
					if (data == 1) {
						alert("예약이 되었습니다. 결제 페이지로 이동합니다.");
						window.location.href = "paymentForm";
					}
				},
				error : function(reject) {
					console.log(reject);
				}
			});
		}); 
		
	});
	
</script>