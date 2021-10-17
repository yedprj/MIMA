<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="boxed_wrapper">

        <!-- preloader -->
        <div class="preloader"></div>
        <!-- preloader -->


        <!-- banner-section -->
        <section class="banner-section bg-color-1">
            <div class="pattern-layer" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-2.png);"></div>
            <div class="auto-container">
                <div class="row align-items-center clearfix">
                    <div class="col-lg-6 col-md-12 col-sm-12 content-column">
                        <div class="content-box">
                            <h1>Find Nearest Doctor.</h1>
                            <p>Amet consectetur adipisicing elit sed do eiusmod.</p>
                            <div class="form-inner">
                                <form action="index.html" method="post">
                                    <div class="form-group">
                                        <input type="text" name="name" placeholder="Ex. Name, Specialization..." required="">
                                        <button type="submit"><i class="icon-Arrow-Right"></i></button>
                                    </div>
                                </form>
                                <ul class="select-box clearfix">
                                    <li>
                                        <div class="single-checkbox">
                                            <input type="radio" name="check-box" id="check1" checked="">
                                            <label for="check1"><span></span>All</label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="single-checkbox">
                                            <input type="radio" name="check-box" id="check2">
                                            <label for="check2"><span></span>Doctor</label>    
                                        </div>
                                    </li>
                                    <li>
                                        <div class="single-checkbox">
                                            <input type="radio" name="check-box" id="check3">
                                            <label for="check3"><span></span>Clinic</label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12 col-sm-12 image-column">
                        <div class="image-box js-tilt">
                            <figure class="image clearfix wow fadeInRight animated animated" data-wow-delay="00ms" data-wow-duration="1500ms"><img src="${pageContext.request.contextPath}/resources/assets/images/banner/banner-image-1.png" alt=""></figure>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- banner-section end -->


        <!-- clients-section -->
        <section class="clients-section bg-color-2">
            <div class="pattern-layer">
                <div class="pattern-1" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-3.png);"></div>
                <div class="pattern-2" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-4.png);"></div>
            </div>
            <div class="auto-container">
                <div class="auto-container">
                    <div class="clients-carousel owl-carousel owl-theme owl-nav-none owl-dots-none">
                        <figure class="clients-logo-box"><a href="index.html"><img src="${pageContext.request.contextPath}/resources/assets/images/clients/clients-logo-1.png" alt=""></a></figure>
                        <figure class="clients-logo-box"><a href="index.html"><img src="${pageContext.request.contextPath}/resources/assets/images/clients/clients-logo-2.png" alt=""></a></figure>
                        <figure class="clients-logo-box"><a href="index.html"><img src="${pageContext.request.contextPath}/resources/assets/images/clients/clients-logo-3.png" alt=""></a></figure>
                        <figure class="clients-logo-box"><a href="index.html"><img src="${pageContext.request.contextPath}/resources/assets/images/clients/clients-logo-4.png" alt=""></a></figure>
                        <figure class="clients-logo-box"><a href="index.html"><img src="${pageContext.request.contextPath}/resources/assets/images/clients/clients-logo-5.png" alt=""></a></figure>
                    </div>
                </div>
            </div>
        </section>
        <!-- clients-section end -->




        <!-- about-section -->
        <section class="about-section">
            <div class="auto-container">
                <div class="row align-items-center clearfix">
                    <div class="col-lg-6 col-md-12 col-sm-12 image-column">
                        <div class="image_block_1">
                            <div class="image-box">
                                <div class="pattern">
                                    <div class="pattern-1" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-15.png);"></div>
                                    <div class="pattern-2"></div>
                                    <div class="pattern-3" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-16.png);"></div>
                                </div>
                                <figure class="image clearfix"><img src="${pageContext.request.contextPath}/resources/assets/images/resource/about-1.png" alt=""></figure>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12 col-sm-12 content-column">
                        <div class="content_block_1">
                            <div class="content-box">
                                <div class="sec-title">
                                    <p>About Docpro</p>
                                    <h2>Bring care to your home with one click</h2>
                                </div>
                                <div class="text">
                                    <p>Lorem ipsum dolor sit amet consectur adipiscing elit sed eiusmod ex tempor incididunt labore dolore magna aliquaenim ad minim veniam quis nostrud exercitation ullamco laboris.</p>
                                </div>
                                <ul class="list-style-one clearfix">
                                    <li>Associates Insurance</li>
                                    <li>Pina & Insurance</li>
                                </ul>
                                <div class="btn-box"><a href="about.html" class="theme-btn-one">About Us<i class="icon-Arrow-Right"></i></a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- about-section end -->

        <!-- testimonial-section -->
        <section class="testimonial-section bg-color-3">
            <div class="bg-layer" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/background/testimonial-1.jpg);"></div>
            <div class="pattern-layer">
                <div class="pattern-1" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-22.png);"></div>
                <div class="pattern-2" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-23.png);"></div>
            </div>
            <div class="auto-container">
                <div class="row clearfix">
                    <div class="col-xl-7 col-lg-12 col-md-12 inner-column">
                        <div class="testimonial-inner">
                            <div class="pattern" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-21.png);"></div>
                            <div class="sec-title">
                                <p>Testimonials</p>
                                <h2>What client’s say?</h2>
                            </div>
                            <div class="single-item-carousel owl-carousel owl-theme owl-dots-none nav-style-one">
                                <div class="testimonial-block-one">
                                    <div class="inner-box">
                                        <div class="text">
                                            <p>“ Lorem ipsum dolor sit amet consectetur adipic  eksed do eiusmod tempor incid unt labore dolore magna Aliqua.enim minim veniam, quis nostrud. “</p>
                                        </div>
                                        <div class="author-info">
                                            <figure class="author-thumb"><img src="${pageContext.request.contextPath}/resources/assets/images/resource/testimonial-1.png" alt=""></figure>
                                            <h3>Amelia Anna</h3>
                                            <span class="designation">Amelia Anna</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="testimonial-block-one">
                                    <div class="inner-box">
                                        <div class="text">
                                            <p>“ Lorem ipsum dolor sit amet consectetur adipic  eksed do eiusmod tempor incid unt labore dolore magna Aliqua.enim minim veniam, quis nostrud. “</p>
                                        </div>
                                        <div class="author-info">
                                            <figure class="author-thumb"><img src="${pageContext.request.contextPath}/resources/assets/images/resource/testimonial-1.png" alt=""></figure>
                                            <h3>Amelia Anna</h3>
                                            <span class="designation">Amelia Anna</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="testimonial-block-one">
                                    <div class="inner-box">
                                        <div class="text">
                                            <p>“ Lorem ipsum dolor sit amet consectetur adipic  eksed do eiusmod tempor incid unt labore dolore magna Aliqua.enim minim veniam, quis nostrud. “</p>
                                        </div>
                                        <div class="author-info">
                                            <figure class="author-thumb"><img src="${pageContext.request.contextPath}/resources/assets/images/resource/testimonial-1.png" alt=""></figure>
                                            <h3>Amelia Anna</h3>
                                            <span class="designation">Amelia Anna</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- testimonial-section end -->


        <!-- team-section -->
        <section class="team-section">
            <div class="auto-container">
                <div class="sec-title centred">
                    <p>Meet Our Professionals</p>
                    <h2>Top Rated Specialists</h2>
                </div>
                <div class="row clearfix">
                    <div class="col-lg-6 col-md-6 col-sm-12 team-block">
                        <div class="team-block-one wow fadeInLeft animated animated" data-wow-delay="00ms" data-wow-duration="1500ms">
                            <div class="inner-box">
                                <div class="pattern">
                                    <div class="pattern-1" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-24.png);"></div>
                                    <div class="pattern-2" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-25.png);"></div>
                                </div>
                                <figure class="image-box"><img src="${pageContext.request.contextPath}/resources/assets/images/team/team-1.jpg" alt=""></figure>
                                <div class="content-box">
                                    <div class="like-box"><a href="index.html"><i class="far fa-heart"></i></a></div>
                                    <ul class="name-box clearfix">
                                        <li class="name"><h3><a href="doctors-details.html">Dr. Julia Jhones</a></h3></li>
                                        <li><i class="icon-Trust-1"></i></li>
                                        <li><i class="icon-Trust-2"></i></li>
                                    </ul>
                                    <span class="designation">MBBS, MS - General Surgery, MCh</span>
                                    <div class="text">
                                        <p>Lorem ipsum dolor sit amet consectur adipisc elit sed eiusmod tempor.</p>
                                    </div>
                                    <div class="rating-box clearfix">
                                        <ul class="rating clearfix">
                                            <li><i class="icon-Star"></i></li>
                                            <li><i class="icon-Star"></i></li>
                                            <li><i class="icon-Star"></i></li>
                                            <li><i class="icon-Star"></i></li>
                                            <li><i class="icon-Star"></i></li>
                                            <li><a href="index.html">(32)</a></li>
                                        </ul>
                                        <div class="link"><a href="index.html">Available Today</a></div>
                                    </div>
                                    <div class="location-box">
                                        <p><i class="fas fa-map-marker-alt"></i>G87P, Birmingham, UK</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 team-block">
                        <div class="team-block-one wow fadeInRight animated animated" data-wow-delay="00ms" data-wow-duration="1500ms">
                            <div class="inner-box">
                                <div class="pattern">
                                    <div class="pattern-1" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-24.png);"></div>
                                    <div class="pattern-2" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-25.png);"></div>
                                </div>
                                <figure class="image-box"><img src="${pageContext.request.contextPath}/resources/assets/images/team/team-2.jpg" alt=""></figure>
                                <div class="content-box">
                                    <div class="like-box"><a href="index.html"><i class="far fa-heart"></i></a></div>
                                    <ul class="name-box clearfix">
                                        <li class="name"><h3><a href="doctors-details.html">Dr. Mary Astor</a></h3></li>
                                        <li><i class="icon-Trust-1"></i></li>
                                        <li><i class="icon-Trust-2"></i></li>
                                    </ul>
                                    <span class="designation">MDS - Periodontology and BDS</span>
                                    <div class="text">
                                        <p>Lorem ipsum dolor sit amet consectur adipisc elit sed eiusmod tempor.</p>
                                    </div>
                                    <div class="rating-box clearfix">
                                        <ul class="rating clearfix">
                                            <li><i class="icon-Star"></i></li>
                                            <li><i class="icon-Star"></i></li>
                                            <li><i class="icon-Star"></i></li>
                                            <li><i class="icon-Star"></i></li>
                                            <li><i class="icon-Star"></i></li>
                                            <li><a href="index.html">(32)</a></li>
                                        </ul>
                                        <div class="link not-available"><a href="index.html">Available Today</a></div>
                                    </div>
                                    <div class="location-box">
                                        <p><i class="fas fa-map-marker-alt"></i>G87P, Birmingham, UK</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 team-block">
                        <div class="team-block-one wow fadeInLeft animated animated" data-wow-delay="00ms" data-wow-duration="1500ms">
                            <div class="inner-box">
                                <div class="pattern">
                                    <div class="pattern-1" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-24.png);"></div>
                                    <div class="pattern-2" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-25.png);"></div>
                                </div>
                                <figure class="image-box"><img src="${pageContext.request.contextPath}/resources/assets/images/team/team-3.jpg" alt=""></figure>
                                <div class="content-box">
                                    <div class="like-box"><a href="index.html"><i class="far fa-heart"></i></a></div>
                                    <ul class="name-box clearfix">
                                        <li class="name"><h3><a href="doctors-details.html">Dr. Rex Allen</a></h3></li>
                                        <li><i class="icon-Trust-1"></i></li>
                                        <li><i class="icon-Trust-2"></i></li>
                                    </ul>
                                    <span class="designation">BDS, MDS - Maxillofacial Surgery</span>
                                    <div class="text">
                                        <p>Lorem ipsum dolor sit amet consectur adipisc elit sed eiusmod tempor.</p>
                                    </div>
                                    <div class="rating-box clearfix">
                                        <ul class="rating clearfix">
                                            <li><i class="icon-Star"></i></li>
                                            <li><i class="icon-Star"></i></li>
                                            <li><i class="icon-Star"></i></li>
                                            <li><i class="icon-Star"></i></li>
                                            <li><i class="icon-Star"></i></li>
                                            <li><a href="index.html">(32)</a></li>
                                        </ul>
                                        <div class="link"><a href="index.html">Available Today</a></div>
                                    </div>
                                    <div class="location-box">
                                        <p><i class="fas fa-map-marker-alt"></i>G87P, Birmingham, UK</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 team-block">
                        <div class="team-block-one wow fadeInRight animated animated" data-wow-delay="00ms" data-wow-duration="1500ms">
                            <div class="inner-box">
                                <div class="pattern">
                                    <div class="pattern-1" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-24.png);"></div>
                                    <div class="pattern-2" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-25.png);"></div>
                                </div>
                                <figure class="image-box"><img src="${pageContext.request.contextPath}/resources/assets/images/team/team-4.jpg" alt=""></figure>
                                <div class="content-box">
                                    <div class="like-box"><a href="index.html"><i class="far fa-heart"></i></a></div>
                                    <ul class="name-box clearfix">
                                        <li class="name"><h3><a href="doctors-details.html">Dr. Stella Adler</a></h3></li>
                                        <li><i class="icon-Trust-1"></i></li>
                                        <li><i class="icon-Trust-2"></i></li>
                                    </ul>
                                    <span class="designation">MDS - Periodontology and BDS</span>
                                    <div class="text">
                                        <p>Lorem ipsum dolor sit amet consectur adipisc elit sed eiusmod tempor.</p>
                                    </div>
                                    <div class="rating-box clearfix">
                                        <ul class="rating clearfix">
                                            <li><i class="icon-Star"></i></li>
                                            <li><i class="icon-Star"></i></li>
                                            <li><i class="icon-Star"></i></li>
                                            <li><i class="icon-Star"></i></li>
                                            <li><i class="icon-Star"></i></li>
                                            <li><a href="index.html">(32)</a></li>
                                        </ul>
                                        <div class="link"><a href="index.html">Available Today</a></div>
                                    </div>
                                    <div class="location-box">
                                        <p><i class="fas fa-map-marker-alt"></i>G87P, Birmingham, UK</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="more-btn centred"><a href="doctors-1.html" class="theme-btn-one">All Specialist<i class="icon-Arrow-Right"></i></a></div>
            </div>
        </section>
        <!-- team-section end -->

        <!-- news-section -->
        <section class="news-section">
            <div class="auto-container">
                <div class="sec-title centred">
                    <p>News & Article</p>
                    <h2>Stay Update With Docpro</h2>
                </div>
                <div class="row clearfix">
                    <div class="col-lg-4 col-md-6 col-sm-12 news-block">
                        <div class="news-block-one wow fadeInUp animated animated" data-wow-delay="00ms" data-wow-duration="1500ms">
                            <div class="inner-box">
                                <figure class="image-box">
                                    <img src="${pageContext.request.contextPath}/resources/assets/images/news/news-1.jpg" alt="">
                                    <a href="blog-details" class="link"><i class="fas fa-link"></i></a>
                                    <span class="category">Featured</span>
                                </figure>
                                <div class="lower-content">
                                    <h3><a href="blog-details.html">Including animation in your design system</a></h3>
                                    <ul class="post-info">
                                        <li><img src="${pageContext.request.contextPath}/resources/assets/images/news/admin-1.png" alt=""><a href="index.html">Eva Green</a></li>
                                        <li>April 10, 2020</li>
                                    </ul>
                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing sed.</p>
                                    <div class="link"><a href="blog-details.html"><i class="icon-Arrow-Right"></i></a></div>
                                    <div class="btn-box"><a href="blog-details.html" class="theme-btn-one">Read more<i class="icon-Arrow-Right"></i></a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-12 news-block">
                        <div class="news-block-one wow fadeInUp animated animated" data-wow-delay="300ms" data-wow-duration="1500ms">
                            <div class="inner-box">
                                <figure class="image-box">
                                    <img src="${pageContext.request.contextPath}/resources/assets/images/news/news-2.jpg" alt="">
                                    <a href="blog-details" class="link"><i class="fas fa-link"></i></a>
                                    <span class="category">Featured</span>
                                </figure>
                                <div class="lower-content">
                                    <h3><a href="blog-details.html">Baking can be done with a few things.</a></h3>
                                    <ul class="post-info">
                                        <li><img src="${pageContext.request.contextPath}/resources/assets/images/news/admin-2.png" alt=""><a href="index.html">George Clooney</a></li>
                                        <li>April 09, 2020</li>
                                    </ul>
                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing sed.</p>
                                    <div class="link"><a href="blog-details.html"><i class="icon-Arrow-Right"></i></a></div>
                                    <div class="btn-box"><a href="blog-details.html" class="theme-btn-one">Read more<i class="icon-Arrow-Right"></i></a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-12 news-block">
                        <div class="news-block-one wow fadeInUp animated animated" data-wow-delay="600ms" data-wow-duration="1500ms">
                            <div class="inner-box">
                                <figure class="image-box">
                                    <img src="${pageContext.request.contextPath}/resources/assets/images/news/news-3.jpg" alt="">
                                    <a href="blog-details" class="link"><i class="fas fa-link"></i></a>
                                    <span class="category">Featured</span>
                                </figure>
                                <div class="lower-content">
                                    <h3><a href="blog-details.html">Great food is not just eating energy.</a></h3>
                                    <ul class="post-info">
                                        <li><img src="${pageContext.request.contextPath}/resources/assets/images/news/admin-3.png" alt=""><a href="index.html">George Clooney</a></li>
                                        <li>April 08, 2020</li>
                                    </ul>
                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing sed.</p>
                                    <div class="link"><a href="blog-details.html"><i class="icon-Arrow-Right"></i></a></div>
                                    <div class="btn-box"><a href="blog-details.html" class="theme-btn-one">Read more<i class="icon-Arrow-Right"></i></a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- news-section end -->


    </div>

