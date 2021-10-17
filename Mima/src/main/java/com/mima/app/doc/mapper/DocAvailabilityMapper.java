package com.mima.app.doc.mapper;

import org.apache.ibatis.annotations.Param;

import com.mima.app.doc.domain.DocAvailabilityVO;
import com.mima.app.member.domain.MemberVO;

public interface DocAvailabilityMapper {

	// 의사 진료 시간 조회 p.10/04
	public String selectDocTime(@Param("day") String day, @Param("docNo") int docNo);
	
	//의사 진료 시간 전체조회 s:1017
	public DocAvailabilityVO checkAvail(MemberVO vo);
	
	//S: 1005 의사 진료 가능 시간 요일 입력 
	public int insert(DocAvailabilityVO vo);
	
	//S: 1017 의사 진료 가능 시간 요일 update
	public int update(DocAvailabilityVO vo);
}
