<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
				<h1>비밀번호 변경</h1>
			</div>
		</div>
	</div>
	<div class="lower-content">
		<ul class="bread-crumb clearfix">
			<li><a href="${pageContext.request.contextPath}">Home</a></li>
			<li>비밀번호 변경</li>
		</ul>
	</div>
</section>
<!--page-title-two end-->  
    
<section class="doctors-dashboard bg-color-3">
	<!-- 사이드 메뉴바 연결 -->
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
					<li><a id="guid" href="${pageContext.request.contextPath}/pharmacy/medGuid"><i class="fas fa-comment-medical"></i>복약지도관리</a></li>
					<li><a id="revicw" href="${pageContext.request.contextPath}/pharmacy/review"><i class="fas fa-star"></i>약국 후기</a></li>
					<li><a id="ques" href="${pageContext.request.contextPath}/pharmacy/phaQna"><i class="fas fa-comments"></i>문의</a><span>20</span></li>
					<li><a id="profile" href="${pageContext.request.contextPath}/pharmacy/myProfile"><i class="fas fa-user"></i>약국 프로필</a></li>
					<li><a id="pwUpdate" href="${pageContext.request.contextPath}/pharmacy/pwUpdate" class="current"><i
							class="fas fa-unlock-alt"></i>비밀번호 변경</a></li>
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
                <div class="add-listing change-password">
                    <div class="single-box">
                        <div class="title-box">
                            <h3>비밀번호 변경</h3>
                        </div>
                        <div class="inner-box">
                            <form action="add-listing.html" method="post">
                                <div class="row clearfix">
                                    <div class="col-lg-6 col-md-12 col-sm-12 form-group">
                                        <label>이전 비밀번호</label>
                                        <input type="password" id="password1" name="password1">
                                        <span id="originCheck" class="jb-xx-small"></span>
                                    </div>
                                    <div class="col-lg-6 col-md-12 col-sm-12 form-group">
                                        
                                    </div>
                                    <div class="col-lg-6 col-md-12 col-sm-12 form-group">
                                        <label>새로운 비밀번호</label>
                                        <input type="password" id="password2" name="password2" onchange="change_pw()" required="required">
                                    </div>
                                    <div class="col-lg-6 col-md-12 col-sm-12 form-group">
                                        
                                    </div>
                                    <div class="col-lg-6 col-md-12 col-sm-12 form-group">
                                        <label>새로운 비밀번호 확인</label>
                                        <input type="password" id="password3" name="password3" onchange="change_pw2()" required="required">
                                        <span id="pwCheck" class="jb-xx-small"></span>
                                    </div>
                                    <div class="col-lg-6 col-md-12 col-sm-12 form-group">
                                        
                                    </div>
                                </div>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                            </form>
                        </div>
                    </div>
                    <div class="btn-box">
                        <button id="update" name="update" class="theme-btn-one">비밀번호 변경<i class="icon-Arrow-Right"></i></button>
                        <button id="cancel" name="cancel" class="cancel-btn">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script>

	//비밀번호 형식 체크 function 들어갈 부분
	function change_pw() {
		
		var password2 = $("#password2").val();
		
		if(!/^[a-zA-Z0-9]{8,20}$/.test(password2)){
	        alert("비밀번호는 숫자와 영문자 조합으로 8~20자리를 사용해야 합니다.");
	        $('#password2').val('').focus();
	        return false;
	    }
	    
	    var chk_num = password2.search(/[0-9]/g);
	    var chk_eng = password2.search(/[a-z]/ig);
	    
	    if(chk_num<0 || chk_eng<0){
	        alert("비밀번호는 숫자와 영문자를 혼용하여야 합니다.");
	        $('#password2').val('').focus();
	        return false;
	    }
	    if(/(\w)\1\1\1/.test(password2)){
	        alert("비밀번호에 같은 문자를 4번 이상 사용하실 수 없습니다.");
	        $('#password2').val('').focus();
	        return false;
	    }
	    
	    $('#password3').focus();
		return true;
	}
	
	// 비밀번호 중복 체크 function
	function change_pw2() {
		
		var password = $("#password2").val();
		var pwcheck = $("#password3").val();
		
		if( change_pw() == true ) {
			if (password != null && pwcheck != null) {
				if (password == pwcheck) {
					$('#password2').removeClass('is-invalid')
								   .addClass('is-valid');
					$('#password3').removeClass('is-invalid')
								   .addClass('is-valid');
					$('#pwCheck').removeClass('invalid-feedback')
								 .addClass('valid-feedback').text('입력하신 비밀번호가 일치합니다.');
				} else {
					$('#password2').removeClass('is-valid')
								   .addClass('is-invalid');
					$('#password3').removeClass('is-valid')
								   .addClass('is-invalid');
					$('#pwCheck').removeClass('valid-feedback')
								 .addClass('invalid-feedback').text('입력하신 비밀번호가 일치하지 않습니다.');
				}
			} else {
				$('#password2').removeClass('is-valid')
							   .removeClass('is-invalid');
				$('#password3').removeClass('is-valid')
							   .removeClass('is-invalid');
				$('#pwCheck').removeClass('valid-feedback')
							 .removeClass('invalid-feedback');
			}
		}
	}

	$(function(){
		
		$("#logoutBtn1").on("click", function(){
			$('#logOutfrm1').submit();
		});
		
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		var id = "${memberId}";
		
		$('#password1').blur(function(){
			
			var password = $('#password1').val();
			
			$.ajax({
				url : 'pwConfirm',
				type : 'post',
				data : { memberId : id,
						 password : password },
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},		 
				success : function(data) {
					if (data == true) {
						$('#password1').removeClass('is-invalid')
						 			   .addClass('is-valid');
						$('#originCheck').removeClass('invalid-feedback')
										 .addClass('valid-feedback').text('입력하신 비밀번호는 현재 비밀번호가 맞습니다.');
						$('#password2').focus();
					} else {
						$('#password1').removeClass('is-valid')
			 			   			   .addClass('is-invalid');
						$('#originCheck').removeClass('valid-feedback')
							 			 .addClass('invalid-feedback').text('입력하신 비밀번호는 현재 비밀번호가 아닙니다.');
						$('#password1').val('');
						$('#password1').focus();
					}
				},
				error : function(reject) {
					console.log(reject);
				}
			});
		});
		
		
		// 버튼 클릭 시 비밀번호 수정 p.10/11
		$('#update').on('click', function(e){
			e.preventDefault();
			
			var udpassword = $('#password2').val();
			
			$.ajax({
				url : 'updatePassword',
				type : 'post',
				data : {memberId : id,
					    password : udpassword},
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				success : function(data) {
					if(data == 1){
						alert("비밀번호가 성공적으로 변경되었습니다.");
						location.href= "pwUpdate";
					} else {
						alert("비밀번호 변경에 실패하였습니다.");
					}
				},
				error : function(reject) {
					console.log(reject);
				}
			});
		});
		
		$('#cancel').on('click', function(e) {
			e.preventDefault();
			location.href= "pharmacyDash";
		});
	});
</script>