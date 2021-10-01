<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <div class="boxed_wrapper">

        <!-- preloader -->
        <div class="preloader"></div>
        <!-- preloader -->

        <!-- doctors-dashboard -->
        <section class="doctors-dashboard bg-color-3" >
           
            <div >
                <div class="content-container" style="min-height:90%">
                    <div class="outer-container">
                        <div class="add-listing my-profile">
                            <div class="single-box" style="margin-bottom:0px;">
                                <div class="title-box">
                                    <h3>Basic Information</h3>${pt }
                                </div>
                                <div class="inner-box">
                                   <!--s:10/01 환자 프로필 사진 보여주는 곳 <div class="profile-title">
                                        <figure class="image-box"><img src="assets/images/resource/profile-4.png" alt=""></figure>
                                        <div class="upload-photo">
                                            <a href="my-profile.html"><i class="icon-Upload"></i>Upload Photo</a>
                                            <span>Allowed JPG, GIF or PNG. Max size of 2MB</span>
                                        </div>
                                    </div> -->
                                    <form>
                                        <div class="row clearfix">
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>이 름</label>
                                                <input type="text" name="fname" placeholder="Enter first name" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>주민번호</label>
                                                <input type="text" name="lname" placeholder="Enter last name" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>성별</label>
                                                <input type="email" name="email" placeholder="Enter your Email" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>전화번호</label>
                                                <input type="text" name="birth_date" placeholder="Date of birth" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>관심사</label>
                                                <input type="text" name="gender" placeholder="Your Gender" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>약배달</label>
                                                <input type="text" name="age" placeholder="Your Age" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>자가검진표</label>
                                                <input type="text" name="phone" placeholder="Your Phone" required="">
                                            </div>
                                            <div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                                <label>과거 병력</label>
                                                <textarea name="message" placeholder="Write your note..."></textarea>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- doctors-dashboard -->


    
    </div>
