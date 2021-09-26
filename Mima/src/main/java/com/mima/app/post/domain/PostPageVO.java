package com.mima.app.post.domain;


import com.mima.app.criteria.domain.Criteria;

import lombok.Data;

@Data
public class PostPageVO {
	private int startPage;
	private int endPage;
	private boolean prev, next;
	private int total;	 			//전체 레코드 건수
	private Criteria cri;			//pageNum, amount
	//criteria 랑 토탈값을 받아와서 초기화 시켜주는 constructor
	public PostPageVO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		this.endPage=(int) Math.ceil(cri.getPageNum()/10.0)*9;
		this.startPage =this.endPage-9;
		int realEnd = (int)(Math.ceil((total*1.0)/cri.getAmount()));
		if(realEnd < this.endPage) {
			this.endPage=realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
	
	
}
