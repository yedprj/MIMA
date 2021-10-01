package com.mima.app.session.service;

import com.mima.app.session.domain.BookingVO;
import com.mima.app.session.domain.PtInfoVO;

public interface ConsultationService {
	public PtInfoVO getPtInformation(BookingVO vo);
}
