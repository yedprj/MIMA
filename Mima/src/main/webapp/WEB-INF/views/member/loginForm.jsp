<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

// 모달 박스 스타일
<style>
.layerPopLostIdPw h4 {
  font-size: 16px;
  margin-bottom: 25px;
}
.layerPopLostIdPw .tabBox {
  text-align: center;
  margin-bottom: 30px;
}
.layerPopLostIdPw .tabBox li {
  display: inline-block;
  width: 49%;
  height: 50px;
  line-height: 50px;
  border: 1px solid #ddd;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  -ms-box-sizing: border-box;
  -o-box-sizing: border-box;
  box-sizing: border-box;
}
.layerPopLostIdPw .tabBox li a {
  display: block;
}
.layerPopLostIdPw .tabBox li.active {
  background-color: #192028;
}
.layerPopLostIdPw .tabBox li.active a {
  color: #ffffff;
}
.layerPopLostIdPw .lostIdBox dl {
  margin-bottom: 15px;
}
.layerPopLostIdPw .lostIdBox dt {
  color: #3c4452;
  line-height: 24px;
  margin-bottom: 5px;
}
.layerPopLostIdPw .lostPwBox {
  display: none;
}
.layerPopLostIdPw .lostPwBox dl {
  margin-bottom: 15px;
}
.layerPopLostIdPw .lostPwBox dt {
  color: #3c4452;
  line-height: 24px;
  margin-bottom: 5px;
}
.layerPopLostIdPw .confirmBox {
  margin-top: 35px;
  text-align: center;
}
.layerPopLostIdPw .confirmBox .confirm {
  width: 195px;
  height: 50px;
  background-color: #192028;
  color: #ffffff;
  cursor: pointer;
}
.layerPopLostIdPw .closeBox {
  position: absolute;
  top: -52px;
  right: -52px;
}

// 스위치 박스 스타일
.ico-default {
	width: 30px;
	height: 30px;
	border-radius: 50%;
}

.switchBox > .lostIdBox > dl > dt .ico-facebook2:before {
	position: absolute;
	top: 50%;
	left: 50%;
	margin: -7.5px 0 0 -4px;
	width: 8px;
	height: 15px;
	background-position: -350px -230px;
}
.switchBox > .lostIdBox > dl > dt .ico-google:before {
	position: absolute;
	top: 50%;
	left: 50%;
	margin: -8px 0 0 -7.5px;
	width: 15px;
	height: 16px;
	background-position: -360px -230px;
}
.switchBox > .lostIdBox > dl > dt .ico-naver:before {
	position: absolute;
	top: 50%;
	left: 50%;
	margin: -5.5px 0 0 -6px;
	width: 12px;
	height: 11px;
	background-position: -380px -230px;
}
.switchBox > .lostIdBox > dl > dt .ico-kakao:before {
	position: absolute;
	top: 50%;
	left: 50%;
	margin: -7.5px 0 0 -8px;
	width: 16px;
	height: 15px;
	background-position: -400px -230px;
}
.switchBox > .lostIdBox > dl > dt .ico-appstore {
	display:inline-block;
	*display:inline;
	position:relative;
	margin-right:10px;
	vertical-align:middle;
	background-color:#fff;
}
.switchBox > .lostIdBox > dl > dt .ico-appstore:before {
	position: absolute;
	top: 50%;
	left: 50%;
	margin: -11px 0 0 -7.5px;
	width: 16px;
	height: 19px;
	background-position: -419px -226px;
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
