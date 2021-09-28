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
								<div><c:out value="${error}"/></div>
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
									<a href="login.html">Forget Password?</a>
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
								href="${pageContext.request.contextPath}/member/joinForm">Register
								Now</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- registration-section end -->
