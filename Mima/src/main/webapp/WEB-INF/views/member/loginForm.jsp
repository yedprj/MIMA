<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
				<h1>Login</h1>
			</div>
		</div>
	</div>
	<div class="lower-content">
		<div class="auto-container">
			<ul class="bread-crumb clearfix">
				<li><a href="index.html">Home</a></li>
				<li>Login</li>
			</ul>
		</div>
	</div>
</section>
<!--page-title-two end-->


<!-- registration-section -->
<section class="registration-section bg-color-3">
	<div class="pattern">
		<div class="pattern-1"
			style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-85.png);"></div>
		<div class="pattern-2"
			style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-86.png);"></div>
	</div>
	<div class="auto-container">
		<div class="inner-box">
			<div class="content-box">
				<div class="title-box">
					<h3>Login</h3>
				</div>
				<div class="inner">
					<form id="frm" name="frm" action="login" method="post"
						class="registration-form">

						<c:if test="${not empty error}">
							<div class="alert alert-danger d-flex align-items-center"
								role="alert">
								<svg class="bi flex-shrink-0 me-2" width="30" height="24"
									role="img" aria-label="Danger:">
									<use xlink:href="#exclamation-triangle-fill" /></svg>
								<div>
									<c:out value="${error}" />
								</div>
							</div>
						</c:if>

						<div class="row clearfix">
							<div class="col-lg-12 col-md-12 col-sm-12 form-group">
								<label>아이디</label> <input type="text" id="memberId"
									name="memberId" placeholder="아이디를 입력해 주세요" required="required">
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12 form-group">
								<label>비밀번호</label> <input type="password" id="password"
									name="password" placeholder="비밀번호를 입력해 주세요" required="required">
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12 form-group">
								<div class="forgot-passowrd clearfix">

									 <a href="#" data-toggle="modal"data-target="#modalidpw">Forget Id or Password Reset? </a>
								</div>
							</div>

							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}">

							<div class="col-lg-12 col-md-12 col-sm-12 form-group message-btn">
								<button type="submit" class="theme-btn-one">
									Login Now<i class="icon-Arrow-Right"></i>
								</button>
							</div>
						</div>
					</form>

					<div class="login-now">
						<p>
							Don’t have an account? <a
								href="${pageContext.request.contextPath}/joinForm">Register
								Now</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- registration-section end -->

<!-- Modal p-29 -->
<div class="modal fade" id="modalidpw" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">아이디 찾기 / 비밀번호 초기화</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="frm" name="frm">

					<div style="margin-bottom: 10px;"
						class="custom-control custom-radio custom-control-inline">
						<input type="radio" class="custom-control-input" id="search_1"
							name="search_total" onclick="searchCheck(1)" checked="checked">
						<label class="custom-control-label font-weight-bold"
							for="search_1">아이디 찾기</label>
					</div>

					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" class="custom-control-input" id="search_2"
							name="search_total" onclick="searchCheck(2)"> <label
							class="custom-control-label font-weight-bold" for="search_2">비밀번호 초기화</label>
					</div>

					<div id="searchI">
						<div class="row clearfix">
							<div class="col-lg-12 col-md-12 col-sm-12 form-group">
								<label for="recipient-name" class="col-form-label">이름</label> <input
									type="text" class="form-control" id="name" name="name"
									placeholder="이름을 입력해주세요">
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12 form-group">
								<label for="message-text" class="col-form-label">휴대폰번호</label> <input
									type="text" class="form-control" id="phone" name="phone"
									placeholder="-를 제외한 숫자만 입력해 주세요">
							</div>
							<button type="button" id="findId" class="btn btn-primary btn-block mx-3">아이디 찾기</button>
							<button type="button" class="btn btn-secondary btn-block mx-3" data-dismiss="modal">취소</button>
						</div>
					</div>
					
					<div id="searchP" style="display: none;">
						<div class="row clearfix">
							<div class="col-lg-12 col-md-12 col-sm-12 form-group">
								<label for="recipient-name" class="col-form-label">아이디</label> <input
									type="text" class="form-control" id="mmemberId"
									name="mmemberId" placeholder="아이디를 입력해주세요">
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12 form-group">
								<label for="message-text" class="col-form-label">이메일</label> <input
									type="text" class="form-control" id="email" name="email"
									placeholder="회원가입 시 인증한 메일을 입력해 주세요">
							</div>
						</div>
						
						<div id="pwReset"></div>
						<div id="pwcheck">
							<button type="button" id="findpw" class="btn btn-primary btn-block">확인</button>
							<button type="button" class="btn btn-secondary btn-block" data-dismiss="modal">취소</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- 아이디 비밀번호 찾기 ajax p-29 -->
<script>

	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	<!-- 모달 변경 부분 p-30 -->
	function searchCheck(num) {
		if (num == '1') {
			$("#searchP").css('display','none');
			$("#searchI").css('display', 'block');   
		} else {
			$("#searchI").css('display', 'none');
			$("#searchP").css('display', "block");
		}
	} 
	
	$(function(){
		<!-- 아이디 찾기 ajax p-29-->
		
		$("#findId").on("click", function(e) {
			e.preventDefault();
			
			$.ajax({
				url : "findMemberId",
				type : "post",
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				data : JSON.stringify({ name : $("#name").val(),
									   phone : $("#phone").val()}),
				contentType : "application/json",
				success : function(data) {
					console.log(data);
					$("#mmemberId").val(data);
					alert("찾으시는 아이디는 " + data + " 입니다.");
				},
				error : function(reject){
					console.log(reject)
				}
			});
		});
		
		$("#findpw").on("click", function(e) {
			e.preventDefault();
			
			$.ajax({
				url : "resetPassword",
				type : "post",
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				data : JSON.stringify({ memberId : $("#mmemberId").val(), 
										email : $("#email").val()}),
				contentType : "application/json",
				success : function(data) {
					console.log(data);
					if (data == 1){
						let str = "";
						str += pwResetCk();
						$("#pwReset").html(str);
						$("#pwcheck").css('display','none');
					} else {
						alert("등록되지 않은 이메일 입니다.");
					}
				},
				error : function(reject) {
					console.log(reject);
				}
			});
		});
		
		// 비밀번호 리셋 여부 묻는 html p-29
		function pwResetCk() {
			return "<div class='col-lg-12 col-md-12 col-sm-12 form-group'>"
				   +"	<div class='mx-3'>"
				   +"		<h5>비밀번호를 초기화 하시겠습니까?</h5>"
				   +"		<span>초기화 시 등록된 이메일로 전송이 됩니다.</span>"
				   +"	</div>"
				   +"</div>"
				   +"<div class='col-lg-12 col-md-12 col-sm-12 form-group'>"
				   +"	<button type='button' id='resetPw' name='resetPw' class='btn btn-primary btn-block'>확인"
				   +"	</button>"
				   +"	<button type='button' class='btn btn-secondary btn-block' data-dismiss='modal'>취소"
				   +"	</button>"
				   +"</div>"
		}
		
		// 비밀번호 reset 후 이메일로 전송 p-30
		$(document).on('click', '#resetPw', function(){	
			var email = $('#email').val();
			var mmemberId = $("#mmemberId").val();
			
			$.ajax({
				url: "resetPwMail?email=" + email + "&memberId="+mmemberId,
				type: "get",
				success : function(data) {
					console.log(data);
					message = data.trim();
					if (message == "success"){
						alert("초기화된 비밀번호가 등록된 메일로 전송되었습니다.");
						$("#modalpw").modal("hide");	
					} else {
						alert("초기화에 실패 했습니다.");
					}
				}, error : function(reject) {
					console.log(reject);
				}
			}); 
		});
	});
</script>