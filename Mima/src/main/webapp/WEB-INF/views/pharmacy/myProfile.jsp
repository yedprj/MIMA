<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<h1>약국 대쉬보드</h1>
			</div>
		</div>
	</div>
	<div class="lower-content">
		<ul class="bread-crumb clearfix">
			<li><a href="${pageContext.request.contextPath}">Home</a></li>
			<li>약국 대쉬보드</li>
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
						<p>Qualitative Pharmacy</p>
					</div>
				</div>
			</div>
			<div class="profile-info">
				<ul class="list clearfix">
					<li><a id="dash" href="${pageContext.request.contextPath}/pharmacy/pharmacyDash"><i
							class="fas fa-columns"></i>대쉬보드</a></li>
					<li><a id="delivery" href="${pageContext.request.contextPath}/pharmacy/medDelivery"><i class="fas fa-ambulance"></i>약배달관리</a></li>
					<li><a id="guid" href="${pageContext.request.contextPath}/pharmacy/medGuid"><i class="fas fa-comment-medical"></i>복약지도관리</a></li>
					<li><a id="revicw" href="${pageContext.request.contextPath}/pharmacy/review"><i class="fas fa-star"></i>약국 후기</a></li>
					<li><a id="ques" href="${pageContext.request.contextPath}/pharmacy/phaQna"><i class="fas fa-comments"></i>문의</a><span>20</span></li>
					<li><a id="profile" href="${pageContext.request.contextPath}/pharmacy/myProfile?memberNo=${session.memberNo}" class="current"><i class="fas fa-user"></i>약국 프로필</a></li>
					<li><a id="pwUpdate" href="${pageContext.request.contextPath}/pharmacy/pwUpdate?memberNo=${session.memberNo}"><i
							class="fas fa-unlock-alt"></i>비밀번호 변경</a></li>
					<li><a id="logout" href="login.html"><i class="fas fa-sign-out-alt"></i>로그아웃</a></li>
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
                                    <figure class="image-box"><img width="300" height="300"  id="profileImg" src="${pageContext.request.contextPath}/assets/images/resource/profile-3.png" alt="프로필 미리보기"></figure>
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
                            <h3>About Me</h3>
                        </div>
                        <div class="inner-box">
                                <div class="row clearfix">
                                    <div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                        <label>약국 소개</label>
                                        <textarea id="profileContents" name="profileContents" placeholder="약국의 대한 간단한 소개를 적어주세요."></textarea>
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
								<div class="col-lg-6 col-md-6 col-sm-12 form-group">
									<input type="hidden" id="confmKey" name="confmKey" value="" >
									<input type="text" class="form-control form-control-user"
										id="postcode" name="postcode" placeholder="우편번호" readonly>
								</div>
	                           	<div class="col-lg-6 col-md-12 col-sm-12 form-group" >
									<button type="button" onclick="execDaumPostcode();" class="theme-btn-one" style=" float:right;padding:9px 30px; ">
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
                        	</div>
                    	</div>
                    </div>
                    <div class="btn-box">
                        <a id="updateBtn" class="theme-btn-one">프로필 수정<i class="icon-Arrow-Right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- doctors-dashboard -->
        
<script>

	// 이미지 파일 넣기 테스트
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
		
				
		$("#uploadBtn").on("click", function(){ //업로드 버튼
			var formData = new FormData(document.frm);

			var inputFile = $("input[name='upLoadFile']");
			var files = inputFile[0].files;
			for(i=0; i<files.length; i++){
				if( !checkExtension(files[i].name, files[i].size) )
					return;				
				formData.append("upLoadFile", files[i]);
			} 
			//formData
			$.ajax({
				processData : false,
				contentType : false,
				url : "../uploadAjaxAction",
				method : "post",
				data : formData ,
				success : function(datas){
					var str = "";
					for(i=0; i<datas.length; i++){
						var obj= datas[i];
						var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
					    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
					      
						str += "<li "
						str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
						str += "<span> "+ obj.fileName+"</span>";
						str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
						str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
						str += "<img src='../resources/img/attach.png'></a>";
						str += "</div>";
						str +"</li>";
						
						
					}
					$("#uploaded").html(str);
					alert("uploaded");
				}
			}) // ajax end
			
			
			
		}); // btn end	




// 파일 이미지 넣기
/* $(document).ready(function(){

    var fileTarget = $('.file-upload .upload-hidden');

    fileTarget.on('change', function(){  // 값이 변경되면
         if(window.FileReader){  // modern browser
              var filename = $(this)[0].files[0].name;
         } 
         else {  // old IE
              var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
         }

         // 추출한 파일명 삽입
         $(this).siblings('.upload-name').val(filename);
    });
}); 

//preview image 
var imgTarget = $('.preview-image .upload-hidden');

imgTarget.on('change', function(){
    var parent = $(this).parent();
    parent.children('.upload-display').remove();

    if(window.FileReader){
         //image 파일만
         if (!$(this)[0].files[0].type.match(/image\//)) return;

         var reader = new FileReader();
         reader.onload = function(e){
              var src = e.target.result;
              //parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
              $(".image-box > img").attr("src",src);
              
         }
         reader.readAsDataURL($(this)[0].files[0]);
    }

    else {
         $(this)[0].select();
         $(this)[0].blur();
         var imgSrc = document.selection.createRange().text;
         parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

         var img = $(this).siblings('.image-box').find('img');
         img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
    }
});
//파일 이미지 넣기 끝 
 */

$(function() {
	var memberNo = ${profile.memberNo};
	
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
		
	// 수정버튼 클릭
	$("#updateBtn").on("click", function(){
		// 수정 ajax 호출
		$.ajax({
			url : "profileUpdate",
			method : "put",
			dataType : "json",
			data : JSON.stringify({
				memberNo : memberNo,
				profilePhoto : $('input[name="pharmacyphoto"]').val(),
				profileContents : $('input[name="profileContents"]').val(),
				pharmacyContact : $('input[name="pharmacyContact"]').val(),
				pharmacyEmail : $('input[name="pharmacyEmail"]').val(),
				deliveryArea : $('input[name="deliveryArea"]').val()
			}),
			contentType : 'application/json',
			success : function(data) {
				alert("프로필 수정이 완료되었습니다.");
			}// success end
		}); //  ajax end
		
		
	}); // updateBtn end
	
}); // $.function end
</script>
