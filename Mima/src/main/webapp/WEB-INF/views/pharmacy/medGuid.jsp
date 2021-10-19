<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
#delMemo {
	position: relative; 
	top: 0px; 
	transition: top 0.1s;
	cursor : pointer;
}
#delMemo:hover {
	color : #39cabb;
	cursor : pointer;
}
#trList td {
    position: relative;
}
#delMemoHidden {
	display: none;
  	position: absolute;
  	width: 150px;
  	padding: 8px;
  	left: 0;
  	-webkit-border-radius: 8px;
  	-moz-border-radius: 8px;  
  	border-radius: 8px;
  	background: #ebfaf8;;
  	color: #39cabb;
  	z-index : 100;
	}
#delMemo:hover + #delMemoHidden {
  display: block;
}
.my-patients .title-box .search-form input[type='search']{
	margin-left : 20px;
}
.doctors-appointment .doctors-table tr td p {
    font-size: 16px;
    line-height: 18px;
    color: #061a3a;
    padding: 5px 30px
 }
 .accept, .cancel{
 	cursor : pointer;
 }
 
.modal{ 
  position:absolute; 
  width:100%; 
  height:100%; 
  background: rgba(0,0,0,0.8); 
  top:0; 
  left:0; 
  display:none;
}

.modal_content{
  width:500px;
  background:#fff; border-radius:10px;
  position:relative; top:35%; left:50%;
  margin-top:-300px; 
  margin-left:-200px;
  text-align:center;
  box-sizing:border-box; padding:74px 0;
  line-height:23px; cursor:pointer;
}
.appointment-section, .registration-section {
    padding: 0px;
}
#modalContentCss {
	padding-right: 0px;
    padding-left: 0px;
}
.doctors-appointment .doctors-table tr td .status.pending {
    margin-right: 30px;
}
.doctors-appointment .doctors-table tr td .status {
	margin-right: 30px;
}

.doctors-appointment .doctors-table tr td .accept {
	margin-right: 80px;
}
</style>

<!--page-title-two-->
<section class="page-title-two">
	<div class="title-box centred bg-color-2">
		<div class="pattern-layer">
			<div class="pattern-1"
				style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-70.png);"></div>
			<div class="pattern-2"
				style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-71.png);"></div>
		</div>
		<div class="auto-container">
			<div class="title">
				<h1>복약지도</h1>
			</div>
		</div>
	</div>
	<div class="lower-content">
		<ul class="bread-crumb clearfix">
			<li><a href="${pageContext.request.contextPath}">Home</a></li>
			<li>복약지도관리</li>
		</ul>
	</div>
</section>
<!--page-title-two end-->
    
<section class="doctors-dashboard bg-color-3">
	<!-- 왼쪽사이드 메뉴바 연결 -->
	<div class="left-panel">
		<div class="profile-box">
			<div class="upper-box">
				<figure class="profile-image">
					<img src="${pageContext.request.contextPath}/resources/assets/images/resource/profile-2.png" alt="">
				</figure>
				<div class="title-box centred">
					<div class="inner">
						<h3>${profile.pharmacyInfo}</h3>
						<p>${profile.profileContents}</p>
					</div>
				</div>
			</div>
			<div class="profile-info">
				<ul class="list clearfix">
					<li><a id="dash" href="${pageContext.request.contextPath}/pharmacy/pharmacyDash" ><i
							class="fas fa-columns"></i>대쉬보드</a></li>
					<li><a id="delivery" href="${pageContext.request.contextPath}/pharmacy/mediDelivery"><i class="fas fa-ambulance"></i>약배달관리</a></li>
					<li><a href="${pageContext.request.contextPath}/pharmacy/deliveryRegCancel"><i class="fas fa-laptop-medical"></i>약배달 등록/취소</a></li>
					<li><a id="guid" href="${pageContext.request.contextPath}/pharmacy/medGuid" class="current"><i class="fas fa-comment-medical"></i>복약지도관리</a></li>
					<li><a id="revicw" href="${pageContext.request.contextPath}/pharmacy/review"><i class="fas fa-star"></i>약국 후기</a></li>
					<li><a id="profile" href="${pageContext.request.contextPath}/pharmacy/myProfile"><i class="fas fa-user"></i>약국 프로필</a></li>
					<li><a id="pwUpdate" href="${pageContext.request.contextPath}/pharmacy/pwUpdate"><i
							class="fas fa-unlock-alt"></i>비밀번호 변경</a></li>
					<li><a id="logout" href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt"></i>로그아웃</a></li>
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
                                    <h3>복약지도</h3>
                                </div>
                                <div class="btn-box pull-right">
                                    <form id="medGuid"  action="medGuid" method="get" class="search-form">
                                        <div class="form-group">
                                            <input type="search" name="keyword" value="" placeholder="환자이름으로 검색" >
                                            <button type="submit"><i class="far fa-search"></i></button>
                                        </div>
                                        <input type="hidden" name="type" value="N">
                                        <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
										<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                    </form>
		
                                </div>
                            </div>
                            <div class="doctors-list">
                              <div class="table-outer">
                                  <table class="doctors-table">
                                      <thead class="table-header">
                                          <tr class="text-center">
                                              <th>신청인</th>
                                              <th>신청일자</th>
                                              <th>연락처</th>
                                              <th>주소</th>
                                              <th>배달상태</th>
                                              <th>복약지도상태</th>
                                          </tr>    
                                      </thead>
                                      <tbody>
                                      	<c:forEach var="ptEdu" items="${ptEducation}">
                                          <tr id="trList">
                                              <td>
                                                  <div class="name-box">
                                                      <figure class="image"><img src="${pageContext.request.contextPath}/resources/assets/images/resource/patient-1.png" alt=""></figure>
                                                      <h5>${ptEdu.name}</h5>
                                                  </div>
                                              </td>
                                              <td class="text-center"><p><fmt:formatDate value="${ptEdu.consultDate}" type="both" pattern="YY-MM-dd" /></p></td>
                                              <td class="text-center"><p>${ptEdu.phone }</p></td>
                                              <td class="text-center"><p>${ptEdu.delAddr},</p><p>${ptEdu.delAddr2}  ${ptEdu.delAddr3 }</p></td>
                                              <td class="text-center">
                                              		<c:if test="${ptEdu.deliveryStatus eq 'p'}">
														<span class="status">배달완료</span>
													</c:if>
													<c:if test="${ptEdu.deliveryStatus eq 'n'}">
														<span class="status pending">미배달</span>
													</c:if>
                                              </td>
                                              <td class="text-center">
                                                  <span class="cancel" data-no="${ptEdu.bookingNo}" data-name="${del.name}"><i class="fas fa-pencil-alt"></i>복약지도완료</span>
                                              </td>
                                          </tr>
                                          </c:forEach>
                                      </tbody>
                                  </table>
                              </div>
                          </div>
                        </div>
                        <!-- pagination  -->
						<div class="pagination-wrapper" >
							<ul class="pagination">
								<c:if test="${pageMaker.prev }">
									<li class="paginate_button previous"><a href="${pageMaker.startPage-1 }">이전</a></li>
								</c:if>
									
								<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
									<li class="paginate_button"><a href="${num}" >${num}</a></li>
								</c:forEach>
								<c:if test="${pageMaker.next }">
									<li class="paginate_button next"><a href="${pageMaker.endPage+1 }">다음</a></li>
								</c:if>
							</ul>
						</div>
                    </div>
                </div>
            </div>
</section>
<!-- doctors-dashboard -->
<script>
	$(".pagination a").on("click", function(e) {
		e.preventDefault(); // a, submit 기능을 막음
		var p = $(this).attr("href")
		$("[name='pageNum']").val(p)
		$("#medGuid").submit();
	});
	
	$(function(){
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		
		$("#logoutBtn1").on("click", function(){
			$('#logOutfrm1').submit();
		});
		
		// "cancel" btn - 복약지도 완료
		$("#trList > td").on("click",".cancel",function(){
			$("#message").val("");
			var bookingNo = $(this).data("no");
			var name = $(this).data("name");
			var thisTr = $(this).parent().parent();
			
			var result = confirm("복약지도가 완료되었습니까?");
			
			if(result){
				$.ajax({
					url : 'ptEduStatusUpdate',
					type : 'post',
					data : { 
						bookingNo : bookingNo
					},
					beforeSend : function(xhr) {
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},		 
					success : function(data) {
						if(data > 0 ){
							console.log(data);
							thisTr.remove();
						}else {
							alert("성공적으로 처리되지 못했습니다.")
						}
					}
				});// ajax end
			} else { return; } 
			
			
		}); // 반환 btn end
	
	}); // function end
</script>