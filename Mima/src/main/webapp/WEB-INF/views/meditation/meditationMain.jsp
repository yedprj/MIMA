<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>

 <!--Page Title-->
        <section class="page-title centred bg-color-1">
            <div class="pattern-layer">
                <div class="pattern-1" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-70.png);"></div>
                <div class="pattern-2" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-71.png);"></div>
            </div>
            <div class="auto-container">
                <div class="content-box">
                    <div class="title">
                        <h1>마음챙김</h1>
                    </div>
                    <ul class="bread-crumb clearfix">
                        <li><a href="index.html">Home</a></li>
                        <li>명상</li>
                    </ul>
                </div>
            </div>
        </section>
        <!--End Page Title-->

 
 <!--  추천명상 들어갈 자리!!!!-->
        <section class="team-style-two">
            <div class="auto-container">
                <div style="margin-bottom:10px"><p style="font-size:30px"> ${session.nickname }님을 위한 오늘의 추천명상</p></div>
                <div class="row clearfix">
                	<c:forEach var="medit" items="${list }">
                    <div class="col-lg-3 col-md-6 col-sm-12 team-block">
                        <div class="team-block-two wow fadeInUp animated animated" data-wow-delay="00ms" data-wow-duration="1500ms">
                            <div class="inner-box">
                                <div class="pattern" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-43.png);"></div>
                                <figure class="image-box">
                                    <img src="${pageContext.request.contextPath}/resources/assets/images/medit/medit_moody.png" alt="">
                                </figure>
                                <div class="lower-content">
                                    <h3><a class="move" href="${medit.meditationNo }">${medit.title }</a></h3>
                                    <div>
                                     <span><img src="${pageContext.request.contextPath}/resources/assets/images/medit/admin-1.png" alt="">${medit.teacherName }</span>
                                     <span><fmt:formatDate value="${medit.regDate }" pattern="yyyy-MM-dd" /></span>
                                     <br>
                                    	<span>${medit.category }</span>
                                    <br>
                                    <span>${medit.commentsCnt } reviews</span>
                                    </div>
                                    <br>
	                                <div class="btn-box">
	                                	<a type="button" href="${medit.meditationNo }" class="btn move" style="background-color:rgb(229, 204, 255); border-color:none;">더보기<i class="icon-Arrow-Right"></i></a>
	                                </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
                   <div style="float:right"><div class="btn-box"><a href="totalList" class="theme-btn-one">Total list of meditation<i class="icon-Arrow-Right"></i></a></div></div>
            </div>
        </section>
        <!-- End of 추천명상 들어갈 자리!!!! -->
        
        <!--카테고리별 명상 -->
        <section class="clients-section bg-color-2">
            <div class="pattern-layer">
                <div class="pattern-1" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-3.png);"></div>
                <div class="pattern-2" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-4.png);"></div>
            </div>
            <div class="auto-container">
                <div class="">
                    <div class="clients-carousel owl-carousel owl-theme owl-nav-none owl-dots-none">
                        <figure class="clients-logo-box"><a href="totalList?category=감정"><img src="${pageContext.request.contextPath}/resources/assets/images/medit/medit_emotion.png" alt=""></a></figure>
                        <figure class="clients-logo-box"><a href="totalList?category=분노"><img src="${pageContext.request.contextPath}/resources/assets/images/medit/medit_anger.png" alt=""></a></figure>
                        <figure class="clients-logo-box"><a href="totalList?category=중독"><img src="${pageContext.request.contextPath}/resources/assets/images/medit/medit_addiction.png" alt=""></a></figure>
                        <figure class="clients-logo-box"><a href="totalList?category=인간관계"><img src="${pageContext.request.contextPath}/resources/assets/images/medit/medit_relation.png" alt=""></a></figure>
                        <figure class="clients-logo-box"><a href="totalList?category=수면"><img src="${pageContext.request.contextPath}/resources/assets/images/medit/medit_sleep.png" alt=""></a></figure>
                        <figure class="clients-logo-box"><a href="totalList?category=스트레스"><img src="${pageContext.request.contextPath}/resources/assets/images/medit/medit_stress.png" alt=""></a></figure>
                    </div>
                </div>
            </div>
        </section>
<!-- End of 카테고리별 명상 -->
       
        
        
         <!-- 명상에 관해서 -->
        <section class="about-style-two">
            <div class="auto-container">
                <div class="row align-items-center clearfix">
                    <div class="col-lg-6 col-md-12 col-sm-12 image-column">
                        <div class="image_block_2">
                            <div class="image-box">
                                <div class="pattern">
                                    <div class="pattern-1" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-37.png);"></div>
                                    <div class="pattern-2" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-38.png);"></div>
                                    <div class="pattern-3"></div>
                                </div>
                                <figure class="image image-1 paroller-2" style="transform: translateY(-105px) translateX(-150px);"><img src="${pageContext.request.contextPath}/resources/assets/images/medit/stones.jpg" alt=""></figure>
                                <figure class="image image-2 paroller"><img src="${pageContext.request.contextPath}/resources/assets/images/medit/monk.jpg" alt=""></figure>
                                
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12 col-sm-12 content-column">
                        <div class="content_block_1">
                            <div class="content-box">
                                <div class="sec-title">
                                    <p>마음, 챙겨주세요</p>
                                    <h2>트랜드로 떠오르고 있는 명상, 얼마나 아시나요?</h2>
                                </div>
                                <div class="text">
                                    <p>Lorem ipsum dolor sit amet consectur adipiscing elit sed eiusmod ex tempor incididunt labore dolore magna aliquaenim ad minim veniam quis nostrud exercitation ullamco laboris.</p>
                                </div>
                                <ul class="list-style-one clearfix">
                                    <li>건강 보조제? 마음 보조제!</li>
                                    <li>잠깐의 투자로 내 마음을 돌보자</li>
                                </ul>
                                <div class="btn-box"><a href="aboutMedit" class="theme-btn-one">더 알아볼까요?<i class="icon-Arrow-Right"></i></a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--End of 명상에 관해서-->
	<div>
</div>


 <form action="meditationDetail" method="get" id="frm">
		<input type="hidden" id="pageNum" name="pageNum" value="1">
    	<input type="hidden" id="amount" name="amount" value="${pageMaker.cri.amount}">
 </form>


<script>
 $(document).ready(function() {
	 $(".move").on('click', function(e){
		 e.preventDefault();
		 $('#frm').append('<input type="hidden" id="meditationNo" name="meditationNo" value="'+ $(this).attr("href") +'">');
		 $('#frm').submit();
	 });

	
    });
</script>
