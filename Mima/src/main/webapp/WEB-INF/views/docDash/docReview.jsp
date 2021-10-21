<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
th, td {
		text-align: center;
		span: center;
		}

.doctors-dashboard .review-list .comment-inner .single-comment-box .comment.replay-comment {
	margin-left: 0px;
}

.theme-btn-one {
	padding: 5px 25px;
}

.theme-btn-two {
	padding: 4px 25px;
	border: 1px solid #ebeef1;
}

.add-listing .single-box {
	margin-bottom: 10px;
}

textarea {
	width: 100%;
	margin-top: 10px;
}

2px solid #ebeef1
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
            <h1>나의 후기</h1>
        </div>
    </div>
</div>
<div class="lower-content">
    <ul class="bread-crumb clearfix">
        <li><a href="${pageContext.request.contextPath}">Home</a></li>
            <li>나의 후기</li>
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
                <li><a href="apptHistory"><i class="fas fa-calendar-alt"></i>진료내역</a></li>
                <li><a href="patientList"><i class="fas fa-wheelchair"></i>나의 환자들</a></li>
                <li><a href="docReview" class="current"><i class="fas fa-star"></i>나의 후기</a></li>
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
            <div class="review-list">
                <div class="title-box clearfix">
                    <div class="text pull-left">
                    	<h3>나의 후기</h3>
                    	<span>환자가 등록한 후기를 조회할 수 있습니다.</span>
                    </div>
                    
                    <div class="select-box pull-right">
                        <select class="wide" id="selectBox" name="selectBox" onchange="searchCheck()">
                           <option value="latest">최신순</option>
                           <option value="oldest">오래된순</option>
                        </select>
                        <script type="text/javascript">
                        	$("#selectBox").val("${cri.keyword}"== ""?"latest" : "${cri.keyword}")
                        </script>
                    </div>
                   
                    
                </div>
               
               <div class="comment-inner" id="latest" style="display:block;">
		       		<c:forEach items="${docReviewPage}" var="docReviewPage">
     					<div class="single-comment-box">
         					<div id="comment" class="comment">
         						<figure class="comment-thumb"><img src="${pageContext.request.contextPath}/resources/assets/images/resource/comment-1.png"></figure>
             					<h4>${docReviewPage.name}</h4>
             					<span class="comment-time"><i class="fas fa-calendar-alt"></i><fmt:formatDate value="${docReviewPage.regDate}" pattern="yy-MM-dd"/></span>
				             	<ul class="rating clearfix">
					            	<c:forEach var="i" begin="1" end="${docReviewPage.reviewPoint}">
					             		<span style="color:#ffab01;"><i class="icon-Star"></i></span>
					             	</c:forEach>
					             	<c:forEach var="i" begin="1" end="${5-docReviewPage.reviewPoint}">
					             		<i class="icon-Star"></i>
					             	</c:forEach>
				                </ul>
            						<p>${docReviewPage.contents}</p>
            						<c:if test="${null eq docReviewPage.rcontents}">
	            						<button class="replay-btn" data-cno="${docReviewPage.cno}" data-no="${docReviewPage.commentWriterNo}"><i class="fas fa-share"></i>Reply Now</button>
	            						<div id="reply">
	            						</div>
            						</c:if>
            						<c:if test="${null ne docReviewPage.rcontents}">
			      						<div class="comment replay-comment">
			                                 <figure class="comment-thumb"><img src="${pageContext.request.contextPath}/resources/assets/images/resource/comment-2.png"></figure>
			                                 <h4><i class="fas fa-comments"></i>&nbsp;${session.name} 의사</h4>
			                                 <span class="comment-time"><i class="fas fa-calendar-alt"></i><fmt:formatDate value="${docReviewPage.rregDate}" pattern="yy-MM-dd"/></span>
			                                 <span class="rating clearfix">
			                                 	<a type="button" id="updateBtn" class="theme-btn-one" data-cno="${docReviewPage.cno}" data-no="${docReviewPage.rno}"><i class="fas fa-pencil-alt" style="margin-left: 0px;"></i></a>
                                                    <input type="hidden" id="rregDate" name="rregDate" value="${docReviewPage.rregDate}"/>
                                                    <input type="hidden" id="rcontents" name="rcontents" value="${docReviewPage.rcontents}"/>
			                                 	<a type="button" id="deleteBtn" class="theme-btn-two" data-no="${docReviewPage.rno}"><i class="fas fa-times"></i></a>
                                                    <input type="hidden" id="rno" name="rno" value="${docReviewPage.rno}"/>
			                                 </span>
			                                 <p id="rcontents">${docReviewPage.rcontents}</p>
			                            </div>
                            		</c:if>
             				</div>
             				
                            
				    	</div>
					</c:forEach>
               </div>
               
               <%-- <div class="comment-inner" id="oldest" style="display:none;">
                   	<c:forEach items="${docReviewPageOldest}" var="docReviewPageOldest">
     					<div class="single-comment-box">
         					<div class="comment">
         						<figure class="comment-thumb"><img src="${pageContext.request.contextPath}/resources/assets/images/resource/comment-1.png"></figure>
	             					<h4>${docReviewPageOldest.nickname}</h4>
             					<span class="comment-time"><i class="fas fa-calendar-alt"></i><fmt:formatDate value="${docReviewPageOldest.regDate}" pattern="yy-MM-dd"/></span>
					             <ul class="rating clearfix">
					              <c:forEach var="i" begin="1" end="${docReviewPageOldest.reviewPoint}">
					             		<span style="color:#ffab01;"><i class="icon-Star"></i></span>
					             	</c:forEach>
					             	<c:forEach var="i" begin="1" end="${5-docReviewPageOldest.reviewPoint}">
					             		<i class="icon-Star"></i>
					             	</c:forEach>
					             </ul>
             					<p>${docReviewPageOldest.contents}</p>
				         </div>
				     </div>
				    </c:forEach>
               </div> --%>
               
            </div>
                <!-- pagination  -->
				<div class="pagination-wrapper">
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a href="docReview?pageNum=${pageMaker.startPage-1}&keyword=${cri.keyword}">이전</a></li>
						</c:if>
							
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
							<li class="paginate_button"><a href="docReview?pageNum=${num}&keyword=${cri.keyword}">${num}</a></li>
						</c:forEach>
							
						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a href="docReview?pageNum=${pageMaker.endPage+1}&keyword=${cri.keyword}">다음</a></li>
						</c:if>
					</ul>
				</div>
				<!-- pagination end -->
            </div>
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
	var replyBtnBackup;
		
	function searchCheck() {
		var choose = $("#selectBox option:selected").val();
		
	    /* if (choose == 'latest') {
			$("#latest").css('display', 'block');   
			$("#oldest").css('display', 'none');
		} else if (choose == 'oldest') {
			$("#latest").css('display', 'none');   
			$("#oldest").css('display', 'block');
		} */
		
		location.href="docReview?pageNum=1&keyword="+choose
	}
		
	// 댓글 등록 후 삭제
	$(document).on('click', '#replyDelete', function(){
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		
		var rno = $(this).data("no");
		var pa = $(this).closest(".comment");
		var replyDiv = pa.prev('#reply');
		var delReply = pa.find(".replay-comment");
		
		$.ajax({
			url : "replyDelete",
			method : "post",
			data : {
				rno : rno
			},
			beforeSend : function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success : function(datas) {
					if( datas > 0 ){
						alert("댓글이 삭제되었습니다.");
						pa.remove();
						replyDiv.before(replyBtnBackup);
					}
			} // success end
		}) //ajax end
	});
		
	// 기존 댓글 삭제_J21
	$(document).on('click', '#deleteBtn', function(){
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		
		var rno = $(this).data("no");
		var pa = $(this).closest(".comment");
		var replyDiv = pa.prev('#reply');
		var delReply = pa.find(".replay-comment");
		
		$.ajax({
			url : "replyDelete",
			method : "post",
			data : {
				rno : rno
			},
			beforeSend : function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success : function(datas) {
					if( datas > 0 ){
						alert("댓글이 삭제되었습니다.");
						pa.remove();
						replyDiv.before(replyBtnBackup);
						location.href="docReview";
					}
			} // success end
		}) //ajax end
	});
		
	// 기존 댓글 수정_J21
	/* $(document).on("click", '#updateBtn', function(){
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		
		var rno = $(this).data("no");
		var pa = $(this).closest(".comment");
		var rcontents = $("input[name='rcontents']").val();
		
		$.ajax({
			url : "docReplyUpdate",
			method : "post",
			data : {
				rno : rno,
				rcontents : rcontents
			},
			beforeSend : function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success : function(datas) {
					  if( datas > 0 ){
						  alert("댓글이 수정되었습니다.");
						  pa.remove();
						  pa.append('<div class="comment replay-comment">'
                               	    +'<figure class="comment-thumb"><img src="${pageContext.request.contextPath}/resources/assets/images/resource/comment-2.png"></figure>'
                                    +'<h4><i class="fas fa-comments"></i> ${session.name}의사</h4>'
                                    +'<span class="comment-time"><i class="fas fa-calendar-alt"></i>'+datas.reditDate+'</span>'
                                    +'<p id="rcontents">'+datas.rcontents+'</p>'
                                    +'<span class="rating clearfix">'
                                    +'<a type="button" id="updateBtn" class="theme-btn-one" data-no=""><i class="fas fa-pencil-alt" style="margin-left: 0px;"></i></a>'
                                    +'&nbsp;'
                                    +'<a id="replyDelete" type="button" class="theme-btn-two" data-no="'+datas.rno+'"><i class="fas fa-times"></i></a>'
                                    +'</span>'
                                    +'</div>');
					  } 
			} // success end
		}) //ajax end
	}); */
	
	// 댓글 등록 후 수정
	$(document).on('click', '#replyUpdate', function(){
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
	});
	
	// 등록폼 취소 버튼
	$(document).on('click', '#cancel', function(){
		$(".comment #reply").empty();
	});
	
	// 등록폼 등록 버튼
	$(document).on('click', '#insert', function(){
		
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		
		var pa = $(this).closest(".comment");
		
		$.ajax({
			url : "docReplyInsert",
			method : "post",
			data : $("#replyForm").serialize(),
			beforeSend : function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success : function(datas) {
					$(".add-listing").remove();
					pa.find(".replay-btn").remove();
					pa.append('<div class="comment replay-comment">'
                              	  +'<figure class="comment-thumb"><img src="${pageContext.request.contextPath}/resources/assets/images/resource/comment-2.png"></figure>'
                                 +'<h4><i class="fas fa-comments"></i> ${session.name}의사</h4>'
                                 +'<span class="comment-time"><i class="fas fa-calendar-alt"></i>'+datas.rregDate+'</span>'
                                 +'<p id="rcontents">'+datas.rcontents+'</p>'
                                 +'<span class="rating clearfix">'
                                 +'<a type="button" id="replyUpdate" class="theme-btn-one" data-no="'+datas.rno+'"><i class="fas fa-pencil-alt" style="margin-left: 0px;"></i></a>'
                                 +'&nbsp;'
                                 +'<a id="replyDelete" type="button" class="theme-btn-two" data-no="'+datas.rno+'"><i class="fas fa-times"></i></a>'
                                 +'</span>'
                                 +'</div>');
					alert("댓글이 등록되었습니다.");
			} // success end
		}) //ajax end
	}); // 등록 폼 버튼 end

	// 수정폼 등록 버튼
	$(document).on('click', '#update', function(){
		
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		
		var pdiv = $(this).closest(".add-listing");
		var num = pdiv.find("input[name='rmainNo']").val();
		var con = pdiv.find("#replyContents").val();
		console.log(rno);
		console.log(rcontents);
		
		var pa = $(this).closest(".comment");
		
		$.ajax({
			url : "docReplyUpdate",
			method : "post",
			data : {
				rno : num,
				rcontents : con
			},
			beforeSend : function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success : function(datas) {
					$(".add-listing").remove();
					pa.find(".replay-btn").remove();
					pa.append('<div class="comment replay-comment">'
                              	 +'<figure class="comment-thumb"><img src="${pageContext.request.contextPath}/resources/assets/images/resource/comment-2.png"></figure>'
                                 +'<h4><i class="fas fa-comments"></i> ${session.name}의사</h4>'
                                 +'<span class="comment-time"><i class="fas fa-calendar-alt"></i>'+datas.rregDate+'</span>'
                                 +'<p id="rcontents">'+datas.rcontents+'</p>'
                                 +'<span class="rating clearfix">'
                                 +'<a type="button" id="update" class="theme-btn-one" data-no="'+datas.rno+'"><i class="fas fa-pencil-alt" style="margin-left: 0px;"></i></a>'
                                 +'&nbsp;'
                                 +'<a id="replyDelete" type="button" class="theme-btn-two" data-no="'+datas.rno+'"><i class="fas fa-times"></i></a>'
                                 +'</span>'
                                 +'</div>');
					alert("댓글이 수정되었습니다.");
			} // success end
		}) //ajax end
	}); // 수정폼 버튼 end
		
		$(document).ready(function() {
			$('#selectBox').val('${cri.category}').prop("selected", true);

			$("#logoutBtn1").on("click", function(){
				$('#logOutfrm1').submit();
			});
			
			// 등록폼
			$(".comment").on("click",'.replay-btn', function(){
				var cno = $(this).data("cno")
				var no = $(this).data("no")
				
				replyBtnBackup = $(this)[0];
				$(".comment #reply").empty();
				$(this).next()
				.append('<div class="add-listing">'
	                	+'<form id="replyForm">'
	                    +'<br><label><b>댓글 쓰기</b></label><br>'
						+'  <div class="single-box col-lg-12 col-md-12 col-sm-12">'
	                    +'    <textarea id="replyContents" name="rcontents" placeholder="미마 님의 후기에 댓글을 남겨주세요!"></textarea>'
	                	+'  </div>'
	                	+'  <input type="hidden" name="rcno" value="'+cno+'">'
	                	+'  <input type="hidden" name="rwriterNo" value="'+${session.memberNo}+'">'
	                	+'  <input type="hidden" name="rmainNo" value="'+no+'">'
	                	+'<p><button type="button" class="theme-btn-one" id="insert">등록</button>&nbsp;<button type="button" class="theme-btn-two" id="cancel">취소</button></p>'
	                	+'</form>'
	                	+'<div>')
			});
			
			// 수정폼
			$(".comment").on("click",'#updateBtn', function(){
				var cno = $(this).data("cno")
				var no = $(this).data("no")
				
				$(this).closest(".replay-comment").empty();
				
				$("#comment").append('<div class="add-listing">'
	                	+'<form id="replyForm">'
	                    +'<br><label><b>댓글 수정</b></label><br>'
						+'  <div class="single-box col-lg-12 col-md-12 col-sm-12">'
	                    +'    <textarea id="replyContents" name="rcontents" placeholder="미마 님의 후기에 댓글을 남겨주세요!"></textarea>'
	                	+'  </div>'
	                	+'  <input type="hidden" name="rcno" value="'+cno+'">'
	                	+'  <input type="hidden" name="rwriterNo" value="'+${session.memberNo}+'">'
	                	+'  <input type="hidden" name="rmainNo" value="'+no+'">'
	                	+'<p><button type="button" class="theme-btn-one" id="update">수정</button>&nbsp;<button type="button" class="theme-btn-two" id="cancel">취소</button></p>'
	                	+'</form>'
	                	+'<div>')
			});
		
		
		
		}); // document function End
		

</script>