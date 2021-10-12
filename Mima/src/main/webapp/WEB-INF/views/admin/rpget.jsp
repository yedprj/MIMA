<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="boxed_wrapper">

	<!-- preloader -->
	<div class="preloader"></div>
	<!-- preloader -->


		<!-- doctors-dashboard -->
		<section class="doctors-dashboard bg-color-3">

			<div>
				<div class="content-container">
					<div class="outer-container">
						<div class="add-listing my-profile">
							<div class="single-box">
								<div class="title-box">
									<h3>신고글</h3>
								</div>
								<div class="inner-box">
									<form action="add-listing.html" method="post">
										<div class="row clearfix">
											<div class="col-lg-6 col-md-6 col-sm-12 form-group">
												<label>신고당한 원글번호</label> <input type="text"
													value="${report.reportNo }" required="">
											</div>
											<div class="col-lg-6 col-md-6 col-sm-12 form-group">
												<label>신고한 회원번호</label> <input type="text"
													value="${report.memberNo }" required="">
											</div>
											<div class="col-lg-6 col-md-6 col-sm-12 form-group">
												<label>신고당한 회원번호</label> <input type="text"
													value="${report.postNo }" required="">
											</div>
											<div class="col-lg-6 col-md-6 col-sm-12 form-group">
												<label>신고한 회원아이디</label> <input type="text"
													value="${report.rmemberId }" required="">
											</div>
											<div class="col-lg-6 col-md-6 col-sm-12 form-group">
												<label>신고당한 회원아이디</label> <input type="text"
													value="${report.reportId }" required="">
											</div>
											<div class="col-lg-6 col-md-6 col-sm-12 form-group">
												<label>신고일</label> <input type="text"
													placeholder="<fmt:formatDate value="${report.reportDate }"
														pattern="yy-MM-dd" />"
													required="">
											</div>
											<div class="col-lg-12 col-md-12 col-sm-12 form-group">
												<label>신고글</label> <input type="text" value="신고내역"
													required="">
											</div>
										</div>
									</form>
								</div>
							</div>


							<div class="btn-box" align="center">
								<a href="rplist" class="cancel-btn">목록</a> 
								<a class="cancel-btn" onclick="location.href='rpdelete?reportNo=${report.reportNo}'">확인</a>
							</div>

						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- doctors-dashboard -->


		<!--Scroll to top-->
		<button class="scroll-top scroll-to-target" data-target="html">
			<span class="fa fa-arrow-up"></span>
		</button>
</div>

