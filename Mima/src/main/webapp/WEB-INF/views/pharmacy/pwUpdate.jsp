<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="include/dashHeader.jsp"></jsp:include>    
    
<section class="doctors-dashboard bg-color-3">
	<!-- 사이드 메뉴바 연결 -->
	<jsp:include page="include/sideDash.jsp"></jsp:include>
	
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
                                                <label>현재 비밀번호</label>
                                                <input type="hidden" name="id" value="${memberNo}">
                                                <input type="password" id="password" name="password2" >
                                            </div>
                                            <div class="col-lg-6 col-md-12 col-sm-12 form-group">
                                                <span class="accept"><i class="fas fa-check"></i>체크</span>
                                            </div>
                                            <div class="col-lg-6 col-md-12 col-sm-12 form-group">
                                                <label>새로운 비밀번호</label>
                                                <input type="password" name="password2" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-12 col-sm-12 form-group">
                                                
                                            </div>
                                            <div class="col-lg-6 col-md-12 col-sm-12 form-group">
                                                <label>새로운 비밀번호 확인</label>
                                                <input type="password" name="password3" required="">
                                            </div>
                                            <div class="col-lg-6 col-md-12 col-sm-12 form-group">
                                                
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="btn-box">
                                <a href="add-listing.html" class="theme-btn-one">비밀번호 변경<i class="icon-Arrow-Right"></i></a>
                                <a href="add-listing.html" class="cancel-btn">취소</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
</section>
<script>
	
	var memberId = $("input[name='id']").val();

	// 현재 비밀번호 확인  - 시큐리티 때문에 아직 테스트 못해봄 ㅠㅠ
	$("#password").on("change", function(){
		var password = $("input[name='password']").val();
		if(password == ""){
			return;
		}
		$.ajax({
			url : "pwConfirm",
			method : "post",
			dataType : "json",
			data : JSON.stringify({
				memberId : memberId,
				password : password
			}),
			contentType : 'application/json',
			success : function(data) {
				if(data.password == password){
					$('.accept').css("color", "#39cabb");
				}else {
					$('.accept').text("비밀번호가 일치하지 않습니다");
				}
			},// success end
			error : function(xhr, status, message) {
				alert(xhr + " status: " + status + " er:" + message);
			}
		}) //ajax end
	}) // 현재 비밀번호 확인 끝


	
</script>