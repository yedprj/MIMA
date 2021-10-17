package com.mima.app.push.mapper;

import java.util.List;

import com.mima.app.push.domain.PushVO;

public interface PushMapper {
	
	// K. 10/16 약배달 취소시 알림 등록
	public int delCancelAlarm(PushVO vo);
	
	// K. 10/17 회원별 알림건 조회
	public List<PushVO> selectMemberPush(int toMemberNo);

}
