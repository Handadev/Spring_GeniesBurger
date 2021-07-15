package com.myweb.persistence.purchase;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.PurchaseVO;

@Repository
public class PurchaseDAO implements PurchaseDAORule {
	private static Logger logger = LoggerFactory.getLogger(PurchaseDAO.class);
	private final String NS = "PurchaseMapper.";
	
	@Inject
	private SqlSession sql;

	@Override
	public int insert(PurchaseVO purvo) {
		int mno = purvo.getMno();
		int cartno = purvo.getCartno();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mno", mno);
		map.put("cartno", cartno);
		return sql.insert(NS+"reg", map);
	}

}
