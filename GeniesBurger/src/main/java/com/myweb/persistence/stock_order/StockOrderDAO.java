package com.myweb.persistence.stock_order;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.CouponPageVO;
import com.myweb.domain.StockOrderVO;
import com.myweb.domain.StockVO;

@Repository
public class StockOrderDAO implements StockOrderDAORule {
	private static Logger logger = LoggerFactory.getLogger(StockOrderDAO.class);
	private final String NS = "StockOrderMapper.";
	
	@Inject
	private SqlSession SQL;

	@Override
	public int insert(StockOrderVO sovo) {
		return SQL.insert(NS + "od", sovo);
	}

	@Override
	public List<StockOrderVO> selectList(CouponPageVO cpgvo) {
		return SQL.selectList(NS + "odList", cpgvo);
	}

	@Override
	public int totalCount(CouponPageVO cpgvo) {
		return SQL.selectOne(NS + "tc", cpgvo);
	}

}
