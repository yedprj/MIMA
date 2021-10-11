<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<div>
<button id="sessionStartBtn" class="btn btn-primary">진료시작하기</button>
예약번호: <span id="bookingNo"></span>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

<script>
/* page on load */
$(function(){
	const bookingNo = 37;
	
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	$('#bookingNo').text(bookingNo);
	$('#sessionStartBtn').on('click', function(){
		alert('진료를 시작합니다.', bookingNo);
		
		let url="";
		//uuid 구해서 링크 받아오기 s:1011
		$.ajax({ 
            url: '${pageContext.request.contextPath}/socket/getRmId',
            type: 'GET',
            cache: false, 
            data: {
               bookingNo: bookingNo
            },
            beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					//xhr.setRequestHeader("aa", "bb");
			},
            success: function(data) {
                        console.log(data.roomId);
                        
                      },
            error: function(jqXHR, textStatus, err){
                 alert('text status '+textStatus+', err '+err);
             }
          })
		socket.send("msg");

		window.open('http://localhost:3000/?bookingNo='+bookingNo,'진료방','width=1200,height=900,location=no,status=no,scrollbars=yes');
		
		//s:1011 소켓 메세지 보내기
		//s:1007 진료방 열고 원래 톰캣 창은 의사메인대시보드로 이동
		//location.href="${pageContext.request.contextPath}/docMain";
		
	})


});//end of page on load

</script>
</div>