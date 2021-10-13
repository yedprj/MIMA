<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div class="boxed_wrapper">

        <!-- preloader -->
        <div class="preloader"></div>
        <!-- preloader -->


        <!--page-title-two-->
        <section class="page-title-two">
            <div class="title-box centred bg-color-2">
                <div class="pattern-layer">
                    <div class="pattern-1" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-70.png);"></div>
                    <div class="pattern-2" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-71.png);"></div>
                </div>
                <div class="auto-container">
                    <div class="title">
                        <h1>Doctor Details</h1>
                    </div>
                </div>
            </div>
            <div class="lower-content">
                <div class="auto-container">
                    <ul class="bread-crumb clearfix">
                        <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                        <li>Doctor Details</li>
                    </ul>
                </div>
            </div>
        </section>
        <!--page-title-two end-->


        <!-- ddoctor-details -->
        <section class="doctor-details bg-color-3">
            <div class="auto-container">
                <div class="row clearfix">
                    <div class="col-lg-8 col-md-12 col-sm-12 content-side">
                        <div class="clinic-details-content doctor-details-content">
                            <div class="clinic-block-one">
                                <div class="inner-box">
                                    <figure class="image-box"><img src="${pageContext.request.contextPath}/resources/assets/images/team/team-33.jpg" alt=""></figure>
                                    <div class="content-box">
                                        <div class="like-box"><a href="doctors-details.html"><i class="far fa-heart"></i></a></div>
                                        <div class="share-box">
                                            <a href="doctors-details.html" class="share-btn"><i class="fas fa-share-alt"></i></a>
                                        </div>
                                        ${item }<br>
                                        ${item.subjects.category1 }
                                        <ul class="name-box clearfix">
                                            <li class="name"><h2>Dr.${item.name }</h2></li>
                                        </ul>
                                        <span class="designation">${item.clinicInfo }</span>
                                        <div class="rating-box clearfix">
                                            <ul class="rating clearfix">
                                                <li><i class="icon-Star"></i></li>
                                                <li><i class="icon-Star"></i></li>
                                                <li><i class="icon-Star"></i></li>
                                                <li><i class="icon-Star"></i></li>
                                                <li><i class="icon-Star"></i></li>
                                                <li><a href="doctors-details.html">(${item.commentsCnt })</a></li>
                                            </ul>
                                        </div>
                                        <div class="text">
                                            <p></p>
                                        </div>
                                        <div class="lower-box clearfix">
                                            <ul class="info clearfix">
                                                <li><i class="fas fa-map-marker-alt"></i>${item.addr1 }</li>
                                                <li><i class="fas fa-phone"></i>${item.clinicPhone }</li>
                                                <li><i class="fas fa-phone"></i>${item.clinicEmail }</li>
                                            </ul>
                                            <div class="view-map"><a href="doctors-details.html">View Map</a></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tabs-box">
                                <div class="tab-btn-box centred">
                                    <ul class="tab-btns tab-buttons clearfix">
                                        <li class="tab-btn active-btn" data-tab="#tab-1">Overview</li>
                                        <li class="tab-btn" data-tab="#tab-2">Experience</li>
                                        <li class="tab-btn" data-tab="#tab-3">Location</li>
                                        <li class="tab-btn" data-tab="#tab-4">Reviews</li>
                                    </ul>
                                </div>
                                <div class="tabs-content">
                                    <div class="tab active-tab" id="tab-1">
                                        <div class="inner-box">
                                            <div class="text">
                                                <h3>전문의 Dr. ${item.name }님은요... :</h3>
                                                <p>${item.profileContents }</p>
                                                <h3>진료과목</h3>
                                                <ul class="treatments-list clearfix">
                                                    <li><a href="doctors-details.html">${item.subjects.category1 }</a></li>
                                                    <li><a href="doctors-details.html">${item.subjects.category2 }</a></li>
                                                    <li><a href="doctors-details.html">${item.subjects.category3 }</a></li>
                                                </ul>
                                                <h3>학력</h3>
                                                <p>${item.profileEducation } 을 밑에 잘라 넣으면 됩니다.</p>
                                                <ul class="list clearfix">
                                                    <li>New York Medical College <span>- Doctor of Medicine</span></li>
                                                    <li>Montefiore Medical Center <span>- Residency in Internal Medicine</span></li>
                                                    <li>New York Medical College <span>- Master Internal Medicine</span></li>
                                                </ul>
                                            </div>
                                            <div class="accordion-box">
                                                <h3>진료과목과 가격안내</h3>
                                                <div class="title-box">
                                                    <h6>Service<span>Price</span></h6>
                                                </div>
                                                <ul class="accordion-inner">
                                                    <li class="accordion block">
                                                        <div class="acc-btn">
                                                            <div class="icon-outer"></div>
                                                            <h6>${item.subjects.category1 }<span>${item.subjects.price1 }</span></h6>
                                                        </div>
                                                        <div class="acc-content">
                                                            <div class="text">
                                                                <p>진료과목 설명이 있음 좋겠지만....없네유?</p>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="accordion block active-block">
                                                        <div class="acc-btn active">
                                                            <div class="icon-outer"></div>
                                                            <h6>${item.subjects.category2 }<span>${item.subjects.price2 }</span></h6>
                                                        </div>
                                                        <div class="acc-content current">
                                                            <div class="text">
                                                                <p>진료과목 설명이 있음 좋겠지만....없네유?</p>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="accordion block">
                                                         <div class="acc-btn">
                                                            <div class="icon-outer"></div>
                                                            <h6>${item.subjects.category3 }<span>${item.subjects.price3 }</span></h6>
                                                        </div>
                                                        <div class="acc-content">
                                                            <div class="text">
                                                                <p>진료과목 설명이 있음 좋겠지만....없네유?</p>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="award-box">
                                                <h3>Awards</h3>
                                                <ul class="list clearfix">
                                                    <li>Award win by American Dental Council of America<span>(2006)</span></li>
                                                    <li>Award win by Karnataka State Dental Council<span>(2009)</span></li>
                                                    <li>Award win by Manchester Academy of Oral Medicine<span>(2015)</span></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab" id="tab-2">
                                        <div class="experience-box">
                                            <div class="text">
                                                <h3>경력사항</h3>
                                                <p>Dr. Agnes Ayres is a Maxillofacial Surgeon in New York, NY.  Dr. Ayres has more experience with Congenital Cardiac Disorders and Cardiac Care than other specialists in his area.  He is affiliated with medical facilities.</p>
                                                <ul class="experience-list clearfix">
                                                    <li>
                                                        Aurora Medical & Dental College:
                                                        <p>Medical & General Dentistry <span>(Aug 2008-Sep 2013)</span></p>
                                                    </li>
                                                    <li>
                                                        Horizon Dermatology & Cosmetic Center:
                                                        <p>Assistant Darmatologist <span>(Oct 2013-Nov 2017)</span></p>
                                                    </li>
                                                    <li>
                                                        New Apollo Hospital:
                                                        <p>Darmatologist<span>(Dec 2017-Till Now)</span></p>
                                                    </li>
                                                </ul>
                                                <h3>Key Skills</h3>
                                                <ul class="skills-list clearfix">
                                                    <li>Proficient in assisting all Gynecology & Obstetrics Surgeries.</li>
                                                    <li>Expert in conducting all high risk labor.</li>
                                                    <li>Proficient in performing all minor surgeries.</li>
                                                    <li>Expert in handling all outpatients & inpatients department</li>
                                                    <li>Able to perform ultrasound of Gynecology & Obstetrics</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab" id="tab-3">
                                        <div class="location-box">
                                            <h3>Locations</h3>
                                            <div class="map-inner">
                                                <div 
                                                    class="google-map" 
                                                    id="contact-google-map" 
                                                    data-map-lat="40.712776" 
                                                    data-map-lng="-74.005974" 
                                                    data-icon-path="${pageContext.request.contextPath}/resources/assets/images/icons/map-marker.png"  
                                                    data-map-title="Brooklyn, New York, United Kingdom" 
                                                    data-map-zoom="12" 
                                                    data-markers='{
                                                        "marker-1": [40.712776, -74.005974, "<h4>Branch Office</h4><p>77/99 New York</p>","${pageContext.request.contextPath}/resources/assets/images/icons/map-marker.png"]
                                                    }'>

                                                </div>
                                            </div>
                                            <h4>${item.clinicInfo }:</h4>
                                            <ul class="location-info clearfix">
                                                <li><i class="fas fa-map-marker-alt"></i>${item.addr1 } ${item.addr2 } ${item.addr3 }<br />${item.postcode }</li>
                                                <li><i class="fas fa-phone"></i><a href="tel:2265458856">+(82)${item.clinicPhone }</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="tab" id="tab-4">
                                        <div class="review-box">
                                            <h3>Dr. ${item.name } Reviews</h3>
                                            <!-- <div class="rating-inner">
                                                <div class="rating-box">
                                                    <h2>4.5</h2>
                                                    <ul class="clearfix">
                                                        <li><i class="icon-Star"></i></li>
                                                        <li><i class="icon-Star"></i></li>
                                                        <li><i class="icon-Star"></i></li>
                                                        <li><i class="icon-Star"></i></li>
                                                        <li><i class="icon-Star"></i></li>
                                                    </ul>
                                                    <span>Based on 5 review</span>
                                                </div>
                                                <div class="rating-pregress">
                                                    <div class="single-progress">
                                                        <span class="porgress-bar"></span>
                                                        <div class="text"><p><i class="icon-Star"></i>5 Stars</p></div>
                                                    </div>
                                                    <div class="single-progress">
                                                        <span class="porgress-bar"></span>
                                                        <div class="text"><p><i class="icon-Star"></i>4 Stars</p></div>
                                                    </div>
                                                    <div class="single-progress">
                                                        <span class="porgress-bar"></span>
                                                        <div class="text"><p><i class="icon-Star"></i>3 Stars</p></div>
                                                    </div>
                                                    <div class="single-progress">
                                                        <span class="porgress-bar"></span>
                                                        <div class="text"><p><i class="icon-Star"></i>2 Stars</p></div>
                                                    </div>
                                                    <div class="single-progress">
                                                        <span class="porgress-bar"></span>
                                                        <div class="text"><p><i class="icon-Star"></i>1 Stars</p></div>
                                                    </div>
                                                </div>
                                            </div> -->
                                            <div class="review-inner">
                                                <div class="single-review-box">
                                                    <figure class="image-box"><img src="${pageContext.request.contextPath}/resources/assets/images/resource/review-1.jpg" alt=""></figure>
                                                    <ul class="rating clearfix">
                                                        <li><i class="icon-Star"></i></li>
                                                        <li><i class="icon-Star"></i></li>
                                                        <li><i class="icon-Star"></i></li>
                                                        <li><i class="icon-Star"></i></li>
                                                        <li class="light"><i class="icon-Star"></i></li>
                                                    </ul>
                                                    <h6>Agnes Ayres <span>- April 10, 2020</span></h6>
                                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing sed eiusmod tempor incididunt labore dolore magna aliqua enim.</p>
                                                </div>
                                                <div class="single-review-box">
                                                    <figure class="image-box"><img src="${pageContext.request.contextPath}/resources/assets/images/resource/review-2.jpg" alt=""></figure>
                                                    <ul class="rating clearfix">
                                                        <li><i class="icon-Star"></i></li>
                                                        <li><i class="icon-Star"></i></li>
                                                        <li><i class="icon-Star"></i></li>
                                                        <li><i class="icon-Star"></i></li>
                                                        <li><i class="icon-Star"></i></li>
                                                    </ul>
                                                    <h6>Mary Astor <span>- April 09, 2020</span></h6>
                                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing sed eiusmod tempor incididunt labore dolore magna aliqua enim.</p>
                                                </div>
                                                <div class="single-review-box">
                                                    <figure class="image-box"><img src="${pageContext.request.contextPath}/resources/assets/images/resource/review-3.jpg" alt=""></figure>
                                                    <ul class="rating clearfix">
                                                        <li><i class="icon-Star"></i></li>
                                                        <li><i class="icon-Star"></i></li>
                                                        <li><i class="icon-Star"></i></li>
                                                        <li><i class="icon-Star"></i></li>
                                                        <li class="light"><i class="icon-Star"></i></li>
                                                    </ul>
                                                    <h6>Anderson <span>- April 08, 2020</span></h6>
                                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing sed eiusmod tempor incididunt labore dolore magna aliqua enim.</p>
                                                </div>
                                                <div class="single-review-box">
                                                    <figure class="image-box"><img src="${pageContext.request.contextPath}/resources/assets/images/resource/review-4.jpg" alt=""></figure>
                                                    <ul class="rating clearfix">
                                                        <li><i class="icon-Star"></i></li>
                                                        <li><i class="icon-Star"></i></li>
                                                        <li><i class="icon-Star"></i></li>
                                                        <li><i class="icon-Star"></i></li>
                                                        <li class="light"><i class="icon-Star"></i></li>
                                                    </ul>
                                                    <h6>Bradshaw <span>- April 07, 2020</span></h6>
                                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing sed eiusmod tempor incididunt labore dolore magna aliqua enim.</p>
                                                </div>
                                                <div class="single-review-box">
                                                    <figure class="image-box"><img src="${pageContext.request.contextPath}/resources/assets/images/resource/review-5.jpg" alt=""></figure>
                                                    <ul class="rating clearfix">
                                                        <li><i class="icon-Star"></i></li>
                                                        <li><i class="icon-Star"></i></li>
                                                        <li><i class="icon-Star"></i></li>
                                                        <li><i class="icon-Star"></i></li>
                                                        <li class="light"><i class="icon-Star"></i></li>
                                                    </ul>
                                                    <h6>Bradshaw <span>- April 26, 2020</span></h6>
                                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing sed eiusmod tempor incididunt labore dolore magna aliqua enim.</p>
                                                </div>
                                            </div>
                                            <div class="btn-box">
                                                <a href="doctors-details.html" class="theme-btn-one">Submit Review<i class="icon-Arrow-Right"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12 col-sm-12 sidebar-side">
                        <div class="doctors-sidebar">
                            <div class="form-widget">
                                <div class="form-title">
                                    <h3>Book Appointment</h3>
                                </div>
                                <div class="form-inner">
                                    <div class="choose-service">
                                        <h4>진료과목을 선택하세요</h4>
                                        <div class="custom-check-box">
                                            <div class="custom-controls-stacked">
                                                <label class="custom-control material-checkbox">
                                                    <input type="checkbox" class="material-control-input">
                                                    <span class="material-control-indicator"></span>
                                                    <span class="description">${item.subjects.category1 }<span class="price">$${item.subjects.price1 }</span></span>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="custom-check-box">
                                            <div class="custom-controls-stacked">
                                                <label class="custom-control material-checkbox">
                                                    <input type="checkbox" class="material-control-input" checked="">
                                                    <span class="material-control-indicator"></span>
                                                    <span class="description">${item.subjects.category2 }<span class="price">$${item.subjects.price2 }</span></span>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="custom-check-box">
                                            <div class="custom-controls-stacked">
                                                <label class="custom-control material-checkbox">
                                                    <input type="checkbox" class="material-control-input">
                                                    <span class="material-control-indicator"></span>
                                                    <span class="description">${item.subjects.category3 }<span class="price">$${item.subjects.price3 }</span></span>
                                                </label>
                                            </div>
                                        </div>
                                        
                                        <div class="btn-box">
                                            <a href="#" class="theme-btn-one">진료 예약 페이지로 이동<i class="icon-Arrow-Right"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- doctor-details end -->

    </div>
    