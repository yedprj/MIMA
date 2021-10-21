<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
th, td {
		text-align: center;
		}
.doctors-appointment .doctors-table tr td .status.pending {
    margin-right: 30px;
}
.doctors-appointment .doctors-table tr td .status {
	margin-right: 30px;
}

.doctors-appointment .doctors-table tr td .print {
	margin-right: 70px;
}
</style>

<!-- doctors-dashboard -->
<!--page-title-two-->
<section class="page-title-two">
    <div class="title-box centred bg-color-2">
        <div class="pattern-layer">
            <div class="pattern-1" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-70.png);"></div>
			<div class="pattern-2" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-71.png);"></div>
    	</div>
	    <div class="auto-container">
	        <div class="title">
	            <h1>진료내역</h1>
	        </div>
	    </div>
	</div>
	<div class="lower-content">
	    <ul class="bread-crumb clearfix">
	        <li><a href="${pageContext.request.contextPath}">Home</a></li>
	            <li>진료내역</li>
	    </ul>
	</div>
</section>
<!--page-title-two end-->

<section class="doctors-dashboard bg-color-3">

<div class="left-panel">
	<div class="profile-box">
	    <div class="upper-box">
        	<figure class="profile-image"><img src="${pageContext.request.contextPath}/resources/assets/images/resource/profile-2.png" alt=""></figure>
	        <div class="title-box centred">
	        	<div class="inner">
		            <h3>${session.name}</h3>
		            <p>${clinicName}</p>
	            </div>
	        </div>
        </div>
        <div class="profile-info">
            <ul class="list clearfix">
                <li><a href="docMain"><i class="fas fa-columns"></i>대쉬보드</a></li>
                <li><a href="apptManage"><i class="fas fa-clock"></i>예약관리</a></li>
                <li><a href="apptHistory" class="current"><i class="fas fa-calendar-alt"></i>진료내역</a></li>
                <li><a href="patientList"><i class="fas fa-wheelchair"></i>나의 환자들</a></li>
                <li><a href="docReview"><i class="fas fa-star"></i>나의 후기</a></li>
                <li><a href="docProfileInsertForm"><i class="fas fa-user"></i>프로필 관리</a></li>
                <li><a href="docProfileForm"><i class="fas fa-stethoscope"></i>진료관리</a></li>
                <li><a href="docPwChangeForm"><i class="fas fa-unlock-alt"></i>비밀번호 변경</a></li>
                <li>
                	<form id="logOutfrm1" name="logOutfrm1" action="../logout" method="post">
						<a href="#" id="logoutBtn1"><i class="fas fa-sign-out-alt"></i>로그아웃</a>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					</form>
				</li>
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
                            <h3>진료내역</h3>
							<span>지난 진료내역을 조회합니다. 목록은 진료일순으로 보여집니다.</span>
                        </div>
                        
                        <div class="btn-box pull-right">
                             
                            <form action="apptHistory" method="get" class="search-form" id="actionForm">
                            	<div class="form-group">
			                    	<input type="hidden" id="pageNum" name="pageNum" value="${pageMaker.cri.pageNum}">
	              					<input type="hidden" id="amount" name="amount" value="${pageMaker.cri.amount}">
	              					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	              					
			                        <input type="search" id="keyword" name="keyword" onKeypress="enter();" placeholder="환자명을 입력하세요.">
			                        <button type="submit"><i class="fas fa-search"></i></button>
			                    </div>
                            </form>
                        </div>
                    </div>
                    <div class="doctors-list">
                        <div class="table-outer">
                            <table class="doctors-table table-hover">
                                <thead class="table-header">
				                   <tr>
				                       <th>환자명</th>
				                       <th>예약번호</th>
				                       <th>진료일</th>
				                       <th>예약일</th>
				                       <th>결제금액</th>
				                       <th></th>
				                   </tr>    
				               </thead>
				               <tbody>
				               	<c:forEach items="${apptHistoryPage}" var="apptHistoryPage">
									<tr>
										<td>
											<div class="name-box">
												<figure class="image">
														<img src="${pageContext.request.contextPath}/resources/assets/images/resource/dashboard-doc-1.png" alt="">
												</figure>
	                                             <h5>${apptHistoryPage.name}</h5>
	                                            <span class="ptno"># ${apptHistoryPage.ptNo}</span>
	                                        </div>
	                                    </td>
										<td>${apptHistoryPage.bookingNo}</td>
										<td>
											<fmt:formatDate value="${apptHistoryPage.consultDate}" pattern="yy-MM-dd"/>
											<span class="time">${apptHistoryPage.consultTime}</span>
										</td>
										<td><fmt:formatDate value="${apptHistoryPage.bookingDate}" pattern="yy-MM-dd"/></td>
										<td><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${apptHistoryPage.price}" /></td>
	                                    <td>
	                                        <button class="view" id="cnote" onclick="window.open('cnote?bookingNo=${apptHistoryPage.bookingNo}', '진료노트', 'width=1100, height=800, scrollbars=yes')">
	                                        	<i class="fas fa-eye"></i>진료노트
	                                        </button>
	                                      	<button class="print" id="prescription" onclick="prescriptionPdf(${apptHistoryPage.bookingNo})" >
	                                      		<i class="fas fa-print"></i>처방전
	                                      	</button>
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
							<li class="paginate_button previous"><a href="${pageMaker.startPage-1}">이전</a></li>
						</c:if>
							
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
							<li class="paginate_button"><a href="${num}">${num}</a></li>
						</c:forEach>
							
						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a href="${pageMaker.endPage+1}">다음</a></li>
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

<script>

function prescriptionPdf(no){
	window.open('${pageContext.request.contextPath}/prePdf2?bookingNo='+ no, '처방전', 'width=1000px, height=1600px , scrollbars=yes');
}


$(document).ready(function() {
	 var actionForm = $('#actionForm');

		$('#nameSearch');
		
		$(".pagination a").on("click", function(e) {
	         e.preventDefault();
	         var p = $(this).attr("href")
	         $("[name='pageNum']").val(p)
	         actionForm.submit();
	      });

		/* $(enter(event){
			if(event.keyCode == 13){
				
			}
		}); */
		
		$("#logoutBtn1").on("click", function(){
			$('#logOutfrm1').submit();
		});
		
	});
</script>