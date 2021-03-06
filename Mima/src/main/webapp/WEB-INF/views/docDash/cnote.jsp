<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
div {
	align: center;
}
</style>

<section>
	<div class="panel">
		<div class="content-container">
			<div class="outer-container">
				<div class="add-listing">
					<div class="single-box">
						<div class="title-box">
							<h3>진료노트</h3>
						</div>
						<div class="inner-box">
								<div class="row clearfix">
									<div class="col-lg-6 col-md-6 col-sm-12 form-group">
										<label>환자명</label>
										<input type="text" name="name" value="${cnote.name}" readonly>
									</div>
									<div class="col-lg-6 col-md-6 col-sm-12 form-group">
										<label>주민번호</label>
										<input type="text" name="identifyNo" value="${cnote.identifyNo}" readonly>
									</div>
									<div class="col-lg-6 col-md-6 col-sm-12 form-group">
										<label>성별</label>
										<input type="text" name="gender" value="${cnote.gender}" readonly>
									</div>
									<div class="col-lg-6 col-md-6 col-sm-12 form-group">
										<label>연락처</label>
										<input type="text" name="phone" value="${cnote.phone}" readonly>
									</div>
									<div class="col-lg-6 col-md-6 col-sm-12 form-group">
										<label>예약번호</label>
										<input type="text" name="bookingNo" value="${cnote.bookingNo}" readonly>
									</div>
									<div class="col-lg-6 col-md-6 col-sm-12 form-group">
										<label>진료일시</label>
										<input type="text" name="consultDate" value="<fmt:formatDate value="${cnote.consultDate}" pattern="yyyy-MM-dd"/> ${cnote.consultTime}" readonly>
									</div>
									<div class="col-lg-12 col-md-12 col-sm-12 form-group">
										<label>주소</label>
										<input type="text" name="addr1" value="${cnote.addr1} ${cnote.addr2} ${cnote.addr3}" readonly>
									</div>
									<div class="col-lg-12 col-md-12 col-sm-12 form-group">
										<label>진료과목</label>
										<input type="text" name="sub" value="${cnote.subject}" readonly>
									</div>
									<div class="col-lg-12 col-md-12 col-sm-12 form-group">
										<label>증상</label>
										<textarea name="ptsymptom" readonly>${cnote.ptSymptom}</textarea>
									</div>
									<div class="col-lg-12 col-md-12 col-sm-12 form-group">
										<label>평가</label>
										<textarea name="ptAssessment" readonly>${cnote.ptAssessment}</textarea>
									</div>
									<div class="col-lg-12 col-md-12 col-sm-12 form-group">
										<label>진단명</label>
										<textarea name="ptDiagnosis" readonly>${cnote.ptDiagnosis}</textarea>
									</div>
								</div>
					<div class="btn-box" style="margin-top: 40px;, margin-bottom: 20px;">
						<a href="javascript:window.close();" class="cancel-btn">창닫기</a>
						<!-- <a href="add-listing.html" class="theme-btn-one">닫기<i class="icon-Arrow-Right"></i></a> -->
					</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>