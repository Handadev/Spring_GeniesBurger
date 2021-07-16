package com.myweb.persistence.stock;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.StockVO;

@Repository
public class StockDAO implements StockDAORule {
	private static Logger logger = LoggerFactory.getLogger(StockDAO.class);
	private final String NS = "StockMapper.";

	@Inject
	private SqlSession sql;

	@Override
	public int insert(StockVO svo) {
		return sql.insert(NS + "reg", svo);
	}

	@Override
	public List<StockVO> selectList() {
		return sql.selectList(NS + "list");
	}

	@Override
	public int update(StockVO svo) {
		return sql.update(NS + "mod", svo);
	}

	@Override
	public int updateStockQty(int sno, int qty) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("sno", (Integer) sno);
		map.put("qty", (Integer) qty);
		return sql.update(NS + "upsq", map);
	}

	@Override
	public int delete(int sno) {
		return sql.delete(NS + "del", sno);
	}

	@Override
	public List<StockVO> selectOneList(String sname) {
		return sql.selectList(NS + "oneList", sname);
	}

	@Override
	public List<StockVO> selectTotalCntList() {
		return sql.selectList(NS + "totalCntList");
	}

	@Override
	public int deleteAll(String sname) {
		return sql.delete(NS + "delAll", sname);
	}

	@Override // HomeCtrl 버거와 연관되어있는 재고 가져오기
	public List<StockVO> selectBurgerStockList() {
		return sql.selectList(NS + "getBurgerStock");
	}


}
