package com.myweb.service.stock_order;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.CouponPageVO;
import com.myweb.domain.StockOrderVO;
import com.myweb.persistence.stock_order.StockOrderDAORule;

@Service
public class StockOrderService implements StockOrderServiceRule {
	private static Logger logger = LoggerFactory.getLogger(StockOrderService.class);

	@Inject
	private StockOrderDAORule sodao;
	
	@Override
	public int register(StockOrderVO sovo) {
		return sodao.insert(sovo);
	}

	@Override
	public List<StockOrderVO> getList(CouponPageVO cpgvo) {
		return sodao.selectList(cpgvo);
	}

	@Override
	public int getTotalCount(CouponPageVO cpgvo) {
		return sodao.totalCount(cpgvo);
	}


}
