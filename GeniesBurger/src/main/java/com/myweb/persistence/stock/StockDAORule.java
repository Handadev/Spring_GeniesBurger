package com.myweb.persistence.stock;

import java.util.List;
import java.util.Map;

import com.myweb.domain.StockVO;

public interface StockDAORule {
	public int insert(StockVO svo);
	public List<StockVO> selectList();
	public int update(StockVO svo);
	public int updateStockQty(int sno, int qty);
	public int delete(int sno);
	public List<StockVO> selectOneList(String sname);
	public List<StockVO> selectTotalCntList();
	public int deleteAll(String sname);
}
