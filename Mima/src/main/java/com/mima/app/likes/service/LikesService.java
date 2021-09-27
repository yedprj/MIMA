package com.mima.app.likes.service;

import com.mima.app.likes.domain.LikesVO;

public interface LikesService {
	
	public int postLikeinsert(LikesVO vo);
	
	public LikesVO postLikesRead(LikesVO vo);
	
	public int postLikedelete(LikesVO vo);

	//나중에 가능하면 이걸로 합칠게요!!! 의사랑 약국은 이거 같이 쓰시면 됩니다
	//좋아요 테이블에 인서트
	public int likeInsert(LikesVO vo);
	//좋아요 테이블에 딜리트
	public int likeDelete(LikesVO vo);

}
