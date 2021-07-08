package com.myweb.service.cart;

import java.util.List;

import com.myweb.domain.CartVO;

public interface CartServiceRule {
	public int register(CartVO cartvo);
	public List<CartVO> getList();
	public int remove(int cartno);

}
