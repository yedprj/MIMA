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
                    <li><a href="${pageContext.request.contextPath}">Home</a></li>
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
							<li><a href="docMain" class="current"><i class="fas fa-columns"></i>대쉬보드</a></li>
							<li><a href="apptManage"><i class="fas fa-clock"></i>예약관리</a></li>
							<li><a href="apptHistory"><i class="fas fa-calendar-alt"></i>진료내역</a></li>
							<li><a href="patientList"><i class="fas fa-wheelchair"></i>나의 환자들</a></li>
							<li><a href="docReview"><i class="fas fa-star"></i>나의 후기</a></li>
							<li><a href="docQna"><i class="fas fa-comments"></i>나의 문의</a></li>
							<li><a href="docProfile"><i class="fas fa-user"></i>프로필 관리</a></li>
							<li><a href="change-password.html"><i class="fas fa-unlock-alt"></i>비밀번호 변경</a></li>
							<li><a href="login.html"><i class="fas fa-sign-out-alt"></i>로그아웃</a></li>
						</ul>
                    </div>
                </div>
            </div>
            <div class="right-panel">
                <div class="content-container">
                    <div class="outer-container">
                        <div class="add-listing">
                            <div class="single-box">
                                <div class="title-box">
                                    <h3>기본 정보</h3>
                                </div>
                                <div class="inner-box">
                                    <form action="add-listing.html" method="post">
                                        <div class="row clearfix">
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>이름</label>
                                                <input type="text" name="name" placeholder="이름을 입력하세요." required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>연락처</label>
                                                <input type="text" name="phone" placeholder="연락처를 입력하세요." required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>이메일</label>
                                                <input type="email" name="email" placeholder="이메일을 입력하세요." required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>진료과목</label>
                                                <input type="text" name="subject" placeholder="진료과목을 입력하세요." required="">
                                            </div>
                                            <div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                                <label>프로필 사진</label>
                                                <input type="file" name="uploaded_file">
                                            </div>
                                            <div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                                <label>약력</label>
                                                <textarea name="message" placeholder="약력을 입력하세요."></textarea>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="single-box">
                                <div class="title-box">
                                    <h3>진료기관 정보</h3>
                                    <a href="add-listing.html" class="menu"><i class="icon-Dot-menu"></i></a>
                           
                                </div>
                                <div class="inner-box">
                                    <form action="add-listing.html" method="post">
                                        <div class="row clearfix">
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>주소</label>
                                                <input type="text" name="address" placeholder="Enter your City" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>연락처</label>
                                                <input type="text" name="hphone" placeholder="Enter your Address" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>State</label>
                                                <input type="text" name="state" placeholder="State" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>Zip code</label>
                                                <input type="text" name="zip" placeholder="Zip code" required="">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="single-box">
                                <div class="title-box">
                                    <h3>Curriculum</h3>
                                    <a href="add-listing.html" class="menu"><i class="icon-Dot-menu"></i></a>
                                </div>
                                <div class="inner-box">
                                    <form action="add-listing.html" method="post">
                                        <div class="row clearfix">
                                            <div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                                <label>Biography</label>
                                                <textarea name="message" placeholder="Enter your name"></textarea>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="single-box">
                                <div class="title-box">
                                    <h3>Social Network Info</h3>
                                    <a href="add-listing.html" class="menu"><i class="icon-Dot-menu"></i></a>
                                    <a href="add-listing.html" class="theme-btn-one">Add More<i class="icon-image"></i></a>
                                </div>
                                <div class="inner-box">
                                    <form action="add-listing.html" method="post">
                                        <div class="row clearfix">
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>Facebook URL</label>
                                                <input type="text" name="url" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>Twitter URL</label>
                                                <input type="text" name="url2" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>Google Plus URL</label>
                                                <input type="text" name="url3" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>Instagram URL</label>
                                                <input type="text" name="url4" required="">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="single-box">
                                <div class="title-box">
                                    <h3>Pricing</h3>
                                    <a href="add-listing.html" class="menu"><i class="icon-Dot-menu"></i></a>
                                    <a href="add-listing.html" class="theme-btn-one">Add More<i class="icon-image"></i></a>
                                </div>
                                <div class="inner-box">
                                    <form action="add-listing.html" method="post">
                                        <div class="row clearfix">
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>Treatment</label>
                                                <input type="text" name="treatment" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>PriceL</label>
                                                <input type="text" name="price" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>Treatment</label>
                                                <input type="text" name="treatment2" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>Price</label>
                                                <input type="text" name="price2" required="">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="btn-box">
                                <a href="add-listing.html" class="theme-btn-one">Save Change<i class="icon-Arrow-Right"></i></a>
                                <a href="add-listing.html" class="cancel-btn">Cancel</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- doctors-dashboard -->