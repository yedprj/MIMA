<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<div class="boxed_wrapper">

	<!-- doctors-dashboard -->
	<section class="doctors-dashboard bg-color-3">
		<div>
			<div class="content-container">
				<div class="outer-container">
					<div class="doctors-appointment my-patients">
						<div class="title-box clearfix">
							<div class="text pull-left">
								<h3>신고글 조회</h3>
							</div>
							<div class="btn-box pull-right">
								<form action="my-patients.html" method="post"
									class="search-form">
									<div class="form-group">
										<input type="search" name="search-field" placeholder="Search"
											required="">
										<button type="submit">
											<i class="far fa-search"></i>
										</button>
									</div>
								</form>
							</div>
						</div>
						<div class="doctors-list">
							<div class="table-outer">
								<table class="table table-hover">
									<thead class="table-header">
										<tr align="center">
											<th>NO</th>
											<th>신고당한 원글번호</th>
											<th>신고당한 회원번호</th>
											<th>신고당한 회원아이디</th>
											<th>신고한 회원번호</th>
											<th>신고한 회원아이디</th>
											<th>신고일</th>
											<th>신고 확인일</th>
											<th>신고 조치 여부</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${list}" var="rmember">
											<tr align="center"
												onclick="location.href='rpget?reportNo=${rmember.reportNo}'">
												<td>${rmember.reportNo }</td>
												<td>${rmember.postNo }</td>
												<td>${rmember.reportMno }</td>
												<td>${rmember.reportId }</td>
												<td>${rmember.memberNo }</td>
												<td>${rmember.rmemberId }</td>
												<td><fmt:formatDate value="${rmember.reportDate }"
														pattern="yy-MM-dd" /></td>
												<td><fmt:formatDate value="${rmember.checkDate }"
														pattern="yy-MM-dd" /></td>
												<td>${rmember.reportResult }</td>

											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- pagination  -->
					<div class="pagination-wrapper" align="center">
						<ul class="pagination">
						
							<c:if test="${pageMaker.prev }">
							<li><a href="${pageMaker.startPage-1 }" class="current">1</a></li>
							</c:if>
							
							<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
							<li><a href=""${num }">2</a></li>
							</c:forEach>
							
							<c:if test="${pageMaker.next }">							
							<li><a href="${pageMaker.endPage+1 }"><i class="icon-Arrow-Right"></i></a></li>
							</c:if>
							
						</ul>
					</div>
					<!-- pagination end -->
					<br> <br>

					<div align="center">
						<div class="add-listing my-profile">
							<div class="btn-box">
								<a href="../admin/adMain" class="cancel-btn">목록</a>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>
	<!-- doctors-dashboard -->


	<!--Scroll to top-->
	<button class="scroll-top scroll-to-target" data-target="html">
		<span class="fa fa-arrow-up"></span>
	</button>
</div>


