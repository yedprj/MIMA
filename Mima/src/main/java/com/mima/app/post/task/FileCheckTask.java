package com.mima.app.post.task;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.mima.app.post.service.PostService;
import com.mima.app.session.domain.BookingVO;
import com.mima.app.session.service.BookingService;

import lombok.extern.java.Log;

@Log
@Component
public class FileCheckTask {
	
	@Autowired PostService postService;
	@Autowired BookingService bookingService;
	
	@Scheduled(cron="0 0 0 * * *")
	public void checkFiles() throws Exception{
		
		log.info("지난 날짜 삭제 확인");
		
		// 여기서 부터는 실행이 안됨....
		postService.schedulerPost();
		log.info("==================삭제확인");
	}


	@Scheduled(cron="*/10 0 8-18 * * MON-FRI")
	public void checkRoomId() {
		log.info("~~~~~진료를 위한 url을 확인중입니다...~~~~~~~~");
		List<BookingVO> oldList = new ArrayList<BookingVO>();
		
		List<BookingVO> readyList = new ArrayList<BookingVO>();
		
		readyList = bookingService.getRoomId();
		
		oldList = readyList;
		if(oldList.size() < readyList.size()) {

		}
	}
}
