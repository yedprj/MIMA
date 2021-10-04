package com.mima.app.doc.mapper;

import org.apache.ibatis.annotations.Param;

public interface DocAvailabilityMapper {

	// 의사 진료 시간 조회 p.10/04
	public String selectDocTime(@Param("day") String day, @Param("docNo") int docNo);
}
