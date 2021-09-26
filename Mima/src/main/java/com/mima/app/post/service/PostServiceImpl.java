package com.mima.app.post.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mima.app.post.domain.PostVO;
import com.mima.app.post.mapper.PostMapper;

@Service
public class PostServiceImpl implements PostService {
	
	@Autowired PostMapper postMapper;

	@Override
	public List<PostVO> getList(PostVO vo) {
		// TODO Auto-generated method stub
		return postMapper.getList(vo);
	}

	@Override
	public PostVO read(PostVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(PostVO vo) {
		// TODO Auto-generated method stub
		return postMapper.insert(vo);
	}

	@Override
	public int updateLike(PostVO vo) {
		// TODO Auto-generated method stub
		return postMapper.updateLike(vo);
	}

	@Override
	public int delete(PostVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateNotLike(PostVO vo) {
		// TODO Auto-generated method stub
		return postMapper.updateNotLike(vo);
	}

	// 스케쥴러 삭제
	@Override
	public int schedulerPost() {
		// TODO Auto-generated method stub
		return postMapper.schedulerPost();
	}

	@Override
	public List<PostVO> randomList(int reportMno) {
		// TODO Auto-generated method stub
		return postMapper.randomList(reportMno);
	}

}
