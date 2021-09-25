package com.mima.app.meditation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mima.app.criteria.domain.Criteria;
import com.mima.app.meditation.domain.MeditAttachVO;
import com.mima.app.meditation.domain.MeditationVO;
import com.mima.app.meditation.mapper.MeditAttachMapper;
import com.mima.app.meditation.mapper.MeditationMapper;

import jdk.internal.org.jline.utils.Log;

@Service
public class MeditationServiceImpl implements MeditationService {

	@Autowired
	MeditationMapper meditationMapper;
	@Autowired
	MeditAttachMapper attachMapper;

	@Override
	public int insert(MeditationVO vo) {
				
		meditationMapper.insert(vo); // 게시글 등록
		//첨부파일 등록 (첨부파일 테이블에) 교재 567
		if (vo.getAttachFile() == null) {
			return 2;
		}
		// BoardServiceImpl 참고
		
		MeditAttachVO attach =vo.getAttachFile();
		attach.setMeditationNo(vo.getMeditationNo());
		
		System.out.println("첨부파일 인서트 제발 좀 들어가-"+attach+"meditationServiceImpl");
		attachMapper.insert(attach);

		return 1;
	}

	@Override
	public int update(MeditationVO vo) {
		return meditationMapper.update(vo);
	}

	@Override
	public int delete(MeditationVO vo) {
		return meditationMapper.delete(vo);
	}

	// 게시글 단건 조회
	@Override
	public MeditationVO read(MeditationVO vo) {
		vo = meditationMapper.read(vo); // 게시글만 조회, 보에 담음
		vo.setAttachFile(attachMapper.findByMeditNo(vo.getMeditationNo())); // 첨부파일도 조회해서 담기
		return vo;
	}

	@Override
	public List<MeditationVO> getMeditationList(Criteria cri) {
		return meditationMapper.getMeditationList(cri);
	}

	@Override
	public int getTotalMeditCount(Criteria cri) {
		return meditationMapper.getTotalMeditCount(cri);
	}

	//한 명상 게시판에 달린 파일 조회
	@Override 
	public MeditAttachVO getAttach(int medtitaionNo) { 
		return attachMapper.findByMeditNo(medtitaionNo);
	}

	//이거도 맹 한건 첨부파일 조회
	@Override
	public MeditAttachVO attachRead(String uuid) {
		return attachMapper.read(uuid);
	}

}
