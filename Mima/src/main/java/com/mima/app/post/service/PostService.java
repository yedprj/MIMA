package com.mima.app.post.service;

import java.util.List;

import com.mima.app.post.domain.PostVO;

public interface PostService {
	
	public List<PostVO> getList(int reportMno);
	
	public PostVO read(PostVO vo);
	
	public int insert(PostVO vo);
	
	public int updateLike(PostVO vo);
	
	public int updateNotLike(PostVO vo);
	
	public int delete(PostVO vo);
	
	public int schedulerPost();

}
