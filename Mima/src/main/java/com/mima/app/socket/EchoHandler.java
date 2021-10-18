package com.mima.app.socket;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.mima.app.member.domain.MemberVO;
import com.mima.app.session.domain.BookingVO;
import com.mima.app.session.service.BookingService;
import com.mima.app.session.service.ConsultationService;

import lombok.extern.java.Log;


//s:1009 https://stothey0804.github.io/project/WebSocketExam/ 참고 로그인중인 유저에게 알람보내기

@Log
@Controller
@RequestMapping("/socket/*")
public class EchoHandler extends TextWebSocketHandler{
	
	@Autowired BookingService bookingService;
	@Autowired ConsultationService consultationService;
	
	//로그인한 전체 유저
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	// 로그인중인 개별유저
	Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();

	String url="";
	
	//s:1011 진료방 링크 구하기
	@GetMapping("/getRmId")
	@ResponseBody
	private BookingVO getRmId(int bookingNo) {
		BookingVO vo= bookingService.getRoomId(bookingNo);
		System.out.println(vo+"진료방아이디 확인!!");
		
		return vo;
	}
	
	
	// 클라이언트가 서버로 연결시
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String senderId = getMemberId(session); // 접속한 유저의 http세션을 조회하여 id를 얻는 함수
		System.out.println("senderId check  "+ senderId);
		
		if(senderId!=null) {	// 로그인 값이 있는 경우만
			log(senderId + " 연결 됨");
			users.put(senderId, session);   // 로그인중 개별유저 저장
			System.out.println(users+" users 보기");
			sessions.add(session); //전체 유저에 저장(이거 근데 필요 없을거같은데)
		}
		System.out.println(users);
	}
	
	// 클라이언트가 Data 전송 시
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		String senderId = getMemberId(session);
		System.out.println(senderId);
		// 특정 유저에게 보내기
		String msg = message.getPayload();
		System.out.println("url 받아온 것 "+msg);
		
		// K. 10/15 약배달 알람
		log.info(msg);
		if(msg.substring(0,3).equals("med")) {
			log.info("*****수민테스트*****"+msg);
			String[] strs = msg.split("=");
			log(strs.toString());
			if(strs != null && strs.length == 4) {
				int bookingNo = Integer.parseInt(strs[1]);
				String delMessage = strs[2];
				int pharmacyNo = Integer.parseInt(strs[3]);

				// 예약번호로 환자 NO 찾기
				BookingVO vo= bookingService.getRoomId(bookingNo);
				// 부킹번호로 환자 ID 찾기
				String ptId = consultationService.checkPtId(bookingNo); // 테스트 완료 
				
				log.info("*******취소내용:"+delMessage);
				log.info("*******받는사람ID: "+ptId + ", 받는사람 : "+ vo.getPtNo());
				log.info("*******보내는사람Id: "+ senderId + " , 보내는사람 : "+ pharmacyNo );
				
				 
				TextMessage tmpMsg = new TextMessage("<p>약배달 신청이 취소되었습니다.</p><br><a href='pharmacyDash'>자세히보기</a>");
				TextMessage confirmMsg = new TextMessage("<p>환자에게 알람이 전송되었습니다.</p>");
				
				if(users.get(ptId) != null) {
					users.get(ptId).sendMessage(tmpMsg);  				
				} 
				users.get(senderId).sendMessage(confirmMsg);
			}
 		} // 약국 알람 end
		
		//진료시작 알람
			String bknum = msg.substring(msg.lastIndexOf("=")+1);
			int num = Integer.parseInt(bknum);
			String ptId = consultationService.checkPtId(num);
			log.info("환자아이디======="+ptId);
			if(msg != null) {
				TextMessage tmpMsg = new TextMessage("<a target=\"_blank\" href="+msg+">진료실이 준비되었습니다. 이동하기</a>");
				TextMessage confirmMsg = new TextMessage("<p>환자께 알림을 보냈습니다.</p>");
				System.out.println("보내진 메세지 확인"+ tmpMsg.toString());
				if(users.get(ptId) != null) {
					users.get(ptId).sendMessage(tmpMsg);				
				}
				users.get(senderId).sendMessage(confirmMsg);
				System.out.println("msg sent");
			}
		
	}
	// 연결 해제될 때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		String senderId = getMemberId(session);
		if(senderId!=null) {	// 로그인 값이 있는 경우만
			log(senderId + " 연결 종료됨");
			//메세지 보낸 유저 연결해제
			users.remove(senderId);
			//전체 유저중에서  연결해제
			sessions.remove(session);
		}
	}
	// 에러 발생시
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		log(session.getId() + " 익셉션 발생: " + exception.getMessage());

	}
	// 로그 메시지
	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);
	}
	// 웹소켓에 id 가져오기
    // 접속한 유저의 http세션을 조회하여 id를 얻는 함수
	private String getMemberId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		
		MemberVO mVo = (MemberVO) httpSession.get("session");
		
		String m_id = mVo.getMemberId(); // 세션에 저장된 m_id 기준 조회
		return m_id==null? null: m_id;
	}
}


