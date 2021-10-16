package com.mima.app.push.service;

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

}
