package com.myweb.service.stock;

import java.util.List;
import java.util.Map;

import com.myweb.domain.StockVO;

public interface StockServiceRule {
	public int register(StockVO svo);
	public List<StockVO> getList();
	public List<StockVO> getBurgerStockList();
	public int modify(StockVO svo);
	public int modifyStockQty(int sno);
	public int remove(int sno);
	public List<StockVO> getOneList(String sname);
	public List<StockVO> getTotalCntList();
	public int removeAll(String sname);
	public int getUpsqSno(String sname);
}
