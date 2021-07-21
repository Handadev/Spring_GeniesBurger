package com.myweb.service.cart;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.AddExtraVO;
import com.myweb.domain.CartVO;
import com.myweb.persistence.add_extra.AddExtraDAORule;
import com.myweb.persistence.cart.CartDAORule;

@Service
public class CartService implements CartServiceRule {
	private static Logger logger = LoggerFactory.getLogger(CartService.class);

	@Inject
	private CartDAORule cartdao;
	
	@Inject
	private AddExtraDAORule aedao;
	
	@Override
	public int register(CartVO cartvo) {
		return cartdao.insert(cartvo);
	}

	@Override
	public List<CartVO> getList(int mno) {
		List<CartVO> list = new ArrayList<CartVO>();
		List<CartVO> clist =  cartdao.selectList(mno);
		for (CartVO cartvo : clist) {
			int pno = cartvo.getPno();
			List<AddExtraVO> aelist = aedao.selectList(mno, pno);
			cartvo.setAelist(aelist);
			list.add(cartvo);
		}
		
		return list;
	}

	@Override
	public int remove(int cartno) {
		return cartdao.delete(cartno);
	}
	
	@Override
	public int removeWithPno(int pno) {
		return cartdao.deleteWithPno(pno);
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

	// 카트 중복체크 기능 : 현재 사용 X
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
	public List<CartVO> payment(int mno) {
		return cartdao.selectList(mno);
	}

	@Override
	public int removeWithMno(int mno) {
		return cartdao.deleteWithMno(mno);
	}

	@Override
	public List<CartVO> getOrderList(int mno) {
		return cartdao.selectOrderList(mno);
	}

	

}
