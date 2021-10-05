<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
                        <h1>프로필 관리</h1>
                    </div>
                </div>
            </div>
            <div class="lower-content">
                <ul class="bread-crumb clearfix">
                    <li><a href="index.html">Home</a></li>
                    <li>프로필 관리</li>
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
                                <h3>Dr. Rex Allen</h3>
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
			                <li><a href="docProfileForm" class="current"><i class="fas fa-user"></i>프로필 관리</a></li>
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
                                    <h3>기본정보</h3>
                                </div>
                                <div class="inner-box">
                                    <div class="profile-title">
                                        <figure class="image-box"><img src="${pageContext.request.contextPath}/resources/assets/images/resource/profile-3.png" alt=""></figure>
                                        <div class="upload-photo">
                                            <a href="my-profile.html"><i class="icon-Upload"></i>프로필 사진 업로드</a>
                                            <span>최대 2MB의 JPG, GIF 혹은 PNG 파일을 업로드 해주세요.</span>
                                        </div>
                                    </div>
                                    <form action="add-listing.html" method="post">
                                        <div class="row clearfix">
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>아이디</label>
                                                <input type="text" name="memberId" placeholder="${placeholder}" required="" readonly>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>닉네임</label>
                                                <input type="text" name="nickname" placeholder="${placeholder}" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>이름</label>
                                                <input type="text" name="name" placeholder="${placeholder}" required="" readonly>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>성별</label>
                                                <input type="text" name="gender" placeholder="${placeholder}" required="" readonly>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>전화번호</label>
                                                <input type="text" name="phone" placeholder="${placeholder}" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>이메일</label>
                                                <input type="email" name="email" placeholder="${placeholder}" required="" readonly>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                            	<label>우편번호</label>
												<input type="hidden" id="confmKey" name="confmKey" value="" >
												<input type="text" class="form-control form-control-user"
													id="postcode" name="postcode" placeholder="${placeholder}" readonly>
											</div>
											<div class="col-lg-6 col-md-6 col-sm-12 form-group" style="margin-top: 30px;">
												<button type="button" onclick="execDaumPostcode();" class="theme-btn-one">
													주소검색</button>
											</div>
											<div class="col-lg-12 col-md-12 col-sm-12 form-group">
												<label>주소</label>
												<input type="text" class="form-control" id="address"
													name="address" placeholder="${placeholder}">
											</div>
											
											<div class="col-lg-6 col-md-6 col-sm-12 form-group">
												<label>상세주소</label>
												<input type="text" class="form-control" id="detailAddress"
												name="detailAddress" placeholder="${placeholder}">
											</div>
											
											<div class="col-lg-6 col-md-6 col-sm-12 form-group">
												<label>참고사항</label>
												<input type="text" class="form-control" id="extraAddress"
													name="extraAddress" placeholder="${placeholder}">
											</div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="single-box">
                                <div class="title-box">
                                    <h3>진료정보</h3>
                                    
                                </div>
                                <div class="inner-box">
                                    <form action="add-listing.html" method="post">
                                        <div class="row clearfix">
                                        	<div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                                <label>약력</label>
                                                <textarea name="profileCareer" placeholder="${placeholder}"></textarea>
                                            </div>
                                            
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
												<label>진료과목</label>
												<div class="select-box">
													<select class="good-select wide" id="subject" name="subject">
														<option data-display="진료과목">진료과목</option>
														<option value="1">진료과목</option>
														<option value="2">진료과목</option>
													</select>
												</div>
											</div>
                                            
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>진료기관 전화번호</label>
                                                <input type="text" name="clinicPhone" placeholder="${placeholder}"></input>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                            	<label>우편번호</label>
												<input type="hidden" id="confmKey" name="confmKey" value="" >
												<input type="text" class="form-control form-control-user"
													id="postcode" name="postcode" placeholder="${placeholder}" readonly>
											</div>
											<div class="col-lg-6 col-md-6 col-sm-12 form-group">
												<button type="button" onclick="execDaumPostcode();" class="theme-btn-one" style="margin-top: 30px;">
													주소검색</button>
											</div>
											<div class="col-lg-12 col-md-12 col-sm-12 form-group">
												<label>주소</label>
												<input type="text" class="form-control" id="address"
													name="address" placeholder="${placeholder}">
											</div>
											<div class="col-lg-6 col-md-6 col-sm-12 form-group">
												<label>상세주소</label>
												<input type="text" class="form-control" id="detailAddress"
												name="detailAddress" placeholder="${placeholder}">
											</div>
											
											<div class="col-lg-6 col-md-6 col-sm-12 form-group">
												<label>참고사항</label>
												<input type="text" class="form-control" id="extraAddress"
													name="extraAddress" placeholder="${placeholder}">
											</div>
											<div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                                <label>진료기관 사진 업로드 (선택)</label>
                                                <input type="file" name="upload_file">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="single-box">
                                <div class="title-box">
                                    <h3>진료가능시간 설정</h3>
                                    <a href="add-listing.html" class="theme-btn-one" style="margin-right:-50px;">Add More<i class="icon-image"></i></a>
                                </div>
                                <div class="inner-box">
                                    <form action="add-listing.html" method="post">
	                                    <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                        	<div class="form-check form-check-inline">
											  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
											  <label class="form-check-label" for="inlineCheckbox1">월</label>
											</div>
											<div class="form-check form-check-inline">
											  <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
											  <label class="form-check-label" for="inlineCheckbox2">화</label>
											</div>
											<div class="form-check form-check-inline">
											  <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option2">
											  <label class="form-check-label" for="inlineCheckbox3">수</label>
											</div>
											<div class="form-check form-check-inline">
											  <input class="form-check-input" type="checkbox" id="inlineCheckbox4" value="option2">
											  <label class="form-check-label" for="inlineCheckbox4">목</label>
											</div>
											<div class="form-check form-check-inline">
											  <input class="form-check-input" type="checkbox" id="inlineCheckbox5" value="option2">
											  <label class="form-check-label" for="inlineCheckbox5">금</label>
											</div>
											<div class="form-check form-check-inline">
											  <input class="form-check-input" type="checkbox" id="inlineCheckbox6" value="option2">
											  <label class="form-check-label" for="inlineCheckbox6">토</label>
											</div>
											<div class="form-check form-check-inline">
											  <input class="form-check-input" type="checkbox" id="inlineCheckbox7" value="option2">
											  <label class="form-check-label" for="inlineCheckbox7">일</label>
											</div>
	                                        <div class="col-lg-6 col-md-6 col-sm-12 form-group">
	                                        	<label>시작시간</label>
	                                            <input type="text" name="" placeholder="${placeholder}" required="">
	                                        	<label>마감시간</label>
	                                            <input type="text" name="" placeholder="${placeholder}" required="">
	                                        </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            
                            <div class="single-box">
                                <div class="title-box">
                                    <h3>진료비 책정</h3>
                                    <a href="add-listing.html" class="theme-btn-one" style="margin-right:-50px;">Add More<i class="icon-image"></i></a>
                                </div>
                                <div class="inner-box">
                                    <form action="add-listing.html" method="post">
                                        <div class="row clearfix">
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>진료명</label>
                                                <input type="text" name="treatment" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>금액</label>
                                                <input type="text" name="price" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>진료명</label>
                                                <input type="text" name="treatment2" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>금액</label>
                                                <input type="text" name="price2" required="">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            
                            <div class="btn-box">
                                <a href="add-listing.html" class="theme-btn-one">저장하기<i class="icon-Arrow-Right"></i></a>
                                <a href="add-listing.html" class="cancel-btn">취소</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- doctors-dashboard -->
        
<script>
//주소 API 연결
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").focus();
        }
    }).open();
}
</script>