<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script>
const bookingNo = 2;
</script>
<div>
<button id="sessionStartBtn" class="btn btn-primary">진료시작하기</button>
예약번호: <span id="bookingNo"></span>

<script>
/* page on load */
$(function(){
	
$('#bookingNo').text(bookingNo);
$('#sessionStartBtn').on('click', function(){
	alert('진료를 시작합니다.')
	window.open('http://localhost:3000/?bookingNo='+bookingNo,'진료방','width=1200,height=900,location=no,status=no,scrollbars=yes');
})


});//end of page on load

</script>
</div>