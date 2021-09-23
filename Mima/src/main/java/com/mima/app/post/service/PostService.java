package com.mima.app.post.service;

import java.util.List;

import com.mima.app.post.domain.PostVO;

public interface PostService {
	
	public List<PostVO> getList();
	
	public PostVO read(PostVO vo);
	
	public int insert(PostVO vo);
	
	public int update(PostVO vo);
	
	public int delete(PostVO vo);

}
