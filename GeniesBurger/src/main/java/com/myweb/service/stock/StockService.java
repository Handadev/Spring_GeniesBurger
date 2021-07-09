package com.myweb.service.stock;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.StockVO;
import com.myweb.persistence.stock.StockDAORule;

@Service
public class StockService implements StockServiceRule {
	private static Logger logger = LoggerFactory.getLogger(StockService.class);

	@Inject
	private StockDAORule sdao;
	
	@Override
	public int register(StockVO svo) {
		return sdao.insert(svo);
	}

	@Override
	public List<StockVO> getList() {
		return sdao.selectList();
	}

	@Override
	public int modify(StockVO svo) {
		return sdao.update(svo);
	}

	@Override
	public int modifyStockQty(int sno, int qty) {
		return sdao.updateStockQty(sno, qty);
	}

	@Override
	public int remove(int sno) {
		return sdao.delete(sno);
	}

}
