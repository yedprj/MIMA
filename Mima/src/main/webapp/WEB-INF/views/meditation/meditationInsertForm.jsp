<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Fav Icon -->
<link rel="icon" href="../../../Docpro/assets/images/favicon.ico" type="image/x-icon">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

<!-- Stylesheets -->
<link href="../../../Docpro/assets/css/font-awesome-all.css" rel="stylesheet">
<link href="../../../Docpro/assets/css/flaticon.css" rel="stylesheet">
<link href="../../../Docpro/assets/css/owl.css" rel="stylesheet">
<link href="../../../Docpro/assets/css/bootstrap.css" rel="stylesheet">
<link href="../../../Docpro/assets/css/jquery.fancybox.min.css" rel="stylesheet">
<link href="../../../Docpro/assets/css/animate.css" rel="stylesheet">
<link href="../../../Docpro/assets/css/color.css" rel="stylesheet">
<link href="../../../Docpro/assets/css/nice-select.css" rel="stylesheet">
<link href="../../../Docpro/assets/css/style.css" rel="stylesheet">
<link href="../../../Docpro/assets/css/responsive.css" rel="stylesheet">


</head>
<body>


<!-- registration-section -->
<section class="registration-section bg-color-3">
	<div class="pattern">
		<div class="pattern-1"
			style="background-image: url(assets/images/shape/shape-85.png);"></div>
		<div class="pattern-2"
			style="background-image: url(assets/images/shape/shape-86.png);"></div>
	</div>
	<div class="auto-container">
		<div class="inner-box">
			<div class="content-box">
				<div class="title-box">
					<h3>Doctor Registration</h3>
					<a href="register-page.html">Not a Doctor?</a>
				</div>
				<div class="inner">
					<form action="register-page.html" method="post"
						class="registration-form">
						<div class="row clearfix">
							<div class="col-lg-6 col-md-6 col-sm-12 form-group">
								<label>Fast name</label> <input type="text" name="fname"
									placeholder="Enter your name" required="">
							</div>
							<div class="col-lg-6 col-md-6 col-sm-12 form-group">
								<label>Last name</label> <input type="text" name="lname"
									placeholder="Enter your name" required="">
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12 form-group">
								<label>Email</label> <input type="email" name="email"
									placeholder="Enter your email" required="">
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12 form-group">
								<label>Password</label> <input type="password" name="password"
									placeholder="Your password" required="">
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12 form-group">
								<label>Confirm password</label> <input type="password"
									name="cpassword" placeholder="Confirm password" required="">
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12 form-group">
								<div class="custom-check-box">
									<div class="custom-controls-stacked">
										<label class="custom-control material-checkbox"> <input
											type="checkbox" class="material-control-input"> <span
											class="material-control-indicator"></span> <span
											class="description">I accept <a
												href="book-appointment.html">terms</a> and <a
												href="book-appointment.html">conditions</a> and general
												policy
										</span>
										</label>
									</div>
								</div>
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12 form-group message-btn">
								<button type="submit" class="theme-btn-one">
									Register Now<i class="icon-Arrow-Right"></i>
								</button>
							</div>
						</div>
					</form>
					<div class="text">
						<span>or</span>
					</div>
					<ul class="social-links clearfix">
						<li><a href="register-page.html">Login with Facebook</a></li>
						<li><a href="register-page.html">Login with Google Plus</a></li>
					</ul>
					<div class="login-now">
						<p>
							Already have an account? <a href="register-page.html">Login
								Now</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- registration-section end -->
</body>
</html>