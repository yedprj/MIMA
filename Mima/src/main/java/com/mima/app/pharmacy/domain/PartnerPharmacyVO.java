package com.mima.app.pharmacy.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PartnerPharmacyVO {
	private int memberNo;			// 약국 번호
	private String profilePhoto;	// 약국, 약사 프로필 사진
	private String profilePhotoImg;
	private String profileContents;	// 약국, 약사 프로필 내용
	private String pharmacyInfo;	// 약국 위치 ->  약국 이름으로 사용
	private String pharmacyContact;	// 약국 연락처
	private String pharmacyEmail;	// 약국 이메일
	private String deliveryArea;	// 배달 가능 지역 ->[K]210929 약국 주소로 사용
	private Date regDate;			// 등록일
	private Date editDate;			// 수정일
	private String pharmacyPostCode; // 우편번호
	private String deliveryArea2;	// 약국 도로명주소
	private String deliveryArea3;	// 약국 상세주소
	private String openHours;		// 약국 영업시간 -> String 으로 전부 합쳐서 받음
}
