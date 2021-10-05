<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <h1>비밀번호 변경</h1>
                    </div>
                </div>
            </div>
            <div class="lower-content">
                <ul class="bread-crumb clearfix">
                    <li><a href="index.html">Home</a></li>
                    <li>비밀번호 변경</li>
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
			                <li><a href="docProfileForm"><i class="fas fa-user"></i>프로필 관리</a></li>
			                <li><a href="docPwChangeForm" class="current"><i class="fas fa-unlock-alt"></i>비밀번호 변경</a></li>
			                <li><a href="login.html"><i class="fas fa-sign-out-alt"></i>로그아웃</a></li>
			            </ul>
                    </div>
                </div>
            </div>
            <div class="right-panel">
                <div class="content-container">
                    <div class="outer-container">
                        <div class="add-listing change-password">
                            <div class="single-box">
                                <div class="title-box">
                                    <h3>비밀번호 변경</h3>
                                </div>
                                <div class="inner-box">
                                    <form action="add-listing.html" method="post">
                                        <div class="row clearfix">
                                            <div class="col-lg-6 col-md-12 col-sm-12 form-group">
                                                <label>이전 비밀번호</label>
                                                <input type="password" name="password1" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-12 col-sm-12 form-group">
                                                
                                            </div>
                                            <div class="col-lg-6 col-md-12 col-sm-12 form-group">
                                                <label>새로운 비밀번호</label>
                                                <input type="password" name="password2" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-12 col-sm-12 form-group">
                                                
                                            </div>
                                            <div class="col-lg-6 col-md-12 col-sm-12 form-group">
                                                <label>새로운 비밀번호 확인</label>
                                                <input type="password" name="password3" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-12 col-sm-12 form-group">
                                                
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