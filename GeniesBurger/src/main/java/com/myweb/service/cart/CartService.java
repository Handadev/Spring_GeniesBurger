package com.myweb.service.cart;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.CartVO;
import com.myweb.persistence.cart.CartDAORule;

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
		return cartdao.downQty(cartno, Integer.parseInt(downqtystr));
	}

}
