package com.mima.app.session.domain;

import java.util.Date;

import lombok.Data;

//s: 10/01 의사가 진료 볼 때 환자 정보 조회 버튼 누를 때 사용하는 보임

@Data
public class PtInfoVO {
	private int MEMBER_NO;
	private String NAME;
	private String IDENTIFY_NO;
	private String GENDER;
	private String ADDRESS;
	private String EMAIL;
	private String PHONE;
	private String PAST_HX;
	private String PRE_SELF_AX;
	private String TOPIC;
	private String MED_DELIVERY;
}
