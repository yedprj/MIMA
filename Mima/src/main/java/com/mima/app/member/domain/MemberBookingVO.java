package com.mima.app.member.domain;

import lombok.Data;

@Data
public class MemberBookingVO{
	
	private int mmemberNo;		// 회원번호
	private String mname;		// 이름
	private String mptProfilePhoto;	// 환자 프로필 사진
	private String midentifyNo;	// 주민등록번호
	private String mgender;		// 성별
	private String mphone;		// 전화번호
	private String maddr1;		// 주소
	private String maddr2;		// 상세주소
	private String maddr3;		// 참고주소
	private int bdocNo;
	private int bptNo;
	
}
