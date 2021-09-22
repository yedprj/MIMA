<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>	


 <!--Page Title-->
        <section class="page-title centred bg-color-1">
            <div class="pattern-layer">
                <div class="pattern-1" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-70.png);"></div>
                <div class="pattern-2" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-71.png);"></div>
            </div>
            <div class="auto-container">
                <div class="content-box">
                    <div class="title">
                        <h1>명상 컨텐츠 등록</h1>
                    </div>
                    <ul class="bread-crumb clearfix">
                        <li><a href="index.html">Home</a></li>
                        <li>명상 등록 폼</li>
                    </ul>
                </div>
            </div>
        </section>
        <!--End Page Title-->

<!-- registration-section -->
<section class="registration-section bg-color-3">
	<div class="pattern">
		<div class="pattern-1"style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-85.png);"></div>
		<div class="pattern-2" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-86.png);"></div>
	</div>
	<div class="auto-container">
		<div class="inner-box">
			<div class="content-box">
				<div class="title-box">
					<h3>명상 등록</h3>
				</div>
				<div class="inner">
					<form action="register" method="post" class="registration-form" ><!-- 멀티파트 나중에 고치기 -->
						<div class="row clearfix">
							<div class="col-lg-12 col-md-12 col-sm-12 form-group">
								<label>카테고리 체크박스로 줄까? 카테고리랑 해시태그 다르게??</label>
								<input type="text" id="category" name="category" placeholder="카테고리를 입력하세요" required="reqired">
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12 form-group">
								<label>명상 제목</label>
								<input type="text" id="title" name="title" placeholder="제목을 입력하세요" required="reqired">
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12 form-group">
								<label>내용</label>
								<textarea class="form-control" id="contents" name="contents" placeholder="명상의 내용을 입력하세요" required="reqired"></textarea>
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12 form-group">
								<label>파일첨부</label><!-- 나중에 파일로 고치기 -->
								<input type="text" id="meditationFile" name="meditationFile" required="reqired">
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12 form-group">
								<label>명상가 이름</label> 
								<input type="text" id="teacherName" name="teacherName" placeholder="명상가의 이름은?">
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12 form-group">
								<label>명상가 정보</label> 
								<textarea class="form-control" id="teacherInfo" name="teacherInfo" placeholder="명상가의 정보"></textarea>
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12 form-group">
								<label>명상가 사진  파일로 고치기</label>
								<input type="text" id="teacherPhoto" name="teacherPhoto">
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12 form-group message-btn">
								<button type="submit" class="theme-btn-one">
									등록하기!<i class="icon-Arrow-Right"></i>
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- registration-section end -->
