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
				<h1>일반 회원가입</h1>
			</div>
		</div>
	</div>
	<div class="lower-content">
		<div class="auto-container">
			<ul class="bread-crumb clearfix">
				<li><a href="home">Home</a></li>
				<li>Sign Up</li>
			</ul>
		</div>
	</div>
</section>
<!--page-title-two end-->


<!-- registration-section -->
<section class="registration-section bg-color-3">
	<div class="pattern">
		<div class="pattern-1"
			style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-85.png);"></div>
		<div class="pattern-2"
			style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-86.png);"></div>
	</div>
	<div class="auto-container">
		<div class="inner-box">
			<div class="content-box">
				<div class="title-box">
					<h3>Patient Registration</h3>
				</div>
				<div class="inner">
					<form id="frm" name="frm" class="registration-form">
						<div class="row clearfix">
							<div class="col-lg-6 col-md-6 col-sm-12 form-group">
								<label>아이디</label> 
								<input type="text" class="form-control"
								 id="memberId" name="memberId" placeholder="아이디를 입력해 주세요" required="required">
							</div>
							<div class="col-lg-6 col-md-6 col-sm-12 form-group">
								<button type="button" id="idcheck" name="idcheck" 
									class="theme-btn-one mt-4">아이디 중복 체크</button>
							</div>
							
							<div class="col-lg-6 col-md-6 col-sm-12 form-group">
                            	<label>비밀번호</label>
                                <input type="password" id="password" name="password" class="form-control"
                                	placeholder="비밀번호를 입력해주세요" required="required" onchange="check_pw()">
                                <span id="pwCheck" class="jb-xx-small"></span>
                            </div>
                            
                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                            	<label>비밀번호 확인</label>
                                <input type="password" id="pwcheck" name="pwcheck" class="form-control"
                                	placeholder="비밀번호 확인을 위해 입력해주세요" onchange="check_pw2()" required="required">
                            </div>
							
							<div class="col-lg-12 col-md-12 col-sm-12 form-group">
								<label>닉네임</label> 
								<input type="text" id="nickname" name="nickname" class="form-control"
									placeholder="사용할 닉네임을 입력해주세요" onchange="nicknamecheck()">
							</div>
							
							<div class="col-lg-12 col-md-12 col-sm-12 form-group">
								<label>권한</label> 
								<input type="text" id="role" name="role" 
									value="환자" readonly="readonly">
							</div>
							
							<div class="col-lg-12 col-md-12 col-sm-12 text">
								<span></span>
							</div>
							
							<div class="col-lg-12 col-md-12 col-sm-12 form-group">
								<label>이름</label> 
								<input type="text" id="name" name="name"
									placeholder="이름(name)" required="required">
							</div>
							
							<div class="col-lg-12 col-md-12 col-sm-12 form-group">
								<label>주민등록번호</label> 
								<input type="password" id="identifyNo" name="identifyNo" 
									placeholder="주민등록번호" required="required">
							</div>
							
							<div class="col-lg-12 col-md-12 col-sm-12 form-group">
								<label>이메일</label> 
								<input type="text" id="email" name="email" class="form-control"
									placeholder="이메일(email)" onchange="emailCheck()" required="required">
								<span id="emailCheck" class="jb-xx-small"></span>
							</div>
							
							<div class="col-lg-6 col-md-6 col-sm-12 form-group">
								<input type="text" id="emailnum" name="emailnum" class="form-control"
								 onchange="checkEmailnum()" placeholder="이메일 인증 번호" disabled >
								 <span id="emailnumCheck" class="jb-xx-small"></span>
							</div>
							
							<div class="col-lg-6 col-md-6 col-sm-12 form-group">
								<button type="button" id="emailcheck" name="emailcheck" 
									class="theme-btn-one">이메일 인증</button>
							</div>
							
							<div class="col-lg-12 col-md-12 col-sm-12 form-group">
								<label>성별</label> 
								<input type="text" id="gender" name="gender" 
									placeholder="성별(gender)" required="required">
							</div>
							
							<div class="col-lg-12 col-md-12 col-sm-12 form-group">
								<label>전화번호</label> 
								<input type="text" id="phone" name="phone" 
									placeholder="전화번호(phone)" required="required">
							</div>
							
							<div class="col-lg-6 col-md-6 col-sm-12 form-group">
								<input type="hidden" id="confmKey" name="confmKey" value="" >
								<input type="text" class="form-control form-control-user"
									id="postcode" name="postcode" placeholder="우편번호" readonly>
							</div>
							
							<div class="col-lg-6 col-md-6 col-sm-12 form-group">
								<button type="button" onclick="execDaumPostcode();" class="theme-btn-one">
									주소검색</button>
							</div>
							
						
							<div class="col-lg-12 col-md-12 col-sm-12 form-group">
								<input type="text" class="form-control" id="addr1"
									name="addr1" placeholder="주소">
							</div>
							
							<div class="col-lg-6 col-md-6 col-sm-12 form-group">
								<input type="text" class="form-control" id="addr2"
								name="addr2" placeholder="상세주소">
							</div>
							
							<div class="col-lg-6 col-md-6 col-sm-12 form-group">
								<input type="text" class="form-control" id="addr3"
									name="addr3" placeholder="참고항목">
							</div>
							
							<div class="col-lg-12 col-md-12 col-sm-12 form-group">
								<label>프로필 업로드</label> 
								<input type="file" id="ptProfilePhoto" name="ptProfilePhoto">
							</div>
							
							<div class="col-lg-12 col-md-12 col-sm-12 form-group">
								<div class="custom-check-box">
									<div class="custom-controls-stacked">
										<label class="custom-control material-checkbox"> <input
											type="checkbox" class="material-control-input"> <span
											class="material-control-indicator"></span> <span
											class="description">I accept <a
												href="book-appointment.html">terms</a> and <a
												href="book-appointment.html">conditions</a> and general
												policy
										</span>
										</label>
									</div>
								</div>
							</div>
							
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							
							<div class="col-lg-12 col-md-12 col-sm-12 form-group message-btn">
								<button type="button" id="joinMember" name="joinMember" class="theme-btn-one">
									Register Now<i class="icon-Arrow-Right"></i>
								</button>
							</div>
						</div>
					</form>
					<div class="login-now">
						<p>
							Already have an account? <a href="${pageContext.request.contextPath}/login">Login
								Now</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</section>
<!-- registration-section end -->

<script>

	var code ="";	// 이메일 전송 인증번호 저장위한 코드
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	$(function(){
		// 아이디 중복 체크
		$("#idcheck").on("click", function(e){
			e.preventDefault();
			
			var memberId = $("#memberId").val();
			
			if (memberId != ''){
				$.ajax({
					url : "IdCheck",
					type : "post",
					data : JSON.stringify({memberId : memberId}),
					beforeSend : function(xhr) {
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
					dataType : "json",
					contentType : "application/json",
					success : function(data){
						console.log(data);
						if (data == 0){
							alert("사용할 수 있는 아이디 입니다.");
							$('#memberId').removeClass('is-invalid')
										  .addClass('is-valid');
							$('#password').focus();
						} else {
							alert("중복된 아이디 입니다. 다른 아이디를 입력해 주세요.");
							$('#memberId').removeClass('is-valid')
										  .addClass('is-invalid');
							$('#memberId').val('')
										  .focus();
						}
					},
					error: function(){
						alert("비교 실패");
					}
				});
			} else {
				alert("아이디를 입력해 주세요");
			}
		});
	});
	
	// 회원 가입
	$("#joinMember").on("click", function(e) {
		e.preventDefault();
		
		var memberId = $("#memberId").val();
		var password = $("#password").val();
		var nickname = $("#nickname").val();
		var role = $("#role").val();
		var name = $("#name").val();
		var identifyNo = $("#identifyNo").val();
		var gender = $("#gender").val();
		var postcode = $("#postcode").val();
		var addr1 = $("#addr1").val();
		var addr2 = $("#addr2").val();
		var addr3 = $("#addr3").val();
		var email = $("#email").val();
		var phone = $("#phone").val();
		var ptProfilePhoto = $("#ptProfilePhoto").val();
		
		if (role == "환자"){
			role = "pt";
			var status = "y";
		}
		
		if (allCheck() == true) {
			$.ajax({
				url : "joinMember",
				type : "post",
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				data : JSON.stringify({memberId : memberId,
									   password : password,
									   nickname : nickname,
									   role : role,
									   name : name,
									   identifyNo : identifyNo,
									   gender : gender,
									   postcode : postcode,
									   addr1 : addr1,
									   addr2 : addr2,
									   addr3 : addr3,
									   email : email,
									   phone : phone,
									   status : status,
									   ptProfilePhoto : ptProfilePhoto}),
				dataType : "json",
				contentType : "application/json",
				success : function(data) {
					//console.log(data);
					if (data == 1) {
						alert("회원가입이 완료되었습니다!");
						window.location.href = "login";
					} else {
						alert("회원가입 실패!")
					}
				}
			});
		} else {
			return false;
		}
	});
	
	// 인증번호 이메일 전송
	$("#emailcheck").on("click", function(){
		
		var email = $("#email").val();	// 입력한 이메일
		
		$.ajax({
			type : "get",
			url : "mailCheck?email=" + email,
			success : function(data){
				//console.log("data : " + data);
				$("#emailnum").attr("disabled", false);
				code = data;
				//console.log(code);
			}
		});
	});
	
	// 인증번호 비교
	function checkEmailnum() {
		
		var inputCode = $("#emailnum").val();	// 입력코드
		
		//console.log(inputCode);
		//console.log(code);
		if (inputCode == code) {				// 일치할 경우
			$("#emailnum").removeClass('is-invalid')
						  .addClass('is-valid');
			$("#emailnumCheck").removeClass('invalid-feedback')
			 		   .addClass('valid-feedback').text('입력하신 인증번호가 일치합니다.');
		} else {								// 일치하지 않을 경우
			$("#emailnum").removeClass('is-valid')
			  			  .addClass('is-invalid');
			$("#emailnumCheck").removeClass('valid-feedback')
	 		   			.addClass('invalid-feedback').text('입력하신 인증번호가 틀립니다. 다시 입력해 주세요.');
		} 
	}
	
	/* $("#emailnum").blur(function() {
		var inputCode = $("#emailnum").val();	// 입력코드
		var checkResult = $("#emailnumCheck");	// 비교 결과
		//console.log();
		//console.log(code);
		if (inputCode == code) {				// 일치할 경우
			$("#emailnumCheck").removeClass('invalid-feedback')
			 		   .addClass('valid-feedback').text('입력하신 인증번호가 일치합니다.');
		} else {								// 일치하지 않을 경우
			$("#emailnumCheck").removeClass('valid-feedback')
	   				   .addClass('invalid-feedback').text('입력하신 인증번호가 틀립니다. 다시 입력해 주세요.');
		}
	}); */
	
	// 비밀번호 형식 체크 function 들어갈 부분
	function check_pw() {
		
		var password = $("#password").val();
		
		if(!/^[a-zA-Z0-9]{8,20}$/.test(password)){
	        alert("비밀번호는 숫자와 영문자 조합으로 8~20자리를 사용해야 합니다.");
	        $('#password').val('').focus();
	        return false;
	    }
	    
	    var chk_num = password.search(/[0-9]/g);
	    var chk_eng = password.search(/[a-z]/ig);
	    
	    if(chk_num<0 || chk_eng<0){
	        alert("비밀번호는 숫자와 영문자를 혼용하여야 합니다.");
	        $('#password').val('').focus();
	        return false;
	    }
	    if(/(\w)\1\1\1/.test(password)){
	        alert("비밀번호에 같은 문자를 4번 이상 사용하실 수 없습니다.");
	        $('#password').val('').focus();
	        return false;
	    }
	    
	    $('#pwcheck').focus();
		return true;
	}
	
	// 비밀번호 중복 체크 function
	function check_pw2() {
		
		var password = $("#password").val();
		var pwcheck = $("#pwcheck").val();
		if( check_pw() == true ) {
			if (password != null && pwcheck != null) {
				if (password == pwcheck) {
					$('#password').removeClass('is-invalid')
								  .addClass('is-valid');
					$('#pwcheck').removeClass('is-invalid')
								  .addClass('is-valid');
					$('#pwCheck').removeClass('invalid-feedback')
								 .addClass('valid-feedback').text('입력하신 비밀번호가 일치합니다.');
				} else {
					$('#password').removeClass('is-valid')
								.addClass('is-invalid');
					$('#pwcheck').removeClass('is-valid')
								 .addClass('is-invalid');
					$('#pwCheck').removeClass('valid-feedback')
								.addClass('invalid-feedback').text('입력하신 비밀번호가 일치하지 않습니다.');
				}
			} else {
				$('#userPw').removeClass('is-valid')
							.removeClass('is-invalid');
				$('#userPwOk').removeClass('is-valid')
							  .removeClass('is-invalid');
				$('#pwCheck').removeClass('valid-feedback')
							 .removeClass('invalid-feedback');
			}
		}
	}
	
	// 닉네임 중복 체크
	function nicknamecheck() {
		
		var nickname = $('#nickname').val();
		
		if (nickname != null && nickname != ''){
			$.ajax({
				url : "nickNameCheck",
				type : "post",
				data : JSON.stringify({nickname : nickname}),
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				dataType : "json",
				contentType : "application/json",
				success : function(data){
					if (data == 0) {
						alert("사용할 수 있는 닉네임입니다.");
						$('#nickname').removeClass('is-invalid')
						          	  .addClass('is-valid');
						$("#name").focus();
						nickname = '';
					} else {
						alert("중복된 닉네임입니다. 다른 닉네임을 입력해 주세요.");
						$('#nickname').removeClass('is-valid')
						  			  .addClass('is-invalid');
						$('#nickname').val('')
						  			  .focus();
					}
				},
				error : function(){
					alert("중복 체크 실패");	
				}
			});
		} else {
			alert("닉네임을 입력해 주세요");
		}
		
	}
	
	// 이메일 형식 체크
	function emailCheck() {
		
		var email = $("#email").val();
		var emailck = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		
		//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우
		if (emailck.test(email) == false) {
			$("#email").removeClass("is-valid")
					   .addClass("is-invalid");
			$("#emailCheck").removeClass('valid-feedback')
						   .addClass('invalid-feedback').text('이메일 형식이 맞지 않습니다.');
			$('#email').val('').focus();
			return false;
		} else {
			$("#email").removeClass("is-invalid")
			  		   .addClass("is-valid");
			$("#emailCheck").removeClass('invalid-feedback')
				   		   .addClass('valid-feedback').text('이메일 형식이 맞습니다.');
		}
	}
	
	// 회원 가입 시 전체 체크 function
	function allCheck() {
		// 아이디 입력 했는지 체크
		if (frm.memberId.val == '') {
			alert("아이디를 입력해 주세요.");
			return false;
		}
		
		// 비밀번호를 입력 했는지 체크
		if (frm.password.val == ''){
			alert("비밀번호를 입력해주세요.");
			return false;
		}
		
		// 닉네임 입력 했는지 체크
		if (frm.nickname.val == '') {
			alert("닉네임을 입력해주세요.");
			return false;
		}
		
		// 이름 입력 했는지 체크
		if (frm.name.val == '') {
			alert("이름을 입력해주세요.");
			return false;
		}
		
		// 주민등록번호를 입력 했는지 체크
		if (frm.identifyNo.val == '') {
			alert("주민등록번호를 입력해주세요.");
			return false;
		}
		
		// 휴대폰 확인 했는지 체크
		if (frm.phone.val == '') {
			alert("휴대폰 본인인증을 해주세요.");
			return false;
		}
		
		// 성별을 입력 했는지 체크
		if (frm.gender.val == '') {
			alert("성별을 입력해주세요.");
			return false;
		}
		
		// 이메일을 입력 했는지 체크
		if (frm.email.val == '') {
			alert("이메일을 입력해주세요.");
			return false;
		}
		
		// 주소 api 사용 유무 체크
		if (frm.addr1.val == '') {
			alert("주소 검색을 사용해 입력해 주세요.");
			return false;
		}
		
		if (frm.addr2.val == '') {
			alert("주소 검색을 사용해 입력해 주세요.");
			return false;
		}
		
		if (frm.addr3.val == '') {
			alert("주소 검색을 사용해 입력해 주세요.");
			return false;
		}
		
		// 프로필 등록 체크
		if (frm.ptProfilePhoto.val == '') {
			alert("프로필 등록할 사진을 업로드 해주세요.");
			return false;
		}
		return true;
	}
	
	// 주소 API 연결
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("addr3").value = extraAddr;
                
                } else {
                    document.getElementById("addr3").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("addr1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr2").focus();
            }
        }).open();
    }
</script>
