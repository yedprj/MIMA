package com.mima.app.criteria.domain;

import lombok.Data;

@Data
public class Criteria {
	private int pageNum =1;
	private int amount =9;
	private String type;
	private String keyword;
	private String category;
	public Criteria() {	}
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		return type==null ? new String[] {}:type.split("");
	}
}
