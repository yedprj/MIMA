package com.mima.app.comments.domain;

import java.util.List;


import lombok.Data;

@Data
public class CommentsPageVO {
	private int replyCnt;
	private List<CommentsVO> list;
}

