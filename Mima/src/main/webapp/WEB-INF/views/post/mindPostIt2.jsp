<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.team-block-three .inner-box .image-box .textBox {
	position: absolute;
	left: 1px;
	display: inline-block;
	width: 100%;
	height: 100%;
	line-height:100%;
	text-align: center;
	z-index: 0.5;
}

.team-block-three .inner-box .image-box .textBox div {
	position: relative;
	display: inline-block;
	padding : 0 50px;
	top : 45%;
	text-align: center;
	z-index: 1;
}
.clinic-section {
    padding: 20px 0px 20px 0px;
}
.team-block-three .inner-box{
  box-shadow: none;
}
</style>

<div class="boxed_wrapper">






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
					<h1>그린 포스트잇</h1>
				</div>
			</div>
		</div>
		<div class="lower-content">
			<div class="auto-container">
				<ul class="bread-crumb clearfix">
					<li><a href="index.html">Home</a></li>
					<li>그린 포스트잇</li>
				</ul>
			</div>
		</div>
	</section>
	<!--page-title-two end-->


	<div class="select-field bg-color-3">
		<div class="auto-container">
			<div class="row clearfix">
				<div class="col-lg-12 col-md-12 col-sm-12 content-side">
					<div class="item-shorting clearfix">
						<div class="left-column pull-left">
							<h3>오늘 하루는 어땠나요? 😃</h3>
						</div>
						<div class="right-column pull-right clearfix">
							<div class="short-box clearfix">
								<div class="select-box">
									<p>2021년 09월 22일</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- clinic-section -->
	<section class="clinic-section">
		<div class="auto-container">
			<div class="row clearfix">
				<div class="col-lg-12 col-md-12 col-sm-12 content-side">
					<div class="content-box">
						<ul class="select-box clearfix">
							<li>
								<div class="single-checkbox">
									<input type="radio" name="check-box" id="check1"> <label
										for="check1"><span></span>Latest</label>
								</div>
							</li>
							<li>
								<div class="single-checkbox">
									<input type="radio" name="check-box" id="check2"> <label
										for="check2"><span></span>Random</label>
								</div>
							</li>
						</ul>
					</div>
					<br>
					<div class="wrapper grid">

						<div class="clinic-grid-content grid-item">
							<div class="row clearfix postContents">
								<div class="col-lg-4 col-md-6 col-sm-12 team-block">
									<div class="team-block-three">
										<div class="inner-box">
											<figure class="image-box">
												<img
													src="${pageContext.request.contextPath}/resources/assets/images/clinic/redPost.png"
													alt="">
												<a href="clinic-details.html"><i class="far fa-heart"></i></a>
												<div class="textBox">
													<div>
														textBox 테스트 textBox 테스트 textBox 테스트
													</div>
												</div>
											</figure>
										</div>
									</div>
								</div>



							</div>
						</div>
					</div>
					<div class="pagination-wrapper">
						<ul class="pagination">
							<li><a href="clinic-1.html" class="current">1</a></li>
							<li><a href="clinic-1.html">2</a></li>
							<li><a href="clinic-1.html">3</a></li>
							<li><a href="clinic-1.html"><i class="icon-Arrow-Right"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- clinic-section end -->





	<!--Scroll to top-->
	<button class="scroll-top scroll-to-target" data-target="html">
		<span class="fa fa-arrow-up"></span>
	</button>
</div>

<script>
	$(function() {

		postList();

	}); //end 

	//페이지 목록 조회
	function postList() {
		var str;
		$.ajax({
			url : "postList",
			dataType : "json",
			success : function(datas) {
				$(".postContents").empty();
				$.each(datas,function(i, data) {
					$("<div class='col-lg-4 col-md-6 col-sm-12 team-block'>")
						.append(
								"<div class='team-block-three'>"
								+ '<div class="team-block-three">'
								+ '<div class="inner-box">'
								+ '<figure class="image-box">'
								+ '<img src="${pageContext.request.contextPath}/resources/assets/images/clinic/redPost.png" alt=""> '
								+ '<a href="clinic-details.html"><i class="far fa-heart"></i></a>'
								+ '<div class="textBox">'
								+ '<div>'+data.contents+'</div>'
								+ '</div></figure></div></div>'
							)
						.appendTo(	$(".postContents"));

					}); // each end
			} // success end
		}) //ajax end
	} // 페이지목록 조회 end
</script>



