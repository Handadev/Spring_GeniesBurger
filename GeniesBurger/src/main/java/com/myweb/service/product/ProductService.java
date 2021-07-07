package com.myweb.service.product;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.ProductPageVO;
import com.myweb.domain.ProductVO;
import com.myweb.persistence.product.ProductDAORule;
import com.myweb.persistence.productfile.ProductFileDAORule;

@Service
public class ProductService implements ProductServiceRule {
	private static Logger logger = LoggerFactory.getLogger(ProductService.class);

	@Inject
	private ProductDAORule pdao;
	
	@Inject
	private ProductFileDAORule pfdao;
	
	@Override
	public int register(ProductVO pvo) {
		return pdao.insert(pvo);
	}

//	@Override
//	public List<ProductVO> getList(ProductPageVO pgvo) {
//		return null;
//	}
	
	@Override
	public List<ProductVO> getList() {
		return pdao.selectList();
	}

	@Override
	public ProductVO detail(int pno) {
		return pdao.selectOne(pno);
	}

	@Override
	public int modify(ProductVO pvo) {
		return pdao.update(pvo);
	}

	@Override 
	public int remove(int pno) {
		int isDel = pdao.delete(pno);
		if (isDel > 0) {
			isDel = pfdao.delete(pno);
		}
		return isDel;
	}

	@Override
	public int getCurrPno() {
		return pdao.selectOne();
	}

	@Override
	public int getTotalCount(ProductPageVO ppgvo) {
		return pdao.selectOne(ppgvo);
	}

	

}
