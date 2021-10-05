<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <!-- s:1005 의사 프로파일 인서트 폼 -->
   <div class="boxed_wrapper">

        <!-- preloader -->
        <div class="preloader"></div>
        <!-- preloader -->

        <!--page-title-two-->
        <section class="page-title-two">
            <div class="title-box centred bg-color-2">
                <div class="pattern-layer">
                    <div class="pattern-1" style="background-image: url(${pageContext.request.contextPath}/assets/images/shape/shape-70.png);"></div>
                    <div class="pattern-2" style="background-image: url(${pageContext.request.contextPath}/assets/images/shape/shape-71.png);"></div>
                </div>
                <div class="auto-container">
                    <div class="title">
                        <h1>나의 프로필 입력/수정</h1>
                    </div>
                </div>
            </div>
            <div class="lower-content">
                <ul class="bread-crumb clearfix">
                    <li><a href="index.html">Home</a></li>
                    <li>Partner_Doctor_내 프로필 입력/수정</li>
                </ul>
            </div>
        </section>
        <!--page-title-two end-->


        <!-- doctors-dashboard -->
        <section class="doctors-dashboard bg-color-3">
            <div class="left-panel">
                <div class="profile-box">
                    <div class="upper-box">
                        <figure class="profile-image"><img src="${pageContext.request.contextPath}/assets/images/resource/profile-2.png" alt=""></figure>
                        <div class="title-box centred">
                            <div class="inner">
                                <h3>Dr. Rex Allen</h3>
                                <p>MDS - Periodontology</p>
                            </div>
                        </div>
                    </div>
                    <div class="profile-info">
                        <ul class="list clearfix">
                            <li><a href="doctors-dashboard.html"><i class="fas fa-columns"></i>Dashboard</a></li>
                            <li><a href="appointment.html"><i class="fas fa-calendar-alt"></i>Appointments</a></li>
                            <li><a href="my-patients.html"><i class="fas fa-wheelchair"></i>My Patients</a></li>
                            <li><a href="add-listing.html"><i class="fas fa-plus-circle"></i>Add Listing</a></li>
                            <li><a href="schedule-timing.html"><i class="fas fa-clock"></i>Schedule Timing</a></li>
                            <li><a href="review.html"><i class="fas fa-star"></i>Reviews</a></li>
                            <li><a href="message.html"><i class="fas fa-comments"></i>Messages</a><span>20</span></li>
                            <li><a href="my-profile.html" class="current"><i class="fas fa-user"></i>My Profile</a></li>
                            <li><a href="change-password.html"><i class="fas fa-unlock-alt"></i>Change Password</a></li>
                            <li><a href="login.html"><i class="fas fa-sign-out-alt"></i>Logout</a></li>
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
                                    <h3>나의 정보</h3>
                                </div>
                                <div class="inner-box">
                                    <div class="profile-title">
                                    <!-- 여기 프로필 사진 보여주기 하면 됨 -->
                                        <figure class="image-box"><img src="${pageContext.request.contextPath}/assets/images/resource/profile-3.png" alt=""></figure>
                                        <div class="upload-photo">
                                       		<input id="fileInput" type="file" name="meditVFile" required><br>
                                            <span>형식은 JPG, GIF, PNG 만 가능합니다.<br> 파일사이즈 최대 2MB</span><br>
                                            <button type="button" id="meditUpBtn" class="theme-btn-one" style="box-shadow: none;">등록</button>
                                        </div>
                                    </div>
                                    <form action="add-listing.html" method="post">
                                        <div class="row clearfix">
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>이름*</label>
                                                <input type="text" name="fname" placeholder="Username*" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>사용자 이름*</label>
                                                <input type="text" name="fname" placeholder="Enter your name" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>병원 이름</label>
                                                <input type="text" name="lname" placeholder="Enter your name" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>병원 이메일</label>
                                                <input type="email" name="email" placeholder="Email" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>병원 전화번호</label>
                                                <input type="text" name="phone" placeholder="Mobile number" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>Gender</label>
                                                <input type="text" name="gender" placeholder="Gender" required="">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                           
                            <div class="single-box">
                                <div class="title-box">
                                    <h3>병원 연락처 상세</h3>
                                </div>
                                <div class="inner-box">
                                    <form action="add-listing.html" method="post">
                                        <div class="row clearfix">
											<div class="col-lg-6 col-md-6 col-sm-12 form-group">
												<input type="hidden" id="confmKey" name="confmKey" value="" >
												<input type="text" class="form-control form-control-user"
													id="postcode" name="postcode" placeholder="우편번호" readonly>
											</div>
	                                        <div class="col-lg-6 col-md-12 col-sm-12 form-group" >
												<button type="button" onclick="execDaumPostcode();" class="theme-btn-one" style=" float:right;padding:9px 30px; ">
													주소검색</button>
											</div>
											
											<div class="col-lg-12 col-md-12 col-sm-12 form-group">
												<input type="text" class="form-control" id="address"
													name="address" placeholder="주소">
											</div>
											<div class="col-lg-6 col-md-6 col-sm-12 form-group">
												<input type="text" class="form-control" id="detailAddress"
												name="detailAddress" placeholder="상세주소">
											</div>
											
											<div class="col-lg-6 col-md-6 col-sm-12 form-group">
												<input type="text" class="form-control" id="extraAddress"
													name="extraAddress" placeholder="참고항목">
											</div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="single-box">
                                <div class="title-box">
                                    <h3>Education</h3>
                                </div>
                                <div class="inner-box">
                                    <form action="add-listing.html" method="post">
                                        <div class="row clearfix" >
                                            <div class="col-lg-4 col-md-6 col-sm-12 form-group">
                                                <label>Degree</label>
                                                <input type="text" name="degree" required="">
                                            </div>
                                            <div class="col-lg-4 col-md-6 col-sm-12 form-group">
                                                <label>Institute</label>
                                                <input type="text" name="instute" required="">
                                            </div>
                                            <div class="col-lg-4 col-md-6 col-sm-12 form-group">
                                                <label>Passing year</label>
                                                <input type="text" name="year" required="">
                                            </div>
                                            <div class="col-lg-4 col-md-6 col-sm-12 form-group">
                                                <label>Degree</label>
                                                <input type="text" name="degree2" required="">
                                            </div>
                                            <div class="col-lg-4 col-md-6 col-sm-12 form-group">
                                                <label>Institute</label>
                                                <input type="text" name="instute2" required="">
                                            </div>
                                            <div class="col-lg-4 col-md-6 col-sm-12 form-group">
                                                <label>Passing year</label>
                                                <input type="text" name="year2" required="">
                                            </div>
                                            <div class="col-lg-4 col-md-6 col-sm-12 form-group">
                                                <label>Degree</label>
                                                <input type="text" name="degree3" required="">
                                            </div>
                                            <div class="col-lg-4 col-md-6 col-sm-12 form-group">
                                                <label>Institute</label>
                                                <input type="text" name="instute3" required="">
                                            </div>
                                            <div class="col-lg-4 col-md-6 col-sm-12 form-group">
                                                <label>Passing year</label>
                                                <input type="text" name="year3" required="">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="single-box">
                                <div class="title-box">
                                    <h3>Experience</h3>
                                </div>
                                <div class="inner-box">
                                    <form action="add-listing.html" method="post">
                                        <div class="row clearfix" id="addEpxDiv">
                                            <!-- 경력1 -->
                                            <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                                <label>병원이름</label>
                                                <input type="text" name="1" required="">
                                            </div>
                                            <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                                <label>직위</label>
                                                <input type="text" name="2" required="">
                                            </div>
                                            <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                                <label>언제부터</label>
                                                <input type="date" name="3" required=""style="cursor:pointer">
                                            </div>
                                            <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                                <label>언제까지</label>
                                                <input type="date" name="4" required=""style="cursor:pointer">
                                            </div>
                                            <!-- 경력2 -->
                                            <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                                <label>병원이름</label>
                                                <input type="text" name="5" required="">
                                            </div>
                                            <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                                <label>직위</label>
                                                <input type="text" name="6" required="">
                                            </div>
                                            <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                                <label>언제부터</label>
                                                <input type="date" name="7" required=""style="cursor:pointer">
                                            </div>
                                            <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                                <label>언제까지</label>
                                                <input type="date" name="8" required=""style="cursor:pointer">
                                            </div>
                                            <!-- 경력3 -->
                                            <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                                <label>병원이름</label>
                                                <input type="text" name="5" required="">
                                            </div>
                                            <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                                <label>직위</label>
                                                <input type="text" name="6" required="">
                                            </div>
                                            <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                                <label>언제부터</label>
                                                <input type="date" name="7" required="" style="cursor:pointer">
                                            </div>
                                            <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                                <label>언제까지</label>
                                                <input type="date" name="8" required="" style="cursor:pointer">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                             <div class="single-box">
                                <div class="title-box">
                                    <h3>About Me</h3>
                                </div>
                                <div class="inner-box">
                                    <form action="add-listing.html" method="post">
                                        <div class="row clearfix">
                                            <div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                                <label>자기소개</label>
                                                <textarea name="message" placeholder="전문분야와 경력 등 상세히 알려주세요."></textarea>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="btn-box d-flex flex-row-reverse">
                                <a href="add-listing.html" class="cancel-btn">Cancel</a>
                                <a href="add-listing.html" class="theme-btn-one">Save Change<i class="icon-Arrow-Right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- doctors-dashboard -->

    </div>
    
    
    <script>
	// 주소 API 연결 s:1005
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
    }// 주소 api 끝
    
    //s:1005 addExp onCLick event
    $('#addExp').on('click', function(){
    	const str =""
    	
    	str+=
    	
    	
    	$('#addExpDiv').append(
    			
    			)
    }) //End of addEdu onCLick event
    
    </script>
    
    