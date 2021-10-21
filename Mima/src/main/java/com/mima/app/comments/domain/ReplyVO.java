package com.mima.app.comments.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ReplyVO {

	// 닥터 대쉬보드 나의 후기 댓글달기_J20
	private int rno;
	private int rmainNo;
	private int rwriterNo;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
	private Date rregDate;
	private Date reditDate;
	private String rcontents;
	private int rcno;
	
}
