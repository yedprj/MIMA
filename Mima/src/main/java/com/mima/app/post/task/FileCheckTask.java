package com.mima.app.post.task;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.mima.app.post.service.PostService;

import lombok.extern.java.Log;

@Log
@Component
public class FileCheckTask {
	
	@Autowired PostService postService;
	
	@Scheduled(cron="0 * * * * *")
	public void checkFiles() throws Exception{
		
		log.info("지난 날짜 삭제 확인");
		
		// 여기서 부터는 실행이 안됨....
		postService.schedulerPost();
		log.info("==================삭제확인");
	}


	
	
}
