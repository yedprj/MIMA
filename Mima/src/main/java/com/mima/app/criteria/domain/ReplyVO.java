package com.mima.app.criteria.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ReplyVO {
	
	private String cmainCategory;
	private int cmainNo;
	private int commentWriterNo;
	private String contents;
	private int reviewPoint;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date regDate;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date editDate;
	
}
