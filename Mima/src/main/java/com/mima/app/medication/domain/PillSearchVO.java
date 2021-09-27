package com.mima.app.medication.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PillSearchVO {

	private int resultCode;
	private String resultMsg;
	private int numOfRows;
	private int pageNo;
	private int totalCount;
	private String entpName;
	private String itemName;
	private int itemSeq;
	private String efcyQesitm;
	private String useMethodQesitm;
	private String atpnWarnQesit;
	private String atpnQesitm;
	private String intrcQesitm;
	private String seQesitm;
	private String depositMethodQesitm;
	private Date openDe;
	private Date updateDe;
	private String itemlmage;
	
	
}
