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
<jsp:include page="include/dashHeader.jsp"></jsp:include>    
    
<section class="doctors-dashboard bg-color-3">
	<!-- 사이드 메뉴바 연결 -->
	<jsp:include page="include/sideDash.jsp"></jsp:include>
	
	<div class="right-panel">
        <div class="content-container">
            <div class="outer-container">
                <div class="add-listing my-profile">
                    <div class="single-box">
                        <div class="title-box">
                            <h3>약국 프로필</h3>
                        </div>
                        <div class="inner-box">
                            <div class="profile-title">
                                <figure class="image-box"><img style="height:150px;" src="${pageContext.request.contextPath}/resources/assets/images/resource/profile-3.png" alt=""></figure>
                                <div class="file-upload preview-image">
								    <input type="text" class="upload-name" value="파일선택" disabled="disabled">
								    <label for="input-file">업로드</label> 
								    <input type="file" id="input-file" class="upload-hidden" name="pharmacyphoto"> 
								    <br><span>프로필 이미지를 등록해주세요 ,최대 2MB(JPG, GIF, PNG)</span>
								</div>
								<br> 
								<!-- <div class="form-group">
									<input type="file"  id="upLoadFile" name="upLoadFile" multiple="multiple">
									<button type="button" id="uploadBtn">첨부파일등록</button>
								</div>
								<div class="form-group">
									<label>파일 목록</label> 
									<ul id="uploaded"></ul>
								</div> -->
                            </div>
                                <div class="row clearfix">
                                    <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                        <label><b>약국명</b></label>
                                        <input type="text" name="pharmacyInfo" value="${profile.pharmacyInfo}" >
                                    </div>
                                  
                                    <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                        <label><b>이메일</b></label>
                                        <input type="email" name="pharmacyEmail" value="${profile.pharmacyEmail}">
                                    </div>
                                    
                                    <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                        <label><b>연락처</b></label>
                                        <input type="text" name="pharmacyContact" value="${profile.pharmacyContact}">
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                      <label><b>영업시간</b></label>
                                      <input type="text" name="pharmacy" >
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                      <label><b>약국주소</b></label>
                                      <input type="text" name="deliveryArea" value="${profile.deliveryArea}">
                                  </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                        <label><b>간단 소개글</b></label>
                                        <textarea name="profileContents" placeholder="약국 소개글을 간단하게 입력해주세요"></textarea>
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
// 파일 이미지 넣기
$(document).ready(function(){

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