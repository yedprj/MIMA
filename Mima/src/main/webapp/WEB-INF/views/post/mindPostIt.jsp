<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
	.team-style-two {
    padding: 20px 0px 20px 0px;
}
</style>

<div class="boxed_wrapper">
    <!--Page Title-->
    <section class="page-title centred bg-color-1">
        <div class="pattern-layer">
            <div class="pattern-1" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-70.png);"></div>
            <div class="pattern-2" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-71.png);"></div>
        </div>
        <div class="auto-container">
            <div class="content-box">
                <div class="title">
                    <h1>그린포스트잇</h1>
                </div>
            </div>
        </div>
    </section>
    <!--End Page Title-->


    <!-- team-style-two -->
    <section class="team-style-two bg-color-3">
        <div class="auto-container">
               
               
               
               
               <div class="row clearfix">
                    <div class="col-lg-12 col-md-12 col-sm-12 content-side">
                        <div class="item-shorting clearfix">
                            <div class="left-column pull-left">
                                <h3>당신의 오늘은 어떤가요?😃</h3>
                            </div>
                        </div>
                        <br>
                        <div class="wrapper grid">

                            <div class="clinic-grid-content grid-item">
                                <div class="row clearfix postContents">
                                <!-- 내용 -->
                                    <div class="col-lg-3 col-md-6 col-sm-12 team-block">
                                        <div class="team-block-three">
                                            <div class="inner-box">
                                                
                                                <div class="lower-content">
                                                	<div class="content-box right-column pull-right">
	                                   					<div class="like-box">
	                                   						<a href="clinic-details.html"><i class="far fa-heart"></i></a>
	                                   					</div>
                                 					</div>
                                                    <ul class="name-box clearfix">
                                                        <li class="name"><h3><a href="clinic-details.html">Memorial Hospital</a></h3></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                <!-- 내용 끝-->    
                                </div>
                            </div>
                        </div>
                        
                        <br>
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
    <!-- team-style-two -->


    <!--Scroll to top-->
    <button class="scroll-top scroll-to-target" data-target="html">
        <span class="fa fa-arrow-up"></span>
    </button>
</div>

<script>
	$(function() {

		postList();

	}); //end 

	//페이지 목록 조회
	function postList() {
		var str;
		$.ajax({
			url : "postList",
			dataType : "json",
			success : function(datas) {
				$(".postContents").empty();
				$.each(datas, function(i, data) {
					$("<div class='col-lg-3 col-md-6 col-sm-12 team-block'>")
						.append( "<div class='team-block-three'>"
						+ '<div class="inner-box">'
                        + '<div class="lower-content">'
                    	+ '<div class="content-box right-column pull-right">'
        				+ '<div class="like-box">'
        				+	'	<a href="clinic-details.html"><i class="far fa-heart"></i></a>'
        				+	'</div>'
     					+ '</div>'
                        + '<div class="name-box clearfix">'
                        +  '  <h3 class="name text-center"><br><b>'+data.contents +'</b><br><br></h3></li>'
                        +  '</div>'
                    	+ '</div>'
                		+ '</div>'
            			+ '</div>'					
						)  
						.appendTo($(".postContents"));
					 	
					}); // each end
				} // success end
			}) //ajax end
		} // 페이지목록 조회 end
</script>

	

