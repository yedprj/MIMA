package com.mima.app.doc.domain;

import java.util.Date;
import java.util.List;

import com.mima.app.member.domain.ExperienceVO;

import lombok.Data;


//s:1008 의사 전체 리스트 뽑고 디테일 페이지 쿼리할때 쓰는 보
@Data
public class DocInfoVO {
	private int memberNo;			//의사 멤버번호
	private String name;			//의사이름
	private String gender;			//의사성별
	private String addr1;			//의사주소
	private String addr2;			//의사상세주소
	private String addr3;			//의사주소더?
	private String postcode;		//우편ㅂ
	private String profilePhoto;	//사진
	private String profileContents;	//프로필내용
	private String profileEducation;//학력
	private String clinicInfo;		//병원이름
	private String clinicPhone;		//병원번호
	private String clinicEmail;		//병원이멜
	
	private String title;			//경력제목
	private String detail;			//경력 상세
	private Date fromDate;			//경력시작날짜
	private Date toDate;			//경력 끝날짜
	private int commentsCnt;		// 의사 리뷰 수 
	
	private MentalSubjectVO subjects; //의사 진료과목 가격 보
	private List<ExperienceVO> exp;		//의사 경력사항 보
}
