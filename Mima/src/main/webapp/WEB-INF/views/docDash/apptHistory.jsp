<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
	th, td {
			text-align: center;
			}
</style>

    <div class="boxed_wrapper">

        <!--page-title-two-->
        <section class="page-title-two">
            <div class="title-box centred bg-color-2">
                <div class="pattern-layer">
                    <div class="pattern-1" style="background-image: url(assets/images/shape/shape-70.png);"></div>
                    <div class="pattern-2" style="background-image: url(assets/images/shape/shape-71.png);"></div>
                </div>
                <div class="auto-container">
                    <div class="title">
                        <h1>진료내역</h1>
                    </div>
                </div>
            </div>
            <div class="lower-content">
                <ul class="bread-crumb clearfix">
                    <li><a href="index.html">홈</a></li>
                    <li>진료내역</li>
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
                            <li><a href="apptManage"><i class="fas fa-clock"></i>예약관리</a></li>
                            <li><a href="apptHistory" class="current"><i class="fas fa-calendar-alt"></i>진료내역</a></li>
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
                                    <h3>진료내역</h3>
                                    <span>지난 진료내역을 조회합니다. 목록은 최신순으로 보여집니다.</span>
                                </div>
                                
                                <div class="select-box pull-right">
			                      <form name="search-form" action="apptHistory" method="post" class="search-form">
			                          <div class="form-group">
			                              <input type="search" name="search-field" placeholder="환자명을 입력하세요." required="">
			                              <button type="submit" onclick="getSearchList()"><i class="far fa-search"></i></button>
			                          </div>
			                      </form>
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
                                                <th>결제상태</th>
                                            </tr>    
                                        </thead>
                                        <tbody>
                                        	<c:forEach items="${apptHistoryList}" var="apptHistoryList">
												<tr>
													<td>
														<div class="name-box">
	                                                        <h5>${apptHistoryList.name}</h5>
	                                                        <span class="ptno">#${apptHistoryList.ptNo}</span>
	                                                    </div>
	                                                </td>
													<td>${apptHistoryList.bookingNo}</td>
													<td>
														<fmt:formatDate value="${apptHistoryList.consultDate}" pattern="yy-MM-dd"/>
														<span class="time">${apptHistoryList.consultTime}</span>
													</td>
													<td><fmt:formatDate value="${apptHistoryList.bookingDate}" pattern="yy-MM-dd"/></td>
													<td><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${apptHistoryList.price}" /></td>
													<td>${apptHistoryList.payStatus}</td>
	                                                <td>
	                                                    <button class="view"><i class="fas fa-eye"></i>진료노트</button>
	                                                </td>
													<td>
                                                    	<button class="print"><i class="fas fa-print"></i>처방전</button>
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
