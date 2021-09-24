package com.mima.app.meditation.mapper;

import java.util.List;

import com.mima.app.meditation.domain.MeditAttachVO;

public interface MeditAttachMapper {
	public void insert(MeditAttachVO vo);

	public void delete(String uuid);

	public MeditAttachVO findByMeditNo(int meditationNo);

	public void deleteAll(int meditationNo);

	public List<MeditAttachVO> getOldFiles();
	
	public MeditAttachVO read(String uuid);
}
