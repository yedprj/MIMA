<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- s:0929 -->
<!-- 의사가 우선 대시보드 예약현황에서 환자 진료 시작하기버튼을 누르면 예약 번호가 이 페이지로 전달 되어야 함 -->
    <div>
    This is test page for the video consultation. Ju 29-09-2021
    <button id="startBtn" class="theme-btn-one">
    진료 시작하기<i class="icon-Arrow-Right"></i></button>
    
    <input id="bookingNo" value="1">
    </div>
    
    <script>
    $(document).ready(function(){

    	$('#startBtn').on('click', function(){
    		
    		var BOOKING_NO=$('#bookingNo').val();
    		window.open('http://localhost:3000/?bookingNo='+BOOKING_NO,'진료방','width=1200,height=900,location=no,status=no,scrollbars=yes');
    		
    	});
 
     });
    
    
    </script>