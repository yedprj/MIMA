package com.mima.app.post.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mima.app.admin.mapper.ReportMapper;
import com.mima.app.post.domain.PostVO;
import com.mima.app.post.mapper.PostMapper;

@Service
public class PostServiceImpl implements PostService {
	
	@Autowired PostMapper postMapper;

	@Override
	public List<PostVO> getList(int reportMno) {
		// TODO Auto-generated method stub
		return postMapper.getList(reportMno);
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

}
