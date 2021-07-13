package com.myweb.persistence.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.CartVO;

@Repository
public class CartDAO implements CartDAORule {
	private static Logger logger = LoggerFactory.getLogger(CartDAO.class);
	private final String NS = "CartMapper.";

	@Inject
	private SqlSession sql;

	@Override
	public int insert(CartVO cartvo) {
		return sql.insert(NS + "reg", cartvo);
	}

	@Override
	public List<CartVO> selectList() {
		return sql.selectList(NS + "list");
	}

	@Override
	public int delete(int cartno) {
		return sql.delete(NS + "del", cartno);
	}

	@Override
	public int upQty(int cartno, int upqtystr) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("cartno", cartno);
		map.put("upno", upqtystr);
		return sql.update(NS + "upQty", map);
	}

	@Override
	public int downQty(int cartno, int downqtystr) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("cartno", cartno);
		map.put("downno", downqtystr);
		return sql.update(NS + "downQty", map);
	}

	@Override
	public int dupleProduct(int pno) {
		return sql.selectOne(NS + "dupleProduct", pno);
	}

	@Override
	public int upQtyDuple(int pno) {
		int isUp = sql.update(NS + "upQtyDuple", pno);
		logger.info("DAO upQtyDuple : " + isUp);
		return isUp;
	}

}
