<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <!-- s:1007 진료후 환자가 의사리뷰 남기는 폼 -->
   <div class="boxed_wrapper">

        <!-- preloader -->
        <div class="preloader"></div>
        <!-- preloader -->

        <!--page-title-two-->
        <section class="page-title-two">
            <div class="title-box centred bg-color-2">
                <div class="pattern-layer">
                    <div class="pattern-1" style="background-image: url(assets/images/shape/shape-70.png);"></div>
                    <div class="pattern-2" style="background-image: url(assets/images/shape/shape-71.png);"></div>
                </div>
                <div class="auto-container">
                    <div class="title">
                        <h1>Submit Review</h1>
                    </div>
                </div>
            </div>
            <div class="lower-content">
                <div class="auto-container">
                    <ul class="bread-crumb clearfix">
                        <li><a href="index.html">Home</a></li>
                        <li>Submit Review</li>
                    </ul>
                </div>
            </div>
        </section>
        <!--page-title-two end-->


        <!-- submit-review -->
        <section class="submit-review bg-color-3">
            <div class="pattern">
                <div class="pattern-1" style="background-image: url(assets/images/shape/shape-85.png);"></div>
                <div class="pattern-2" style="background-image: url(assets/images/shape/shape-86.png);"></div>
            </div>
            <div class="auto-container">
                <div class="review-box">
                    <div class="content-box">
                        <div class="title-inner">
                            <h3>Write a Review for Dr. Agnes Ayres</h3>
                            <p>Don’t hesitate to review me</p>
                        </div>
                        <div class="content-inner">
                            <div class="rating-box">
                                <h4>Overall Rating</h4>
                                <ul class="rating clearfix">
                                    <li><i class="icon-Star-2"></i></li>
                                    <li><i class="icon-Star-2"></i></li>
                                    <li><i class="icon-Star-2"></i></li>
                                    <li><i class="icon-Star-2"></i></li>
                                    <li><i class="icon-Star-2"></i></li>
                                </ul>
                            </div>
                            <div class="form-inner">
                                <form action="submit.html" method="post">
                                    <div class="row clearfix">
                                        <div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                            <label>Title of your review</label>
                                            <input type="text" name="title" placeholder="If you could say it in one sentance, what would you say?" required="">
                                        </div>
                                        <div class="col-lg-6 col-md-12 col-sm-12 form-group">
                                            <label>Your name</label>
                                            <input type="text" name="name" placeholder="Enter your name" required="">
                                        </div>
                                        <div class="col-lg-6 col-md-12 col-sm-12 form-group">
                                            <label>Your email</label>
                                            <input type="email" name="email" placeholder="Enter your email" required="">
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                            <label>Your review</label>
                                            <textarea name="message" placeholder="Write your review here..."></textarea>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                            <div class="custom-controls-stacked">
                                                <label class="custom-control material-checkbox">
                                                    <input type="checkbox" class="material-control-input">
                                                    <span class="material-control-indicator"></span>
                                                    <span class="description">I accept <a href="submit.html">terms</a> and <a href="submit.html">conditions</a> and general policy</span>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 form-group message-btn">
                                            <button type="submit" class="theme-btn-one">Send Message<i class="icon-Arrow-Right"></i></button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- submit-review end -->
    </div>
 