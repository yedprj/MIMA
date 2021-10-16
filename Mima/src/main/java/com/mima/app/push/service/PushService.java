package com.mima.app.push.service;

import com.mima.app.push.domain.PushVO;

public interface PushService {
	
	// K. 10/16 약배달 취소시 알림 등록
	public int delCancelAlarm(PushVO vo);

}
