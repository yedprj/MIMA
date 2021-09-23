<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
 <!--page-title-two-->
<section class="page-title-two">
    <div class="title-box centred bg-color-2">
        <div class="pattern-layer">
            <div class="pattern-1" style="background-image: url(${pageContext.request.contextPath}/assets/images/shape/shape-70.png);"></div>
            <div class="pattern-2" style="background-image: url(${pageContext.request.contextPath}/assets/images/shape/shape-71.png);"></div>
        </div>
        <div class="auto-container">
            <div class="title">
                <h1>${item.title }</h1>
            </div>
        </div>
    </div>
    <div class="lower-content">
        <div class="auto-container">
            <ul class="bread-crumb clearfix">
                <li><a href="index.html">Home</a></li>
                <li><a href="totalList">전체 리스트</a></li>
                <li><a href="totalList?category=${item.category }">${item.category }</a></li>
                <li>${item.title }</li>
            </ul>
        </div>
    </div>
</section>
<!--page-title-two end-->


<!-- sidebar-page-container -->
<section class="sidebar-page-container">
    <div class="auto-container">
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 content-side">
                <div class="blog-details-content">
                <!-- 본문 -->
                    <div class="news-block-one">
                        <div class="inner-box">
                            <figure class="image-box">
                                <img src="${pageContext.request.contextPath}/assets/images/news/news-18.jpg" alt="">
                                <span class="category">${item.category }</span>
                            </figure>
                            <div class="lower-content">
                                <h3>${item.title }</h3>
                                <ul class="post-info">
                                    <li><img src="${pageContext.request.contextPath}/assets/images/news/admin-1.png" alt=""><a href="index.html">${item.teacherName }</a></li>
                                    <li><fmt:formatDate value="${item.regDate }"
											pattern="yyyy-MM-dd" /></li>
                                </ul>
                                <p>${item.contents }</p>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                            </div>
                        </div>
                    </div>
                    <blockquote>
                        <i class="fas fa-quote-left"></i>
                        <p><img src="assets/images/news/admin-1.png" alt=""><a href="index.html">${item.teacherName }</a></p>
                        <p>${item.teacherInfo }</p>
                    </blockquote>
                  <!-- end of 본문 -->
                 
                 <!-- 코멘트 코멘트  -->
                    <div class="comment-box">
                        <div class="group-title">
                            <h3>Comments</h3>
                        </div>
                        <div class="comment">
                            <figure class="thumb-box">
                                <img src="assets/images/news/comment-1.png" alt="">
                            </figure>
                            <div class="comment-inner">
                                <div class="comment-info">
                                    <h5>Leroy Anderson</h5>
                                    <span class="comment-time">April 10, 2020</span>
                                </div>
                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incidid unt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exerc itation ullamco laboris.</p>
                                <a href="blog-details.html" class="reply-btn">Reply</a>
                            </div>
                        </div>
                        <div class="comment">
                            <figure class="thumb-box">
                                <img src="assets/images/news/comment-2.png" alt="">
                            </figure>
                            <div class="comment-inner">
                                <div class="comment-info">
                                    <h5>Leroy Anderson</h5>
                                    <span class="comment-time">April 09, 2020</span>
                                </div>
                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incidid unt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exerc itation ullamco laboris.</p>
                                <a href="blog-details.html" class="reply-btn">Reply</a>
                            </div>
                        </div>
                        <div class="comment">
                            <figure class="thumb-box">
                                <img src="assets/images/news/comment-3.png" alt="">
                            </figure>
                            <div class="comment-inner">
                                <div class="comment-info">
                                    <h5>Leroy Anderson</h5>
                                    <span class="comment-time">April 08, 2020</span>
                                </div>
                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incidid unt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exerc itation ullamco laboris.</p>
                                <a href="blog-details.html" class="reply-btn">Reply</a>
                            </div>
                        </div>
                    </div>
                     <!-- end of 코멘트본문 코멘트  -->
                     
                     <!-- 코멘트 입력 폼 -->
                    <div class="comments-form-area">
                        <div class="group-title">
                            <h3>Leave a Comment</h3>
                        </div>
                        <form action="blog-details.html" method="post" class="comment-form">
                            <div class="row clearfix">
                                <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                    <input type="text" name="fname" placeholder="First Name" required="">
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                    <input type="text" name="lname" placeholder="Last Name" required="">
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                    <input type="email" name="email" placeholder="Email Address" required="">
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                    <input type="text" name="phone" placeholder="Phone" required="">
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                    <textarea name="message" placeholder="Leave A Comment"></textarea>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 form-group message-btn">
                                    <button type="submit" class="theme-btn-one">Send Message<i class="icon-Arrow-Right"></i></button>
                                </div>
                            </div>
                        </form>
                    </div>
                     <!-- end of 코멘트 입력 폼 -->
                    
                </div>
            </div>
         
        </div>
    </div>
</section>
<!-- sidebar-page-container end -->    