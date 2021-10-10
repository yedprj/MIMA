<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- page wrapper -->

<div class="boxed_wrapper">

	<!-- preloader -->
	<div class="preloader"></div>
	<!-- preloader -->

	<!-- team-style-two -->
	<section class="team-style-two bg-color-3">
		<div class="auto-container">
			<div class="row clearfix">

				<c:forEach var="member" items="${patnerStatusSelect}">
					<div class="col-lg-3 col-md-6 col-sm-12 team-block">
						<div class="team-block-two wow fadeInUp animated animated"
							data-wow-delay="600ms" data-wow-duration="1500ms">
							<div class="inner-box">
								<div class="pattern"
									style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-43.png);"></div>
								<button type="button" class="btn btn-white"
									style="background-color: #39CABB;" id="insertpartner"
									name="insertpartner">등록</button>
								<div class="lower-content">
									<h3>
										<a>${member.name }</a>
									</h3>
									<span class="designation">${member.license }</span> <input
										type="hidden" id="license" name="license"
										value="${member.license }">
									<ul class="rating clearfix">
										<li><i class="icon-Star"></i></li>
										<li><i class="icon-Star"></i></li>
										<li><i class="icon-Star"></i></li>
										<li><i class="icon-Star"></i></li>
										<li><i class="icon-Star"></i></li>
										<li><a>5 reviews</a></li>
									</ul>
									<div class="location-box">
										<p>
											<i class="fas fa-map-marker-alt"></i>${member.addr1 }</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>

		<br>
		<br>

		<div align="center">
			<div class="add-listing my-profile">
				<div class="btn-box">
					<a href="adMain" class="cancel-btn">목록</a>
				</div>
			</div>
		</div>

		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}">

	</section>
</div>
<!-- team-style-two -->

<script>
	$(function() {

		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		
		$(document).on("click", "button[name=insertpartner]", function() {
			console.log("버튼클릭!");
			var license = $("#license").val();
			console.log(license);

			$.ajax({
				url : "patnerStatusUpdate",
				method : "put",
				dataType : "json",
				data : JSON.stringify({
					license : license
				}),
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				contentType : 'application/json',
				success : function(data) {
					console.log(data);
					alert(license + "등록이 되었습니다.");
					location.reload();
				},
				error : function() {
					console.log("error");
				}
			});
		});
	});
</script>