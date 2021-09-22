<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<link href="assets/css/responsive.css" rel="stylesheet">


 <!--page-title-two-->
        <section class="page-title-two">
            <div class="title-box centred bg-color-2">
                <div class="pattern-layer">
                    <div class="pattern-1" style="background-image: url(assets/images/shape/shape-70.png);"></div>
                    <div class="pattern-2" style="background-image: url(assets/images/shape/shape-71.png);"></div>
                </div>
                <div class="auto-container">
                    <div class="title">
                        <h1>전체 명상 리스트</h1>
                    </div>
                </div>
            </div>
            <div class="lower-content">
                <div class="auto-container">
                    <ul class="bread-crumb clearfix">
                        <li><a href="index.html">Home</a></li>
                        <li>전체 명상 리스트</li>
                    </ul>
                </div>
            </div>
        </section>
        <!--page-title-two end-->


        <!-- news-section -->
        <section class="blog-grid">
            <div class="auto-container">
                <div class="row clearfix">
                 <div class="col-lg-12 col-md-12 col-sm-12 sidebar-side">
                        <div class="blog-sidebar">
			                <div class="sidebar-widget sidebar-tags">
			                    <div class="widget-content">
			                        <ul class="tags-list clearfix">
			                            <li><a href="">감정</a></li>
			                            <li><a href="">분노</a></li>
			                            <li><a href="">중독</a></li>
			                            <li><a href="">인간관계</a></li>
			                            <li><a href="">수면</a></li>
			                            <li><a href="">스트레스</a></li>
			                        </ul>
			                    </div>
			                </div>
                        
                            <div class="sidebar-widget sidebar-search">
                                <div class="widget-title">
                                    <h3>Search</h3>
                                </div>
                                
                         <form action="blog-3.html" method="post" class="search-form">
				            <div class="row clearfix d-flex">
				                <div class="search-inner col-lg-4 col-md-12 col-sm-12">
				                    <div class="nice-select form-group">
				                        <select class="" name="type">
											<option value=""
												<c:out value="${pageMaker.cri.type == null ? 'selected':'' }"/>
											>선택</option>
											<option value="T" 
												<c:out value="${pageMaker.cri.type eq 'T'? 'selected':'' }"/>
											>제목</option>
											<option value="C"
												<c:out value="${pageMaker.cri.type eq 'C'? 'selected':'' }"/>
											>내용</option>
											<option value="W"
												<c:out value="${pageMaker.cri.type eq 'W'? 'selected':'' }"/>
											>작성자</option>
											<option value="TC"
												<c:out value="${pageMaker.cri.type eq 'TC'? 'selected':'' }"/>
											>제목 or 내용</option>
											<option value="TW" 
												<c:out value="${pageMaker.cri.type eq 'TW'? 'selected':'' }"/>
											>제목 or 작성자</option>
											<option value="TWC"
												<c:out value="${pageMaker.cri.type eq 'TWC'? 'selected':'' }"/>
											>제목 or 내용 or 작성자</option>
										</select>
				                    </div>
				                </div>
				                <div class="col-lg-7 col-md-12 col-sm-12">
				                    <div class="form-group">
				                        <input type="search" name="search-field" placeholder="Search" required="">
				                        <button type="submit"><i class="fas fa-search"></i></button>
				                    </div>
				                </div>
				            </div>
				        </form>
                                
                            </div>
                        
                        </div>
                    </div>
                </div>
               
                 <div class="row clearfix">
		            <!-- 명상 카드바디 -->
                    <c:forEach var="item" items="${list }">
	                    <div class="col-lg-4 col-md-6 col-sm-12 news-block">
	                        <div class="news-block-one wow fadeInUp animated animated" data-wow-delay="00ms" data-wow-duration="1500ms">
	                            <div class="inner-box">
	                                <figure class="image-box">
	                                    <img src="${pageContext.request.contextPath}/resources/assets/images/news/news-1.jpg" alt="">
	                                    <a href="${item.meditationNo }" class="link"><i class="fas fa-link"></i></a>
	                                    <span class="category">${item.category }</span>
	                                </figure>
	                                <div class="lower-content">
	                                    <h3><a href="${item.meditationNo }">${item.title }</a></h3>
	                                    <ul class="post-info">
	                                    <!--img scr나중에 다시 하기. 절대경로+이미지저장경로/${item.teacherPhoto}  -->
	                                        <li><img src="${pageContext.request.contextPath}/resources/assets/images/news/admin-1.png" alt="">${item.teacherName }</li>
	                                        <li><fmt:formatDate value="${item.regDate }"
											pattern="yyyy-MM-dd" /></li>
	                                    </ul>
	                                    <div class="link"><a href="blog-details.html"><i class="icon-Arrow-Right"></i></a></div>
	                                    <div class="btn-box"><a href="detail" class="theme-btn-one">명상하러 가기<i class="icon-Arrow-Right"></i></a></div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
                    </c:forEach>
                     <!-- end of 명상 카드바디 -->
                </div>
                 
                 
              
                 
                <!-- pagination  -->
                <div class="pagination-wrapper centred">
                    <ul class="pagination">
                    	<c:if test="${pageMaker.prev }">
                    	<li><a href="${pageMaker.startPage-1 }"><i class="icon-Arrow-Left"></i></a></li>
                    	</c:if>
                    	
                    	<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
                        <li><a href="${num }" class="current">${num }</a></li>
                        </c:forEach>
                        
                        <c:if test="${pageMaker.next }">
                        <li><a href="${pageMaker.endPage+1 }"><i class="icon-Arrow-Right"></i></a></li>
                        </c:if>
                    </ul>
                </div>
                 <!-- pagination end -->
            </div>
        </section>
        <!-- news-section end -->
        
        
        <script>
	 $(document).ready(function() {
		 var actionForm = $('#actionForm');
		 
		 /* 타이틀 클릭 시 상세페이지로 넘어가면서 페이지넘&어마운트 같이 가져가기 */
		 $(".move").on('click', function(e){
			 e.preventDefault();
			 actionForm.append('<input type="hidden" id="bno" name="bno" value="'+ $(this).attr("href") +'">');
			 actionForm.attr("action", "get");
			 actionForm.submit();
		 });
		 
		 
		 /* 교재 312 */
		 $("#pageButton a").on("click", function(e){
			 e.preventDefault(); //a tag, submit
			 console.log('clicked')
			 var p=$(this).attr("href");
			 $('[name="pageNum"]').val(p);
			 
			 actionForm.submit();
		 });

			/* $('#board').DataTable({
	            responsive: true
	        });*/
	    });
	</script>