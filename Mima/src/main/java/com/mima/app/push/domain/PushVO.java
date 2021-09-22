package com.mima.app.push.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PushVO {
	private int pushNo;			// 푸시 알람 번호
	private int toMemberNo;		// 알람 받는 회원 번호
	private int userMemberNo;	// 알람 보내는 회원 번호
	private String type;		// 알람 종류 ??
	private String contentId;	// 컨텐츠 번호 ?? 
	private String message;		// 알람 내용
	private String pushDt;		// 이동할 주소 ?? 
	private Date pushDate;		// 알람 발생 일시
	private Date checkDate;		// 알람 확인 일시
}
