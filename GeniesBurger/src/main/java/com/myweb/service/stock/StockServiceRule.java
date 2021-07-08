package com.myweb.service.stock;

import java.util.List;

import com.myweb.domain.StockVO;

public interface StockServiceRule {
	public int register(StockVO svo);
	public List<StockVO> getList();
	public int modify(StockVO svo);
	public int modifyStockQty(int sno, int qty);
	public int remove(int sno);
}
