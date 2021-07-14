package com.myweb.service.stock_order;

import java.util.List;

import com.myweb.domain.CouponPageVO;
import com.myweb.domain.StockOrderVO;

public interface StockOrderServiceRule {
	public int register(StockOrderVO sovo); // 재고 주문
    public List<StockOrderVO> getList(CouponPageVO cpgvo);
	public int getTotalCount(CouponPageVO cpgvo);
}
