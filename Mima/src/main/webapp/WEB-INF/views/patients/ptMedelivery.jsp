<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
th, td {
	text-align: center;
}
label b {
 	color : #00224f;
 	font-weight : 900;
}
#searchBtn, #modalSearchBtn {
	position: relative;
    display: inline-block;
    font-size: 15px;
    line-height: 26px;
    font-weight: 600;
    color: #fff !important;
    text-align: center;
    padding: 13px 40px;
    border-radius: 30px;
    z-index: 1;
	box-shadow: 0;
    transition: all 500ms ease;
    background: #39cabb;
    margin-top: 30px;
}

.modal_content{
  width:500px; 
  height:400px;
  background:#fff; 
  border : 2px solid gray;
  border-radius:10px;
  position:relative; 
  top:30%; 
  left:50%;
  margin-top:-100px; 
  margin-left:-200px;
  text-align:center;
  box-sizing:border-box; 
  padding:20px 0;
  line-height:23px; 
  cursor:pointer;
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

.add-listing .single-box {
	border : 0px;
}
</style>

<!-- doctors-dashboard -->
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
				<h1>약 배달</h1>
			</div>
		</div>
	</div>
	<div class="lower-content">
		<ul class="bread-crumb clearfix">
			<li><a href="${pageContext.request.contextPath}">Home</a></li>
			<li>약배달</li>
		</ul>
	</div>
</section>
<!--page-title-two end-->

<section class="doctors-dashboard bg-color-3">

	<div class="left-panel">
		<div class="profile-box">
			<div class="upper-box">
				<figure class="profile-image">
					<img
						src="${pageContext.request.contextPath}/resources/assets/images/resource/profile-2.png"
						alt="">
				</figure>
				<div class="title-box centred">
					<div class="inner">
						<h3>Dr. Rex Allen</h3>
						<p>MDS - Periodontology</p>
					</div>
				</div>
			</div>
			<div class="profile-info">
				<ul class="list clearfix">
					<li><a href="ptMain" class="current"><i class="fas fa-columns"></i>대쉬보드</a></li>
					<li><a href="ptHistory"><i class="fas fa-calendar-alt"></i>진료내역</a></li>
					<li><a href="patientList"><i class="fas fa-wheelchair"></i>내가 찜한 의사</a></li>
					<li><a href="ptReview"><i class="fas fa-star"></i>나의 후기</a></li>
					<li><a href="docQna"><i class="fas fa-comments"></i>나의 문의</a></li>
					<li><a href="ptMedelivery"><i class="fas fa-ambulance"></i>약 배달</a></li>
					<li><a href="docProfile"><i class="fas fa-user"></i>프로필 관리</a></li>
					<li><a href="change-password.html"><i class="fas fa-unlock-alt"></i>비밀번호 변경</a></li>
					<li><a href="login.html"><i class="fas fa-sign-out-alt"></i>로그아웃</a></li>
				</ul>
			</div>
		</div>
	</div>

	<div class="right-panel">
                <div class="content-container">
                    <div class="outer-container">
                        <div class="add-listing">
                            <div class="single-box">
                                <div class="title-box">
                                    <h3>약 배달 신청 주소</h3>
                                    <a href="add-listing.html" class="menu"><i class="icon-Dot-menu"></i></a>
                                </div>
                                <div class="inner-box">
                                    <form action="add-listing.html" method="post">
                                        <div class="row clearfix">
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label><b>신청할 주소</b></label>
                                                <input type="text" name="city" placeholder="신청한 주소가 존재하지 않습니다" >
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
												                                             	
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label><b>신청 약국</b></label>
                                                <input type="text" name="state" placeholder="State" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
												<button id="searchBtn" type="button">검색</button>                                             	
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label><b>특이사항</b></label>
                                                <textarea name="message" placeholder="Enter your name"></textarea>
                                            </div>
                                        </div>
                                        
                                    </form>
                                </div>
                            </div>
                            <div class="btn-box">
                                <a href="add-listing.html" class="theme-btn-one">저장하기<i class="icon-Arrow-Right"></i></a>
                            </div>
                            <div class="modal">
								<div class="modal_content" title="클릭하면 창이 닫힙니다.">
								    <div class="single-box">
		                                <div class="title-box">
		                                    <h3>약국 검색</h3>
		                                </div>
		                                <div class="inner-box">
	                                        <div class="row clearfix">
	                                        	<div class="short-box clearfix">
				                                    <div class="select-box">
				                                        <select class="wide">
				                                           <option data-display="Sort by">Sort by</option>
				                                           <option value="1">Cardiology</option>
				                                           <option value="2">Nurology</option>
				                                           <option value="4">Pragnency</option>
				                                        </select>
				                                    </div>
				                                </div>
	                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
	                                                <label><b>신청 약국</b></label>
	                                                <input type="text" name="pharmacy" placeholder="State" required="">
	                                            </div>
	                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
													<button id="modalSearchBtn" type="button">검색</button>                                             	
	                                            </div>
	                                            
	                                        </div>
		                                </div>
		                                <span class="accept insertBtn" style="float: right;"><i	class="fas fa-check"></i></span> 
		                                <span class="cancel closeBtn" style="float: right;"><i class="fas fa-times"></i></span>
		                            </div>   <!-- single box end -->
								</div>
							</div> <!-- modal end -->
                        </div>
                    </div>
                </div>
            </div>
            
</section>
<!-- doctors-dashboard -->

<!--Scroll to top-->
<button class="scroll-top scroll-to-target" data-target="html">
	<span class="fa fa-arrow-up"></span>
</button>


<script>
$(function(){ 
		
	 
	  $("#searchBtn").click(function(){
	    $(".modal").fadeIn();
	  });
	  
	  $(".cancel").click(function(){
	    $(".modal").fadeOut();
	  }); 
	  
	  $("#modalSearchBtn").on("click", function(){
		  var pharmacy = $("input[name='pharmacy']").val();
		  
		  // ajax 호출 검색
		  
	  });
	
	  
	});
</script>