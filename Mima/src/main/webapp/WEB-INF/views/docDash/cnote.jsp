<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
							<form action="add-listing.html" method="post">
								<div class="row clearfix">
									<div class="col-lg-6 col-md-6 col-sm-12 form-group">
										<label>환자명</label> <input type="text" name="fname"
											placeholder="Enter your name" required="">
									</div>
									<div class="col-lg-6 col-md-6 col-sm-12 form-group">
										<label>예약번호</label> <input type="text" name="fname"
											placeholder="Enter your bookingNo" required="">
									</div>
									<div class="col-lg-6 col-md-6 col-sm-12 form-group">
										<label>예약일</label> <input type="text" name="fname"
											placeholder="Enter your bookingDate" required="">
									</div>
									<div class="col-lg-6 col-md-6 col-sm-12 form-group">
										<label>성별</label> <input type="text" name="lname"
											placeholder="Enter your gender" required="">
									</div>
									<div class="col-lg-6 col-md-6 col-sm-12 form-group">
										<label>주민번호</label> <input type="text" name="email"
											placeholder="dob" required="">
									</div>
									<div class="col-lg-6 col-md-6 col-sm-12 form-group">
										<label>연락처</label> <input type="text" name="phone"
											placeholder="Mobile number" required="">
									</div>
									<div class="col-lg-12 col-md-12 col-sm-12 form-group">
										<label>주소</label> <input type="text" name="phone"
											placeholder="address" required="">
									</div>
									<div class="col-lg-12 col-md-12 col-sm-12 form-group">
										<label>증상</label>
										<textarea name="symptoms" placeholder="symptoms"></textarea>
									</div>
									<div class="col-lg-12 col-md-12 col-sm-12 form-group">
										<label>처치내용</label>
										<textarea name="note" placeholder="note"></textarea>
									</div>
									<div class="col-lg-12 col-md-12 col-sm-12 form-group">
										<label>기록</label>
										<textarea name="history" placeholder="history"></textarea>
									</div>
								</div>
							</form>
						</div>
					</div>
					<div class="btn-box">
						<a href="add-listing.html" class="theme-btn-one">저장하기<i class="icon-Arrow-Right"></i></a>
						<a href="add-listing.html" class="cancel-btn">새로 작성하기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>