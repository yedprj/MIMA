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
#checkIcon {
	color : #39cabb;
}
#prescription {
	cursor: pointer;
}
.doctors-appointment .doctors-table tr td .print i {
	cursor: pointer;
    margin-right: 5px;
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
				<h1>????????? ??????/??????</h1>
			</div>
		</div>
	</div>
	<div class="lower-content">
		<ul class="bread-crumb clearfix">
			<li><a href="${pageContext.request.contextPath}">Home</a></li>
			<li>????????? ??????/??????</li>
		</ul>
	</div>
</section>
<!--page-title-two end-->
    
<section class="doctors-dashboard bg-color-3">
	<!-- ??????????????? ????????? ?????? -->
	<div class="left-panel">
		<div class="profile-box">
			<div class="upper-box">
				<figure class="profile-image">
					<c:choose>
						<c:when test="${not empty session.ptProfilePhoto }">
							<img src="FileDown.do?fname=${session.ptProfilePhoto}">
						</c:when>
						<c:otherwise>
							<img src="${pageContext.request.contextPath}/resources/assets/images/icons/user.png" alt="">
						</c:otherwise>
					</c:choose>
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
							class="fas fa-columns"></i>????????????</a></li>
					<li><a id="delivery" href="${pageContext.request.contextPath}/pharmacy/mediDelivery"><i class="fas fa-ambulance"></i>???????????????</a></li>
					<li><a href="${pageContext.request.contextPath}/pharmacy/deliveryRegCancel" class="current"><i class="fas fa-laptop-medical"></i>????????? ??????/??????</a></li>
					<li><a id="guid" href="${pageContext.request.contextPath}/pharmacy/medGuid" ><i class="fas fa-comment-medical"></i>??????????????????</a></li>
					<li><a id="revicw" href="${pageContext.request.contextPath}/pharmacy/review"><i class="fas fa-star"></i>?????? ??????</a></li>
					<li><a id="profile" href="${pageContext.request.contextPath}/pharmacy/myProfile"><i class="fas fa-user"></i>?????? ?????????</a></li>
					<li><a id="pwUpdate" href="${pageContext.request.contextPath}/pharmacy/pwUpdate"><i
							class="fas fa-unlock-alt"></i>???????????? ??????</a></li>
					<li><a id="logout" href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt"></i>????????????</a></li>
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
                                    <h3>????????? ??????/??????</h3>
                                </div>
                                <div class="btn-box pull-right">
                                    <form id="delRegCancel"  action="deliveryRegCancel" method="get" class="search-form">
                                        <div class="form-group">
                                            <input type="search" name="keyword" value="" placeholder="Search" >
                                            <button type="submit"><i class="far fa-search"></i></button>
                                            <input type="hidden" name="type" value="N">
	                                        <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
											<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="doctors-list">
                                <div class="table-outer">
                                    <table class="doctors-table">
                                        <thead class="table-header">
                                            <tr>
                                                <th>????????? ??????</th>
                                                <th>????????????</th>
                                                <th>??????</th>
                                                <th>????????????</th>
                                                <th class="text-center">?????????</th>
                                                <th>????????????</th>
                                                <th>&nbsp;</th>
                                                <th>&nbsp;</th>
                                            </tr>    
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="del" items="${delivery}">
                                          <tr id="trList">
                                              <td>
                                                  <div class="name-box">
                                                      <figure class="image" style="overflow:hidden;">
                                                      	<c:choose>
															<c:when test="${not empty del.ptProfilePhoto }">
																<img src="FileDown.do?fname=${del.ptProfilePhoto}">
															</c:when>
															<c:otherwise>
																<img src="${pageContext.request.contextPath}/resources/assets/images/icons/user.png" alt="">
															</c:otherwise>
														</c:choose>
                                                      </figure>
                                                      <h5>${del.name}</h5>
                                                  </div>
                                              </td>
                                              <td class="text-center"><p><fmt:formatDate value="${del.consultDate}" type="both" pattern="YY-MM-dd" /></p></td>
                                              <td><p>${del.delAddr},</p><p>${del.delAddr2}  ${del.delAddr3 }</p></td>
                                              <td class="text-center"><p>${del.delPostCode }</p></td>
                                              <td class="text-center"><a class="view" id="prescription" onclick="prescriptionPdf(${del.bookingNo})" ><i class="fas fa-eye"></i> ?????????</a>&nbsp;&nbsp;
                                              							<span style="padding:9px 9px;" class="print" data-no="${del.bookingNo}" id="pdfDown" ><i class="fas fa-print"></i></span></td>
                                              <td><p id="delMemo"><c:if test="${not empty del.delNote}">?????? O</c:if></p>
                                              	<c:if test="${not empty del.delNote}"><div id="delMemoHidden">${del.delNote}</div></c:if>
                                              </td>
                                              <td>
                                                  <span class="accept" data-no="${del.bookingNo}" data-name="${del.name}"><i class="fas fa-pencil-alt"></i>????????????</span>
                                              </td>
                                              <td>
                                                  <span class="cancel" data-no="${del.bookingNo}" 
                                                  	data-phano="${del.pharmacyNo}"
                                                  data-name="${del.name}"><i class="fas fa-times"></i>??????</span>
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
									<li class="paginate_button previous"><a href="${pageMaker.startPage-1 }">??????</a></li>
								</c:if>
									
								<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
									<li class="paginate_button"><a href="${num}" >${num}</a></li>
								</c:forEach>
								<c:if test="${pageMaker.next }">
									<li class="paginate_button next"><a href="${pageMaker.endPage+1 }">??????</a></li>
								</c:if>
							</ul>
						</div>
                    </div>
                </div>
            </div>
</section>
<!-- doctors-dashboard -->
<div class="modal">
        <section class="modal_content appointment-section bg-color-3">
            <div class="auto-container">
                <div class="row clearfix">
                    <div id="modalContentCss" class="col-lg-12 col-md-12 col-sm-12 left-column">
                        <div class="appointment-information">
                            <div class="title-box">
                                <h3>????????? ?????????</h3>
                            </div>
                            <div class="inner-box">
                                <div class="information-form">
                                    <h3>????????? ????????? ????????? ???????????? ???????????? ?????? ???????????????</h3>
                                    <form action="book-appointment.html" method="post">
                                        <div class="row clearfix">
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>?????? ?????? ??????</label>
                                                <input type="text" name="name" value="${profile.pharmacyInfo}">
                                                <input id="returnPhaNo" type="hidden" name="pharmacyNo"  >
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>?????? ??????</label>
                                                <input type="text" name="customerName" >
                                                <input id="returnBookingNo" type="hidden" name="bookingNo" >
                                            </div>
                                            <div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                                <label>(????????????)</label>
                                                <textarea id="message" name="message" placeholder="???????????? ???????????? ????????? ???????????? ???????????????..."></textarea>
                                            </div>
                                        </div>
                                    </form>
                                </div>
		                        <div class="btn-box">
		                            <a id="delReturnBtn" class="theme-btn-one">????????? ?????? ??? ??????<i class="icon-Arrow-Right"></i></a>
		                            <button id="cancelBtn" class="cancel cancel-btn">??????</button>
		                        </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- appointment-section end -->
        </div>
        
<!--Scroll to top-->
<button class="scroll-top scroll-to-target" data-target="html">
	<span class="fa fa-arrow-up"></span>
</button>


<script>

function prescriptionPdf(no){
	window.open('${pageContext.request.contextPath}/prePdf2?bookingNo='+ no, '?????????', 'width=1000px, height=1600px , scrollbars=yes');
}

$(".pagination a").on("click", function(e) {
	e.preventDefault(); // a, submit ????????? ??????
	var p = $(this).attr("href")
	$("[name='pageNum']").val(p)
	$("#delRegCancel").submit();
});


$(function(){
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	$("#logoutBtn1").on("click", function(){
		$('#logOutfrm1').submit();
	});
	
	// ?????? ?????? btn
	$("#trList > td").on("click",".accept",function(){
		var bookingNo = $(this).data("no");
		var name = $(this).data("name");
		var thisTr = $(this).parent().parent();
		console.log(thisTr);
		var result = confirm("["+name +"???] ???????????? ?????? ???????????????????");
		if(result){
			$.ajax({
				url : 'deliveryStatusUpdate',
				type : 'post',
				data : { 
					bookingNo : bookingNo,
					deliveryStatus : "y"
				},
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},		 
				success : function(data) {
					if(data > 0 ){ thisTr.remove(); }
					else { alert("??????????????? ??????????????????!") }
				}
			});// ajax end
		} else { return; } 
	}); // ?????? ?????? btn end
	
	
	// ?????? btn
	$("#trList > td").on("click",".cancel",function(){
		$("#message").val("");
		var bookingNo = $(this).data("no");
		var name = $(this).data("name");
		var pharmacyNo = $(this).data("phano");
		var thisTr = $(this).parent().parent();
		
		
		$("input[name='customerName']").val(name);
		$("#returnPhaNo").val(pharmacyNo);
		$("#returnBookingNo").val(bookingNo);
		
		$(".modal").fadeIn();			
		  
		$("#cancelBtn").click(function(){
		    $(".modal").fadeOut();
		});
		
		$("#delReturnBtn").click(function(){
			var message = $("#message").val();
			if (message == ''){
				alert("???????????? ????????? ???????????? ???????????????!");
				return;
			}else {
				$.ajax({
					url : 'delCancel',
					type : 'post',
					data : { 
						bookingNo : bookingNo,
						deliveryStatus : "c",
						deliveryDecline : message
					},
					beforeSend : function(xhr) {
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},		 
					success : function(data) {
						if(data > 0 ){
							console.log(data);
							alert("????????? ????????? ?????????????????????.")
							// socket ????????? (????????? ??????, ???????????? ??????, ???????????? ???????????????)
							socket.send("med="+bookingNo+"="+message+"="+pharmacyNo+"");
							$(".modal").fadeOut();
							thisTr.remove();
						}else { alert("??????????????? ??????????????????!") }
					}
				});// ajax end
			}
		}); // cancelBtn end
	}); // ?????? btn end
	
	
	
	
	// PDF ??????
	$("#trList > td").on("click","#pdfDown",function(){
		var bookingNo = $(this).data("no");
		location.href= "${pageContext.request.contextPath}/prePdf3?bookingNo="+ bookingNo;
	});

}); // function end
</script>
