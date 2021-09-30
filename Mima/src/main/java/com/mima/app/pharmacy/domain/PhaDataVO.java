package com.mima.app.pharmacy.domain;

import lombok.Data;

@Data
public class PhaDataVO {
	
	private String dutyAddr;   // 주소
	private String dutyName;   // 약국명
	private String dutyTime1s; // 월요일 오픈시간
	private String dutyTime1c; // 		 마감시간
	private String dutyTime2s; // 화요일 오픈시간
	private String dutyTime2c; // 		 마감시간
	private String dutyTime3s; // 수요일 오픈시간
	private String dutyTime3c; // 		 마감시간
	private String dutyTime4s; // 목요일 오픈시간
	private String dutyTime4c; // 		 마감시간
	private String dutyTime5s; // 금요일 오픈시간
	private String dutyTime5c; // 		 마감시간
	private String dutyTime6s; // 토요일 오픈시간
	private String dutyTime6c; // 		 마감시간
	private String dutyTime7s; // 일요일 오픈시간
	private String dutyTime7c; // 		 마감시간
	private String dutyTime8s; // 공휴일 오픈시간
	private String dutyTime8c; // 		 마감시간
	private int hpid;		   // 기관ID
	private int postCdn1;	   // 우편번호
	private int postCdn2;	   // 우편번호2
	private double wgs84Lon;   // 경도
	private double wgs84Lat;   // 위도
	

}
