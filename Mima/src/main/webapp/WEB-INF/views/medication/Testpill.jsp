<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<style>
</style>

<!-- sidebar-page-container -->
<section class="sidebar-page-container">
	<div class="auto-container">
		<div class="row clearfix">
			<div class="col-lg-12 col-md-12 col-sm-12 sidebar-side">
				<div class="blog-sidebar">
					<!-- 약 검색 구간 -->
					<div class="sidebar-widget sidebar-search"
						style="background-color: #ebf7f6;">
						<div class="widget-title col-12">
							<div class="row">
								<div class="col-12 col-sm-2">
									<h3>약 검색</h3>
								</div>
								<div class="col-12 col-sm-2">
									<div class="form-group">
										<select class="wide">
											<option data-display="카테고리">카테고리</option>
											<option value="1">California</option>
											<option value="2">New York</option>
											<option value="3">Sun Francis</option>
											<option value="4">Shicago</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="search-inner">
							<form action="blog-3.html" method="post" class="search-form">
								<div class="form-group">
									<input type="search" name="search-field"
										placeholder="Pill Search..">
									<button type="submit">
										<i class="fas fa-search"></i>
									</button>
									<i class="icon-star"></i>
								</div>
							</form>
						</div>
					</div>
					<!-- 약 검색 출력 구간 -->
						<c:if test="${not empty plist}">
							<c:forEach items="${plist}" var="list">
								<p>${list.entpName}</p>
								<p>${list.itemName}</p>
								<p>${list.itemSeq}</p>
								<p>${list.efcyQesitm}</p>
								<p>${list.useMethodQesitm}</p>
								<p>${list.atpnWarnQesit}</p>
								<p>${list.atpnQesitm}</p>
								<p>${list.intrcQesitm}</p>
								<p>${list.seQesitm}</p>
								<p>${list.depositMethodQesitm}</p>
								<p>${list.openDe}</p>
								<p>${list.updateDe}</p>
								<p><img src="${list.itemlmage}"></p>
							</c:forEach>
						</c:if>



					<div class="sidebar-widget category-widget">
						<div class="widget-title">
							<h3>카테고리</h3>
						</div>
						<div class="widget-content">
							<ul class="category-list clearfix">
								<li><a href="blog-details.html">신경</a></li>
								<li><a href="blog-details.html">Dermatology</a></li>
								<li><a href="blog-details.html">Family Medicine</a></li>
								<li><a href="blog-details.html">Obstetrics & Gynecology</a></li>
								<li><a href="blog-details.html">Oncology</a></li>
								<li><a href="blog-details.html">Orthopedic Surgery</a></li>
							</ul>
						</div>
					</div>
					<div class="sidebar-widget sidebar-tags">
						<div class="widget-title">
							<h3>자주 쓰는 약</h3>
						</div>
						<div class="widget-content">
							<ul class="tags-list clearfix">
								<li><a href="blog-details.html">Medicine</a></li>
								<li><a href="blog-details.html">Treatment</a></li>
								<li><a href="blog-details.html">Pills</a></li>
								<li><a href="blog-details.html">Specialist</a></li>
								<li><a href="blog-details.html">Doctors</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- sidebar-page-container end -->


<script>


</script>

