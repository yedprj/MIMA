<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
  <style>
.starR{
  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
  background-size: auto 100%;
  width: 30px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}
.starR.on{background-position:0 0;}
</style>  
    
    <!-- s:1007 진료후 환자가 의사리뷰 남기는 폼 -->
   <div class="boxed_wrapper">

        <!-- preloader -->
        <div class="preloader"></div>
        <!-- preloader -->

        <!--page-title-two-->
        <section class="page-title-two">
            <div class="title-box centred bg-color-2" style="height:120px">
                <div class="pattern-layer">
                    <div class="pattern-1" style="background-image: url(${pageContext.request.contextPath}/assets/images/shape/shape-70.png);"></div>
                    <div class="pattern-2" style="background-image: url(${pageContext.request.contextPath}/assets/images/shape/shape-71.png);"></div>
                </div>
                <div class="auto-container">
                    <div class="title">
                        <h1>진료 후 리뷰 남기기</h1>
                    </div>
                </div>
            </div>
            <div class="lower-content">
                <div class="auto-container">
                    <ul class="bread-crumb clearfix">
                        <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                        <li>진료 후 리뷰 남기기</li>
                    </ul>
                </div>
            </div>
        </section>
        <!--page-title-two end-->


        <!-- submit-review -->
        <section class="submit-review bg-color-3" style="padding-top:30px">
            <div class="pattern">
                <div class="pattern-1" style="background-image: url(assets/images/shape/shape-85.png);"></div>
                <div class="pattern-2" style="background-image: url(assets/images/shape/shape-86.png);"></div>
            </div>
            <div class="auto-container">
                <div class="review-box">
                    <div class="content-box">
                        <div class="title-inner">
                            <h3>Write a Review for Dr.${doc.name } </h3>
                            <p>리뷰를 남겨 주시면 감사하겠습니다 :)</p>
                        </div>
                        <div class="content-inner">
                            <div class="rating-box">
                                <h4>Overall Rating</h4>
                                
                                <div class="starRev">
                                	<span class="starR on">별1</span>
									<span class="starR">별2</span>
									<span class="starR">별3</span>
									<span class="starR">별4</span>
									<span class="starR">별5</span>
                                </div>
                                
                            </div>
                            <div class="form-inner">
                                <form method="post" id="reviewInsertFrm">
                                <input type="hidden" id="cmainCategory" name="cmainCategory" value="doc" >
                                <!-- 의사 번호 (이건 예약번호로 조회해서 넣어주기) -->
                                 <input type="hidden" id="cmainNo" name="cmainNo" value="${doc.memberNo }" >
                                 <input type="hidden" id="bookingNo" name="bookingNo" value="${doc.bookingNo }" >
                                 
                                <input type="hidden" id="commentWriterNo" name="commentWriterNo" value="${session.memberNo }" >
                                    <div class="row clearfix">
                                        ${bookingNo }
                                        <div class="col-lg-6 col-md-12 col-sm-12 form-group">
                                            <label></label>
                                            <input type="text" name="name" value="${session.name }" disabled>
                                        </div>
                                        <div class="col-lg-6 col-md-12 col-sm-12 form-group">
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                            <label>리뷰를 남겨 주세요!</label>
                                            <textarea id="contents" name="contents"></textarea>
                                        </div>
                                       
                                        <div class="col-lg-12 col-md-12 col-sm-12 form-group message-btn">
                                            <button type="button" class="theme-btn-one" id="reviewInsertBtn">리뷰쓰기<i class="icon-Arrow-Right"></i></button>
                                        </div>
                                    </div>
                                       <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- submit-review end -->
    </div>
    
    <script type="text/javascript">
    

    var csrfHeaderName = "${_csrf.headerName}";
    var csrfTokenValue = "${_csrf.token}";


    $('.starRev span').click(function(){
    	  $(this).parent().children('span').removeClass('on');
    	  $(this).addClass('on').prevAll('span').addClass('on');
    	  return false;
    	});
    //리뷰 등록 버튼이벤트
    $('#reviewInsertBtn').on('click', function(){
	    let stars={};
	    stars = $('.starRev').find('.on');
	    let starNum=stars.length;
	    let str='<input type="hidden" id="reviewPoint" name="reviewPoint" value="'+starNum+'\">'
	    
	    $('#reviewInsertFrm').append(str);
	    $.ajax({
			url : "ptReviewInsert",
			method : "POST",
			data : {
				cmainCategory:$('#cmainCategory').val(),
				cmainNo:$('#cmainNo').val(),
				commentWriterNo:$('#commentWriterNo').val(),
				contents:$('#contents').val(),
				reviewPoint: $('#reviewPoint').val(),
				bookingNo : $('#bookingNo').val()
			},
		 	beforeSend : function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success : function(data) {
				console.log(data);
				if(data ==1){
					alert("리뷰가 저장되었습니다!");
					window.close();
				}
			},// success end
			error: function (err){
				console.error(err);
			}
		})//  ajax end
    })//리뷰 인서트 버튼 이벤트 끝
    
</script>
 