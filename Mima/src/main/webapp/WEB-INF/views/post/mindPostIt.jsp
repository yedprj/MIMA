<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
                                <h3>Showing 1-6 of 20 Results</h3>
                            </div>
                            <div class="right-column pull-right clearfix">
                                <div class="short-box clearfix">
                                    <div class="select-box">
                                        <select class="wide">
                                           <option data-display="Sort by">Sort by</option>
                                           <option value="1">Cardiology</option>
                                           <option value="2">Nurology</option>
                                           <option value="4">Pragnency</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="menu-box">
                                    <button class="list-view"><i class="icon-List"></i></button>
                                    <button class="grid-view on"><i class="icon-Grid"></i></button>
                                </div>
                            </div>
                        </div>
                        <div class="wrapper grid">

                            <div class="clinic-grid-content grid-item">
                                <div class="row clearfix">
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
		$.ajax({
			url : "postList",
			dataType : "json",
			success : function(datas) {
				$("#postContents").empty();
				$.each(datas, function(i, data) {
					$("<div id='"+data.postNo+"'>").append(
							$("<p>").html(data.contents)).appendTo(
							$("#postContents"));
				});
			}
		})
	} // 페이지목록 조회 end
</script>

	

