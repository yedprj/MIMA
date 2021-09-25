package com.mima.app.comments.domain;

import java.util.List;

import com.mima.app.criteria.domain.ReplyVO;

import lombok.Data;

@Data
public class CommentsPageVO {
	private int replyCnt;
	private List<ReplyVO> list;
}

