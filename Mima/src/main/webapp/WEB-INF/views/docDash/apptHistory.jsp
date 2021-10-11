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
		            <p>MDS - Periodontology</p>
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
                <li><a href="docQna"><i class="fas fa-comments"></i>나의 문의</a></li>
                <li><a href="docProfileInsertForm"><i class="fas fa-user"></i>프로필 관리</a></li>
                <li><a href="docProfileForm"><i class="fas fa-user"></i>진료 관리</a></li>
                <li><a href="docPwChangeForm"><i class="fas fa-unlock-alt"></i>비밀번호 변경</a></li>
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
                            <h3>진료내역</h3>
							<span>지난 진료내역을 조회합니다. 목록은 최신순으로 보여집니다.</span>
                        </div>
                        <div class="btn-box pull-right">
                            <form action="my-patients.html" method="post" class="search-form">
                            	<div class="form-group">
			                    	<input type="hidden" id="pageNum" name="pageNum" value="1">
	              					<input type="hidden" id="amount" name="amount" value="${pageMaker.cri.amount}">
	              					
			                        <input type="search" id="nameSearch" name="nameSearch" onKeypress="enter();" placeholder="환자명을 입력하세요.">
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
				                       <th>결제상태</th>
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
											<c:if test="${apptHistoryPage.bookingStatus eq 'p'}">
												<span class="status">결제완료</span>
											</c:if>
											<c:if test="${apptHistoryPage.bookingStatus eq 'y'}">
												<span class="status pending">결제예정</span>
											</c:if>
											<c:if test="${apptHistoryPage.bookingStatus eq 'c'}">
												<span class="status cancel">취소완료</span>
											</c:if>
										</td>
	                                    <td>
	                                        <button class="view" id="cnote" onclick="window.open('cnote?bookingNo=${apptHistoryPage.bookingNo}', '진료노트', 'width=1100, height=800, scrollbars=yes')">
	                                        	<i class="fas fa-eye"></i>진료노트
	                                        </button>
	                                    </td>
										<td>
	                                      	<button class="print" id="prescription" onclick="window.open('prescription?bookingNo=${apptHistoryPage.bookingNo}', '처방전', 'width=1100, height=800, scrollbars=yes')">
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
							<li class="paginate_button previous"><a href="${pageContext.request.contextPath}/apptHistory?pageNum=${pageMaker.startPage-1}">이전</a></li>
						</c:if>
							
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
							<li class="paginate_button"><a href="${pageContext.request.contextPath}/apptHistory?pageNum=${num}">${num}</a></li>
						</c:forEach>
							
						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a href="${pageContext.request.contextPath}/apptHistory?pageNum=${pageMaker.endPage+1}">다음</a></li>
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
	$(function(){
		/* $('#cnote').on('click', function(){
			//window.open('${pageContext.request.contextPath}/docDash/cnote', '진료노트', 'width=1200, height=900, scrollbars=yes');
		}); */
		/* $('prescription').on('click', function(){
			window.open('http://localhost:3000/?bookingNo=', '처방전', 'width=1200, height=900, scrollbars=yes');
		}); */
		
		$('#nameSearch');
		
		$(enter(event){
			if(event.keyCode == 13){
				
			}
		})
		
	});
</script>