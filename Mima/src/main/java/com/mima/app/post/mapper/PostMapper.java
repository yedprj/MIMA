package com.mima.app.post.mapper;

import java.util.List;

import com.mima.app.post.domain.PostVO;

public interface PostMapper {
	
	public List<PostVO> getList(PostVO vo);
	
	public List<PostVO> randomList(int reportMno);
	
	public PostVO read(PostVO vo);
	
	public int insert(PostVO vo);
	
	public int updateLike(PostVO vo);
	
	public int updateNotLike(PostVO vo);
	
	public int delete(PostVO vo);
	
	public int schedulerPost();
	
	public int postCount();
	
	

}
