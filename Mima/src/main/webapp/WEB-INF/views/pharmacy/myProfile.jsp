<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.file-upload label {
    display: inline-block;
    padding: .5em .75em;
    color: #999;
    font-size: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #fdfdfd;
    cursor: pointer;
    border: 1px solid #ebebeb;
    border-bottom-color: #e2e2e2;
    border-radius: .25em;
}
.file-upload input[type="file"] {  /* 파일 필드 숨기기 */
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip:rect(0,0,0,0);
    border: 0;
}

.file-upload input[type="file"] {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip:rect(0,0,0,0);
    border: 0;
}

.file-upload label {
    display: inline-block;
    padding: .5em .75em;
    color: #999;
    font-size: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #fdfdfd;
    cursor: pointer;
    border: 1px solid #ebebeb;
    border-bottom-color: #e2e2e2;
    border-radius: .25em;
}

/* named upload */
.file-upload .upload-name {
    display: inline-block;
    padding: .5em .75em;  /* label의 패딩값과 일치 */
    font-size: inherit;
    font-family: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #f5f5f5;
    border: 1px solid #ebebeb;
    border-bottom-color: #e2e2e2;
    border-radius: .25em;
    -webkit-appearance: none; /* 네이티브 외형 감추기 */
    -moz-appearance: none;
    appearance: none;
}
/* imaged preview */
.file-upload .upload-display {  /* 이미지가 표시될 지역 */
    margin-bottom: 5px;
}

@media(min-width: 768px) { 
    .file-upload .upload-display {
        display: inline-block;
        margin-right: 5px;
        margin-bottom: 0;
    }
}

.file-upload .upload-thumb-wrap {  /* 추가될 이미지를 감싸는 요소 */
    display: inline-block;
    width: 150px;
    padding: 2px;
    vertical-align: middle;
    border: 1px solid #ddd;
    border-radius: 5px;
    background-color: #fff;
}

.file-upload .upload-display img {  /* 추가될 이미지 */
    display: block;
    max-width: 100%;
    width: 100% \9;
}
input::placeholder {
  color: #d9d9d9;
  font-style: italic;
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
				<h1>약국 프로필</h1>
			</div>
		</div>
	</div>
	<div class="lower-content">
		<ul class="bread-crumb clearfix">
			<li><a href="${pageContext.request.contextPath}">Home</a></li>
			<li>약국 프로필</li>
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
						<h3>${profile.pharmacyInfo}</h3>
						<p>${profile.profileContents}</p>
					</div>
				</div>
			</div>
			<div class="profile-info">
				<ul class="list clearfix">
					<li><a id="dash" href="${pageContext.request.contextPath}/pharmacy/pharmacyDash"><i
							class="fas fa-columns"></i>대쉬보드</a></li>
					<li><a id="delivery" href="${pageContext.request.contextPath}/pharmacy/mediDelivery"><i class="fas fa-ambulance"></i>약배달관리</a></li>
					<li><a href="${pageContext.request.contextPath}/pharmacy/deliveryRegCancel"><i class="fas fa-laptop-medical"></i>약배달 등록/취소</a></li>
					<li><a id="guid" href="${pageContext.request.contextPath}/pharmacy/medGuid"><i class="fas fa-comment-medical"></i>복약지도관리</a></li>
					<li><a id="revicw" href="${pageContext.request.contextPath}/pharmacy/review"><i class="fas fa-star"></i>약국 후기</a></li>
					<li><a id="profile" href="${pageContext.request.contextPath}/pharmacy/myProfile" class="current"><i class="fas fa-user"></i>약국 프로필</a></li>
					<li><a id="pwUpdate" href="${pageContext.request.contextPath}/pharmacy/pwUpdate?memberNo=${session.memberNo}"><i
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
                <div class="add-listing my-profile">
                <form id="phaInsertFrm" method="post"  action="register">
                    <input type="hidden" id="memberNo" name="memberNo" value="${session.memberNo }">
                    <div class="single-box">
                        <div class="title-box">
                            <h3>약국 프로필</h3>
                        </div>
                        <div class="inner-box">
                            <div class="profile-title">
                                <div>
                                    <figure class="image-box"><img width="300" height="300"  id="profileImg" src="${pageContext.request.contextPath}/resources/assets/images/resource/profile-3.png" alt="프로필 미리보기"></figure>
                                    <ul id="uploaded"></ul>
                                </div>
                                <div class="upload-photo">
                                	<input id="fileInput" type="file" name="docProImgFile" required><br>
                                    <span>형식은 JPG, GIF, PNG 만 가능합니다.<br> 파일사이즈 최대 2MB</span><br>
                                    <button type="button" id="imgUpBtn" class="theme-btn-one" style="box-shadow: none;">등록</button>
                                </div>
                            </div>
                            <div class="row clearfix">
                                <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                    <label><b>약국명</b></label>
                                    <input type="text" name="pharmacyInfo" value="${profile.pharmacyInfo}" >
                                </div>
                              	<div class="col-lg-6 col-md-6 col-sm-12 form-group">
	                            </div>
                                <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                    <label><b>이메일</b></label>
                                    <input type="email" name="pharmacyEmail" value="${profile.pharmacyEmail}">
                                </div>
                                
                                <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                    <label><b>연락처</b></label>
                                    <input type="text" name="pharmacyContact" value="${profile.pharmacyContact}">
                                </div>
                        	</div>
                        </div>
                    </div>
                    <div class="single-box">
                        <div class="title-box">
                            <h3>약국 상세</h3>
                        </div>
                        <div class="inner-box">
                              <div class="row clearfix">
                                  <div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                      <label>약국 소개</label>
                                      <textarea id="profileContents" name="profileContents" placeholder="약국의 대한 간단한 소개를 적어주세요." >${profile.profileContents}</textarea>
                                  </div>
                                  <div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                      <label>영업 시간</label>
                                      <div class="row openHour"><input type="hidden" id="timeHidden" value="${profile.openHours}">
                                     	   <div class="col-lg-2 col-md-6 col-sm-12 form-group">
                                               <label>&nbsp;&nbsp;&nbsp;</label>
                                               <label><input type="checkbox" id="mon" name="is_check" value="mon" >월요일</label>
                                           </div>
                                           <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                               <label>오픈 시간</label>
                                               <input type="text" id="mon_open" name="open" placeholder="ex) AM 09:00">
                                           </div>
                                           <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                               <label>마감 시간</label>
                                               <input type="text" id="mon_close" name="close" placeholder="ex) PM 06:00">
                                           </div>
                                     		<div class="col-lg-4 col-md-6 col-sm-12 form-group">
                                           </div>
                                           <div class="col-lg-2 col-md-6 col-sm-12 form-group">
                                               <label><input type="checkbox" id="tue" name="is_check" value="tue">화요일</label>
                                           </div>
                                           <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                               <input type="text" id="tue_open" name="tue_open" placeholder="ex) AM 09:00">
                                           </div>
                                           <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                               <input type="text" id="tue_close" name="tue_close" placeholder="ex) PM 06:00">
                                           </div>
                                     		<div class="col-lg-4 col-md-6 col-sm-12 form-group">
                                           </div>
                                           <div class="col-lg-2 col-md-6 col-sm-12 form-group">
                                               <label><input type="checkbox" id="wen" name="is_check" value="wen">수요일</label>
                                           </div>
                                           <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                               <input type="text" id="wen_open" name="wen_open" placeholder="ex) AM 09:00">
                                           </div>
                                           <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                               <input type="text" id="wen_close" name="wen_close" placeholder="ex) PM 06:00">
                                           </div>
                                     		<div class="col-lg-4 col-md-6 col-sm-12 form-group">
                                           </div>
                                           <div class="col-lg-2 col-md-6 col-sm-12 form-group">
                                               <label><input type="checkbox" id="thu" name="is_check" value="thu">목요일</label>
                                           </div>
                                           <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                               <input type="text" id="thu_open" name="thu_open" placeholder="ex) AM 09:00">
                                           </div>
                                           <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                               <input type="text" id="thu_close" name="thu_close" placeholder="ex) PM 06:00">
                                           </div>
                                     		<div class="col-lg-4 col-md-6 col-sm-12 form-group">
                                           </div>
                                           <div class="col-lg-2 col-md-6 col-sm-12 form-group">
                                               <label><input type="checkbox" id="fri" name="is_check" value="fri">금요일</label>
                                           </div>
                                           <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                               <input type="text" id="fri_open" name="fri_open" placeholder="ex) AM 09:00">
                                           </div>
                                           <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                               <input type="text" id="fri_close" name="fri_close" placeholder="ex) PM 06:00">
                                           </div>
                                     		<div class="col-lg-4 col-md-6 col-sm-12 form-group">
                                           </div>
                                           <div class="col-lg-2 col-md-6 col-sm-12 form-group">
                                               <label><input type="checkbox" id="sat" name="is_check" value="sat">토요일</label>
                                           </div>
                                           <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                               <input type="text" id="sat_open" name="sat_open" placeholder="ex) AM 09:00">
                                           </div>
                                           <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                               <input type="text" id="sat_close" name="sat_close" placeholder="ex) PM 06:00">
                                           </div>
                                     		<div class="col-lg-4 col-md-6 col-sm-12 form-group">
                                           </div>
                                           <div class="col-lg-2 col-md-6 col-sm-12 form-group">
                                               <label><input type="checkbox" id="sun" name="is_check" value="sun" >일요일</label>
                                           </div>
                                           <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                               <input type="text" id="sun_open" name="sun_open" placeholder="ex) AM 09:00">
                                           </div>
                                           <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                               <input type="text" id="sun_close" name="sun_close" placeholder="ex) PM 06:00">
                                           </div>
                                     		<div class="col-lg-4 col-md-6 col-sm-12 form-group">
                                           </div>
                                      </div>
                                  </div>
                              </div>
                        </div>
                    </div>
                    <div class="single-box">
                        <div class="title-box">
                            <h3>약국 주소</h3>
                        </div>
                        <div class="inner-box">
                            <div class="row clearfix">
								<div class="col-lg-6 col-md-6 col-sm-12 form-group">
									<input type="hidden" id="confmKey" name="confmKey" value="" >
									<input type="text" class="form-control form-control-user"
										id="postcode" name="pharmacyPostCode" placeholder="우편번호" readonly value="${profile.pharmacyPostCode}">
								</div>
	                           	<div class="col-lg-6 col-md-12 col-sm-12 form-group" >
									<button type="button" onclick="execDaumPostcode();" class="theme-btn-one" style=" float:right;padding:9px 30px; ">
										주소검색</button>
								</div>
								<div class="col-lg-12 col-md-12 col-sm-12 form-group">
									<input type="text" class="form-control" id="addr1"
										name="deliveryArea" placeholder="주소" value="${profile.deliveryArea}">
								</div>
								<div class="col-lg-6 col-md-6 col-sm-12 form-group">
									<input type="text" class="form-control" id="addr2"
									name="deliveryArea3" placeholder="상세주소" value="${profile.deliveryArea3}">
								</div>
								
								<div class="col-lg-6 col-md-6 col-sm-12 form-group">
									<input type="text" class="form-control" id="addr3"
										name="deliveryArea2" placeholder="참고항목" value="${profile.deliveryArea2}">
								</div>
                        	</div>
                    	</div>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                    </form>
                    <div class="btn-box d-flex flex-row-reverse">
                        <button id="insertResetBtn" class="cancel-btn">Cancel</button>
                        <button id="btnRegister" class="theme-btn-one">등록하기<i class="icon-Arrow-Right"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- doctors-dashboard -->
        
<script>
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
}// 주소 api 끝

/* 페이지 로드 이벤트 */
$(function(){
	
	$("#logoutBtn1").on("click", function(){
		$('#logOutfrm1').submit();
	});
	
	
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	// 오픈시간 체크
	var timeCheck = $("#timeHidden").val();
	if(timeCheck != ""){
	var array = timeCheck.split(",");
		for (var i=0; i< array.length-1; i++){
			var str = array[i];
			console.log (str);
			if (str.includes("월")){
				$("#mon").prop("checked",true);
				str = str.slice(1);
				var arr = str.split("-");
				$("#mon_open").val(arr[0]);
				$("#mon_close").val(arr[1]);
			}else if (str.includes("화")){
				$("#tue").prop("checked",true);
				str = str.slice(1);
				var arr = str.split("-");
				$("#tue_open").val(arr[0]);
				$("#tue_close").val(arr[1]);
			}else if (str.includes("수")){
				$("#wen").prop("checked",true);
				str = str.slice(1);
				var arr = str.split("-");
				$("#wen_open").val(arr[0]);
				$("#wen_close").val(arr[1]);
			}else if (str.includes("목")){
				$("#thu").prop("checked",true);
				str = str.slice(1);
				var arr = str.split("-");
				$("#thu_open").val(arr[0]);
				$("#thu_close").val(arr[1]);
			}else if (str.includes("금")){
				$("#fri").prop("checked",true);
				str = str.slice(1);
				var arr = str.split("-");
				$("#fri_open").val(arr[0]);
				$("#fri_close").val(arr[1]);
			}else if (str.includes("토")){
				$("#sat").prop("checked",true);
				str = str.slice(1);
				var arr = str.split("-");
				$("#sat_open").val(arr[0]);
				$("#sat_close").val(arr[1]);
			}else if (str.includes("일")){
				$("#sun").prop("checked",true);
				str = str.slice(1);
				var arr = str.split("-");
				$("#sun_open").val(arr[0]);
				$("#sun_close").val(arr[1]);
			}else {}
		}
	}
   
	//s:1006 폼 전체 취소 버튼 누르면 의사메인으로 돌아가도록
	$('#insertResetBtn').on('click', function(){
		alert("취소하겠습니까? 약국 대시보드 메인으로 돌아갑니닷!");
		document.location.href="${pageContext.request.contextPath}/pharmacy/pharmacyDash"
	})//End of 폼 전체 취소 버튼 누르면 의사메인으로 돌아가도록
	
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
	const profileImg =document.getElementById('profileImg');

	
	input.addEventListener('change', function() {
	  const files = this.files || [];

	  if (!files.length) return;
	  
	  const reader = new FileReader();

	  reader.onload = function (e) {
		profileImg.setAttribute('src', e.target.result);
	  };
	  
	  reader.onprogress = function (e) {
	    console.log('progress: ', Math.round((e.loaded * 100) / e.total));
	  };
	  
	  reader.readAsDataURL(files[0]);
	}); // 사진 미리보기
	
	
	
	//imgUpBtn 눌렀을 때 이벤트 설정 교재502페이지 --> 의사프로필사진 넣는거
	$('#imgUpBtn').on("click", function(e){
		e.preventDefault();
		
		var formData = new FormData(document.docProInsertFrm);
		console.log("formData writer+content: "+ FormData)
		var inputFile = $("[name='docProImgFile']");
		var files = inputFile[0].files;
		console.log(files);
		
		for(var i=0; i<files.length; i++){
			if(!checkExtension( files[i].name, files[i].size) ){
				return;
			}
			formData.append("uploadFile", files[i]);
		}
			
		
		console.log("formData file: "+ formData)
		$.ajax({
			url:'phaAjaxInsert',
			processData:false,
			contentType:false,
			data: formData,
			method:'POST',
			beforeSend : function(xhr) {
				console.log(csrfHeaderName + " and " + csrfTokenValue);
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					//xhr.setRequestHeader("aa", "bb");
			},
			success:function(datas){
				console.log(datas);
				var str="";
				
					var fileCallPath =  encodeURIComponent( datas.uploadPath+"/"+ datas.uuid +"_"+datas.pimgName);			      
				    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
					str += "<li ";
					str += "data-path='"+datas.uploadPath+"' data-uuid='"+datas.uuid+"' data-pimgName='"+datas.pimgName+"' data-type='"+datas.image+"' ><div>";
					str += "<span> "+ datas.pimgName+"</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
					str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "</div>";
					str +="</li>";
								
				$("#uploaded").html(str);
				alert("file uploaded");
			
			},
			error: function(reject){
				console.error(reject);
			}
		})
	}); //end of meditUpBtn event
	
	//btnRegister event  textbook 564page
	$("#btnRegister").on('click', function(e){
		var openHours = "";
		$("input[name=is_check]:checked").each(function(){
			var chk = $(this).val();
			if(chk == "mon"){
				openHours += "월 "+ $("#mon_open").val() + " - " + $("#mon_close").val() ; 
			}else if(chk == "tue"){
				openHours += "화 "+ $("#tue_open").val() + " - " + $("#tue_close").val() ; 
			}else if(chk == "wen"){
				openHours += "수 "+ $("#wen_open").val() + " - " + $("#wen_close").val() ; 
			}else if(chk == "thu"){
				openHours += "목 "+ $("#thu_open").val() + " - " + $("#thu_close").val() ; 
			}else if(chk == "fri"){
				openHours += "금 "+ $("#fri_open").val() + " - " + $("#fri_close").val() ; 
			}else if(chk == "sat"){
				openHours += "토 "+ $("#sat_open").val() + " - " + $("#sat_close").val() ; 
			}else if(chk == "sun"){
				openHours += "일 "+ $("#sun_open").val() + " - " + $("#sun_close").val(); 
			}else {	}
			openHours += " ,";
		});
		var str = "";
		var li = $("#uploaded li");
			str += "<input type='hidden' name='attachFile.pImgName' value='"+li.data("pimgname")+"'>";
		    str += "<input type='hidden' name='attachFile.uuid' value='"+li.data("uuid")+"'>";
		    str += "<input type='hidden' name='attachFile.uploadPath' value='"+li.data("path")+"'>";
		    str += "<input type='hidden' name='profilePhoto'  value='"+li.data("uuid")+"'>";
		    str += "<input type='hidden' name='openHours'  value='"+ openHours +"'>";
		    
		$("#phaInsertFrm").append(str);
		
		

		
		alert("프로필 등록이 완료되었습니다.")
		$("#phaInsertFrm").submit();
		
	});//end of btnRegister event
	
	//attachment btn delete event
	$("#uploaded").on("click", "button", function(e){
		if(confirm("파일을 삭제하시겠습니까?")){
			var targetLi = $(this).closest("li");
			var preview = $('#profileImg');
			targetLi.remove();
			//이거 왜 안돼 ㅠㅠ 첨부파일 x 누르면 사진도 사라져야 하는데 그대로 있네유
			$(preview).removeAttr('src');
			
		}
	});//end of attachment btn delete event
	
	
	
});/* 페이지로드이벤트 끝 */
</script>

