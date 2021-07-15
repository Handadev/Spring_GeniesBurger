package com.myweb.service.purchase;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

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

}
