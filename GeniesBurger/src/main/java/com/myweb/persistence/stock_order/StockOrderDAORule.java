package com.myweb.persistence.stock_order;

import java.util.List;

import com.myweb.domain.CouponPageVO;
import com.myweb.domain.StockOrderVO;

public interface StockOrderDAORule {
	public int insert(StockOrderVO sovo); // 재고 주문
	public List<StockOrderVO> selectList(CouponPageVO cpgvo); // 재고 주문 리스트(페이징 해야됨)
	public int totalCount(CouponPageVO cpgvo);
}
