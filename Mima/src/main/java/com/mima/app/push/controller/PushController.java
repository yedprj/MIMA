package com.mima.app.push.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mima.app.push.service.PushService;

@Controller
public class PushController {
	
	// K. 10/19 수민 알림 내역 삭제
	
	@Autowired PushService pushService;
	
	@PostMapping("patients/pushDelete")
	@ResponseBody
	public int pushDelete(int pushNo) {
		return pushService.pushDelete(pushNo);
	}
	
	@PostMapping("post/pushDelete")
	@ResponseBody
	public int postpushDelete(int pushNo) {
		return pushService.pushDelete(pushNo);
	}
	
	@PostMapping("meditation/pushDelete")
	@ResponseBody
	public int meditationpushDelete(int pushNo) {
		return pushService.pushDelete(pushNo);
	}
	
	@PostMapping("pushDelete")
	@ResponseBody
	public int pushDelete2(int pushNo) {
		return pushService.pushDelete(pushNo);
	}

}
