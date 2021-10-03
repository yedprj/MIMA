package com.mima.app.session.domain;


import lombok.Data;

//s: 10/01 의사가 진료 볼 때 환자 정보 조회 버튼 누를 때 사용하는 보임

@Data
public class PtInfoVO {
	private int memberNo;
	private String name;
	private String identifyNo;
	private String gender;
	private String address;
	private String email;
	private String phone;
	private String pastHx;
	private String preSelfAx;
	private String topic;
	private String medDelivery;
}
