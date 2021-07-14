package com.myweb.service.cart;

import java.util.List;

import com.myweb.domain.CartVO;

public interface CartServiceRule {
	public int register(CartVO cartvo, int mno);
	public List<CartVO> getList();
	public int remove(int cartno);
	public int increQty(int cartno, String upqtystr);
	public int decreQty(int cartno, String downqtystr);
	public boolean dupleCheck(int pno);
	public int increRegister(int pno);
	public CartVO payment(int mno);
}
