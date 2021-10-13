<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <!-- e:1012 환자 프로파일 인서트 폼 -->
   <div class="boxed_wrapper">

        <!-- preloader -->
        <div class="preloader"></div>
        <!-- preloader -->

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
                              
                                <h3>${session.name}</h3>

                                <p>MDS - Periodontology</p>
                            </div>
                        </div>
                    </div>
                    <div class="profile-info">
                        <ul class="list clearfix">
							<li><a href="ptMain" class="current"><i class="fas fa-columns"></i>대쉬보드</a></li>
							<li><a href="ptBookManage"><i class="fas fa-calendar-alt"></i>나의 예약관리</a></li>
							<li><a href="ptHistory"><i class="fas fa-calendar-alt"></i>나의 진료내역</a></li>
							<li><a href="patientList"><i class="fas fa-wheelchair"></i>내가 찜한 의사</a></li>
							<li><a href="ptReview"><i class="fas fa-star"></i>나의 후기</a></li>
							<li><a href="ptQna"><i class="fas fa-comments"></i>나의 문의</a></li>
							<li><a href="ptMedelivery"><i class="fas fa-ambulance"></i>약 배달관리</a></li>
							<li><a href="ptProfileDetail"><i class="fas fa-user"></i>프로필 관리</a></li>
							<li><a href="ptPwChangeForm"><i class="fas fa-unlock-alt"></i>비밀번호 변경</a></li>
							<li><a href="login.html"><i class="fas fa-sign-out-alt"></i>로그아웃</a></li>
			            </ul>
                    </div>
                </div>
            </div>
            <div class="right-panel">
                <div class="content-container">
                    <div class="outer-container">
                        <div class="add-listing my-profile">
                           <form id="ptUpdateForm" method="post"  action="ptprofileUpdate">
                           		<input type="hidden" id="memberNo" name="memberNo" value="${session.memberNo }">
		                            <div class="single-box">
		                                <div class="title-box">
		                                    <h3>나의 정보</h3>
		                                </div>
		                                <div class="inner-box">
	                                
		                                    <div class="profile-title">
		                                    <!-- 여기 프로필 사진 보여주기 하면 됨 -->
		                                    	<div>
			                                        <figure class="image-box"><img width="300" height="300"  id="profileImg" src="${pageContext.request.contextPath}/resources/assets/images/resource/profile-3.png" alt="프로필 미리보기"></figure>
			                                        <ul id="uploaded"></ul>
		                                        </div>
		                                        <div class="upload-photo">
		                                       		<input id="fileInput" type="file" name="docProImgFile" required><br>
		                                            <span>형식은 JPG, GIF, PNG 만 가능합니다.<br> 파일사이즈 최대 2MB</span><br>
		                                            <button type="button" id="imgUpBtn" class="theme-btn-one" style="box-shadow: none;">등록</button>
		                                        </div>
		                                    </div>
	                                    
	                                        <div class="row clearfix">
	                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
	                                                <label>이름</label>
	                                                <input type="text" value="${ptMyProfile.name }" required="">
	                                            </div>
	                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
	                                            	<label>아이디</label>
	                                                <input type="text" value="${ptMyProfile.memberId }" required="">
		                           				</div>
	                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
	                                                <label>이메일</label>
	                                                <input type="text" value="${ptMyProfile.email }" required="">
	                                            </div>
	                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
	                                                <label>전화번호</label>
	                                                <input type="text" value="${ptMyProfile.phone }" required="">
	                                            </div>
	                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
	                                                <label>성별</label>
	                                                <input type="text" value="${ptMyProfile.gender }" required="">
	                                            </div>
	                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
	                                                <label>주민등록번호</label>
	                                                <input type="text" value="${ptMyProfile.identifyNo }" required="">
	                                            </div>
	                                        </div>
		                                </div>
		                            </div>
                            <div class="btn-box d-flex flex-row-reverse">
                                <button class="theme-btn-one" >수정하기!!!!</button>
                            </div>
                           	 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
  

    </div>
    
    

    
    