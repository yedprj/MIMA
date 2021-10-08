<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
th, td {
	text-align: center;
}
/*label b {
 	color : #00224f;
 	font-weight : 900;
}*/
#searchBtn, #modalSearchBtn, #jusoBtn {
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
input::placeholder {
  color: #d9d9d9;
  font-style: italic;
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
                                    <h3>약 배달 신청</h3>
                                    <a href="add-listing.html" class="menu"><i class="icon-Dot-menu"></i></a>
                                </div>
                                <div class="inner-box">
                                    <form action="add-listing.html" method="post">
                                        <div class="row clearfix">
                                            <div class="col-lg-4 col-md-6 col-sm-12 form-group">
                                                <label>배달지 주소</label>
                                                <input id="addr1" name="addr1" placeholder="주소" type="text" >
                                            </div>
                                            <div class="col-lg-2 col-md-6 col-sm-12 form-group">
                                            	<label> &nbsp;&nbsp;&nbsp;</label>
												<input type="text" id="addr3" name="addr3" placeholder="도로명주소">
											</div>
                                            <div class="col-lg-2 col-md-6 col-sm-12 form-group">
                                                <label>상세주소</label>
                                                <input id="addr2" name="addr2" type="text" >
                                            </div>
                                            <div class="col-lg-2 col-md-6 col-sm-12 form-group">
                                                <label>우편번호</label>
                                                <input id="postcode" name="postcode" type="text" placeholder="우편번호" readonly>
                                            </div>
                                            <div class="col-lg-2 col-md-12 col-sm-12 form-group" >
													<button type="button" id="jusoBtn" onclick="execDaumPostcode();" >주소검색</button>
												</div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>신청 약국</label>
                                                <input id="phaName" type="text" name="phaName" >
                                                <input id="memberNo" type="hidden" name="memberNo" >
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
												<button id="searchBtn" type="button" onclick="window.open('phaSearch', '약국찾기', 'top=100px, left=300, width=600px, height=700px , scrollbars=yes');">검색</button>                                             	
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                                <label>특이사항</label>
                                                <textarea name="message" ></textarea>
                                            </div>
                                        </div>
                                        
                                    </form>
                                </div>
                            </div>
                            <div class="btn-box">
                                <a href="add-listing.html" class="theme-btn-one">저장하기<i class="icon-Arrow-Right"></i></a>
                            </div>
                            <!-- <div class="modal">
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
		                            </div>   single box end
								</div>
							</div> modal end -->
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
//주소 API 연결 s:1005
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

$(function(){ 
		
	 
	 /*  $("#searchBtn").click(function(){
	    $(".modal").fadeIn();
	  });
	  
	  $(".cancel").click(function(){
	    $(".modal").fadeOut();
	  }); 
	  
	  $("#modalSearchBtn").on("click", function(){
		  var pharmacy = $("input[name='pharmacy']").val();
		  
		  // ajax 호출 검색
		  
	  }); */
	
	  
	});
</script>