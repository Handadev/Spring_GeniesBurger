package com.myweb.persistence.cart;

import java.util.List;

import com.myweb.domain.CartVO;

public interface CartDAORule {
	public int insert(CartVO cartvo);
	public List<CartVO> selectList();
	public int delete(int cartno);
	public int upQty(int cartno, int upqtystr);
	public int downQty(int cartno, int downqtystr);
}
