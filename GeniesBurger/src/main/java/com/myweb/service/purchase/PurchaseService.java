package com.myweb.service.purchase;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.MemberPageVO;
import com.myweb.domain.PurchaseVO;
import com.myweb.persistence.purchase.PurchaseDAORule;

@Service
public class PurchaseService implements PurchaseServiceRule {
	private static Logger logger = LoggerFactory.getLogger(PurchaseService.class);

	@Inject
	private PurchaseDAORule pdao;

	@Override
	public int register(PurchaseVO purvo) {
		return pdao.insert(purvo);
	}

	@Override
	public List<PurchaseVO> getList(MemberPageVO mpgvo) {
		return pdao.selectList(mpgvo);
	}

	@Override
	public List<PurchaseVO> getList(MemberPageVO mpgvo, int mno) {
		return pdao.selectList(mpgvo, mno);
	}

	@Override
	public int getTotalCount(MemberPageVO mpgvo) {
		return pdao.getTotalCount(mpgvo);
	}

	@Override
	public int getTotalCount(MemberPageVO mpgvo, int mno) {
		return pdao.getTotalCount(mpgvo, mno);
	}

	@Override
	public int getDateSales(String todayString) {
		return pdao.selectDateSales(todayString);
	}

	@Override
	public int getYearSales(String yearString) {
		return pdao.selectYearSales(yearString);
	}

}
