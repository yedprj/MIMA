<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
	th, td {
			text-align: center;
			span: center;
			}
</style>

<!-- page wrapper -->

    <div class="boxed_wrapper">

        <!-- preloader -->
        <div class="preloader"></div>
        <!-- preloader -->


        <!--page-title-two-->
        <section class="page-title-two">
            <div class="title-box centred bg-color-2">
                <div class="pattern-layer">
                    <div class="pattern-1" style="background-image: url(assets/images/shape/shape-70.png);"></div>
                    <div class="pattern-2" style="background-image: url(assets/images/shape/shape-71.png);"></div>
                </div>
                <div class="auto-container">
                    <div class="title">
                        <h1>예약관리</h1>
                    </div>
                </div>
            </div>
            <div class="lower-content">
                <ul class="bread-crumb clearfix">
                    <li><a href="index.html">홈</a></li>
                    <li>예약관리</li>
                </ul>
            </div>
        </section>
        <!--page-title-two end-->

        <!-- doctors-dashboard -->
        <section class="doctors-dashboard bg-color-3">
            <div class="left-panel">
                <div class="profile-box">
                    <div class="upper-box">
                        <figure class="profile-image"><img src="assets/images/resource/profile-2.png" alt=""></figure>
                        <div class="title-box centred">
                            <div class="inner">
                                <h3>Dr. Rex Allen</h3>
                                <p>MDS - Periodontology</p>
                            </div>
                        </div>
                    </div>
                    <div class="profile-info">
                        <ul class="list clearfix">
                            <li><a href="docMain"><i class="fas fa-columns"></i>대쉬보드</a></li>
                            <li><a href="apptManage" class="current"><i class="fas fa-clock"></i>예약관리</a></li>
                            <li><a href="apptHistory"><i class="fas fa-calendar-alt"></i>진료내역</a></li>
                            <li><a href="patientList"><i class="fas fa-wheelchair"></i>나의 환자들</a></li>
                            <li><a href="docReview"><i class="fas fa-star"></i>나의 후기</a></li>
                            <li><a href="docQna"><i class="fas fa-comments"></i>나의 문의</a></li>
                            <li><a href="my-profile.html"><i class="fas fa-user"></i>프로필 관리</a></li>
                            <li><a href="change-password.html"><i class="fas fa-unlock-alt"></i>비밀번호 변경</a></li>
                            <li><a href="login.html"><i class="fas fa-sign-out-alt"></i>로그아웃</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            
	            <div class="right-panel">
	                <div class="content-container">
	                    <div class="outer-container">
	                        <div class="appointment-list">
	                            <div class="upper-box clearfix">
	                                <div class="text pull-left">
	                                    <h3>예약관리</h3>
	                                    <span>예정 혹은 취소된 접수들을 확인하고 관리할 수 있습니다.</span>
	                                </div>
	                                
	                                <div class="select-box pull-right">
	                                    <select class="wide">
	                                       <option data-display="모두보기">모두보기</option>
	                                       <option value="1">예약된 접수</option>
	                                       <option value="2">취소된 접수</option>
	                                    </select>
	                                </div>
	                                
		                                
	                                
	                            </div>
	                            
		                        <div class="doctors-appointment">
		                            <div class="doctors-list">
		                                <div class="table-outer">
		                                    <table class="doctors-table">
		                                        <thead class="table-header">
		                                            <tr>
		                                                <th>환자명</th>
		                                                <th>예약번호</th>
		                                                <th>진료일</th>
		                                                <th>예약일</th>
		                                                <th>결제금액</th>
		                                                <th>결제여부</th>
		                                                <th>예약상태</th>
		                                            </tr>    
		                                        </thead>
		                                        <tbody id="contentAll">
		                                        	<c:forEach items="${apptList}" var="apptList">
														<tr>
															<td>
																<div class="name-box">
			                                                        <h5>${apptList.name}</h5>
			                                                        <span class="ptno">#${apptList.ptNo}</span>
			                                                    </div>
			                                                </td>
															<td>${apptList.bookingNo}</td>
															<td>
																<fmt:formatDate value="${apptList.consultDate}" pattern="yy-MM-dd"/>
																<span class="time">${apptList.consultTime}</span>
															</td>
															<td><fmt:formatDate value="${apptList.bookingDate}" pattern="yy-MM-dd"/></td>
															<td><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${apptList.price}" /></td>
															<td>${apptList.payStatus}</td>
															<td>
																<c:if test="${apptList.bookingStatus eq 'y'}">
				                                                    <span class="status">접수완료</span>
																</c:if>
																<c:if test="${apptList.bookingStatus eq 'c'}">
				                                                    <span class="status pending">취소완료</span>
																</c:if>
			                                                </td>
			                                                <td>
			                                                	<c:if test="${apptList.bookingStatus eq 'y'}">
				                                                	<button class="status cancel"><i class="fas fa-times"></i>취소하기</button>
			                                                	</c:if>
			                                                </td>
														</tr>
													</c:forEach>
		                                        </tbody>    
		                                    </table>
		                                </div>
		                            </div>
		                        </div>
		                        
	                        </div>
	                    </div>
	                    
	                    <div class="right-column pull-right">
                            <form name="search-form" action="schedule-timing.html" method="post" class="search-form">
                                <div class="form-group">
                                    <input type="search" name="search-field" placeholder="환자명을 입력하세요." required="">
                                    <button type="submit" onclick="getSearchList()"><i class="far fa-search"></i></button>
                                </div>
                            </form>
                        </div>
	                    
                        <div class="pagination-wrapper">
                            <ul class="pagination">
                                <li><a href="clinic-1.html" class="current">1</a></li>
                                <li><a href="clinic-1.html">2</a></li>
                                <li><a href="clinic-1.html">3</a></li>
                                <li><a href="clinic-1.html"><i class="icon-Arrow-Right"></i></a></li>
                            </ul>
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
	function getSearchList() {
		$.ajax({
				type: 'GET',
				url: "/getSearchList",
				data: $("form[name=search-form]").serialize(),
				success: function(result) {
						 // 테이블 초기화
						 $('#')
				}
		})
	}
</script>

<!-- End of .page_wrapper -->
    