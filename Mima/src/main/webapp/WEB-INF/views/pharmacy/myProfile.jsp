<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="include/dashHeader.jsp"></jsp:include>    
    
<section class="doctors-dashboard bg-color-3">
	<!-- 사이드 메뉴바 연결 -->
	<jsp:include page="include/sideDash.jsp"></jsp:include>
	
	<div class="right-panel">
                <div class="content-container">
                    <div class="outer-container">
                        <div class="add-listing my-profile">
                            <div class="single-box">
                                <div class="title-box">
                                    <h3>Basic Information</h3>
                                    <a href="add-listing.html" class="menu"><i class="icon-Dot-menu"></i></a>
                                </div>
                                <div class="inner-box">
                                    <div class="profile-title">
                                        <figure class="image-box"><img src="${pageContext.request.contextPath}/resources/assets/images/resource/profile-3.png" alt=""></figure>
                                        <div class="upload-photo">
                                            <a href="my-profile.html"><i class="icon-Upload"></i>Upload Photo</a>
                                            <span>Allowed JPG, GIF or PNG. Max size of 2MB</span>
                                        </div>
                                    </div>
                                    <form action="add-listing.html" method="post">
                                        <div class="row clearfix">
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>Username*</label>
                                                <input type="text" name="fname" placeholder="Username*" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>First name*</label>
                                                <input type="text" name="fname" placeholder="Enter your name" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>Last name</label>
                                                <input type="text" name="lname" placeholder="Enter your name" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>Email</label>
                                                <input type="email" name="email" placeholder="Email" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>Mobile number</label>
                                                <input type="text" name="phone" placeholder="Mobile number" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>Gender</label>
                                                <input type="text" name="phone" placeholder="Gender" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>Date of birth</label>
                                                <input type="text" name="phone" placeholder="Date of birth" required="">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="single-box">
                                <div class="title-box">
                                    <h3>About Me</h3>
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
                                    <h3>Contact Details</h3>
                                    <a href="add-listing.html" class="menu"><i class="icon-Dot-menu"></i></a>
                                </div>
                                <div class="inner-box">
                                    <form action="add-listing.html" method="post">
                                        <div class="row clearfix">
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>Address 1</label>
                                                <input type="text" name="address" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>Address 2</label>
                                                <input type="text" name="adderss2" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>City</label>
                                                <input type="text" name="city" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>State</label>
                                                <input type="text" name="state" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>Zip code</label>
                                                <input type="text" name="zip" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>Country</label>
                                                <input type="text" name="country" required="">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="single-box">
                                <div class="title-box">
                                    <h3>Clinic Info</h3>
                                    <a href="add-listing.html" class="menu"><i class="icon-Dot-menu"></i></a>
                                    <a href="add-listing.html" class="theme-btn-one">Add More<i class="icon-image"></i></a>
                                </div>
                                <div class="inner-box">
                                    <form action="add-listing.html" method="post">
                                        <div class="row clearfix">
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>Clinic name 1</label>
                                                <input type="text" name="name1" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>Clinic address 1</label>
                                                <input type="text" name="address1" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>Clinic name 2</label>
                                                <input type="text" name="address1" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>Clinic address 2</label>
                                                <input type="text" name="address2" required="">
                                            </div>
                                            <div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                                <label>Upload profile picture</label>
                                                <input type="file" name="upload_file">
                                            </div>
                                            <div class="col-lg-12 col-md-12 col-sm-12 image-column">
                                                <div class="image-box clearfix">
                                                    <figure class="image"><img src="${pageContext.request.contextPath}/resources/assets/images/resource/clinic-1.jpg" alt=""></figure>
                                                    <figure class="image"><img src="${pageContext.request.contextPath}/resources/assets/images/resource/clinic-2.jpg" alt=""></figure>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="single-box">
                                <div class="title-box">
                                    <h3>Education</h3>
                                    <a href="add-listing.html" class="menu"><i class="icon-Dot-menu"></i></a>
                                    <a href="add-listing.html" class="theme-btn-one">Add More<i class="icon-image"></i></a>
                                </div>
                                <div class="inner-box">
                                    <form action="add-listing.html" method="post">
                                        <div class="row clearfix">
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
                                    <a href="add-listing.html" class="menu"><i class="icon-Dot-menu"></i></a>
                                    <a href="add-listing.html" class="theme-btn-one">Add More<i class="icon-image"></i></a>
                                </div>
                                <div class="inner-box">
                                    <form action="add-listing.html" method="post">
                                        <div class="row clearfix">
                                            <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                                <label>Hospital name</label>
                                                <input type="text" name="1" required="">
                                            </div>
                                            <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                                <label>Designation</label>
                                                <input type="text" name="2" required="">
                                            </div>
                                            <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                                <label>From</label>
                                                <input type="text" name="3" required="">
                                            </div>
                                            <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                                <label>To</label>
                                                <input type="text" name="4" required="">
                                            </div>
                                            <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                                <label>Hospital name</label>
                                                <input type="text" name="5" required="">
                                            </div>
                                            <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                                <label>Designation</label>
                                                <input type="text" name="6" required="">
                                            </div>
                                            <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                                <label>From</label>
                                                <input type="text" name="7" required="">
                                            </div>
                                            <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                                <label>To</label>
                                                <input type="text" name="8" required="">
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
