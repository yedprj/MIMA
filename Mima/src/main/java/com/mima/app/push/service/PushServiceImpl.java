package com.mima.app.push.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mima.app.push.domain.PushVO;
import com.mima.app.push.mapper.PushMapper;

@Service
public class PushServiceImpl implements PushService {

	@Autowired PushMapper pushMapper;
	
	// K. 10/16 약배달 취소시 알림 등록
	@Override
	public int delCancelAlarm(PushVO vo) {
		return pushMapper.delCancelAlarm(vo);
	}

	// K. 10/17 회원별 알림건 조회
	@Override
	public List<PushVO> selectMemberPush(int toMemberNo) {
		// TODO Auto-generated method stub
		return pushMapper.selectMemberPush(toMemberNo);
	}

}
