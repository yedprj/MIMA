package com.mima.app.admin.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class NoticeVO {
	
	private int noticeNo;			// 공지사항 번호
	private String noticeTitle;		// 제목
	private String noticeContents;	// 내용
	@DateTimeFormat(pattern = "yyyy/MM/dd")	
	private Date noticeDate;		// 공지사항 작성일
	private String noticeFile;		// 첨부파일
	private int hit;				// 공지사항 조회수
}
