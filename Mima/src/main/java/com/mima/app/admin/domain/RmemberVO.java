package com.mima.app.admin.domain;

import java.util.Date;

import lombok.Data;

@Data
public class RmemberVO {

	private String reportNo; 
	private String postNo; 
	private String memberNo;
	private String reportMno;
	private String rmemberId;
	private String reportId;
	private Date reportDate;
	private Date checkDate;
	private String reportResult;
	
}
