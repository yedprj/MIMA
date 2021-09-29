<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="include/dashHeader.jsp"></jsp:include>    
    
<section class="doctors-dashboard bg-color-3">
	<!-- 사이드 메뉴바 연결 -->
	<jsp:include page="include/sideDash.jsp"></jsp:include>
	
	<div class="right-panel">
                <div class="content-container">
                    <div class="outer-container">
                        <div class="appointment-list">
                            <div class="upper-box clearfix">
                                <div class="text pull-left">
                                    <h3>Appointment Lists</h3>
                                </div>
                                <div class="select-box pull-right">
                                    <select class="wide">
                                       <option data-display="Any Status">Any Status</option>
                                       <option value="1">Approved</option>
                                       <option value="2">Pending</option>
                                       <option value="4">Cancelled</option>
                                    </select>
                                </div>
                            </div>
                            <div class="single-item">
                                <figure class="image-box"><img src="assets/images/resource/appointment-1.jpg" alt=""></figure>
                                <div class="inner">
                                    <h4>Mary Astor</h4>
                                    <ul class="info-list clearfix">
                                        <li><i class="fas fa-clock"></i>15 Oct 2020, 09:30AM</li>
                                        <li><i class="fas fa-map-marker-alt"></i>G87P, Birmingham, UK</li>
                                        <li><i class="fas fa-hourglass-start"></i>Cardiology Test, Diabetic Diagnose</li>
                                        <li><i class="fas fa-envelope"></i><a href="mailto:anna@example.com">anna@example.com</a></li>
                                        <li><i class="fas fa-phone"></i><a href="tel:2265458856">+(22) 65_458_856</a></li>
                                    </ul>
                                    <ul class="confirm-list clearfix">
                                        <li><i class="fas fa-check"></i>Accept</li>
                                        <li><i class="fas fa-times"></i>Cancel</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="single-item">
                                <figure class="image-box"><img src="assets/images/resource/appointment-2.jpg" alt=""></figure>
                                <div class="inner">
                                    <h4>Rex Allen</h4>
                                    <ul class="info-list clearfix">
                                        <li><i class="fas fa-clock"></i>15 Oct 2020, 09:30AM</li>
                                        <li><i class="fas fa-map-marker-alt"></i>G87P, Birmingham, UK</li>
                                        <li><i class="fas fa-hourglass-start"></i>Cardiology Test, Diabetic Diagnose</li>
                                        <li><i class="fas fa-envelope"></i><a href="mailto:anna@example.com">anna@example.com</a></li>
                                        <li><i class="fas fa-phone"></i><a href="tel:2265458856">+(22) 65_458_856</a></li>
                                    </ul>
                                    <ul class="confirm-list clearfix">
                                        <li><i class="fas fa-check"></i>Accept</li>
                                        <li><i class="fas fa-times"></i>Cancel</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="single-item">
                                <figure class="image-box"><img src="assets/images/resource/appointment-3.jpg" alt=""></figure>
                                <div class="inner">
                                    <h4>Leroy Anderson</h4>
                                    <ul class="info-list clearfix">
                                        <li><i class="fas fa-clock"></i>15 Oct 2020, 09:30AM</li>
                                        <li><i class="fas fa-map-marker-alt"></i>G87P, Birmingham, UK</li>
                                        <li><i class="fas fa-hourglass-start"></i>Cardiology Test, Diabetic Diagnose</li>
                                        <li><i class="fas fa-envelope"></i><a href="mailto:anna@example.com">anna@example.com</a></li>
                                        <li><i class="fas fa-phone"></i><a href="tel:2265458856">+(22) 65_458_856</a></li>
                                    </ul>
                                    <ul class="confirm-list clearfix">
                                        <li><i class="fas fa-check"></i>Accept</li>
                                        <li><i class="fas fa-times"></i>Cancel</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="single-item">
                                <figure class="image-box"><img src="assets/images/resource/appointment-4.jpg" alt=""></figure>
                                <div class="inner">
                                    <h4>Julia Jhones</h4>
                                    <ul class="info-list clearfix">
                                        <li><i class="fas fa-clock"></i>15 Oct 2020, 09:30AM</li>
                                        <li><i class="fas fa-map-marker-alt"></i>G87P, Birmingham, UK</li>
                                        <li><i class="fas fa-hourglass-start"></i>Cardiology Test, Diabetic Diagnose</li>
                                        <li><i class="fas fa-envelope"></i><a href="mailto:anna@example.com">anna@example.com</a></li>
                                        <li><i class="fas fa-phone"></i><a href="tel:2265458856">+(22) 65_458_856</a></li>
                                    </ul>
                                    <ul class="confirm-list clearfix">
                                        <li><i class="fas fa-check"></i>Accept</li>
                                        <li><i class="fas fa-times"></i>Cancel</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="single-item">
                                <figure class="image-box"><img src="assets/images/resource/appointment-5.jpg" alt=""></figure>
                                <div class="inner">
                                    <h4>Terry Bradshaw</h4>
                                    <ul class="info-list clearfix">
                                        <li><i class="fas fa-clock"></i>15 Oct 2020, 09:30AM</li>
                                        <li><i class="fas fa-map-marker-alt"></i>G87P, Birmingham, UK</li>
                                        <li><i class="fas fa-hourglass-start"></i>Cardiology Test, Diabetic Diagnose</li>
                                        <li><i class="fas fa-envelope"></i><a href="mailto:anna@example.com">anna@example.com</a></li>
                                        <li><i class="fas fa-phone"></i><a href="tel:2265458856">+(22) 65_458_856</a></li>
                                    </ul>
                                    <ul class="confirm-list clearfix">
                                        <li><i class="fas fa-check"></i>Accept</li>
                                        <li><i class="fas fa-times"></i>Cancel</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="single-item">
                                <figure class="image-box"><img src="assets/images/resource/appointment-6.jpg" alt=""></figure>
                                <div class="inner">
                                    <h4>Amelia Anna</h4>
                                    <ul class="info-list clearfix">
                                        <li><i class="fas fa-clock"></i>15 Oct 2020, 09:30AM</li>
                                        <li><i class="fas fa-map-marker-alt"></i>G87P, Birmingham, UK</li>
                                        <li><i class="fas fa-hourglass-start"></i>Cardiology Test, Diabetic Diagnose</li>
                                        <li><i class="fas fa-envelope"></i><a href="mailto:anna@example.com">anna@example.com</a></li>
                                        <li><i class="fas fa-phone"></i><a href="tel:2265458856">+(22) 65_458_856</a></li>
                                    </ul>
                                    <ul class="confirm-list clearfix">
                                        <li><i class="fas fa-check"></i>Accept</li>
                                        <li><i class="fas fa-times"></i>Cancel</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="single-item">
                                <figure class="image-box"><img src="assets/images/resource/appointment-7.jpg" alt=""></figure>
                                <div class="inner">
                                    <h4>Samuel Daniels</h4>
                                    <ul class="info-list clearfix">
                                        <li><i class="fas fa-clock"></i>15 Oct 2020, 09:30AM</li>
                                        <li><i class="fas fa-map-marker-alt"></i>G87P, Birmingham, UK</li>
                                        <li><i class="fas fa-hourglass-start"></i>Cardiology Test, Diabetic Diagnose</li>
                                        <li><i class="fas fa-envelope"></i><a href="mailto:anna@example.com">anna@example.com</a></li>
                                        <li><i class="fas fa-phone"></i><a href="tel:2265458856">+(22) 65_458_856</a></li>
                                    </ul>
                                    <ul class="confirm-list clearfix">
                                        <li><i class="fas fa-check"></i>Accept</li>
                                        <li><i class="fas fa-times"></i>Cancel</li>
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
