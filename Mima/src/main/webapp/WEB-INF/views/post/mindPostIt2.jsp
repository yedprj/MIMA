<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
Date nowTime = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
%>


<style>
.team-block-three .inner-box .image-box .textBox {
	position: absolute;
	left: 1px;
	display: inline-block;
	width: 100%;
	height: 100%;
	line-height: 100%;
	text-align: center;
	z-index: 0.5;
}

.team-block-three .inner-box .image-box .textBox div {
	position: relative;
	display: inline-block;
	padding: 0 50px;
	top: 45%;
	text-align: center;
	z-index: 1;
}

.clinic-section {
	padding: 20px 0px 20px 0px;
}

.team-block-three .inner-box {
	box-shadow: none;
}
.modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 2; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
    
 /* Modal Content/Box */
 .modal-content {
     background-color: #fefefe;
     margin: 15% auto; /* 15% from the top and centered */
     padding: 20px;
     border: 1px solid #888;
     width: 400px; /* Could be more or less, depending on screen size */
     height : 40%;
     box-sizing: none;                          
 }

.accept {
	position: relative;
    display: inline-block;
    font-size: 15px;
    font-weight: 500;
    line-height: 20px;
    padding: 9px 20px;
    background: #ebfaf8;
    border-radius: 25px;
    float: right;
    margin-right: 10px;
    color: #39cabb;
}

.cancel {
	position: relative;
    display: inline-block;
    font-size: 15px;
    font-weight: 500;
    line-height: 20px;
    padding: 9px 21.5px;
    background: #ffeeec;
    border-radius: 25px;
    margin-right: 30px 10px;
    color: #fe5948;
}

.pallet{
  width: 295px;
  height: 250px;

}
.active{
  outline: 1px solid black;
}
.colorBox{
  width: 20px;
  height: 20px;
  float: left;
  margin: 1px 1px 0px 0px;
  cursor: pointer;
}


</style>

<div class="boxed_wrapper">






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
					<h1>그린 포스트잇</h1>
				</div>
			</div>
		</div>
		<div class="lower-content">
			<div class="auto-container">
				<ul class="bread-crumb clearfix">
					<li><a href="index.html">Home</a></li>
					<li>그린 포스트잇</li>
				</ul>
			</div>
		</div>
	</section>
	<!--page-title-two end-->


	<div class="select-field bg-color-3">
		<div class="auto-container">
			<div class="row clearfix">
				<div class="col-lg-12 col-md-12 col-sm-12 content-side">
					<div class="item-shorting clearfix">
						<div class="left-column pull-left">
							<h3>오늘 하루는 어땠나요? 😃</h3>
						</div>
						<div class="right-column pull-right clearfix">
							<div class="short-box clearfix">
								<div class="select-box">
									<p><%=sf.format(nowTime)%></p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- clinic-section -->
	<section class="clinic-section">
		<div class="auto-container">
			<div class="row clearfix">
				<div class="col-lg-12 col-md-12 col-sm-12 content-side">
					<!-- 리스트 출력 방식  -->
					<div class="content-box clearfix">
						<ul class="select-box ">
							<li>
								<div class="single-checkbox">
									<input type="radio" name="check-box" id="check1"> <label
										for="check1"><span></span>Latest</label>
								</div>
							</li>
							<li>
								<div class="single-checkbox">
									<input type="radio" name="check-box" id="check2"> <label
										for="check2"><span></span>Random</label>
								</div>
							</li>
						</ul>
						<!-- 등록버튼 -->
						<div class="right-column pull-right clearfix">
							<div class="btn-box">
								<a class="theme-btn-one" id="insertBtn"> <i
									class="icon-image" ></i> 등록
								</a>
							</div>
						</div>
					</div>

					<br>
					<div class="wrapper grid">

						<div class="clinic-grid-content grid-item">
							<div class="row clearfix postContents">
								<!-- 메모 내용 -->							

							</div>
						</div>
					</div>
					<div></div>
					<div class="pagination-wrapper">
						<ul class="pagination">
							<li><a href="clinic-1.html" class="current">1</a></li>
							<li><a href="clinic-1.html">2</a></li>
							<li><a href="clinic-1.html">3</a></li>
							<li><a href="clinic-1.html"><i class="icon-Arrow-Right"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- clinic-section end -->
	
	<!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div id="box" class="modal-content box">
          <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 16pt;">포스트잇 등록</span></b></span></p>
          <form name="insert" style="padding-bottom: 10px;padding-top: 10px; height:200px;">
          <textarea id="contents" name="contents" style="background-color:transparent; line-height: 1.5; width:100%; height:170px;"></textarea><br />
          </form>
          <div style="cursor:pointer; flex-direction: none;">
          	  <span id="palletBox" class="pallet"></span>
              <span class="accept insertBtn" style="float:right;" ><i class="fas fa-check"></i></span>
              <span class="cancel closeBtn" style="float:right;"><i class="fas fa-times"></i></span>
          </div>  
      </div>
 
    </div>
        <!--End Modal-->





	<!--Scroll to top-->
	<button class="scroll-top scroll-to-target" data-target="html">
		<span class="fa fa-arrow-up"></span>
	</button>
</div>

<script>
	$(function() {
		

		postList();

		// 모달창 띄우기
		$("#insertBtn").on("click", function (){
			$('#myModal').show();
			
			insert.contents.focus();
			
			$(".closeBtn").on("click", function () {
	            $('#myModal').hide();
	            modalReset();
	       	});

		})// 모달창 버튼 end
		
		postInsert(); // 등록
		

	}); //end
	
	
	function modalReset(){
		$("#contents").val("");
		$("#box").css("background-color","#fff");
	}
	
	
	// 등록
	function postInsert() {
		$(".insertBtn").on("click", function(){
			if($("#contents").val() == ""){
				alert("내용을 입력하세요!")
				return;
			}			
			$.ajax({
				url : "postInsert",
				method : "post",
				dataType : "json",
				data : JSON.stringify({
					memberNo : "29",
					contents : $("#contents").val(),
					postColor : $(".pallet").find(".active").data("img")
				}),
				contentType: 'application/json', 
				success : function(data){
					postList();
					$('#myModal').hide();
					modalReset();
				},// success end
				error : function(xhr, status, message) { 
			        alert(xhr+" status: "+status+" er:"+message);
			    } 
			}) 	//ajax end	
		})
	} //등록 end
	
	
	var beforeColor; //이전에 선택된 컬러 저장 할 변수	


	//페이지 목록 조회
	function postList() {
		$.ajax({
			url : "postList",
			dataType : "json",
			success : function(datas) {
				$(".postContents").empty();
				$.each(datas, function(i, data) {
					$("<div class='col-lg-4 col-md-6 col-sm-12 team-block'>")
						.append(
							"<div class='team-block-three'>"
							+ '<div class="team-block-three">'
							+ '<div class="inner-box">'
							+ '<figure class="image-box">'
							+ '<img src="${pageContext.request.contextPath}/resources/assets/images/post/'+data.postColor+'" alt=""> '
							+ '<a href="clinic-details.html"><i class="far fa-heart"></i></a>'
							+ '<div class="textBox">'
							+ '<div><h4>'
							+ data.contents
							+ '</h4></div>'
							+ '</div></figure></div></div>'
						 )
						.appendTo( $(".postContents") );	
				}); // each end
			} // success end
		}) //ajax end
	} // 페이지목록 조회 end
	


	//HTML 로딩이 끝난 후
	window.onload = function(){
	  init();
	}

	function init(){
	  //2차원 배열 파레트 데이터
	  var pallet = ["#f4ddda", "#f5f4d6", "#dfe5da", "#dde3e2", "#ebebeb", "#e7dbed"];
	  var postColor = ["redPost.png","yellow.png","green.png","blueGray.png","purpleGray.png","purple.png"];
	  var tag = "";
	  for(i=0; i<pallet.length; i++){
	      tag += "<div id='"+pallet[i]+"' data-img='"+postColor[i] +"' class='colorBox' onclick='colorSet(this)'></div>";
	  }
	  //파레트 파싱
	  document.getElementById("palletBox").innerHTML = tag;

	  //색상 입히기
	  var colorBox = document.getElementsByClassName("colorBox");
	  for(i=0; i<colorBox.length; i++){
	    colorBox[i].style.background = colorBox[i].id;
	  }
	}

	// onclick event
	function colorSet(target){
	  document.querySelector("#box").style.background = target.id;

	  if(beforeColor != undefined && beforeColor != null){
	    document.getElementById(beforeColor).className = document.getElementById(beforeColor).className.replace(" active", "");
	  }
	  document.getElementById(target.id).className += " active";
	  beforeColor = target.id;
	  
	  console.log(beforeColor);
	}
	
</script>



