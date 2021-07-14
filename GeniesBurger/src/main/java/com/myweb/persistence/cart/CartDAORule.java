package com.myweb.persistence.cart;

import java.util.List;

import com.myweb.domain.CartVO;

public interface CartDAORule {
	public int insert(CartVO cartvo); 
	public List<CartVO> selectList(); // 리스트에서 사진 출력
	public int delete(int cartno); 
	public int upQty(int cartno, int upqtystr); // 카트 수량 증가
	public int downQty(int cartno, int downqtystr); // 카트 수량 감소
	public int dupleProduct(int pno, int mno);
	public int upQtyDuple(int pno, int mno);
}
