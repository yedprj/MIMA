<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<div class="boxed_wrapper">

	<!-- doctors-dashboard -->
	<section class="doctors-dashboard bg-color-3">
		<div>
			<div class="content-container">
				<div class="outer-container">
					<div class="doctors-appointment my-patients">
						<div class="title-box clearfix">
							<div class="text pull-left">
								<h3>신고글 조회</h3>
							</div>
							<div class="btn-box pull-right">
								<form action="my-patients.html" method="post"
									class="search-form">
									<div class="form-group">
										<input type="search" name="search-field" placeholder="Search"
											required="">
										<button type="submit">
											<i class="far fa-search"></i>
										</button>
									</div>
								</form>
							</div>
						</div>
						<div class="doctors-list">
							<div class="table-outer">
								<table class="table table-hover">
									<thead class="table-header">
										<tr align="center">
											<th>NO</th>
											<th>신고당한 원글번호</th>
											<th>신고당한 회원번호</th>
											<th>신고당한 회원아이디</th>
											<th>신고한 회원번호</th>
											<th>신고한 회원아이디</th>
											<th>신고일</th>
											<th>신고 확인일</th>
											<th>신고 조치 여부</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${list}" var="rmember">
											<tr align="center"
												onclick="location.href='rpget?reportNo=${rmember.reportNo}'">
												<td>${rmember.reportNo }</td>
												<td>${rmember.postNo }</td>
												<td>${rmember.reportMno }</td>
												<td>${rmember.reportId }</td>
												<td>${rmember.memberNo }</td>
												<td>${rmember.rmemberId }</td>
												<td><fmt:formatDate value="${rmember.reportDate }"
														pattern="yy-MM-dd" /></td>
												<td><fmt:formatDate value="${rmember.checkDate }"
														pattern="yy-MM-dd" /></td>
												<td>${rmember.reportResult }</td>

											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- e.1 -->
					<!-- pagination  -->
					
					<form id="actionForm" action="rplist" method="get">
						<select name="type">
						<option value=""
							<c:out value="${pageMaker.cri.type == null ? 'selected':'' }"/>
						>선택</option>
						<option value="T" 
							<c:out value="${pageMaker.cri.type eq 'T'? 'selected':'' }"/>
						>제목</option>
						<option value="C"
							<c:out value="${pageMaker.cri.type eq 'C'? 'selected':'' }"/>
						>내용</option>
						<option value="W"
							<c:out value="${pageMaker.cri.type eq 'W'? 'selected':'' }"/>
						>작성자</option>
						<option value="TC"
							<c:out value="${pageMaker.cri.type eq 'TC'? 'selected':'' }"/>
						>제목 or 내용</option>
						<option value="TW" 
							<c:out value="${pageMaker.cri.type eq 'TW'? 'selected':'' }"/>
						>제목 or 작성자</option>
						<option value="TWC"
							<c:out value="${pageMaker.cri.type eq 'TWC'? 'selected':'' }"/>
						>제목 or 내용 or 작성자</option>
						</select>
						<input type="text" name="keyword" value="${pageMaker.cri.keyword }">

		               <input type="hidden" id="pageNum" name="pageNum" value="1">
		               <input type="hidden" id="amount" name="amount" value="${pageMaker.cri.amount}">
		            	<button class='btn btn-default'>Search</button>
		            </form>
					
					
					<div class="pagination-wrapper" align="center">
						<ul class="pagination">
							<c:if test="${pageMaker.prev }">
								<li class="paginate_button previous"><a href="${pageMaker.startPage-1 }">이전</a></li>
							</c:if>
								
							<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
								<li class="paginate_button"><a href="${num }">${num }</a></li>
							</c:forEach>
								
							<c:if test="${pageMaker.next }">
								<li class="paginate_button next"><a href="${pageMaker.endPage+1 }">다음</a></li>
							</c:if>
						</ul>
					</div>
					<!-- pagination end -->
					<br> <br>

					<div align="center">
						<div class="add-listing my-profile">
							<div class="btn-box">
								<a href="../admin/adMain" class="cancel-btn">목록</a>
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
	 $(document).ready(function() {
		 var actionForm = $('#actionForm');
		 
		 //e.1
		 //페이징
		 $(".move").on('click', function(e){
			 e.preventDefault();
			 actionForm.append('<input type="hidden" id="bno" name="bno" value="'+ $(this).attr("href") +'">');
			 actionForm.attr("action", "get");
			 actionForm.submit();
		 });
		 
		 
		 //e.1
		 //페이징 
		 $("#pageButton a").on("click", function(e){
			 e.preventDefault(); //a tag, submit
			 console.log('clicked')
			 var p=$(this).attr("href");
			 $('[name="pageNum"]').val(p);
			 
			 actionForm.submit();
		 });

			/* $('#board').DataTable({
	            responsive: true
	        });*/
	    });
	</script>