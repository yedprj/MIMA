<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="include/dashHeader.jsp"></jsp:include>    
    
<section class="doctors-dashboard bg-color-3">
	<!-- 사이드 메뉴바 연결 -->
	<jsp:include page="include/sideDash.jsp"></jsp:include>
	
	<div class="right-panel">
                <div class="content-container">
                    <div class="outer-container">
                        <div class="review-list">
                            <div class="title-box clearfix">
                                <div class="text pull-left"><h3>Reviews List</h3></div>
                                <div class="select-box pull-right">
                                    <select class="wide">
                                       <option data-display="Any Time">Any Time</option>
                                       <option value="1">Latest Reviews</option>
                                       <option value="2">Oldest Reviews</option>
                                    </select>
                                </div>
                            </div>
                            <div class="comment-inner">
                                <div class="single-comment-box">
                                    <div class="comment">
                                        <figure class="comment-thumb"><img src="${pageContext.request.contextPath}/resources/assets/images/resource/comment-1.png" alt=""></figure>
                                        <h4>Terry Bradshaw</h4>
                                        <span class="comment-time"><i class="fas fa-calendar-alt"></i>15 Sep 2020, 09:30AM</span>
                                        <ul class="rating clearfix">
                                            <li><i class="icon-Star"></i></li>
                                            <li><i class="icon-Star"></i></li>
                                            <li><i class="icon-Star"></i></li>
                                            <li><i class="icon-Star"></i></li>
                                            <li class="light"><i class="icon-Star"></i></li>
                                        </ul>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod ux tempor incididunt labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis.</p>
                                        <a href="review.html" class="replay-btn"><i class="fas fa-share"></i>Reply Now</a>
                                    </div>
                                    <div class="comment replay-comment">
                                        <figure class="comment-thumb"><img src="${pageContext.request.contextPath}/resources/assets/images/resource/comment-2.png" alt=""></figure>
                                        <h4>Rex Allen</h4>
                                        <span class="comment-time"><i class="fas fa-calendar-alt"></i>14 Sep 2020, 09:30AM</span>
                                        <ul class="rating clearfix">
                                            <li><i class="icon-Star"></i></li>
                                            <li><i class="icon-Star"></i></li>
                                            <li><i class="icon-Star"></i></li>
                                            <li><i class="icon-Star"></i></li>
                                            <li class="light"><i class="icon-Star"></i></li>
                                        </ul>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod ux tempor incididunt labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis.</p>
                                        <a href="review.html" class="replay-btn"><i class="fas fa-share"></i>Reply Now</a>
                                    </div>
                                </div>
                                <div class="single-comment-box">
                                    <div class="comment">
                                        <figure class="comment-thumb"><img src="${pageContext.request.contextPath}/resources/assets/images/resource/comment-3.png" alt=""></figure>
                                        <h4>Julia Jhones</h4>
                                        <span class="comment-time"><i class="fas fa-calendar-alt"></i>15 Sep 2020, 09:30AM</span>
                                        <ul class="rating clearfix">
                                            <li><i class="icon-Star"></i></li>
                                            <li><i class="icon-Star"></i></li>
                                            <li><i class="icon-Star"></i></li>
                                            <li><i class="icon-Star"></i></li>
                                            <li class="light"><i class="icon-Star"></i></li>
                                        </ul>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod ux tempor incididunt labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis.</p>
                                        <a href="review.html" class="replay-btn"><i class="fas fa-share"></i>Reply Now</a>
                                    </div>
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