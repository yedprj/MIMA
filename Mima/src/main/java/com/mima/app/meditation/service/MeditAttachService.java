package com.mima.app.meditation.service;

import java.util.List;

import com.mima.app.meditation.domain.MeditAttachVO;


public interface MeditAttachService {
	public void insert(MeditAttachVO vo);

	public void delete(String uuid);

	public List<MeditAttachVO> findByBno(int meditationNo);

	public void deleteAll(int meditationNo);

	public List<MeditAttachVO> getOldFiles();
	
	public MeditAttachVO read(String uuid);
}
