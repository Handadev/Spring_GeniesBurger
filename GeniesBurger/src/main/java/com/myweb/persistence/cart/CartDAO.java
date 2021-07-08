package com.myweb.persistence.cart;

import java.util.List;

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
		return sql.insert(NS+"reg", cartvo);
	}

	@Override
	public List<CartVO> selectList() {
		return sql.selectList(NS+"list");
	}

	@Override
	public int delete(int cartno) {
		return sql.delete(NS+"del", cartno);
	}

}
