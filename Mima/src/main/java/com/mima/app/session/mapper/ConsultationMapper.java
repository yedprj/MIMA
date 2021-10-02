package com.mima.app.session.mapper;

import com.mima.app.session.domain.BookingVO;
import com.mima.app.session.domain.PtInfoVO;

public interface ConsultationMapper {
	public PtInfoVO getPtInformation(BookingVO vo);
}
