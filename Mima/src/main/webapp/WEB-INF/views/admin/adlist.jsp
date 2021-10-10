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
										<select class="good-select wide" id="selectbox" name="selectbox"
												onchange="searchCheck()">
											<option value="pt" >환자(patients)</option>
											<option value="doctor" >의사(doctor)</option>
											<option value="pharmacy" >약국(pharmacy)</option>
										</select>
									</div>
								</div>
							<!-- selectbox end -->
							</div>
							<!-- patients -->
							<div class="Patients-list" id="patients" style="display: block;">
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
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${getPatientsList}" var="getPatientsList">
												<tr align="center">
													<td>${getPatientsList.memberNo }</td>
													<td>${getPatientsList.pastHx }</td>
													<td>${getPatientsList.preSelfAx }</td>
													<td>${getPatientsList.topic }</td>
													<td>${getPatientsList.medDelivery }</td>
													<td><fmt:formatDate value="${getPatientsList.regDate }"
															pattern="yy-MM-dd" /></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						<!--doctor-->
							<div class="Doctor-list" id="doctor" style="display: none;">
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
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${getdoctorList}" var="getdoctorList">
												<tr align="center">
													<td>${getdoctorList.memberNo }</td>
													<td>${getdoctorList.profileEducation }</td>
													<td>${getdoctorList.clinicInfo }</td>
													<td>${getdoctorList.clinicPhone }</td>
													<td>${getdoctorList.clinicEmail }</td>
													<td><fmt:formatDate value="${getdoctorList.regDate }"
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
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${getpharList}" var="getpharList">
												<tr align="center">
													<td>${getpharList.memberNo }</td>
													<td>${getpharList.pharmacyInfo }</td>
													<td>${getpharList.pharmacyContact }</td>
													<td>${getpharList.pharmacyEmail }</td>
													<td>${getpharList.deliveryArea }</td>
													<td><fmt:formatDate value="${getpharList.regDate }"
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
					<div id="ptPaging" class="pagination-wrapper" align="center" style="display: block;">
						<ul class="pagination">
							<c:if test="${pageMaker.prev }">
								<li class="paginate_button previous"><a href="${pageContext.request.contextPath }/admin/adlist?category=pt&pageNum=${pageMaker.startPage-1 }">이전</a></li>
							</c:if>
								
							<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
								<li class="paginate_button"><a href="${pageContext.request.contextPath }/admin/adlist?category=pt&pageNum=${num }">${num }</a></li>
							</c:forEach>
								
							<c:if test="${pageMaker.next }">
								<li class="paginate_button next"><a href="${pageContext.request.contextPath }/admin/adlist?category=pt&pageNum=${pageMaker.endPage+1 }">다음</a></li>
							</c:if>
						</ul>
					</div>
					
					<div id="doctorPaging" class="pagination-wrapper" align="center" style="display: none;">
						<ul class="pagination">
							<c:if test="${pageMaker.prev }">
								<li class="paginate_button previous"><a href="${pageContext.request.contextPath }/admin/adlist?category=doctor&pageNum=${pageMaker.startPage-1 }">이전</a></li>
							</c:if>
								
							<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
								<li class="paginate_button"><a href="${pageContext.request.contextPath }/admin/adlist?category=doctor&pageNum=${num }">${num }</a></li>
							</c:forEach>
								
							<c:if test="${pageMaker.next }">
								<li class="paginate_button next"><a href="${pageContext.request.contextPath }/admin/adlist?category=doctor&pageNum=${pageMaker.endPage+1 }">다음</a></li>
							</c:if>
						</ul>
					</div>
					
					<div id="pharmacyPaging" class="pagination-wrapper" align="center" style="display: none;">
						<ul class="pagination">
							<c:if test="${pageMaker.prev }">
								<li class="paginate_button previous"><a href="${pageContext.request.contextPath }/admin/adlist?category=pharmacy&pageNum=${pageMaker.startPage-1 }">이전</a></li>
							</c:if>
								
							<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
								<li class="paginate_button"><a href="${pageContext.request.contextPath }/admin/adlist?category=pharmacy&pageNum=${num }">${num }</a></li>
							</c:forEach>
								
							<c:if test="${pageMaker.next }">
								<li class="paginate_button next"><a href="${pageContext.request.contextPath }/admin/adlist?category=pharmacy&pageNum=${pageMaker.endPage+1 }">다음</a></li>
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
	function searchCheck() {
		
		var choose = $("#selectbox option:selected").val();

		if (choose == 'pt') {
			$("#patients").css('display','block');
			$("#doctor").css('display', 'none');   
			$("#pharmacy").css('display', 'none');
			$("#ptPaging").css('display','block');
			$("#doctorPaging").css('display', 'none');   
			$("#pharmacyPaging").css('display', 'none'); 
		} else if (choose == 'doctor'){
			$("#patients").css('display', 'none');
			$("#doctor").css('display', 'block');
			$("#pharmacy").css('display', 'none');
			$("#ptPaging").css('display', 'none');
			$("#doctorPaging").css('display', 'block');
			$("#pharmacyPaging").css('display', 'none');
		} else if (choose == 'pharmacy'){
			$("#patients").css('display', 'none');
			$("#doctor").css('display', 'none');
			$("#pharmacy").css('display', 'block'); 
			$("#ptPaging").css('display', 'none');
			$("#doctorPaging").css('display', 'none');
			$("#pharmacyPaging").css('display', 'block');
		}
	} 
	
	$(document).ready(function(){
		$('#selectbox').val('${cri.category}').prop("selected",true);
		searchCheck();
	});
</script>

