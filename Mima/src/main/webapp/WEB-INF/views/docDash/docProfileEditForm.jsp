<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
<style>
.good-date {
	height: 44px;
    border: 1px solid #e5eded !important;
    border-radius: 10px;
    padding: 24px 20px;
    color: #061a3a;
    font-size: 14px;
    font-weight: 500;
}
</style>
 <!-- s:1005 의사 프로파일 인서트 폼 -->
   <div class="boxed_wrapper">

        <!-- preloader -->
        <div class="preloader"></div>
        <!-- preloader -->

        <!--page-title-two-->
        <section class="page-title-two">
            <div class="title-box centred bg-color-2">
                <div class="pattern-layer">
                    <div class="pattern-1" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-70.png);"></div>
                    <div class="pattern-2" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-71.png);"></div>
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
                    <!-- s:1022 의사 왼쪽 프로필사진 세션에서 가져오는것-->
                        <figure class="image-box profile-image">
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
                              
                                <h3>${session.name}</h3>

                                <p>${doc.clinicInfo }</p>
                            </div>
                        </div>
                    </div>
                    <div class="profile-info">
                        <ul class="list clearfix">
			                <li><a href="docMain"><i class="fas fa-columns"></i>대쉬보드</a></li>
			                <li><a href="apptManage"><i class="fas fa-clock"></i>예약관리</a></li>
			                <li><a href="apptHistory"><i class="fas fa-calendar-alt"></i>진료내역</a></li>
			                <li><a href="patientList"><i class="fas fa-wheelchair"></i>나의 환자들</a></li>
			                <li><a href="docReview"><i class="fas fa-star"></i>나의 후기</a></li>
			                <li><a href="docQna"><i class="fas fa-comments"></i>나의 문의</a></li>
			                <li><a href="docProfileInsertForm" class="current"><i class="fas fa-user"></i>프로필 관리</a></li>
			                <li><a href="docProfileForm"><i class="fas fa-stethoscope"></i>진료관리</a></li>
			                <li><a href="docPwChangeForm"><i class="fas fa-unlock-alt"></i>비밀번호 변경</a></li>
			                <li><a href="login.html"><i class="fas fa-sign-out-alt"></i>로그아웃</a></li>
			            </ul>
                    </div>
                </div>
            </div>
            
            <div class="right-panel">
                <div class="content-container">
                    <div class="outer-container">
                        <div class="add-listing my-profile">
                           <form id="docProInsertFrm" method="post"  action="register">
                           		<input type="hidden" id="memberNo" name="memberNo" value="${session.memberNo }">
	                            <div class="single-box">
	                                <div class="title-box">
	                                    <h3>나의 정보</h3>
	                                </div>
	                                <div class="inner-box">
	                                
		                                    <div class="profile-title">
		                                    <!-- 여기 프로필 사진 보여주기 하면 됨 -->
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
	                                                <label>병원 이름</label>
	                                                <input type="text" id="clinicInfo" name="clinicInfo" value="${doc.clinicInfo }" required="">
	                                            </div>
	                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
	                                            </div>
	                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
	                                                <label>병원 이메일</label>
	                                                <input type="email" id="clinicEmail" name="clinicEmail" value="${doc.clinicEmail }" required="">
	                                            </div>
	                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
	                                                <label>병원 전화번호</label>
	                                                <input type="text" id="clinicPhone" name="clinicPhone" value="${doc.clinicPhone }" required="">
	                                            </div>
	                                        </div>
	                                </div>
	                            </div>
	                           
	                            <div class="single-box">
	                                <div class="title-box">
	                                    <h3>병원 연락처 상세</h3>
	                                </div>
	                                <div class="inner-box">
	                                        <div class="row clearfix">
												<div class="col-lg-6 col-md-6 col-sm-12 form-group">
													<input type="hidden" id="confmKey" name="confmKey" value="" >
													<input type="text" class="form-control form-control-user"
														id="postcode" name="postcode" placeholder="${doc.postcode }" readonly>
												</div>
		                                        <div class="col-lg-6 col-md-12 col-sm-12 form-group" >
													<button type="button" onclick="execDaumPostcode();" class="theme-btn-one" style=" float:right;padding:9px 30px; ">
														주소검색</button>
												</div>
												
												<div class="col-lg-12 col-md-12 col-sm-12 form-group">
													<input type="text" class="form-control" id="addr1"
														name="addr1" value="${doc.addr1 }">
												</div>
												<div class="col-lg-6 col-md-6 col-sm-12 form-group">
													<input type="text" class="form-control" id="addr2"
													name="addr2" value="${doc.addr2 }">
												</div>
												
												<div class="col-lg-6 col-md-6 col-sm-12 form-group">
													<input type="text" class="form-control" id="addr3"
														name="addr3" value="${doc.addr3 }">
												</div>
	                                        </div>
	                                </div>
	                            </div>
	                            <div class="single-box">
	                                <div class="title-box">
	                                    <h3>Education</h3>
	                                </div>
	                                <!--s:1006 여기는 보의 리스트?를 보내서 그걸 입력하는 매퍼를 따로 만들어서 돌려야 할거 같은디요? -->
	                                <div class="inner-box">
	                                        <div class="row clearfix" id="education">
	                                        <!-- 학위1 -->
	                                            <div class="col-lg-4 col-md-6 col-sm-12 form-group">
	                                                <label>Degree</label>
	                                                <input type="text" id="degree" name="degree" required="">
	                                            </div>
	                                            <div class="col-lg-4 col-md-6 col-sm-12 form-group">
	                                                <label>Institute</label>
	                                                <input type="text" id="institute" name="institute" required="">
	                                            </div>
	                                            <div class="col-lg-4 col-md-6 col-sm-12 form-group">
	                                                <label>Passing year</label>
	                                                <input type="date" id="degree1Year" name="degree1Year" required="">
	                                            </div>
	                                             <!-- 학위2 -->
	                                           <div class="col-lg-4 col-md-6 col-sm-12 form-group">
	                                                <label>Degree</label>
	                                                <input type="text" id="degree2" name="degree2" required="">
	                                            </div>
	                                            <div class="col-lg-4 col-md-6 col-sm-12 form-group">
	                                                <label>Institute</label>
	                                                <input type="text" id="institute2" name="institute2"  required="">
	                                            </div>
	                                            <div class="col-lg-4 col-md-6 col-sm-12 form-group">
	                                                <label>Passing year</label>
	                                                <input type="date" id="degree2Year" name="degree2Year" required="">
	                                            </div>
	                                             <!-- 학위3 -->
	                                            <div class="col-lg-4 col-md-6 col-sm-12 form-group">
	                                                <label>Degree</label>
	                                                <input type="text" id="degree3" name="degree3" required="">
	                                            </div>
	                                            <div class="col-lg-4 col-md-6 col-sm-12 form-group">
	                                                <label>Institute</label>
	                                                <input type="text" id="institute3" name="institute3" required="">
	                                            </div>
	                                            <div class="col-lg-4 col-md-6 col-sm-12 form-group">
	                                                <label>Passing year</label>
	                                                <input type="date" id="degree3Year" name="degree3Year" required="">
	                                            </div>
	                                        </div>
	                                </div>
	                            </div>
	                            <div class="single-box">
	                                <div class="title-box">
	                                    <h3>Experience</h3>
	                                </div>
	                                
									<div class="inner-box">
										<div class="row clearfix" id="addEpxDiv">
											<!-- 경력1 -->
											
											<c:forEach var="exp" items="${expList }">
                                            <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                                <label>병원이름</label>
                                                <input type="text" id="title" name="title" value="${exp.title}" required="required">
                                            </div>
                                            <div class="col-lg-3 col-md-6 col-sm-12 form-group">
                                                <label>직위</label>
                                                <input type="text" id="detail" name="detail" value="${exp.detail }"required="required">
                                            </div>
                                            <div class="col-lg-2 col-md-6 col-sm-12 form-group">
                                                <label>언제부터</label>
                                                <input type="date" class="good-date" id="fromDate" name="fromDate" value="${exp.fromDate }" required="required" style="cursor:pointer">
                                            </div>
                                            <div class="col-lg-2 col-md-6 col-sm-12 form-group">
                                                <label>언제까지</label>
                                                <input type="date" class="good-date" id="toDate" name="toDate" required="required" value="${exp.toDate }"  style="cursor:pointer">
                                            </div>
                                            <div class="col-lg-2 col-md-6 col-sm-12 form-group mt-4">
                                            	<button id="insert" name="insert" class="theme-btn-one mt-3" style="padding:9px 30px; box-shadow: none;">등록</button>
                                            	<button id="delete" name="delete" class="theme-btn-one mt-3" style="padding:9px 30px; box-shadow: none;">삭제</button>
                                            </div>
                                            </c:forEach>
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
	                                                <label>자기소개</label>
	                                                <textarea id="profileContents" name="profileContents" placeholder="전문분야와 경력 등 상세히 알려주세요.">${doc.profileContents }</textarea>
	                                            </div>
	                                        </div>
	                                </div>
	                            </div>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                            </form>
                            <div class="btn-box d-flex flex-row-reverse">
                                <button  class="cancel-btn">확인</button>
                                <button id="btnRegister" class="theme-btn-one">수정하기<i class="icon-Arrow-Right"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- doctors-dashboard -->

    </div>
    
    
    <script>
    
 // 주소 API 연결 s:1005
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

    	//경력 날짜 입력... s:1017
      	var fromD1 = "${expList[0].fromDate}";
      	var toD1 =  "${expList[0].toDate}";
      	var fromD2 = "${expList[1].fromDate}";
      	var toD2 =  "${expList[1].toDate}";
      	var fromD3 = "${expList[2].fromDate}";
      	var toD3 =  "${expList[2].toDate}";
		
      	var strArr = fromD1.split(' ');
      	fromD1 = strArr[5]+"/"+strArr[1]+"/"+strArr[2];
      	
      	strArr = toD1.split(' ');
      	toD1 = strArr[5]+"/"+strArr[1]+"/"+strArr[2];
      	
      	strArr = fromD2.split(' ');
      	frofromD2mD1 = strArr[5]+"/"+strArr[1]+"/"+strArr[2];
      	
      	strArr = toD2.split(' ');
      	frotoD2mD1 = strArr[5]+"/"+strArr[1]+"/"+strArr[2];
      	
      	strArr = fromD3.split(' ');
      	frofromD3mD1 = strArr[5]+"/"+strArr[1]+"/"+strArr[2];
      	
      	strArr = toD3.split(' ');
      	toD3 = strArr[5]+"/"+strArr[1]+"/"+strArr[2];
      	
      //경력 날짜 입력... s:1017 아니 이래도 근데 forEach라서 못넣겠어 ㅠㅠ
      	
      	
      	var empListVo = "<c:out value='${sub}'/>";
	
      
      
      
      
      
      
      
    	var csrfHeaderName = "${_csrf.headerName}";
    	var csrfTokenValue = "${_csrf.token}";
  
   		//s:1016 확인 버튼 누르면 의사메인으로 돌아가도록
    	$('#insertResetBtn').on('click', function(){
    		document.location.href="${pageContext.request.contextPath}/docDash/docMain"
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
    	//var videoSource=document.createElement('source');
    	//videoSource.setAttribute('src', "c:upload/"+datas.uuid+datas.vfileName);
    	
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
    	});//End of 비디오 미리보기
    	
    	
    	
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
    			url:'docAjaxInsert',
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
    		var str = "";
    		var li = $("#uploaded li");
    			str += "<input type='hidden' name='attachFile.pImgName' value='"+li.data("pimgname")+"'>";
    		    str += "<input type='hidden' name='attachFile.uuid' value='"+li.data("uuid")+"'>";
    		    str += "<input type='hidden' name='attachFile.uploadPath' value='"+li.data("path")+"'>";
    		    str += "<input type='hidden' name='profilePhoto'  value='"+li.data("uuid")+"'>";
    		    
    		let education =$('#degree').val()+' '+$('#institute').val()+' '+$('#degree1Year').val()+" ";
    		education +=$('#degree2').val()+' '+$('#institute2').val()+' '+$('#degree2Year').val()+" ";
    		education +=$('#degree3').val()+' '+$('#institute3').val()+' '+$('#degree3Year').val();
    		
    		let edu="";
    		var eduList=$('#education');
    			edu+="<input type='hidden' name='profileEducation' id='profileEducation' value='"+education+"'>";
    		
    		$(eduList).append(edu);
    		$("#docProInsertFrm").append(str);
    		alert("프로필 등록이 완료되었습니다.")
    		//$("#docProInsertFrm").submit();
    		
    	});//end of btnRegister event
    	
    	//attachment btn delete event
    	$("#uploaded").on("click", "button", function(e){
    		if(confirm("Remove this file?")){
    			var targetLi = $(this).closest("li");
    			var preview=$('#profileImg');
    			targetLi.remove();
    			//이거 왜 안돼 ㅠㅠ 첨부파일 x 누르면 사진도 사라져야 하는데 그대로 있네유
    			$(preview).removeAttr('src');
    			$(preview).attr('src', "${pageContext.request.contextPath}/resources/assets/images/resource/profile-3.png");
    			
    		}
    	});//end of attachment btn delete event
    	
    	$('#insert').on('click', function() {
    		var title = $('#title').val();
    		var detail = $('#detail').val();
    		var fromDate = $('#fromDate').val();
    		var toDate = $('#toDate').val();
    		var memberNo = ${session.memberNo};
    		
    		$.ajax({
    			url : '',
    			type : 'post',
    			data : {title : title,
    					detail : detail,
    					fromDate : fromDate,
    					toDate : toDate,
    					memberNo : memberNo},
    			success : function(data){
    				console.log(data);
    			},
    			error : function(reject) {
    				console.log(reject);
    			}
    		});
    	});
    	
    	
    });/* 페이지로드이벤트 끝 */
    </script>

    
    