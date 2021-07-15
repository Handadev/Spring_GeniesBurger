package com.myweb.service.cart;

import java.util.List;

import com.myweb.domain.CartVO;

public interface CartServiceRule {
	public int register(CartVO cartvo);
	public List<CartVO> getList();
	public int remove(int cartno);
	public int increQty(int cartno, String upqtystr);
	public int decreQty(int cartno, String downqtystr);
	public boolean dupleCheck(int pno, int mno);
	public int increRegister(int pno, int mno);
	public CartVO payment(int mno);
	public int removeWithMno(int mno);
	public List<CartVO> getOrderList(int mno);
}
