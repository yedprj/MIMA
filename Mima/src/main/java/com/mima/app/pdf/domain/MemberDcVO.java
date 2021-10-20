package com.mima.app.pdf.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberDcVO {
	
	// K.10/20 처방전 pdf VO 
	
	private int booking_no;
	private Date consult_date;
	private int member_no;
	private String name;
	private String identify_no;
	private String clinic_info;
	private String clinic_phone;
	private String clinic_email;
	
	// 처방약 부분
	private String pre_name;
	private String pre_amount;
	private String pre_count;
	private String pre_day;

}
