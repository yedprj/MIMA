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
	

	@Scheduled(cron="5 0 0 * * *")
	public void checkFiles() throws Exception{
		
		log.info("지난 날짜 삭제 확인");
		
		// 여기서 부터는 실행이 안됨....
		postService.schedulerPost();
		log.info("==================삭제확인");
	}

	//s:0929 
	//@Scheduled(cron="*/10 * 8-22 * * MON-FRI")
	//@Scheduled(cron="*/10 * * * * MON-FRI")
	public void checkRoomId() {
		log.info("~~~~~진료를 위한 url을 확인중입니다...~~~~~~~~");
		List<BookingVO> oldList = new ArrayList<BookingVO>();

		List<BookingVO> readyList = new ArrayList<BookingVO>();
		readyList = bookingService.getRoomId();
		System.out.println("----"+readyList.size());
		oldList = readyList;
		System.out.println(oldList.size() +"~~~~~oldlist");
		if(oldList.size() < readyList.size()) {
			System.out.println("새 RoomId가 추가되었습니다.");
		} else {
			System.out.println("nothing much");
		}
		
	}
}
