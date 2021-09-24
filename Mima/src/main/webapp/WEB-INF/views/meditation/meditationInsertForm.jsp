<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>	


<!-- page wrapper -->
<body>

    <div class="boxed_wrapper">

        <!-- preloader -->
        <div class="preloader"></div>
        <!-- preloader -->

        
		<!--Page Title-->
        <section class="page-title centred bg-color-1">
            <div class="pattern-layer">
                <div class="pattern-1" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-70.png);"></div>
                <div class="pattern-2" style="background-image: url(${pageContext.request.contextPath}/resources/assets/images/shape/shape-71.png);"></div>
            </div>
            <div class="auto-container">
                <div class="content-box">
                    <div class="title">
                        <h1>명상 컨텐츠 등록</h1>
                    </div>
                    <ul class="bread-crumb clearfix">
                        <li><a href="index.html">Home</a></li>
                        <li>명상 등록 폼</li>
                    </ul>
                </div>
            </div>
        </section>
        <!--End Page Title-->

        <!-- doctors-dashboard -->
        <section class="doctors-dashboard bg-color-3">
            <div class="content-container row">
                    <div class="outer-container col-lg-8 col-md-8" style="float: none; margin:0 auto;">
                        <div class="add-listing">
                            <div class="single-box" >
                                <div class="title-box">
                                    <h3>명상등록</h3>
                                </div>
                                <div class="row clearfix">
                                    <div class="inner-box">
                                        <form action="register" method="post" id="meditInsertFrm">
                                            <div class="row clearfix">
                                            <!-- 명상 컨텐츠 입력 -->
                                            	<div class="col-lg-12 col-md-12 col-sm-12 form-group ">
                                            	<label style="font-size:20px">Category</label>
                                            	</div>
                                            	<div class="col-lg-12 col-md-12 col-sm-12 form-group ">
                                            	<div class="d-flex justify-content-around">
                                                    <div class="">
                                                    <label><input type="radio" name="category" id="emotion"><span>&nbsp;</span> Emotion</label>
                                       				</div>
                                       				<div class="single-checkbox">
                                                    <label><input type="radio" name="category" id="anger"><span>&nbsp;</span> Anger</label>
                                       				</div>
                                       				<div class="single-checkbox">
                                                    <label ><input type="radio" name="category" id="addit"><span>&nbsp;</span> Addiction</label>
                                       				</div>
                                       				<div class="single-checkbox">
                                                    <label ><input type="radio" name="category" id="relation"><span>&nbsp;</span> Relation</label>
                                       				</div>
                                       				<div class="single-checkbox">
                                                    <label ><input type="radio" name="category" id="sleep"><span>&nbsp;</span> Sleep</label>
                                       				</div>
                                       				<div class="single-checkbox">
                                                    <label ><input type="radio" name="category" id="stress"><span>&nbsp;</span> Stress</label>
                                       				</div>
                                       			</div>	
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                    <label>Title</label>
                                                    <input type="text" name="title" id="title" placeholder="명상 제목을 입력하세요" required>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-12"></div>
                                                
                                                <div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                                    <label>About this meditation...</label>
                                                    <textarea id="contents" name="contents" placeholder="명상 정보를 입력해 주세요"></textarea>
                                                    
                                                </div>
                                                
                                                <!-- 영상?? 미리보기 부분 -->
												<div class="uploadResult"></div>
												
												 <!-- 영상 업로드 Ajax -->
                                                <div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                                    <label>Upload the meditation file</label>
                                                    <input type="file" name="meditVFile" required>
                                                    <button id="meditUpBtn" class="btn btn-outline-info btn-small">등록</button>
                                                </div>
                                                
                                                
                                                 <!-- end of 명상 컨텐츠 입력 -->
                                                 
                                                <!-- 줄 구분 근데 안나와...-->
                                                <div class="col-lg-12 col-md-12 col-sm-12 form-group ">
                                                <div style="borderBottom: 1px solid #e5eded;"></div>
                                                </div>
                                                
                                               
                                                <!-- 명상가 정보입력 -->
                                                <div class="col-lg-12 col-md-12 col-sm-12 form-group ">
                                            	<label style="font-size:20px">Facilitator Information</label>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                    <label>Name</label>
                                                    <input type="text" name="teacherName" id="teacherName" placeholder="명상 제목을 입력하세요" required>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-12"></div>
                                                
                                                <div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                                    <label>About..</label>
                                                    <textarea id="teacherInfo" name="teacherInfo" placeholder="Write your not..."></textarea>
                                                </div>
                                                <!-- 명상가 사진 업로드 ajax -->       
                                                <div class="col-lg-6 col-md-12 col-sm-12 form-group">
                                                    <label>Upload the profile photo</label>
                                                    <input type="file" name="teacherPhoto">
                                                    <button id="facilPhotoUpBtn" class="btn btn-outline-info btn-small">등록</button>
                                                </div>
                                                <!--end of 명상가 정보입력 -->
                                                
                                                
                                            </div>
                                        </form>
                                        <div>
											<ul id="uploaded"></ul>
										</div>
                                    </div>
                                </div>
                            </div>
                            <div class="btn-box" style="float:right">
                                <button id="insertFrmBtn" type="button" class="theme-btn-one">Save Change<i class="icon-Arrow-Right"></i></button>
                                <button id="insertResetBtn" type="button" class="cancel-btn">Cancel</button>
                            </div>
                        </div>
                    </div>
                </div>
        </section>
        <!-- doctors-dashboard -->
    </div>
 
<script>
/* 페이지 로드 이벤트 */
$(function(){
	
	$('#insertResetBtn').on('click', function(){
		$('#meditInsertFrm').reset();
	})
	
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
	
	//meditUpBtn 눌렀을 때 이벤트 설정 교재502페이지
	$('#meditUpBtn').on("click", function(e){
		e.preventDefault();
		//console.log(document.meditInsertFrm);
		var formData = new FormData(document.meditInsertFrm);
		console.log("formData writer+content: "+ FormData)
		var inputFile = $("[name='meditVFile']");
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
			url:'meditAjaxInsert',
			processData:false,
			contentType:false,
			data: formData,
			method:'POST',
			success:function(datas){
				console.log(datas);
				console.log(${insertedVo})
				var str="";
				for(i=0;i<datas.length;i++){
					var obj=datas[i]
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
		$("#uploaded li").each(function(idx, obj){
			var jobj = $(obj); //제이쿼리 객체로 변환시켜주자.
			str += "<input type='hidden' name='attachList["+idx+"].fileName' value='"+jobj.data("filename")+"'>";
		    str += "<input type='hidden' name='attachList["+idx+"].uuid' value='"+jobj.data("uuid")+"'>";
		    str += "<input type='hidden' name='attachList["+idx+"].uploadPath' value='"+jobj.data("path")+"'>";
		    str += "<input type='hidden' name='attachList["+idx+"].fileType' value='1'>"; //"+ jobj.data("type")+" 벨류안에 불린이어야하는데 지금 이거 안들어가서 오류
		});
		$("#meditInsertFrm").append(str).submit();
		
	});//end of btnRegister event
	
	//attachment btn delete event
	$("#uploaded").on("click", "button", function(e){
		if(confirm("Remove this file?")){
			var targetLi = $(this).closest("li");
			targetLi.remove();
		}
	});//end of attachment btn delete event
	
	
	
});/* 페이지로드이벤트 끝 */
</script>

