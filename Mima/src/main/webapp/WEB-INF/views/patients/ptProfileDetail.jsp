<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- e:1012 환자 프로파일 인서트 폼 -->
<div class="boxed_wrapper">

	<!-- preloader -->
	<div class="preloader"></div>
	<!-- preloader -->

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
					<h1>프로필 관리</h1>
				</div>
			</div>
		</div>
		<div class="lower-content">
			<ul class="bread-crumb clearfix">
				<li><a href="index.html">Home</a></li>
				<li>프로필 관리</li>
			</ul>
		</div>
	</section>
	<!--page-title-two end-->


	<!-- doctors-dashboard -->
	<section class="doctors-dashboard bg-color-3">
		<div class="left-panel">
			<div class="profile-box">
				<div class="upper-box">
					<figure class="profile-image">
						<c:choose>
							<c:when test="${not empty session.ptProfilePhoto }">
								<img src="FileDown.do?fname=${session.ptProfilePhoto}">
							</c:when>
							<c:otherwise>
								<img
									src="${pageContext.request.contextPath}/resources/assets/images/resource/profile-2.png"
									alt="">
							</c:otherwise>
						</c:choose>
					</figure>
					<div class="title-box centred">
						<div class="inner">

							<h3>${session.name}</h3>

							<p>MDS - Periodontology</p>
						</div>
					</div>
				</div>
				<div class="profile-info">
					<ul class="list clearfix">
						<li><a href="ptMain"><i class="fas fa-columns"></i>대쉬보드</a></li>
						<li><a href="ptBookManage"><i class="fas fa-calendar-alt"></i>나의
								예약관리</a></li>
						<li><a href="ptHistory"><i class="fas fa-calendar-alt"></i>나의
								진료내역</a></li>
						<li><a href="ptReview"><i class="fas fa-star"></i>나의 후기</a></li>
						<li><a href="ptMedelivery"><i class="fas fa-comment-medical"></i>약배달 신청</a></li>
						<li><a href="ptDeliveryList"><i class="fas fa-ambulance"></i>배송 현황</a></li>
						<li><a href="ptProfileDetail" class="current"><i
								class="fas fa-user"></i>프로필 관리</a></li>
						<li><a href="ptPwChangeForm"><i class="fas fa-unlock-alt"></i>비밀번호
								변경</a></li>
						<li>
							<form id="logOutfrm1" name="logOutfrm1" action="../logout"
								method="post">
								<a href="#" id="logoutBtn1"><i class="fas fa-sign-out-alt"></i>로그아웃</a>
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}">
							</form>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="right-panel">
			<div class="content-container">
				<div class="outer-container">
					<div class="add-listing my-profile">
						<form id="ptUpdateForm" method="post" action="ptprofileUpdate">
							<input type="hidden" id="memberNo" name="memberNo"
								value="${session.memberNo }">
							<div class="single-box">
								<div class="title-box">
									<h3>나의 정보</h3>${ptMyProfile.ptProfilePhotoImg }
								</div>
								<div class="inner-box">

									<div class="profile-title">
										<!-- 여기 프로필 사진 보여주기 하면 됨 -->
										<div>
											<figure class="image-box">
												<c:choose>
													<c:when test="${not empty session.ptProfilePhoto }">
														<img src="FileDown.do?fname=${session.ptProfilePhoto}">
													</c:when>
													<c:otherwise>
														<img
															src="${pageContext.request.contextPath}/resources/assets/images/resource/profile-2.png"
															alt="">
													</c:otherwise>
												</c:choose>
											</figure>
											<ul id="uploaded"></ul>
										</div>
										<div class="upload-photo">
											<input name="ptProfilePhoto" id="ptProfilePhoto" value="${ptMyProfile.ptProfilePhoto }"> <input
												id="fileInput" type="file"><br> <span>형식은
												JPG, GIF, PNG 만 가능합니다.<br> 파일사이즈 최대 2MB
											</span><br>
											<button type="button" id="imgUpBtn" class="theme-btn-one"
												style="box-shadow: none;">등록</button>
										</div>
									</div>
									<div class="row clearfix">
										<div class="col-lg-6 col-md-6 col-sm-12 form-group">
											<label>이름</label> <input type="text"
												value="${ptMyProfile.name }" required="" disabled>
										</div>
										<div class="col-lg-6 col-md-6 col-sm-12 form-group">
											<label>아이디</label> <input type="text"
												value="${ptMyProfile.memberId }" required="" disabled>
										</div>
										<div class="col-lg-6 col-md-6 col-sm-12 form-group">
											<label>이메일</label> <input type="text"
												value="${ptMyProfile.email }" name="email" required="">
										</div>
										<div class="col-lg-6 col-md-6 col-sm-12 form-group">
											<label>전화번호</label> <input type="text"
												value="${ptMyProfile.phone }" name="phone" required="">
										</div>
										<div class="col-lg-6 col-md-6 col-sm-12 form-group">
											<label>성별</label> <input type="text"
												value="${ptMyProfile.gender }" required="" disabled>
										</div>
										<div class="col-lg-6 col-md-6 col-sm-12 form-group"></div>
									</div>
								</div>
							</div>
							<div class="btn-box d-flex flex-row-reverse">
								<button class="theme-btn-one" type="submit">수정하기!!!!</button>
							</div>

							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}">
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!--Modal 추가 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Modal title</h4>
				</div>
				<div class="modal-body">처리가 완료되었습니다.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->


</div>


<script type="text/javascript">
	$(function() {

		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";

		//file insert start
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 5242880; //5MB

		function checkExtension(fileName, fileSize) {

			if (fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}

			if (regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			return true;
		}

		//사진 미리보기
		const input = document.getElementById('fileInput');
		const profileImg = document.getElementById('profileImg');
		//var videoSource=document.createElement('source');
		//videoSource.setAttribute('src', "c:upload/"+datas.uuid+datas.vfileName);

		input.addEventListener('change', function() {
			const files = this.files || [];

			if (!files.length)
				return;

			const reader = new FileReader();

			reader.onload = function(e) {
				profileImg.setAttribute('src', e.target.result);
			};

			reader.onprogress = function(e) {
				console.log('progress: ', Math
						.round((e.loaded * 100) / e.total));
			};

			reader.readAsDataURL(files[0]);
		});//End of 비디오 미리보기

		/* var result = '<c:out value="${result}"/>';

		checkModal(result);
		
		function checkModal(result) {

			if (result === '') {
				return;
			}

			if (parseInt(result) > 0) {
				$(".modal-body").html("result");
			}
			$("#myModal").modal("show");
		
		} */

		// 로그아웃_J18
		$("#logoutBtn1").on("click", function() {
			$('#logOutfrm1').submit();
		});

		//imgUpBtn 눌렀을 때 이벤트 설정 교재502페이지 --> 의사프로필사진 넣는거
		$('#imgUpBtn')
				.on(
						"click",
						function(e) {
							e.preventDefault();

							var formData = new FormData(
									document.docProInsertFrm);
							console.log("formData writer+content: " + FormData)
							var inputFile = $("#fileInput");
							var files = inputFile[0].files;
							console.log(files);

							for (var i = 0; i < files.length; i++) {
								if (!checkExtension(files[i].name,
										files[i].size)) {
									return;
								}
								formData.append("uploadFile", files[i]);
							}

							console.log("formData file: " + formData)
							$
									.ajax({
										url : 'phaAjaxInsert',
										processData : false,
										contentType : false,
										data : formData,
										method : 'POST',
										beforeSend : function(xhr) {
											console.log(csrfHeaderName
													+ " and " + csrfTokenValue);
											xhr.setRequestHeader(
													csrfHeaderName,
													csrfTokenValue);
											//xhr.setRequestHeader("aa", "bb");
										},
										success : function(datas) {
											console.log(datas);
											var str = "";

											var fileCallPath = encodeURIComponent(datas.uploadPath
													+ "/"
													+ datas.uuid
													+ "_"
													+ datas.pimgName);
											var fileLink = fileCallPath
													.replace(new RegExp(/\\/g),
															"/");
											str += "<li ";
											str += "data-path='"+datas.uploadPath+"' data-uuid='"+datas.uuid+"' data-pimgName='"+datas.pimgName+"' data-type='"+datas.image+"' ><div>";
											str += "<span> " + datas.pimgName
													+ "</span>";
											str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
											str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
											str += "</div>";
											str += "</li>";

											$("#uploaded").html(str);
											$("#ptProfilePhoto").val(datas.uuid + datas.pimgName);
											alert("file uploaded");

										},
										error : function(reject) {
											console.error(reject);
										}
									})
						}); //end of meditUpBtn event

		//attachment btn delete event
		$("#uploaded")
				.on(
						"click",
						"button",
						function(e) {
							if (confirm("파일을 삭제하시겠습니까?")) {
								var targetLi = $(this).closest("li");
								var preview = $('#profileImg');
								targetLi.remove();
								//이거 왜 안돼 ㅠㅠ 첨부파일 x 누르면 사진도 사라져야 하는데 그대로 있네유
								$(preview).removeAttr('src');
								$(preview)
										.attr(
												'src',
												"${pageContext.request.contextPath}/resources/assets/images/resource/profile-3.png");

							}
						});//end of attachment btn delete event

	})
</script>

