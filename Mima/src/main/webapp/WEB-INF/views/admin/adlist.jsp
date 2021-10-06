<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- K.10/06 -->
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
												>
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
					<!-- e.4 -->
					<!-- pagination  -->
					<div class="pagination-wrapper" align="center">
						<ul class="pagination">
							<c:if test="${pageMaker.prev }">
								<li class="paginate_button previous"><a href="${pageContext.request.contextPath }/admin/list?pageNum=${pageMaker.startPage-1 }">이전</a></li>
							</c:if>
								
							<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
								<li class="paginate_button"><a href="${pageContext.request.contextPath }/admin/list?pageNum=${num }">${num }</a></li>
							</c:forEach>
								
							<c:if test="${pageMaker.next }">
								<li class="paginate_button next"><a href="${pageContext.request.contextPath }/admin/list?pageNum=${pageMaker.endPage+1 }">다음</a></li>
							</c:if>
						</ul>
					</div>
					<!-- pagination end -->
						<br> <br>
					<div align="center">
						<div class="add-listing my-profile">
							<div class="btn-box">
								<a href="${pageContext.request.contextPath }/admin/adMain" class="cancel-btn">목록</a>
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


