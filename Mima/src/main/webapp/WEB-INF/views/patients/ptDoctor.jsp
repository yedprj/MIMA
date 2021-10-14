<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
th, td {
	text-align: center;
	span: center;
}
</style>

<!--page-title-two-->
<section class="page-title-two">
	<div class="title-box centred bg-color-2">
		<div class="pattern-layer">
			<div class="pattern-1" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-70.png);"></div>
			<div class="pattern-2" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-71.png);"></div>
		</div>
		<div class="auto-container">
			<div class="title">
				<h1>내가 찜한 의사</h1>
			</div>
		</div>
	</div>
	<div class="lower-content">
		<ul class="bread-crumb clearfix">
			<li><a href="${pageContext.request.contextPath}">Home</a></li>
			<li>내가 찜한 의사</li>
		</ul>
	</div>
</section>
<!--page-title-two end-->

<section class="doctors-dashboard bg-color-3">
	<div class="left-panel">
		<div class="profile-box">
			<div class="upper-box">
				<figure class="profile-image">
					<img src="${pageContext.request.contextPath}/resources/assets/images/resource/profile-2.png" >
				</figure>
				<div class="title-box centred">
					<div class="inner">
						<h3>${session.name}</h3>
						<p>${clinicName}</p>
					</div>
				</div>
			</div>
			<div class="profile-info">
				<ul class="list clearfix">
					<li><a href="ptMain" class="current"><i class="fas fa-columns"></i>대쉬보드</a></li>
					<li><a href="ptBookManage"><i class="fas fa-calendar-alt"></i>나의 예약관리</a></li>
					<li><a href="ptDoctor"><i class="fas fa-calendar-alt"></i>나의 진료내역</a></li>
					<li><a href="ptDoctor"><i class="fas fa-wheelchair"></i>내가 찜한 의사</a></li>
					<li><a href="ptReview"><i class="fas fa-star"></i>나의 후기</a></li>
					<li><a href="ptQna"><i class="fas fa-comments"></i>나의 문의</a></li>
					<li><a href="ptMedelivery"><i class="fas fa-ambulance"></i>약 배달관리</a></li>
					<li><a href="ptProfileDetail"><i class="fas fa-user"></i>프로필 관리</a></li>
					<li><a href="ptPwChangeForm"><i class="fas fa-unlock-alt"></i>비밀번호 변경</a></li>
					<li><a href="login.html"><i class="fas fa-sign-out-alt"></i>로그아웃</a></li>
	            </ul>
			</div>
		</div>
	</div>
	
	<div class="right-panel">
        <div class="content-container">
            <div class="outer-container">
                <div class="doctors-appointment my-patients">
                    <div class="title-box clearfix">
                        <div class="text pull-left">
                            <h3>내가 찜한 의사</h3>
							<span>담당 의사들을 확인할 수 있습니다.</span>
                        </div>
                        <div class="btn-box pull-right">
                            <form action="patientList" method="get" class="search-form" id="actionForm">
                                <div class="form-group">
                                	<input type="hidden" id="pageNum" name="pageNum" value="1">
	              					<input type="hidden" id="amount" name="amount" value="${pageMaker.cri.amount}">
                                
                                    <input type="search" id="keyword" name="keyword" onKeypress="enter();" placeholder="의사명을 입력하세요." value="${cri.keyword}">
                                    <button type="submit"><i class="far fa-search"></i></button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="doctors-list">
                        <div class="table-outer">
                            <table class="doctors-table">
                                <thead class="table-header">
                                    <tr>
                                        <th>의사명</th>
                                        <th>성별</th>
                                        <th>병원이름</th>
                                        <th>병원 전화번호</th>
                                        <th>병원 이메일</th>
                                    </tr>    
                                </thead>
                                <tbody>
                                	<c:forEach items="${ptDoctorList}" var="ptDoctorList">
                                		<tr>
	                                        <td>
	                                            <div class="name-box">
	                                                <figure class="image">
	                                                	<img src="${pageContext.request.contextPath}/resources/assets/images/resource/patient-1.png">
	                                                </figure>
	                                                <h5>${ptDoctorList.name}</h5>
	                                                <span class="ptno"># ${ptDoctorList.memberNo}</span>
	                                            </div>
	                                        </td>
	                                        <td>
	                                            <p>${ptDoctorList.gender}</p>
	                                        </td>
	                                        <td>
	                                            <p>${ptDoctorList.clinicInfo}</p>
	                                        </td>
	                                        <td>
	                                            <p>${ptDoctorList.clinicPhone}</p>
	                                        </td>
	                                        <td>
	                                            <p>${ptDoctorList.clinicEmail}</p>
	                                        </td>
                                    	</tr>
                                	</c:forEach>
                                </tbody>    
                            </table>
                        </div>
                    </div>
                </div>
			</div>
			
			<!-- pagination  -->
			<div class="pagination-wrapper">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li class="paginate_button previous"><a href="${pageContext.request.contextPath}/doctor/patientList?pageNum=${pageMaker.startPage-1}&keyword=${cri.keyword}">이전</a></li>
					</c:if>
						
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
						<li class="paginate_button"><a href="${pageContext.request.contextPath}/doctor/patientList?pageNum=${num}&keyword=${cri.keyword}">${num}</a></li>
					</c:forEach>
						
					<c:if test="${pageMaker.next}">
						<li class="paginate_button next"><a href="${pageContext.request.contextPath}/doctor/patientList?pageNum=${pageMaker.endPage+1}&keyword=${cri.keyword}">다음</a></li>
					</c:if>
				</ul>
			</div>
			<!-- pagination end -->
			
		</div>
	</div>
</section>
<!-- doctors-dashboard -->

<!--Scroll to top-->
<button class="scroll-top scroll-to-target" data-target="html">
	<span class="fa fa-arrow-up"></span>
</button>

<!-- End of .page_wrapper -->

<script>
$(document).ready(function() {
	 var actionForm = $('#actionForm');

		$('#nameSearch');

		/* $(enter(event){
			if(event.keyCode == 13){
				
			}
		}); */
		
	});
</script>
