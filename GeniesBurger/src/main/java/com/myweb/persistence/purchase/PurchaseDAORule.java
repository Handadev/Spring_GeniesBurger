package com.myweb.persistence.purchase;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.myweb.domain.PurchaseVO;

public interface PurchaseDAORule {
	public int insert(PurchaseVO purVO);
}
