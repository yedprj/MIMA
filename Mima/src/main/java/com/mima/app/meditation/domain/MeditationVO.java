package com.mima.app.meditation.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MeditationVO {
	private int meditationNo;		// 명상번호
	private String title;			// 제목
	private String contents;		// 내용
	private String meditationFile;	// 파일
	private int meditationLike;		// 명상 좋아요 수
	private int hit;				// 조회수
	private String category;		// 카테고리
	private Date regDate;			// 등록일
	private Date editDate;			// 수정일
	private String teacherName;		// 명상가 이름
	private String teacherInfo;		// 명상가 정보
	private String teacherPhoto;	// 명상가 사진
	private String meditationThumb; // 토탈리스트에 들어갈 썸넬사진
	private String vFileUuid;		// 명상비디오 uuid
	private int commentsCnt;		// 명상에 달린 댓글 수 
	
	private String fileName;
	
	//게시글 하나에 들어가있는 첨부파일
	private MeditAttachVO attachFile;
	
	//s:1013 로그인세션멤버번호담기
	private int memberNo;
	//s:1013 좋아요 1 또는 널!!!!
	private int likesNo;
}
