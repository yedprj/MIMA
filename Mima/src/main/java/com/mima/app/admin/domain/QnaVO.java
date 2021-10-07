package com.mima.app.admin.domain;

import lombok.Data;
 
@Data
public class QnaVO {
	private int qnaNo;        // 문의글 번호
	private String qnaTitle;  // 문의글 제목
	private String qnaDate;   // 답변 등록일
	private String qnaName;   // 문의자 이름
}
