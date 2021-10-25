<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>

<link
	href="${pageContext.request.contextPath}/resources/assets/css/responsive.css"
	rel="stylesheet">

<style>
.search-form {
	position: relative;
	display: inline-block;
	font-size: 14px;
	line-height: 20px;
	color: #7f8180;
	border: 2px solid #e5e5e5;
	border-radius: 30px;
	text-align: center;
	padding: 1px 16px;
	text-decoration: none;
	color: #007bff;
	text-decoration: none;
	background-color: white;
}

.lia > li {
    list-style: none;
    padding: 0px;
    margin: 0px;
    position: relative;
    display: inline-block;
    float: left;
    margin-right: 5px;
    margin-bottom: 15px;
    margin-top : 5px;
}

.lia > li > a {
	position: relative;
    display: inline-block;
    font-size: 14px;
    line-height: 26px;
    color: #7f8180;
    border: 1px solid #e5e5e5;
    border-radius: 30px;
    text-align: center;
    padding: 7px 16px;
    background-color: white;
}

a:-webkit-any-link {
	cursor: pointer;
}

.lia > li > a:hover{
	color: #fff;
	box-shadow: 0 20px 30px #d5edea;
 	border-color: #39cabb;
   	background: #39cabb;
}

</style>
<!--page-title-two-->
<div class="boxed_wrapper">
	<section class="page-title-two">
		<div class="title-box centred bg-color-2">
			<div class="pattern-layer">
				<div class="pattern-1"
					style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-70.png);"></div>
				<div class="pattern-2"
					style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-71.png);"></div>
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
					<li><a href="/app">Home</a></li>
					<li><a href="meditationMain">마음챙김</a></li>
					<c:choose>
						<c:when test="${empty pageMaker.cri.category}">
							<li>전체 리스트</li>
						</c:when>
						<c:otherwise>
							<li><a href="totalList">전체 리스트</a></li>
							<li>${pageMaker.cri.category }</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</section>
	<!--page-title-two end-->

	<!-- search bar -->
	<div class="select-field bg-color-3">
		<div class="auto-container">
			<div class="content-box">
				<div class="form-inner clearfix">
					<form action="totalList" method="get" class="search-form" id="actionForm" style="width: 60%; height: 20%;">
						<div class="form-group clearfix">
							<select class="wide" name="type">
								<option value=""
									<c:out value="${pageMaker.cri.type == null ? 'selected':'' }"/>>선택</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T'? 'selected':'' }"/>>제목</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C'? 'selected':'' }"/>>내용</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq 'W'? 'selected':'' }"/>>명상가</option>
								<option value="TC"
									<c:out value="${pageMaker.cri.type eq 'TC'? 'selected':'' }"/>>제목
									or 내용</option>
								<option value="TW"
									<c:out value="${pageMaker.cri.type eq 'TW'? 'selected':'' }"/>>제목
									or 명상가</option>
								<option value="TWC"
									<c:out value="${pageMaker.cri.type eq 'TWC'? 'selected':'' }"/>>제목
									or 내용 or 명상가</option>
							</select>

							<div class="form-group">
								<input type="hidden" id="pageNum" name="pageNum" value="1">
								<input type="hidden" id="amount" name="amount"
									value="${pageMaker.cri.amount}"> <input type="search"
									id="keyword" name="keyword" placeholder="Search" style="font-size: 20px;">
								<button type="submit">
									<i class="fas fa-search"></i>
								</button>
							</div>
						</div>
					</form>
					
					<div class="sidebar-widget sidebar-tags">
						<div class="widget-content">
							<ul class="tags-list clearfix lia">
								<li><a href="totalList?category=감정">감정</a></li>
								<li><a href="totalList?category=분노">분노</a></li>
								<li><a href="totalList?category=중독">중독</a></li>
								<li><a href="totalList?category=인간관계">인간관계</a></li>
								<li><a href="totalList?category=수면">수면</a></li>
								<li><a href="totalList?category=스트레스">스트레스</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- end of search bar -->


	<!-- news-section -->
	<section class="blog-grid">
		<div class="auto-container">
			<div class="row clearfix">
				<!-- 명상 카드바디 -->
				<c:forEach var="item" items="${list }">
					<div class="col-lg-4 col-md-6 col-sm-12 news-block">
						<div class="news-block-one wow fadeInUp animated animated"
							data-wow-delay="00ms" data-wow-duration="1500ms">
							<div class="inner-box">
								<figure class="image-box">
									<a class="move" href="${item.meditationNo }"> <img style="width:370px; height:270px"
										src="${pageContext.request.contextPath}/resources/assets/images/medit/${item.meditationThumb}"
										alt="">
									</a>
									<span class="category">${item.category }</span>
								</figure>
								<div class="lower-content">
									<h3>
										<a class="move" href="${item.meditationNo }">${item.title }</a>
									</h3>
									<ul class="post-info">
										<!--img scr나중에 다시 하기. 절대경로+이미지저장경로/${item.teacherPhoto}  -->
										<li><img
											src="${pageContext.request.contextPath}/resources/assets/images/medit/mditlogo.png"
											alt="">${item.teacherName }</li>
										<li><fmt:formatDate value="${item.regDate }"
												pattern="yyyy-MM-dd" /></li>
										<li>${item.commentsCnt }Reviews</li>
									</ul>
									<div class="link">
										<a href="blog-sdetails.html"><i class="icon-Arrow-Right"></i></a>
									</div>
									<div class="btn-box">
										<a href="${item.meditationNo }" class="theme-btn-one move">명상하러
											가기<i class="icon-Arrow-Right"></i>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- end of 명상 카드바디 -->
			</div>

			<!-- pagination  -->
			<div class="pagination-wrapper centred">
				<div id="pageButton">
					<ul class="pagination">
						<c:if test="${pageMaker.prev }">
							<li><a href="${pageMaker.startPage-1 }"><i
									class="icon-Arrow-Left"></i></a></li>
						</c:if>

						<c:forEach begin="${pageMaker.startPage }"
							end="${pageMaker.endPage }" var="num">
							<li><a href="${num }" class="current">${num }</a></li>
						</c:forEach>

						<c:if test="${pageMaker.next }">
							<li><a href="${pageMaker.endPage+1 }"><i
									class="icon-Arrow-Right"></i></a></li>
						</c:if>
					</ul>
				</div>
			</div>
			<!-- pagination end -->
		</div>
	</section>
</div>
<!-- news-section end -->

<script>
	$(document).ready(function() {
		var actionForm = $('#actionForm');
		/* 타이틀 클릭 시 상세페이지로 넘어가면서 페이지넘&어마운트 같이 가져가기 */
		$(".move").on('click', function(e) {
			e.preventDefault();
			$('#meditationNo').remove();
			actionForm.append('<input type="hidden" id="meditationNo" name="meditationNo" value="'
								+ $(this).attr("href")+ '">');
			actionForm.attr("action", "meditationDetail");
			actionForm.submit();
		});

		/* 교재 312 */
		$("#pageButton a").on("click", function(e) {
			e.preventDefault(); //a tag, submit

			var p = $(this).attr("href");
			$('[name="pageNum"]').val(p);
				actionForm.submit();
			});
		});
</script>