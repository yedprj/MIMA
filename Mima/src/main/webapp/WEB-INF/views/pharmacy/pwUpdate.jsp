<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="include/dashHeader.jsp"></jsp:include>    
    
<section class="doctors-dashboard bg-color-3">
	<!-- 사이드 메뉴바 연결 -->
	<jsp:include page="include/sideDash.jsp"></jsp:include>
	
	<div class="right-panel">
                <div class="content-container">
                    <div class="outer-container">
                        <div class="add-listing change-password">
                            <div class="single-box">
                                <div class="title-box">
                                    <h3>Change Password</h3>
                                </div>
                                <div class="inner-box">
                                    <form action="add-listing.html" method="post">
                                        <div class="row clearfix">
                                            <div class="col-lg-6 col-md-12 col-sm-12 form-group">
                                                <label>Old Password</label>
                                                <input type="password" name="password1" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-12 col-sm-12 form-group">
                                                
                                            </div>
                                            <div class="col-lg-6 col-md-12 col-sm-12 form-group">
                                                <label>New Password</label>
                                                <input type="password" name="password2" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-12 col-sm-12 form-group">
                                                
                                            </div>
                                            <div class="col-lg-6 col-md-12 col-sm-12 form-group">
                                                <label>Confirm Password</label>
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
