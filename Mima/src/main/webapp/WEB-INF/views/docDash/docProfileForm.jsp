<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!--page-title-two-->
        <section class="page-title-two">
            <div class="title-box centred bg-color-2">
                <div class="pattern-layer">
                    <div class="pattern-1" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-70.png);"></div>
                    <div class="pattern-2" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-71.png);"></div>
                </div>
                <div class="auto-container">
                    <div class="title">
                        <h1>진료관리</h1>
                    </div>
                </div>
            </div>
            <div class="lower-content">
                <ul class="bread-crumb clearfix">
                    <li><a href="${pageContext.request.contextPath}">Home</a></li>
                    <li>진료관리</li>
                </ul>
            </div>
        </section>
        <!--page-title-two end-->


        <!-- doctors-dashboard -->
        <section class="doctors-dashboard bg-color-3">
            <div class="left-panel">
                <div class="profile-box">
                    <div class="upper-box">
                        <figure class="profile-image"><img src="${pageContext.request.contextPath}/resources/assets/images/resource/profile-2.png" alt=""></figure>
                        <div class="title-box centred">
                            <div class="inner">

                                <h3>${session.name}</h3>

                                <p>MDS - Periodontology</p>
                            </div>
                        </div>
                    </div>
                    <div class="profile-info">
                        <ul class="list clearfix">
			                <li><a href="docMain"><i class="fas fa-columns"></i>대쉬보드</a></li>
			                <li><a href="apptManage"><i class="fas fa-clock"></i>예약관리</a></li>
			                <li><a href="apptHistory"><i class="fas fa-calendar-alt"></i>진료내역</a></li>
			                <li><a href="patientList"><i class="fas fa-wheelchair"></i>나의 환자들</a></li>
			                <li><a href="docReview"><i class="fas fa-star"></i>나의 후기</a></li>
			                <li><a href="docQna"><i class="fas fa-comments"></i>나의 문의</a></li>
			                <!-- s:1005 insertForm, subject Form -->
			                <li><a href="docProfileInsertForm"><i class="fas fa-user"></i>프로필 관리</a></li>
			                <li><a href="docProfileForm" class="current"><i class="fas fa-stethoscope"></i>진료관리</a></li>
			                <li><a href="docPwChangeForm"><i class="fas fa-unlock-alt"></i>비밀번호 변경</a></li>
			                <li><a href="login.html"><i class="fas fa-sign-out-alt"></i>로그아웃</a></li>
			            </ul>
                    </div>
                </div>
            </div>
            <div class="right-panel">
                <div class="content-container">
                    <div class="outer-container">
                        <div class="add-listing my-profile">
                        <div class="single-box">
                               <div class="title-box">
                                    <h3>진료 시간</h3>
                                    <span>가능한 진료 시간을 설정해주세요.</span>
                                </div>
                                <div class="inner-box">
                                    <form action="insertAvailable" method="post" id="availableFrm">
                                    <!-- row start -->
                                        <div class="row clearfix" id="addEpxDiv">
                                        <!-- 월화수목금토일 시간설정 -->
                                            <div class="col-lg-3 col-md-6 col-sm-12 form-group">
	                                             <div class="form-check form-check-inline">
													  <input class="form-check-input" type="checkbox" id="mon" value="mon">
													  <label class="form-check-label" for="inlineCheckbox1">월</label>
												</div>
                                            </div>
                                            <div class="col-lg-9 col-md-6 col-sm-12 form-group">
                                                <label>가능시간, 시작 시간을 기준으로 작성하되 띄어쓰기로 구분해 주세요</label>
	                                            <input type="text" name="mon_time" id="mon_time" placeholder="${placeholder}" required="">
                                            </div>
                                            <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                                <div class="form-check form-check-inline">
												  <input class="form-check-input" type="checkbox" id="tue" value="tue">
												  <label class="form-check-label" for="inlineCheckbox2">화</label>
												</div>
                                            </div>
                                            <div class="col-lg-9 col-md-6 col-sm-12 form-group">
                                                <label>가능시간, 시작 시간을 기준으로 작성하되 띄어쓰기로 구분해 주세요</label>
	                                            <input type="text" id="tue_time" name="tue_time" placeholder="${placeholder}" required="">
                                            </div>
                                            <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                                <div class="form-check form-check-inline">
												  <input class="form-check-input" type="checkbox" id="wed" value="wed">
												  <label class="form-check-label" for="inlineCheckbox3">수</label>
												</div>
                                            </div>
                                            <div class="col-lg-9 col-md-6 col-sm-12 form-group">
                                                <label>가능시간, 시작 시간을 기준으로 작성하되 띄어쓰기로 구분해 주세요</label>
	                                            <input type="text"  id="wed_time" name="wed_time" placeholder="${placeholder}" required="">
                                            </div>
                                            <div class="col-lg-3 col-md-6 col-sm-12 form-group">
	                                             <div class="form-check form-check-inline">
													  <input class="form-check-input" type="checkbox" id="thu" value="thu">
													  <label class="form-check-label" for="inlineCheckbox1">목</label>
												</div>
                                            </div>

                                            <div class="col-lg-9 col-md-6 col-sm-12 form-group">
                                                <label>가능시간, 시작 시간을 기준으로 작성하되 띄어쓰기로 구분해 주세요</label>
	                                            <input type="text" id="thu_time" name="thu_time" placeholder="${placeholder}" required="">
                                            </div>
                                            <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                                <div class="form-check form-check-inline">
												  <input class="form-check-input" type="checkbox" id="fri" value="fri">
												  <label class="form-check-label" for="inlineCheckbox2">금</label>
												</div>

                                            </div>
                                            <div class="col-lg-9 col-md-6 col-sm-12 form-group">
                                                <label>가능시간, 시작 시간을 기준으로 작성하되 띄어쓰기로 구분해 주세요</label>
	                                            <input type="text" id="fri_time" name="fri_time" placeholder="${placeholder}" required="">
                                            </div>
                                            <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                                <div class="form-check form-check-inline">
												  <input class="form-check-input" type="checkbox" id="sat" value="sat">
												  <label class="form-check-label" for="inlineCheckbox2">토</label>
												</div>
                                            </div>
                                            <div class="col-lg-9 col-md-6 col-sm-12 form-group">
                                                <label>가능시간, 시작 시간을 기준으로 작성하되 띄어쓰기로 구분해 주세요</label>
	                                            <input type="text" id="sat_time" name="sat_time" placeholder="${placeholder}" required="">
                                            </div>
                                            <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                                <div class="form-check form-check-inline">
												  <input class="form-check-input" type="checkbox" id="sun" value="sun">
												  <label class="form-check-label" for="inlineCheckbox2">일</label>
												</div>
                                            </div>
                                            <div class="col-lg-9 col-md-6 col-sm-12 form-group">
                                                <label>가능시간, 시작 시간을 기준으로 작성하되 띄어쓰기로 구분해 주세요</label>
	                                            <input type="text" id="sun_time" name="sun_time" placeholder="${placeholder}" required="">
                                            </div>
											<!-- 날짜, 시간 선택 끝 -->                                           
                                        </div>
                                        <!-- end of row -->
                                <div class="btn-box d-flex flex-row-reverse"style="padding-top:10px">
	                                <button type="reset" class="cancel-btn">취소</button>
	                                <button id="saveAvailBtn" type="button" class="theme-btn-one" style="margin-left:10px">저장하기<i class="icon-Arrow-Right"></i></button>
	                            </div>
                                    </form>
                                </div>
                            </div>
                        
                            <div class="single-box">
                                <div class="title-box">
                                    <h3>진료비 책정</h3>
                                    <span>진료명과 진료비를 설정해주세요.</span>
                                </div>
                                <div class="inner-box" style="padding-bottom:20px">
                                    <form action="add-listing.html" method="post">
                                        <div class="row clearfix">
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>진료명1</label>
                                                <input type="text" id="category1" name="category1" required="required">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>금액</label>
                                                <input type="text" id="price1" name="price1" required="required">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>진료명2</label>
                                                <input type="text" id="category2" name="category2" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>금액</label>
                                                <input type="text" id="price2" name="price2" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>진료명3</label>
                                                <input type="text"id="category3" name="category3" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>금액</label>
                                                <input type="text"  id="price3" name="price3" required="">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                 <div class="btn-box d-flex flex-row-reverse" style="padding:10px">
	                                <button type="reset" class="cancel-btn">취소</button>
	                                <button id="subjectPriceInsertBtn" name="subjectPriceInsertBtn" class="theme-btn-one" style="margin-left:10px">저장하기<i class="icon-Arrow-Right"></i></button>
	                            </div>
                            </div>
                            
                           <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- doctors-dashboard -->
        
<script>

/* 페이지 온 로드 */
$(function(){
	
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";

	let docNo = ${session.memberNo};
	
	//진료가능시간 등록 버튼 이벤트
	$("#saveAvailBtn").on('click', function(){
		
		//ajax start
		$.ajax({
			url : '../docAvail/insertAvail',
			method : "POST",
			data : {
				docNo: docNo,
				mon : $('#mon_time').val(),
				tue : $('#tue_time').val(),
				wed : $('#wed_time').val(),
				thu : $('#thu_time').val(),
				fri : $('#fri_time').val(),
				sat : $('#sat_time').val(),
				sun : $('#sun_time').val()
			},
			beforeSend : function(xhr) {
				console.log(csrfHeaderName + " and " + csrfTokenValue);
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					//xhr.setRequestHeader("aa", "bb");
			},
			success : function(data) {
				alert("진료가능 요일, 시간이 성공적으로 저장되었습니다.");
				//버튼 없애는게 나을까여??? s:1005
				$('#saveAvailBtn').attr('disabled', true);
			},// success end
			error: function(err){
				console.error(err);
			}
		})
		//  ajax end
		
	})	//진료가능시간 등록 버튼 이벤트 끝
	
	//진료 과목과 가격 등록 버튼 이벤트
	$("#subjectPriceInsertBtn").on('click', function(){
		
		//ajax start
		$.ajax({
			url : '../subject/insertSub',
			method : "POST",
			data : {
				docNo: docNo,
				category1 : $('#category1').val(),
				price1 : $('#price1').val(),
				category2 : $('#category2').val(),
				price2 : $('#price2').val(),
				category3 : $('#category3').val(),
				price3 : $('#price3').val(),
			},
			beforeSend : function(xhr) {
				console.log(csrfHeaderName + " and " + csrfTokenValue);
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					//xhr.setRequestHeader("aa", "bb");
			},
			success : function(data) {
				alert("진료과목과 가격이 성공적으로 저장되었습니다.");
				
				$('#saveAvailBtn').attr('disabled', true);
				
			},// success end
			error: function(err){
				console.error(err);
			}
		})
		//  ajax end
		
	})//진료 과목과 가격 등록 버튼 이벤트 끝 
	
	
	



})/* end of 페이지 온 로드 */
</script>