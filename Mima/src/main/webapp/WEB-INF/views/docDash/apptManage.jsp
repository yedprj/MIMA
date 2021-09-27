<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- page wrapper -->
<body>

    <div class="boxed_wrapper">

        <!-- preloader -->
        <div class="preloader"></div>
        <!-- preloader -->


        <!-- main header -->
        <header class="main-header style-three">

            

            <!--sticky Header-->
            <div class="sticky-header">
                <div class="auto-container">
                    <div class="outer-box">
                        <div class="logo-box">
                            <figure class="logo"><a href="index.html"><img src="assets/images/small-logo.png" alt=""></a></figure>
                        </div>
                        <div class="menu-area">
                            <nav class="main-menu clearfix">
                                <!--Keep This Empty / Menu will come through Javascript-->
                            </nav>
                        </div>
                        <div class="btn-box"><a href="register-page.html" class="theme-btn-one"><i class="icon-image"></i>Join Now</a></div>
                    </div>
                </div>
            </div>
        </header>
        <!-- main-header end -->



        <!--page-title-two-->
        <section class="page-title-two">
            <div class="title-box centred bg-color-2">
                <div class="pattern-layer">
                    <div class="pattern-1" style="background-image: url(assets/images/shape/shape-70.png);"></div>
                    <div class="pattern-2" style="background-image: url(assets/images/shape/shape-71.png);"></div>
                </div>
                <div class="auto-container">
                    <div class="title">
                        <h1>예약관리</h1>
                    </div>
                </div>
            </div>
            <div class="lower-content">
                <ul class="bread-crumb clearfix">
                    <li><a href="index.html">홈</a></li>
                    <li>예약관리</li>
                </ul>
            </div>
        </section>
        <!--page-title-two end-->

        <!-- doctors-dashboard -->
        <section class="doctors-dashboard bg-color-3">
            <div class="left-panel">
                <div class="profile-box">
                    <div class="upper-box">
                        <figure class="profile-image"><img src="assets/images/resource/profile-2.png" alt=""></figure>
                        <div class="title-box centred">
                            <div class="inner">
                                <h3>Dr. Rex Allen</h3>
                                <p>MDS - Periodontology</p>
                            </div>
                        </div>
                    </div>
                    <div class="profile-info">
                        <ul class="list clearfix">
                          <li><a href="doctors-dashboard.html" class="current"><i class="fas fa-columns"></i>대쉬보드</a></li>
                            <li><a href="appointment.html"><i class="fas fa-clock"></i>예약관리</a></li>
                            <li><a href="my-patients.html"><i class="fas fa-calendar-alt"></i>진료내역</a></li>
                            <li><a href="add-listing.html"><i class="fas fa-wheelchair"></i>나의 환자들</a></li>
                            <li><a href="review.html"><i class="fas fa-star"></i>나의 후기</a></li>
                            <li><a href="message.html"><i class="fas fa-comments"></i>나의 문의</a></li>
                            <li><a href="my-profile.html"><i class="fas fa-user"></i>프로필 관리</a></li>
                            <li><a href="change-password.html"><i class="fas fa-unlock-alt"></i>비밀번호 변경</a></li>
                            <li><a href="login.html"><i class="fas fa-sign-out-alt"></i>로그아웃</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="right-panel">
                <div class="content-container">
                    <div class="outer-container">
                        <div class="appointment-list">
                            <div class="upper-box clearfix">
                                <div class="text pull-left">
                                    <h3>예약관리</h3>
                                </div>
                                <div class="select-box pull-right">
                                    <select class="wide">
                                       <option data-display="리스트로 보기">리스트로 보기</option>
                                       <option value="1">달력으로 보기</option>
                                    </select>
                                </div>
                            </div>
                            <div class="single-item">
                                <figure class="image-box"><img src="assets/images/resource/appointment-1.jpg" alt=""></figure>
                                <div class="inner">
                                	<div class="name-box">
	                                    <h4>${name } 이름</h4>
	                                    <span class="ptno">#${bookingList.ptNo} 예약번호</span>
	                                </div>
                                    <ul class="info-list clearfix">
                                        <li><i class="fas fa-map-marker-alt"></i></li>
                                        <li><i class="fas fa-clock"></i>${bookingTime } 예약날짜</li>
                                        <li><i class="fas fa-hourglass-start"></i>${consultTime } 진료날짜</li>
                                        <li><i class="fas fa-hourglass-start"></i>${consultTime } 진료시간</li>
                                        <li><i class="fas fa-hourglass-start"></i>${consultTime } 결제금액</li>
                                        <li><i class="fas fa-hourglass-start"></i>${consultTime } 결제상태</li>
                                        <li><i class="fas fa-envelope"></i>${email }</li>
                                        <li><i class="fas fa-phone"></i>${phone }</li>
                                    </ul>
                                    <ul class="confirm-list clearfix">
                                        <li><i class="fas fa-check"></i><a href="">Accept</a></li>
                                        <li><i class="fas fa-times"></i><a href="">Cancel</a></li>
                                    </ul>
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
        <!-- doctors-dashboard -->


        <!-- main-footer -->
        <footer class="main-footer">
            <div class="footer-top pt-100">
                <div class="pattern-layer">
                    <div class="pattern-1" style="background-image: url(assets/images/shape/shape-30.png);"></div>
                    <div class="pattern-2" style="background-image: url(assets/images/shape/shape-31.png);"></div>
                </div>
                <div class="auto-container">
                    <div class="widget-section">
                        <div class="row clearfix">
                            <div class="col-lg-4 col-md-6 col-sm-12 footer-column">
                                <div class="footer-widget logo-widget">
                                    <figure class="footer-logo"><a href="index.html"><img src="assets/images/footer-logo.png" alt=""></a></figure>
                                    <div class="text">
                                        <p>Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing .</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-6 col-sm-12 footer-column">
                                <div class="footer-widget links-widget">
                                    <div class="widget-title">
                                        <h3>About</h3>
                                    </div>
                                    <div class="widget-content">
                                        <ul class="links clearfix">
                                            <li><a href="index.html">About Us</a></li>
                                            <li><a href="index.html">Listing</a></li>
                                            <li><a href="index.html">How It Works</a></li>
                                            <li><a href="index.html">Our Services</a></li>
                                            <li><a href="index.html">Our Blog</a></li>
                                            <li><a href="index.html">Contact Us</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-12 footer-column">
                                <div class="footer-widget links-widget">
                                    <div class="widget-title">
                                        <h3>Useful Links</h3>
                                    </div>
                                    <div class="widget-content">
                                        <ul class="links clearfix">
                                            <li><a href="index.html">Specialist</a></li>
                                            <li><a href="index.html">Clinic</a></li>
                                            <li><a href="index.html">Hospital</a></li>
                                            <li><a href="index.html">Download App</a></li>
                                            <li><a href="index.html">Join as a Doctor</a></li>
                                            <li><a href="index.html">Privacy Policy</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-12 footer-column">
                                <div class="footer-widget contact-widget">
                                    <div class="widget-title">
                                        <h3>Contacts</h3>
                                    </div>
                                    <div class="widget-content">
                                        <ul class="info-list clearfix">
                                            <li><i class="fas fa-map-marker-alt"></i>
                                                Flat 20, Reynolds Neck, North Helenaville, FV77 8WS
                                            </li>
                                            <li><i class="fas fa-microphone"></i>
                                                <a href="tel:23055873407">+2(305) 587-3407</a>
                                            </li>
                                            <li><i class="fas fa-envelope"></i>
                                                <a href="mailto:info@example.com">info@example.com</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <div class="auto-container">
                    <div class="inner-box clearfix">
                        <div class="copyright pull-left"><p><a href="index.html">Docpro</a> &copy; 2020 All Right Reserved</p></div>
                        <ul class="footer-nav pull-right clearfix">
                            <li><a href="index.html">Terms of Service</a></li>
                            <li><a href="index.html">Privacy Policy</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </footer>
        <!-- main-footer end -->


        <!--Scroll to top-->
        <button class="scroll-top scroll-to-target" data-target="html">
            <span class="fa fa-arrow-up"></span>
        </button>
    </div>

</body><!-- End of .page_wrapper -->
</html>
    