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
									<h3>회원정보조회</h3>
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
												<th>과거진료기록</th>
												<th>자가진단표</th>
												<th>진료분야</th>
												<th>약배달</th>
												<th>등록일</th>
												<th>수정일</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${list}" var="patients">
												<tr align="center">
													<td>${patients.memberNo }</td>
													<td>${patients.pastHx }</td>
													<td>${patients.preSelfAx }</td>
													<td>${patients.topic }</td>
													<td>${patients.medDelivery }</td>
													<td><fmt:formatDate value="${patients.regDate }"
															pattern="yy-MM-dd" /></td>
													<td><fmt:formatDate value="${patients.editDate }"
															pattern="yy-MM-dd" /></td>
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


