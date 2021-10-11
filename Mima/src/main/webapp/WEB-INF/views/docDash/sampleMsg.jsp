<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<div class="modal-body">

<input type="content">
<!-- s:1010 미얀....ㅎㅎㅎ 이거내꺼야 -->

<button id="sendMsgBtn">send</button>
</div>

<script>



$('#notifySendBtn').click(function(e){
    let modal = $('.modal-content').has(e.target);
    let type = '70';
    let target = modal.find('.modal-body input').val();
    let content = modal.find('.modal-body textarea').val();
    let url = '${contextPath}/member/notify.do';
    // 전송한 정보를 db에 저장	
    $.ajax({
        type: 'post',
        url: '${contextPath}/member/saveNotify.do',
        dataType: 'text',
        data: {
            target: target,
            content: content,
            type: type,
            url: url
        },
        success: function(){    // db전송 성공시 실시간 알림 전송
            // 소켓에 전달되는 메시지
            // 위에 기술한 EchoHandler에서 ,(comma)를 이용하여 분리시킨다.
            socket.send("관리자,"+target+","+content+","+url);	
        }
    });
    modal.find('.modal-body textarea').val('');	// textarea 초기화
});
</script>