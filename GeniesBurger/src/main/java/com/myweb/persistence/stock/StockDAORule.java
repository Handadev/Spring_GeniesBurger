package com.myweb.persistence.stock;

import java.util.List;
import java.util.Map;

import com.myweb.domain.StockVO;

public interface StockDAORule {
	public int insert(StockVO svo);
	public List<StockVO> selectList();
	public List<StockVO> selectBurgerStockList();
	public int update(StockVO svo);
	public int updateStockQty(int sno);
	public int delete(int sno);
	public List<StockVO> selectOneList(String sname);
	public List<StockVO> selectTotalCntList();
	public int deleteAll(String sname);
	public int selectUpsqSno(String sname);
}
