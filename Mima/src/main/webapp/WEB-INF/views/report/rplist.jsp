<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



	<div class="boxed_wrapper">

		<!-- doctors-dashboard -->
		<section class="doctors-dashboard bg-color-3">
			<div class="left-panel"></div>
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
									<table class="table table-hover" >
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
												<tr align="center" onclick="location.href='rpget?reportNo=${rmember.reportNo }'">
													<td>${rmember.reportNo }</td>
													<td>${rmember.postNo }</td>
													<td>${rmember.reportMno}</td>
													<td>${rmember.reportId}</td>
													<td>${rmember.memberNo}</td>
													<td>${rmember.rmemberId}</td>
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
						<div class="pagination-wrapper" align="center">
							<ul class="pagination">
								<li><a href="clinic-1.html" class="current">1</a></li>
								<li><a href="clinic-1.html">2</a></li>
								<li><a href="clinic-1.html">3</a></li>
								<li><a href="clinic-1.html"><i class="icon-Arrow-Right"></i></a></li>
							</ul>
						</div>
						<br> <br>
						<div align="center">
							<button type="button" class="btn btn-secondary" style="background-color: #39CABB;" 
								onclick="location.href='../admin/adMain'">목록</button>
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


