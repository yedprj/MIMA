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
									
									<a href="#" data-toggle="modal" data-target="#modalpw">&nbsp;Forget Password?</a>
									
									<a href="#" data-toggle="modal" data-target="#modalidpw">Forget Id / </a>	
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
				<h5 class="modal-title" id="exampleModalLabel">아이디 찾기</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="frm" name="frm">
					<div>
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
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">				
				<button type="button" id="findId" class="btn btn-primary">확인</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalpw" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">비밀번호 찾기</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="frm1" name="frm1">
					<div>
						<div class="row clearfix">
							<div class="col-lg-12 col-md-12 col-sm-12 form-group">
								<label for="recipient-name" class="col-form-label">아이디</label> <input
									type="text" class="form-control" id="mmemberId" name="mmemberId"
									placeholder="아이디를 입력해주세요">
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12 form-group">
								<label for="message-text" class="col-form-label">이메일</label> <input
									type="text" class="form-control" id="email" name="email"
									placeholder="회원가입 시 인증한 메일을 입력해 주세요">
							</div>
						</div>
						
						<div id="pwReset">
						
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">			
				<button type="button" id="findpw" class="btn btn-primary">확인</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>

<!-- 아이디 비밀번호 찾기 ajax p-29 -->
<script>

	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
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
					$("#modalidpw").modal("hide");
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
				   +"	<h5>비밀번호를 초기화 하시겠습니까?</h5>"
				   +"	<span>초기화 시 등록된 이메일로 전송이 됩니다.</span>"
				   +"</div>"
				   +"<div>"
				   +"	<button type='button' id='resetPw' name='resetPw' class='btn btn-primary'>확인"
				   +"	</button>"
				   +"	<button type='button' class='btn btn-secondary' data-dismiss='modal'>취소"
				   +"	</button>"
				   +"</div>"
		}
		
		// 비밀번호 reset 후 이메일로 전송 p-29
		$(document).on('click', '#resetPw', function(){	
			var email = $('#email').val();
			
			$.ajax({
				url: "resetPwMail?email=" + email,
				type: "get",
				success : function(data) {
					console.log(data);
					alert("초기화된 비밀번호가 등록된 메일로 전송되었습니다");
					$("#modalpw").modal("hide");
				}, error : function(reject) {
					console.log(reject);
				}
			}); 
		});
	});
</script>