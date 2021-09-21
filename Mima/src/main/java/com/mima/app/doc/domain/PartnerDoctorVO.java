package com.mima.app.doc.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PartnerDoctorVO {
	private int memberNo;				// 의사번호
	private String profilePhoto;		// 의사 프로필 사진
	private String profileccontents;	// 의사 설명
	private String profileCareer;		// 의사 경력
	private String clinicInfo;			// 클리닉 주소
	private String clinicPhone;			// 클리닉 전화번호
	private String clinicEmail;			// 클리닉 이메일
	private Date regDate;				// 등록일
	private Date editDate;				// 수정일
}
