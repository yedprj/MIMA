<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>

<style>
.starR{
  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
  background-size: auto 100%;
  width: 20px;
  height: 20px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}
.starR.on{background-position:0 0;}
</style>  


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
                                        <br>
                                        <span class="designation">${item.subjects.category1 } / ${item.clinicInfo }</span>
                                        <ul class="name-box clearfix">
                                            <li class="name"><h2>Dr.${item.name }</h2></li>
                                        </ul>
                                        
                                        <div class="text">
                                            <p></p>
                                        </div>
                                        <div class="lower-box clearfix">
                                            <ul class="info clearfix">
                                              	<li><i class="fas fa-comment-dots"></i>전체 리뷰 수(${reviewTotalNum })</li>
                                                <li><i class="fas fa-map-marker-alt"></i>${item.addr1 }</li>
                                                <li><i class="fas fa-phone"></i>${item.clinicPhone }</li>
                                                <li><i class="fas fa-envelope-open-text"></i>${item.clinicEmail }</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tabs-box">
                                <div class="tab-btn-box centred">
                                    <ul class="tab-btns tab-buttons clearfix">
                                        <li class="tab-btn active-btn" data-tab="#tab-1">Overview</li>
                                        <li class="tab-btn" data-tab="#tab-2">Experience</li>
                                        <li class="tab-btn location" data-tab="#tab-3">Location</li>
                                        <li class="tab-btn" data-tab="#tab-4">Reviews</li>
                                    </ul>
                                </div>
                                <div class="tabs-content">
                                    <div class="tab active-tab" id="tab-1">
                                        <div class="inner-box">
                                            <div class="text">
                                                <h3>전문의 Dr. ${item.name }님은요...</h3>
                                                <p>${item.profileContents }</p>
                                                <h3>진료과목</h3>
                                                <p class="treatments-list clearfix">
                                                   <span><i class="fas fa-stethoscope"></i> ${item.subjects.category1 }</span><br>
                                                   <span><i class="fas fa-stethoscope"></i> ${item.subjects.category2 }</span><br>
                                                   <span><i class="fas fa-stethoscope"></i> ${item.subjects.category3 }</span>
                                                </p>
                                                <h3>학력</h3>
                                                <p>${item.profileEducation } 을 밑에 잘라 넣으면 됩니다.</p>
                                                <ul id="uploadedExp clearfix"></ul>
                                                
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
                                                    </li>
                                                    <li class="accordion block active-block">
                                                        <div class="acc-btn">
                                                            <div class="icon-outer"></div>
                                                            <h6>${item.subjects.category2 }<span>${item.subjects.price2 }</span></h6>
                                                        </div>
                                                    </li>
                                                    <li class="accordion block">
                                                         <div class="acc-btn">
                                                            <div class="icon-outer"></div>
                                                            <h6>${item.subjects.category3 }<span>${item.subjects.price3 }</span></h6>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab" id="tab-2">
                                        <div class="experience-box">
                                            <div class="text">
                                                <h3>경력사항</h3>
                                                <ul class="experience-list clearfix">
                                                	<c:forEach var="exp" items="${expList }">
                                                    <li>
														${exp.detail }
                                                        <p>${exp.title }<span>(<fmt:formatDate value="${exp.fromDate }" dateStyle="medium"/>
                                                        -<fmt:formatDate value="${exp.toDate }" dateStyle="medium"/>)</span></p>
                                                    </li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab" id="tab-3">
                                        <div class="location-box">
                                            <h3>Locations</h3>
                                            <!-- <div class="map-inner"> -->
                                              <div id="map" style="width:100%;height:350px;"></div>
                                            <!-- </div> -->
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
                                            <div class="review-inner">
                                            	<c:if test="${empty docReviewPage }">
                                            		<p>아직 등록된 리뷰가 없습니다.</p>
                                            	</c:if>
                                            	<c:if test="${not empty docReviewPage }">
                                            		<c:forEach var="review" items="${docReviewPage }">
	                                            		<div class="single-review-box">
		                                                    <figure class="image-box"><img src="${pageContext.request.contextPath}/resources/assets/images/resource/review-1.jpg" alt=""></figure>
		                                                    <c:if test="${review.reviewPoint == 1}">
			                                                    <div class="starRev">
								                                	<span class="starR on">별1</span>
																	<span class="starR">별2</span>
																	<span class="starR">별3</span>
																	<span class="starR">별4</span>
																	<span class="starR">별5</span>
								                                </div>
		                                                    </c:if>
		                                                     <c:if test="${review.reviewPoint == 2}">
			                                                    <div class="starRev">
								                                	<span class="starR on">별1</span>
																	<span class="starR on">별2</span>
																	<span class="starR">별3</span>
																	<span class="starR">별4</span>
																	<span class="starR">별5</span>
								                                </div>
		                                                    </c:if>
		                                                     <c:if test="${review.reviewPoint == 3}">
			                                                    <div class="starRev">
								                                	<span class="starR on">별1</span>
																	<span class="starR on">별2</span>
																	<span class="starR on">별3</span>
																	<span class="starR">별4</span>
																	<span class="starR">별5</span>
								                                </div>
		                                                    </c:if>
		                                                     <c:if test="${review.reviewPoint == 4}">
			                                                    <div class="starRev">
								                                	<span class="starR on">별1</span>
																	<span class="starR on">별2</span>
																	<span class="starR on">별3</span>
																	<span class="starR on">별4</span>
																	<span class="starR">별5</span>
								                                </div>
		                                                    </c:if>
		                                                     <c:if test="${review.reviewPoint == 5}">
			                                                    <div class="starRev">
								                                	<span class="starR on">별1</span>
																	<span class="starR on">별2</span>
																	<span class="starR on">별3</span>
																	<span class="starR on">별4</span>
																	<span class="starR on">별5</span>
								                                </div>
		                                                    </c:if>
		                                                    
		                                                    <h6>${review.nickname } <span>- <fmt:formatDate value="${review.regDate }" dateStyle="medium"/></span></h6>
		                                                    <p>${review.contents }</p>
                                                		</div>
                                                	</c:forEach>
                                            	</c:if>
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
    
    
    
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1996b7204476ce04c73afedac09391c9&libraries=services"></script>
    <script>

    
	//카카오 맵 펑션 시작   
    function getMap(){
    	var addr1 = "<c:out value='${item.addr1}'/>";
    	var addr2 = "<c:out value='${item.addr2}'/>";
    	var addr3 = "<c:out value='${item.addr3}'/>";
    	var postcode = "<c:out value='${item.postcode}'/>";
    	
    	var address = addr1 +" " +addr2 +" "+postcode;
    	
    	//kakao map start
    	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = {
    		center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level:2 // 지도의 확대 레벨
        };  

	    // 지도를 생성합니다    
	    var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	    // 주소-좌표 변환 객체를 생성합니다
	    var geocoder = new kakao.maps.services.Geocoder();
	
	    // 주소로 좌표를 검색합니다
	    //geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {
	   	geocoder.addressSearch(address, function(result, status) {
	
	        // 정상적으로 검색이 완료됐으면 
	         if (status === kakao.maps.services.Status.OK) {
	
	            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	            // 결과값으로 받은 위치를 마커로 표시합니다
	            var marker = new kakao.maps.Marker({
	                map: map,
	                position: coords
	            });
	
	            // 인포윈도우로 장소에 대한 설명을 표시합니다
	            var infowindow = new kakao.maps.InfoWindow({
	                content: '<div style="width:150px;text-align:center;padding:6px 0;">클리닉</div>'
	            });
	            infowindow.open(map, marker);
	
	            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	            map.setCenter(coords);
	        } 
	    });    //end of kakao map
    }//카카오 맵 펑션 끝
    	
    //s:1019 tab 온클릭이벤트 시작
    $('.location').on('click', function(){
    	getMap();
 
    	});//tab 온클릭이벤트 끝

	
    	var education = "<c:out value='${item.profileEducation }'/>";
    	console.log(education);
    	var arr = education.split("!");
    	
    	for(var i=0; i<arr.length-1; i++){
    		var str="";
    		
    		str += "<li id='scholl_1'>"+arr[i]+"<span id="sub_1"></span></li>"
            str += "<li id='scholl_2'>"++"<span id="sub_3"></span></li>"
            str += "<li id='scholl_3'>"++"<span id="sub_3"></span></li>"
    	}
    	
    	
    </script>
    