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
							<!-- selectbox -->
								<div class="btn-box pull-right">
									<div class="select-box">
										<select class="good-select wide" id="selectbox" name="selectbox">
											<option data-display="환자(patients)">환자(patients)</option>
											<option value="doctor">의사(doctor)</option>
											<option value="pharmacy">약국(pharmacy)</option>
										</select>
									</div>
								</div>
							<!-- selectbox end -->
							</div>
							<!-- patients -->
							<div class="Patients-list" id="patients" style="display: none;">
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
											<c:forEach items="${getptList}" var="getptList">
												<tr align="center">
													<td>${getptList.memberNo }</td>
													<td>${getptList.pastHx }</td>
													<td>${getptList.preSelfAx }</td>
													<td>${getptList.topic }</td>
													<td>${getptList.medDelivery }</td>
													<td><fmt:formatDate value="${getptList.regDate }"
															pattern="yy-MM-dd" /></td>
													<td><fmt:formatDate value="${getptList.editDate }"
															pattern="yy-MM-dd" /></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						<!--doctor-->
							<div class="Doctor-list" id="doctor" style="display: block;">
								<div class="table-outer">
									<table class="table table-hover">
										<thead class="table-header">
											<tr align="center">
												<th>NO</th>
												<th>이름</th>
												<th>주소</th>
												<th>전화번호</th>
												<th>이메일</th>
												<th>등록일</th>
												<th>수정일</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${getdocList}" var="getdocList">
												<tr align="center">
													<td>${getdocList.memberNo }</td>
													<td>${getdocList.profileEducation }</td>
													<td>${getdocList.clinicInfo }</td>
													<td>${getdocList.clinicPhone }</td>
													<td>${getdocList.clinicEmail }</td>
													<td><fmt:formatDate value="${getdocList.regDate }"
															pattern="yy-MM-dd" /></td>
													<td><fmt:formatDate value="${getdocList.editDate }"
															pattern="yy-MM-dd" /></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
					<!-- pharmacy -->
						<div class="Pharmacy-list" id="pharmacy" style="display: none;">
								<div class="table-outer">
									<table class="table table-hover">
										<thead class="table-header">
											<tr align="center">
												<th>NO</th>
												<th>이름</th>
												<th>연락처</th>
												<th>이메일</th>
												<th>배달 가능 지역</th>
												<th>등록일</th>
												<th>수정일</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${getpmList}" var="getpmList">
												<tr align="center">
													<td>${getpmList.memberNo }</td>
													<td>${getpmList.pharmacyInfo }</td>
													<td>${getpmList.pharmacyContact }</td>
													<td>${getpmList.pharmacyEmail }</td>
													<td>${getpmList.deliveryArea }</td>
													<td><fmt:formatDate value="${getpmList.regDate }"
															pattern="yy-MM-dd" /></td>
													<td><fmt:formatDate value="${getpmList.editDate }"
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

<script>
	function searchCheck(num) {
		if (num == '3') {
			$("#patients").css('display','none');
			$("#doctor").css('display', 'block');   
			$("#pharmacy").css('display', 'none'); 
		} else {
			$("#patients").css('display', 'none');
			$("#doctor").css('display', "block");
			$("#pharmacy").css('display', 'none'); 
		}
	} 
</script>
