package com.myweb.service.cart;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.CartVO;
import com.myweb.domain.ProductFileVO;
import com.myweb.persistence.cart.CartDAORule;
import com.myweb.persistence.productfile.ProductFileDAORule;

@Service
public class CartService implements CartServiceRule {
	private static Logger logger = LoggerFactory.getLogger(CartService.class);

	@Inject
	private CartDAORule cartdao;
	
	@Override
	public int register(CartVO cartvo) {
		return cartdao.insert(cartvo);
	}

	@Override
	public List<CartVO> getList() {
		return cartdao.selectList();
	}

	@Override
	public int remove(int cartno) {
		return cartdao.delete(cartno);
	}

	@Override
	public int increQty(int cartno, String upqtystr) {
		return cartdao.upQty(cartno, Integer.parseInt(upqtystr));
	}

	@Override
	public int decreQty(int cartno, String downqtystr) {
		int isUp = cartdao.downQty(cartno, Integer.parseInt(downqtystr));
		logger.info("decreQty : " + isUp);
		
		return isUp;
	}

	@Override
	public boolean dupleCheck(int pno, int mno) {
		return cartdao.dupleProduct(pno, mno) > 0 ? true : false;
	}

	@Override
	public int increRegister(int pno, int mno) {
		int isUp = cartdao.upQtyDuple(pno, mno);
		logger.info("service increReg : " + isUp);
		return isUp;
	}

	@Override
	public CartVO payment(int mno) {
		return cartdao.selectOne(mno);
	}

	@Override
	public int removeWithMno(int mno) {
		return cartdao.deleteWithMno(mno);
	}

}
